# Ploxied's Easy Crackme

- ORIGIN : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/69cbde056793d479be018f09)
- Auteur : Ploxied · Plateforme : Windows x86-64 (PE64 console, MinGW-w64 GCC 14.2, C++, strippé)

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/download.bin` | ZIP d'origine (mot de passe `crackmes.one`) contenant `crackme.exe` |
| `analysis/crackme.exe` | copie extraite du ZIP (pour l'analyse) |
| `tools/ploxied-easy-solve.py` | solveur (`-q`, `--check` = preuve sous Wine) |

## Réponse

**Mot de passe : `-559038737`** (= `0xDEADBEEF` interprété en entier signé 32 bits).

```bash
python3 tools/ploxied-easy-solve.py -q          # -559038737
python3 tools/ploxied-easy-solve.py --check     # lance le vrai exe sous xvfb-run + wine
```

Pas de nom d'utilisateur ici (exemple `petik` sans objet).

## Premier regard

- `original/download.bin` est un ZIP chiffré : `7z x -pcrackmes.one -oanalysis original/download.bin`.
- `diec` : PE64, MinGW GCC 14.2 (UCRT), strippé, ~1 Mo (libstdc++ statique).
- Strings : `[>] Enter your password: `, `[!] Password must be a number!`, `[+] Correct password!`, `[-] Wrong password!`.
- `Wine` : `1` → Wrong, `abc` → « must be a number ».

## Flow

Lecture d'un `int` avec `cin >> int` ; échec de lecture → « must be a number » ; sinon comparaison à une constante.

## Comment on trouve

1. `objdump -d -M intel analysis/crackme.exe > crackme.asm`, puis recherche de la xref vers la string `Enter your password` (`0x1400cd061`) : fonction à `0x140001900`.
2. Piège n°1 : cette fonction contient bien `cmp DWORD PTR [rsp+0x30], 0x2856a42f` (`0x140001afe`) → « Correct », mais c'est un **leurre** : `676766767` (0x2856a42f) donne « Wrong » sous Wine. Cette fonction n'est appelée (`0x1400c593d`, `ecx=0x47`) que depuis le chemin d'échec du vrai main.
3. Le vrai `main` est à `0x1400c5840` (`.text`, section tardive après le code libstdc++). Il déchiffre des strings par `xor byte, 0x69`, lit l'entier (`call 0x1400856d0` = `istream::operator>>(int&)`), `ignore`, puis :

```asm
1400c58ee: test BYTE PTR [rbx+0x30],0x5   ; failbit|badbit ?
1400c58f2: jne  0x1400c5982               ; → "Password must be a number!"
1400c58ff: cmp  DWORD PTR [rsp+0x2c],0xdeadbeef
1400c590b: je   0x1400c5949               ; → déchiffre/affiche "Correct"
           ; sinon xor 0x69696969 des messages + call 0x140001900 (leurre, "Wrong")
```

4. Décodage : `0xdeadbeef` comparé à un `int` 32 bits signé → `0xdeadbeef - 2^32 = -559038737`.
5. Piège n°2 : saisir `3735928559` (décimal non signé) est **rejeté** (`operator>>` déborde → failbit → « must be a number »).

## Vérification

```text
$ echo -559038737 | xvfb-run -a wine crackme.exe   → [+] Correct password!
$ echo 3735928559 | xvfb-run -a wine crackme.exe   → [!] Password must be a number!
$ echo 676766767  | xvfb-run -a wine crackme.exe   → [-] Wrong password!   (leurre 0x2856a42f)
$ echo 1          | xvfb-run -a wine crackme.exe   → [-] Wrong password!
```

Pas de GDB ni de debugger MCP utilisés (statique + Wine).

## Notes

- Vraie constante masquée derrière un faux check ; le XOR 0x69 des strings sert à cacher les messages du vrai chemin.
- `original/` non modifié.
