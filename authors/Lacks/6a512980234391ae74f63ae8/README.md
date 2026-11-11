# Lacks's Level 1

| | |
|---|---|
| **ID** | [`6a512980234391ae74f63ae8`](https://crackmes.one/crackme/6a512980234391ae74f63ae8) · [`ORIGIN.yml`](ORIGIN.yml) |
| **Auteur** | Lacks |
| **Plateforme** | Windows PE64 console (MSVC, C++) |
| **SHA-256** `download.bin` | `489aaa8d0feaea9aad011be74bfbf2177fd4e7569849beb600ed271ca03940d4` |

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/download.bin` | archive du site : en fait un **ZIP** (mot de passe `crackmes.one`) contenant `level1easy.exe` |
| `analysis/extract/level1easy.exe` | exe extrait (SHA-256 `2a7fc744…3ec9`) |
| `analysis/level1easy.asm` | `objdump -d -M intel` complet |
| `tools/lacks-level1-solve.py` | solveur + `--check` (émulation unicorn de `main`) |

## Réponse

**Mot de passe : `password`** (pas de username).

```bash
python3 tools/lacks-level1-solve.py -q        # password
python3 tools/lacks-level1-solve.py --check   # OK -> True / KO -> True
```

## Premier regard

- `original/download.bin` n'est pas un PE : signature `PK` → `unzip -P crackmes.one original/download.bin -d analysis/extract`.
- PE64 MSVC (PDB `crackmetest.pdb`), imports `MSVCP140.dll` (iostream). Strings utiles : `LOGIN SCREEN`, `Enter Password: `, `Access Granted. Welcome!`, `Access Denied. Invalid Password.`.
- Détail piégeux : la chaîne `password` figure en clair dans `.rdata` (`0x1400033C8`) mais précédée de zéros, donc `strings` la sort collée à son voisinage ; le tout n'est pas un hash, juste une constante.

## Flow

Bannière → `Enter Password:` → `getline(cin, s)` → comparaison avec la constante → message Granted/Denied → `Press Enter to exit...` (`cin.ignore` + `cin.get`).

## Comment on trouve

Ancrage : `objdump -d -M intel level1easy.exe`, la fonction `main` démarre en `0x140001290` (elle référence les strings d'UI `0x1400033d8…0x140003498`).

```asm
140001299  mov  rax,[rip+0x3da0]        ; cookie /GS
1400012ba  mov  ebp,0xf                 ; capacité SSO d'un std::string
1400012ca  mov  QWORD PTR [rsp+0x30],0x8   ; size = 8  -> std::string "attendu" de longueur 8
1400012d8  mov  rdi,[rip+0x20e9]        ; = qword @0x1400033c8
1400012df  mov  [rsp+0x20],rdi          ; 8 octets copiés dans le buffer SSO du std::string
...
140001340  call 0x140001720             ; getline(cin, [rsp+0x40])  -> entrée
140001365  cmp  r8,0x8                  ; taille de l'entrée == 8 ?
140001369  jne  0x140001382             ; sinon -> Denied
140001370  call 0x140002b18             ; memcmp(input, attendu, 8)
140001377  jne  0x140001382             ; != 0 -> Denied (0x140003470)
140001379  lea  rdx,[...3450]           ; "Access Granted. Welcome!"
```

Décodage : le qword à `0x1400033c8` vaut `70 61 73 73 77 6f 72 64` = `password` (ASCII, pas d'immediate à décoder, pas de XOR). Le compilateur a inliné la construction du `std::string` constant (taille 8 ≤ 15 → SSO), d'où le `mov` d'un seul qword. La logique est donc : `len(input)==8 && memcmp(input,"password",8)==0`.

Pas de GDB ni de Wine disponibles sur la machine de travail : reverse 100 % statique (pas de section « Debug GDB »).

## Vérification

Ni `wine` ni `gdb` n'étaient installés. La preuve a donc été faite en **émulant le vrai `main` du binaire d'origine** (extrait du ZIP, non modifié) avec unicorn : `getline`, `operator<<`, `memcmp` et les appels IAT finaux sont hookés, le reste (construction du `std::string`, tests de taille, choix du message) est exécuté tel quel.

```text
$ python3 tools/lacks-level1-solve.py --check
Password : password
OK -> True      # "password" -> Access Granted. Welcome!
KO -> True      # "petik"    -> Access Denied. Invalid Password.
```

Une vérification sous Wine (`xvfb-run -a wine level1easy.exe`) reste à faire pour une preuve live complète.

## Notes

- Aucun username, aucun calcul : simple comparaison à une constante.
- `original/download.bin` est un ZIP, pas un exe : ne pas le lancer tel quel.
