# 4f.crackme1 by ximus

| | |
|---|---|
| **ID** | [`5ab77f5333c5d40ad448c12e`](https://crackmes.one/crackme/5ab77f5333c5d40ad448c12e) |
| **Auteur (site)** | crackmes.de |
| **Auteur (local)** | crackmes-de |
| **Auteur (crackme)** | ximus (X[!]M.4F) |
| **Plateforme** | Windows PE32 GUI (MSVC 7.0) |
| **Publié** | 2018-03-25 (réimport crackmes.de) |
| **SHA-256** | `7999c6beb819b930fd5bc56a7d016401e2f429a886ebaab258c7ba24d2802afc` |

## Origine

- Page : https://crackmes.one/crackme/5ab77f5333c5d40ad448c12e
- Download : https://crackmes.one/download/crackme/5ab77f5333c5d40ad448c12e
- ZIP password : `crackmes.one`

Voir [`ORIGIN.yml`](ORIGIN.yml).

## Réponse (keygen)

```
Name   : petik
Serial : 52216-A3399
```

Serial `ABCDE-HHHHH` (11 caractères) :

```
C = name[0] % 10    D = name[1] % 10    E = name[2] % 10
B = (C·D·E) % 10    A = (B + C + D) % 10
HHHHH = 5 premiers car. de "%X" % ((Σ name[i]) · 0xFEAD & 0xFFFFF)
```

petik : `p,e,t` = 112,101,116 → C,D,E = 2,1,6 ; B = 12 % 10 = 2 ; A = 5 % 10 = 5 ; Σ = 541 → `541·0xFEAD & 0xFFFFF = 0xA3399` → **`52216-A3399`**.

## Premier regard

```bash
7z x -pcrackmes.one original/crackme1.zip   # crackme.exe + ReadMe.txt
diec crackme.exe     # MSVC 7.0 ; « PELock » signalé mais le .text est lisible tel quel
```

`ReadMe.txt` : « Write a keygen ». Imports `GetDlgItemTextA`, `wsprintfA`, `MessageBoxA` ; format **`%X`** dans `.rdata` (`0x4050fc`), messages `Wow!!! G00d work!!!` / `Dance behind the display!!! …` (`Fooo...`).

## Comment on trouve

Toute la vérif est dans `sub_401000(name, serial)` (appelée par la DlgProc `0x401127` sur `WM_COMMAND`) :

```bash
objdump -d -M intel crackme.exe --start-address=0x401000 --stop-address=0x401127
```

```asm
strlen(name) >= 3 ; strlen(serial) == 0xb ; serial[5] == '-'
add byte [serial+i], 0xd0 (i=0..4)        ; '0'..'9' → 0..9
(s1+s2+s3) % 10 == s0                     ; idiv 10
(s2*s3*s4) % 10 == s1
name[0] % 10 == s2 ; name[1] % 10 == s3 ; name[2] % 10 == s4
edi = Σ name[i] ; imul edi,0xfead ; and edi,0xfffff
wsprintfA(buf, "%X", edi)
buf[0..4] == serial[6..10]                ; 5 octets comparés
```

Remarque : si `"%X"` fait moins de 5 caractères (hash < `0x10000`), il faudrait un `\0` dans le serial → nom invalide ; pour `petik` le hash vaut `A3399` (5 car.).

## Keygen

[`tools/crackmes-de-4f.crackme1-solve.py`](tools/crackmes-de-4f.crackme1-solve.py) :

```bash
python3 tools/crackmes-de-4f.crackme1-solve.py          # petik / 52216-A3399
python3 tools/crackmes-de-4f.crackme1-solve.py crackmes # crackmes / 52947-4A655
python3 tools/crackmes-de-4f.crackme1-solve.py --check petik 52216-A3399   # OK
```

## Vérification live (Wine)

`Xvfb` + `wine crackme.exe` + `xdotool` (Name, Serial, **Check!**), `WINEDEBUG=+relay` :

- `petik` / `52216-A3399` → `MessageBoxA(…, "Wow!!! G00d work!!! …", "hey!!!")` ([`analysis/good-petik.png`](analysis/good-petik.png))
- `petik` / `52216-A3398` → `MessageBoxA(…, "Dance behind the display!!! It's must help you!!! :D", "Fooo...")` ([`analysis/bad.png`](analysis/bad.png))

Reverse statique (pas de GDB).
