# svidnet's ZEXOR (ZEXOR-01, Windows)

| | |
|---|---|
| **ID** | [`6953d0c0d88d50bd6a9e7b63`](https://crackmes.one/crackme/6953d0c0d88d50bd6a9e7b63) ([`ORIGIN.yml`](ORIGIN.yml)) |
| **Auteur** | svidnet |
| **Plateforme** | Windows x86-64, PE GUI (MinGW-w64, C++, Win32 API) |
| **SHA-256** (`original/download.bin`) | `cfd0a5161968c20990b31a076763d482c05133c4b8947b80209d3a8747d90258` |

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/download.bin` | en réalité le **ZIP** du site (mot de passe `crackmes.one`) contenant `ZEXOR-01.exe` — non modifié |
| `analysis/ZEXOR-01.exe` | exe extrait (SHA-256 `276d3795…1650`) ; `analysis/zexor.asm` = `objdump -d -M intel` |
| `tools/zexor-win-solve.py` | solveur : lit la clé dans le PE, `--check` l'émule avec unicorn |

## Réponse

**Licence : `AEXORRBSHA36325S33`**

Pas de nom d'utilisateur : la clé est la même pour tout le monde (exemple `petik` → même clé ; `petik` saisi comme licence est rejeté).

```bash
python3 -I tools/zexor-win-solve.py -q      # AEXORRBSHA36325S33
python3 tools/zexor-win-solve.py --check    # émulation unicorn de CheckLicense (sans -I : unicorn est en site utilisateur)
```

## Premier regard

- `download.bin` commence par `PK` : c'est un ZIP chiffré → `python3 -c "zipfile…extractall(pwd=b'crackmes.one')"` vers `analysis/` (on ne touche pas à `original/`).
- `ZEXOR-01.exe` : PE32+ MinGW (`.pdata`, `.xdata`, sections `.debug_*`, symboles C++ non strippés : `_Z12CheckLicensePKc`, `_Z7WndProcP6HWND__jyx`).
- `strings -n 5` : `Enter License Key:`, `Check License`, `SUCCESS! License is valid!`, `Invalid license key. Try again!`, et en tête de `.rdata` **`AEXORRBSHA36325S33`** — seule chaîne « sans phrase » du binaire.

## Flow

Fenêtre « ZEXOR v0.1 » : un EDIT, un bouton « Check License », un STATIC de statut. Au clic (`WM_COMMAND` = 0x111, id 2) la WndProc fait `GetWindowTextA(hEdit, buf, 0x100)` puis `CheckLicense(buf)` ; si vrai → statut « SUCCESS » + MessageBox « Congratulations! You've cracked it! », sinon « INVALID LICENSE » + MessageBox d'erreur.

## Comment on trouve

Ancrage : `strings` + `objdump -d -M intel analysis/ZEXOR-01.exe`, symbole `_Z12CheckLicensePKc` @ `0x140001450`.

```asm
140001450  push rbp / mov rbp,rsp / sub rsp,0x20
140001458  mov [rbp+0x10], rcx            ; rcx = saisie
14000145c  mov rdx, [rip+0x1b9d]          ; rdx = LICENO  (0x140003000, variable globale char*)
140001463  mov rax,[rbp+0x10] ; mov rcx,rax
14000146a  call strcmp                    ; -> jmp [IAT strcmp]
14000146f  test eax,eax
140001471  sete al                        ; renvoie (strcmp == 0)
```

C'est donc `bool CheckLicense(const char* k){ return strcmp(k, LICENO)==0; }`.
`LICENO` est dans `.data` (VMA `0x140003000`, offset fichier `0x2600`) ; ses 8 octets valent `00 40 00 40 01 00 00 00` = `0x0000000140004000` = début de `.rdata`, soit la chaîne `AEXORRBSHA36325S33`. Aucune écriture sur `LICENO` ailleurs dans le code (`grep 140003000 zexor.asm` → un seul xref, la lecture ci-dessus) : la valeur statique est la vraie.

Pièges : pas de transformation (XOR, hash) — la chaîne est littérale ; un indirect pointer (`LICENO`) cache juste le `lea` direct. La clé est identique à celle du ZEXOR-v1 Linux de l'auteur (même chaîne, ici sans le décalage `UH`).

## Vérification

- Wine/gdb **non disponibles** sur la machine de travail : la preuve live Wine n'a pas pu être faite. À la place, émulation **unicorn** du vrai code de `CheckLicense` mappé depuis le PE d'origine (seul `strcmp` de la CRT, importé, est remplacé par un hook) :

```text
$ python3 tools/zexor-win-solve.py --check
Licence : AEXORRBSHA36325S33
CheckLicense('AEXORRBSHA36325S33') -> 1   CheckLicense('petik') -> 0
```

Cas OK (`1`) et KO (`0`). Pour un test GUI : `xvfb-run -a wine analysis/ZEXOR-01.exe`, saisir la clé, cliquer « Check License » → MessageBox « Congratulations! ».

## Notes

- Aucune section GDB/x64dbg : reverse 100 % statique + émulation.
- Le ZIP du site n'est pas un binaire : penser à l'extraire avant `file`/`diec`.
