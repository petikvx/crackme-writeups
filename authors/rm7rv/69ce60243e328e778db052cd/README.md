# rm7rv's my first crackme (SillyCrackMe)

| | |
|---|---|
| **ID** | [`69ce60243e328e778db052cd`](https://crackmes.one/crackme/69ce60243e328e778db052cd) ([`ORIGIN.yml`](ORIGIN.yml)) |
| **Auteur** | rm7rv |
| **Plateforme** | Windows PE64 console, **Rust** (MSVC), strings protégées par `obfstr` |
| **SHA-256** (`original/download.bin`, ZIP) | `e933cf607f387af4f55543e9c1e84a5586b7ed12059fa940056514dd5b2c6467` |

## Contenu

| Fichier | Rôle |
|---|---|
| `original/download.bin` | ZIP d’origine (mdp `crackmes.one`) contenant `SillyCrackMe.exe` |
| `analysis/x/SillyCrackMe.exe` | exe extrait du ZIP (copie de travail, `original/` intact) |
| `tools/silly-solve.py` | solveur (`-q`, `--check <exe>`) |
| `tools/emu-verify.py` | rejoue le `main` du PE sous Unicorn (stubs Win32) — preuve live sans Wine |

## Réponse

**Login : `ADMIN`** (en majuscules ; `admin` / `Admin` sont refusés).

```bash
python3 tools/silly-solve.py -q                                  # ADMIN
python3 tools/silly-solve.py --check analysis/x/SillyCrackMe.exe # rejoue le binaire
```

Pas de name→serial : un seul champ, donc pas de `petik` à dériver ici (`petik` est rejeté, cf. vérification).

## Premier regard

- `original/download.bin` est un ZIP (`unzip -P crackmes.one`), un seul fichier `SillyCrackMe.exe` (233 984 o).
- `strings` : chemins `rustlib/src/rust/library/std/...`, `C:\Users\Core i5\.cargo\...\obfstr-0.4.4\src\lib.rs` → **Rust** + crate **obfstr** (chaînes chiffrées à la compilation, donc pas de « enter login » / « correct » en clair).
- Seule chaîne utile en clair dans `.rdata` : `73acd9a5972130b75066c82595a1fae3` (VA `0x14002cae8`, 32 hex = **MD5**).
- Dans `.text`, beaucoup de `and/or/xor` sur `[rsp+..]` : rondes MD5 inlinées.
- Pas de `wine`, `gdb` ni `diec` sur la machine de travail : analyse `objdump` + émulation Unicorn.

## Flow

`main` (VA `0x140007850`) : affiche un prompt (obfstr) `enter login:` → lit une ligne sur stdin → `trim` → MD5 → comparaison avec la constante ASCII de 32 caractères → affiche `correct` ou `not correct` (obfstr également), puis attend « PRESS ENTER ».

## Comment on trouve

1. **Ancrage** : `objdump -d -M intel --no-show-raw-insn SillyCrackMe.exe`, puis recherche de la xref vers la chaîne hex `0x14002cae8` : un seul `lea rax,[rip+0x23726]` à `0x1400093bb`, dans `main`.

   ```asm
   1400093bb: lea  rax,[rip+0x23726]     # "73acd9a5..." (.rdata 0x14002cae8)
   1400093c2: mov  [rbp+0x920],rax        # &str
   1400093c9: mov  QWORD PTR [rbp+0x928],0x20   # len = 32
   1400093e2: lea  rcx,[rbp+0x960]
   1400093e9: call 0x140002bb0            # init contexte MD5 (valeur trimée de l’input en entrée)
   ...
   140009483: call 0x140001580            # compare hex(digest) à la constante (len 0x20)
   140009496: test al,1 ; jne -> 'correct'
   ```
2. **Lecture** : l’entrée trimée passe dans un contexte de hash (`0x140002bb0`/`0x140001970`), le digest est formaté en hex minuscule (table `0123456789abcdef` à `0x140031330`) puis comparé à la constante de 32 octets. Le bloc suivant (`0x1400094bb…`) déchiffre via obfstr (xor avec une clé tirée d’un **splitmix64** : constantes `0x9e3779b97f4a7c15`, `0xbf58476d1ce4e5b9`, `0x94d049bb133111eb` visibles en `0x14000950e…`) le message de succès ; ce n’est pas la partie à reverser : seule la constante MD5 compte.
3. **Inversion** : MD5 non inversible, mais un « premier crackme » → mot de passe court. Dictionnaire + variantes de casse : `md5("ADMIN") = 73acd9a5972130b75066c82595a1fae3` ✔ (`hashlib.md5(b"ADMIN")`). Un brute force 1–6 chiffres ou 1–4 caractères `[a-z0-9]` ne trouve rien : la casse compte.
4. **Pièges** : (a) les messages sont obfstr → inutile de chercher des `strings` ; (b) `admin` en minuscules échoue (le hash est celui de la version majuscule) ; (c) le programme lit via `NtReadFile` (pas `ReadConsoleW`) quand stdin n’est pas une console.

## Debug dynamique (sans Wine/GDB)

Ni Wine ni GDB n’étaient disponibles. Pour avoir malgré tout une preuve sur le **binaire d’origine** (extrait tel quel du ZIP), `tools/emu-verify.py` charge le PE dans Unicorn, remplit l’IAT de stubs (`HeapAlloc/ReAlloc`, `GetStdHandle`, `GetConsoleMode`=0 pour forcer le chemin fichier, `NtReadFile`/`NtWriteFile` branchés sur stdin/stdout, TLS via `gs:0x58`) et exécute directement `main` (`0x140007850`, on saute le CRT).

## Vérification

```text
$ python3 tools/silly-solve.py --check analysis/x/SillyCrackMe.exe
login = ADMIN (md5 = 73acd9a5972130b75066c82595a1fae3)
ADMIN -> correct OK
petik -> not correct OK
```

Autres cas rejoués : `admin`, `Admin`, `foo` → `not correct`.
Sortie brute pour `ADMIN` : `enter login:` / `correct`.

## Notes

- Ce n’est pas un keygen : un seul login fixe, comparé par hash.
- Preuve live = émulation Unicorn du `main` (pas d’exécution Wine possible ici) ; à confirmer sous Windows/Wine en tapant `ADMIN`.
