# crackmes.de's crackme_1_by_dip22e (crcme) by dip22e

| | |
|---|---|
| **ID** | [`5ab77f5833c5d40ad448c396`](https://crackmes.one/crackme/5ab77f5833c5d40ad448c396) · [`ORIGIN.yml`](ORIGIN.yml) |
| **Auteur** | dip22e (via crackmes.de) |
| **Plateforme** | Windows PE32 GUI (x86), MASM 6.14, linker 5.12 |
| **SHA-256 (zip)** | `38bea0c9ce843502458086ad0f9fb4b4af6571f0a250e697fc5bb68a3c7602c4` |

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/crcme.zip` | archive d'origine (mot de passe `crackmes.one`) — non modifiée |
| `analysis/extracted/` | `crcme.exe` + `readme.txt` extraits du zip |
| `tools/crcme-solve.py` | keygen / vérificateur |

## Réponse

Le serial ne dépend d'aucun nom (pas de champ user, donc `petik` n'est pas utilisé) : **8 lettres minuscules** telles que `serial[i] % (8 - i) == 0`.

| Serial | Résultat |
|---|---|
| **`pilihfdb`** | `CRACKED! / MAKE A KEYGEN!` |
| `hifxlfre` | OK |
| `aaaaaaaa` | `NoOo...` |

```bash
python3 tools/crcme-solve.py            # serial = pilihfdb
python3 tools/crcme-solve.py -r -n 5 -q # serials aléatoires
python3 tools/crcme-solve.py --check pilihfdb
```

## Premier regard

```bash
unzip -P crackmes.one original/crcme.zip -d analysis/extracted
file analysis/extracted/crcme.exe   # PE32 GUI, 2 sections (.data, .rsrc)
diec analysis/extracted/crcme.exe   # MASM 6.14, Microsoft Linker 5.12
strings -n 5 analysis/extracted/crcme.exe
```

Les strings révèlent `NoOo...`, `CRACKED!`, `MAKE A KEYGEN!`, et les imports `DialogBoxParamA`, `GetDlgItemTextA`, `MessageBoxA`. Pas de section `.text` : le code vit dans `.data` (RVA `0x220`, entry point `0x2d0`, base `0x400000`), donc `objdump -d` sur le PE ne désassemble rien. Piège contourné avec :

```bash
objdump -D -b binary -m i386 -M intel --adjust-vma=0x400000 \
  --start-address=0x400220 --stop-address=0x400500 analysis/extracted/crcme.exe
```

## Flow

- `0x4002d0` : `GetModuleHandleA(0)` puis `DialogBoxParamA(hInst, "dlg", 0, DlgProc, 0)`.
- `DlgProc` à `0x4002f3` :
  - `WM_INITDIALOG` (0x110) : icône ;
  - `WM_COMMAND` (0x111), id `0xC9` = bouton de vérification, id `0xCA` = bouton « about » (message `FiND SERiAL! / no patching!`).

## Comment on trouve le prédicat

Handler du bouton `0xC9` (`0x40033d`…) :

```asm
mov  eax, fs:[0x18]        ; TEB
mov  eax, [eax+0x30]       ; PEB
movzx eax, byte [eax+2]    ; BeingDebugged
test eax, eax
jnz  fail                  ; anti-debug trivial
push 0x10 / push 0x400260 / push 0x65 / push hDlg
call GetDlgItemTextA       ; lit l'edit 0x65 dans buf=0x400260, max 16
cmp  eax, 8                ; longueur exactement 8
jne  fail
mov  ecx, eax              ; ecx = 8
lea  esi, [0x400260]
loop:
  lodsb                    ; al = serial[i]
  cmp  al,'a' ; jl fail
  cmp  al,'z' ; jg fail    ; a-z uniquement
  cdq
  mov  ebx, ecx
  div  ebx                 ; edx = al % ecx
  test edx,edx ; jnz fail  ; doit être divisible
  dec  ecx
  test ecx,ecx ; jnz loop
-> MessageBoxA("MAKE A KEYGEN!", "CRACKED!")
```

Lecture : `ecx` décroît de 8 à 1 pendant que `esi` avance, donc le caractère d'indice `i` est divisible par `8 - i`. (`eax` ne contient que l'octet chargé : `lodsb` ne touche que `al` et le quotient reste < 256, donc `cdq`/`div` travaille bien sur la valeur du caractère.)

Candidats par position (a-z = 0x61..0x7a) :

| i | diviseur | lettres possibles |
|---|---|---|
| 0 | 8 | `h p x` |
| 1 | 7 | `b i p w` |
| 2 | 6 | `f l r x` |
| 3 | 5 | `d i n s x` |
| 4 | 4 | `d h l p t x` |
| 5 | 3 | `c f i l o r u x` |
| 6 | 2 | `b d f h j l n p r t v x z` |
| 7 | 1 | n'importe quelle lettre |

Exemple `pilihfdb` : `p`=112=8·14, `i`=105=7·15, `l`=108=6·18, `i`=105=5·21, `h`=104=4·26, `f`=102=3·34, `d`=100=2·50, `b`=98 (÷1).
Soit 3·4·4·5·6·8·13·26 combinaisons valides.

## Vérification

Sous Wine avec Xvfb et xdotool (saisie dans l'edit, Tab, Entrée, puis recherche de la fenêtre MessageBox par titre) :

```bash
xvfb-run -a bash -c 'wine analysis/extracted/crcme.exe & sleep 6;
  W=$(xdotool search --name CrackMe|head -1); xdotool windowfocus $W;
  xdotool type "pilihfdb"; xdotool key Tab Return; sleep 2;
  xdotool search --name CRACKED'
```

| Serial | Fenêtre trouvée |
|---|---|
| `pilihfdb` | `CRACKED!` ✔ |
| `hifxlfre` | `CRACKED!` ✔ |
| `pilihfdc` (dernier char libre) | `CRACKED!` ✔ |
| `aaaaaaaa` | `NoOo...` ✘ |
| `pilihfeb` (`e`=101 non pair en position 6) | `NoOo...` ✘ |

Pas de session GDB : reverse statique + preuve Wine.

## Notes

- Le test `BeingDebugged` n'a d'effet que sous debugger ; sous Wine sans debugger il passe.
- Le dernier caractère n'est contraint que par a-z (diviseur 1).
- Aucun lien avec un nom d'utilisateur : keygen = tirage dans les ensembles ci-dessus.
