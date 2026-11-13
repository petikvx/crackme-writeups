# igr0t7's CrackMeBaby2

| | |
|---|---|
| **ID** | [`6a0bd0592b3df128c1df5c16`](https://crackmes.one/crackme/6a0bd0592b3df128c1df5c16) ([`ORIGIN.yml`](ORIGIN.yml)) |
| **Auteur** | igr0t7 |
| **Plateforme** | Windows PE64 console, MSVC (VS 2026), C++ |
| **SHA-256 (`original/download.bin`)** | `5b17c84ccbd329dd692c03380b9e76657ce5e6ae19cf03140bf370ada9d2ba18` |

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/download.bin` | en réalité un **ZIP** (mot de passe `crackmes.one`) contenant `CanYouCrackMeBaby2.exe` (SHA-256 `f83306ad…72c8`) |
| `tools/crackmebaby2-solve.py` | solveur (`-q`, `--check <exe>` lance le vrai exe sous `xvfb-run wine`) |

## Réponse

Pas de username demandé (donc pas d'exemple `petik`). Deux saisies successives :

| Prompt | Saisie |
|---|---|
| `Input the pass:` | **`flag:igr0t-theking`** |
| `Say my name...` | **`igr0t`** |

```bash
python3 tools/crackmebaby2-solve.py            # affiche les deux réponses
python3 tools/crackmebaby2-solve.py -q
python3 tools/crackmebaby2-solve.py --check /chemin/CanYouCrackMeBaby2.exe
```

## Premier regard

- `diec original/download.bin` → **ZIP** (pas un PE). `PK\x03\x04`, flag chiffrement, mot de passe du site : `crackmes.one`. On extrait dans un dossier à part (`python3 -I` + `zipfile`), sans toucher à `original/`.
- `diec CanYouCrackMeBaby2.exe` → PE64, MSVC 19.50, CRT dynamique.
- `strings` : bannière, `Input the pass:`, `You are good , but...`, et un **faux flag** en clair `flag{can-you-crack?}` (leurre).
- Les autres messages (`Access Denied...`, `Say my name...`, `You Win.. (;`, `Anti-Debug`, `Debugger detected! Bye (:`) sont en clair dans `.rdata`.

## Flow

1. `0x140001750` : anti-debug par `CreateToolhelp32Snapshot` / `Process32First/Next` (imports `0x140005008/000/010`), comparaison des noms de process à une liste noire construite à l'init (`0x140001000`). Si trouvé : `MessageBoxA("Debugger detected! Bye (:")` puis `ExitProcess`.
2. Lecture de la saisie 1 (`cin >> s`).
3. Si `s == "flag{can-you-crack?}"` (20 octets) → **Access Denied** (leurre).
4. Sinon `t = s ^ 0x0a` octet par octet ; si `t == C` (18 octets) → `You are good , but...` / `Say my name...`.
5. Lecture de la saisie 2 ; si `== "igr0t"` → `You Win.. (;`.

## Comment on trouve

**Ancrage** : recherche de l'xref vers `Input the pass` (`.rdata` `0x140007cf0`) par script Python sur les `lea rdx,[rip+disp]` → `0x140001dec`, dans `main` (`0x140001b60`). Lecture avec `objdump -d -M intel --start-address=0x140001b60`.

Début de `main` (constantes construites en SSO `std::string`) :

```asm
140001bd1: mov eax,[0x140007a5c]        ; "igr0t" (5 car., SSO)     -> [rsp+0x38]
140001c10: movups xmm0,[0x140007a68]    ; "flag{can-you-crack?}"    -> r13  (len 0x14)
140001c4f: movups xmm0,[0x140007a80]    ; "lfkm0cmx:~'~boacdm"      -> r15  (len 0x12)
140001c8a: movups xmm0,[0x140007a98]    ; "Access Denied...\n"      -> [rbp-0x48]
```

Le message d'échec est recopié puis XORé par `0x0a` (boucle `xor BYTE PTR [rax+rcx],0xa` en `0x140001cd1`) : c'est pourquoi la sortie affichée est `Kiioyy*Nodcon$$$` (= `Access Denied...` ^ 0x0a), pas un vrai message.

La saisie est traitée de la même manière (`0x140001e40`, `xor BYTE PTR [rax+rcx],0xa`), mais **sur une copie** : la comparaison avec le leurre (`0x140001e68..e7a`, `len==0x14` + `memcmp` avec r13) se fait sur la saisie brute ; la comparaison suivante (`0x140002025..203a`, `len==0x12` + `memcmp` avec r15) se fait sur la saisie XORée.

**Décodage** : `C ^ 0x0a`

```text
C  = 6c 66 6b 6d 30 63 6d 78 3a 7e 27 7e 62 6f 61 63 64 6d   "lfkm0cmx:~'~boacdm"
^a = 66 6c 61 67 3a 69 67 72 30 74 2d 74 68 65 6b 69 6e 67   "flag:igr0t-theking"
```

Deuxième étape (`0x140002047..20cb`) : après `You are good , but...` / `Say my name...`, nouvelle lecture ; comparaison `len==5` + `memcmp` avec `[rsp+0x38]` = `"igr0t"` **en clair** (pas de XOR). Succès → `You Win.. (;` (`0x140007d30`).

**Pièges**
- Le `flag{can-you-crack?}` en clair est un leurre : il mène à `Access Denied`.
- Le message d'échec est XORé → sortie illisible (`Kiioyy*Nodcon$$$`) qui ressemble à un bug.
- Anti-debug par liste de process : ne pas lancer le binaire sous un debugger/outil listé (ici aucun GDB/x64dbg utilisé, analyse 100 % statique + Wine).
- Le fichier téléchargé est un ZIP, pas un exe.

## Vérification

Preuve live (Wine, `xvfb-run -a wine`) :

```text
$ python3 tools/crackmebaby2-solve.py --check CanYouCrackMeBaby2.exe
Input the pass:
You are good , but...
Say my name...
You Win.. (;
```

Cas KO :

| Saisie 1 | Résultat |
|---|---|
| `wrong` | `Kiioyy*Nodcon$$$` (= Access Denied...) |
| `flag{can-you-crack?}` | `Kiioyy*Nodcon$$$` (leurre) |
| `flag:igr0t-theking` + `nope` | `You are good , but...` / `Say my name...` puis sortie sans `You Win` |

## Notes

- Aucun patch de l'exe ; `original/` non modifié.
- Aucune session GDB / x64dbg / IDA : reverse fait avec `objdump` et Python.
