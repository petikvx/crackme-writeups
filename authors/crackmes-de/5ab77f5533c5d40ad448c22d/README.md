# kgm1 by kkr_we_rule

| | |
|---|---|
| **ID** | [`5ab77f5533c5d40ad448c22d`](https://crackmes.one/crackme/5ab77f5533c5d40ad448c22d) · [ORIGIN](ORIGIN.yml) |
| **Auteur** | KKR (réimport crackmes.de, local `crackmes-de`) |
| **Publié** | 2018-03-25 (keygenme de Noël 2015) |
| **Plateforme** | Windows PE32 GUI, MASM32 (code de 0x410 octets, pas de packer), boîte de dialogue |
| **Difficulté** | 2.0 |
| **SHA-256 exe** | `c888c78d209d32262549f8fc208f0204940e03e0f5ac974e85ef0a7374cc3c98` |

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/Kgm#1.zip`, `original/Kgm#1/Keygenme#1.exe`, `original/Kgm#1/ReadMe.txt` | archive + binaire d'origine + consignes (« Goal is to write a keygen. Patching is forbidden ») |
| `analysis/disasm.txt` | `objdump -d -M intel` de `.text` (tout le programme) |
| `tools/kgm1-keygen.py` | keygen (`-q`, `--check NOM SERIAL`) |
| `tools/drive.c`, `tools/verify-wine.sh` | preuve live sous wine/Xvfb |
| `analysis/wine-run.txt` | sortie de la preuve live (2 OK, 3 KO) |

## Réponse

Serial = trois nombres **hexadécimaux** (majuscules) `w0-w1-w2` solution, modulo 499, du système

$$
\begin{pmatrix}15&18&21\\14&17&20\\16&18&19\end{pmatrix}
\begin{pmatrix}w_0\\w_1\\w_2\end{pmatrix}
\equiv
\begin{pmatrix}s_1\\s_2\\s_3\end{pmatrix} \pmod{499}
$$

avec \( s_1 = \sum c_i \), \( s_2 = \sum (c_i \cdot i) \oplus i \) (i à partir de 1), \( s_3 = s_1 + s_2 \) sur les octets du nom.

```
Nom    : petik       (s1, s2, s3) mod 499 = (42, 113, 155)
Serial : 5-1DD-1BD

Nom    : crackmes    (342, 313, 156)
Serial : 132-1DB-F6
```

```bash
python3 tools/kgm1-keygen.py petik                      # serial = 5-1DD-1BD
python3 tools/kgm1-keygen.py --check petik 5-1DD-1BD    # OK
tools/verify-wine.sh petik 5-1DD-1BD                    # MessageBox « Excellent Work! / Serial is accepted! »
```

## Premier regard

```
Keygenme#1.exe: PE32 executable for MS Windows 4.00 (GUI), Intel i386, 4 sections
diec : Linker Microsoft Linker(5.12.8078), Compiler MASM(6.14.8444), Tool MASM32
```

Imports minimaux : `DialogBoxParamA`, `GetDlgItemTextA`, `MessageBoxA`, `EndDialog`, `LoadIconA` (user32), `GetModuleHandleA`, `ExitProcess`, `RtlZeroMemory` (kernel32). Chaînes : `Serial is accepted!` / `Excellent Work!`, `Invalid Serial. Try Again!` / `Wrong!`, `Please enter a name!!`, `Please enter a serial!!`. Le `ReadMe.txt` annonce « no crypto in this! ». `objdump` suffit.

## Flow

1. `0x401000` : `DialogBoxParamA(…, 0x65, …, DlgProc = 0x401028)`.
2. `DlgProc` : `WM_COMMAND` + `0x3EB` → `check(hDlg)` en `0x401099` ; `0x3EC` → `EndDialog` ; `WM_CLOSE` remet les buffers à zéro (`0x401354`, `RtlZeroMemory`).
3. `check` :
   - `GetDlgItemTextA(0x3E9)` → nom en `0x403000`, longueur en `0x403200` (0 → « No name! ») ;
   - `GetDlgItemTextA(0x3EA)` → serial en `0x403100`, longueur en `0x40320A` (0 → « No Serial! ») ;
   - `0x40115D` hash du nom, `0x4011BA` parse du serial, `0x40124C` calcul sur le serial, `0x4012FD` comparaison → `eax == 1` : « Excellent Work! ».

## Comment on trouve le prédicat

### Nom → `s1`, `s2`, `s3` (`0x40115D`)

```asm
401174  movzx eax, byte [edx+esi-1]   ; c_i (edx = i, 1-based)
401179  add   ebx, eax                ; s1 += c_i               -> [0x403214]
401192  movzx eax, byte [edx+esi-1]
401197  imul  eax, edx                ; c_i * i
40119a  xor   eax, edx                ; ^ i
40119c  add   ebx, eax                ; s2 += (c_i*i) ^ i       -> [0x403264]
4011af  add   ebx, [0x403214]         ; s3 = s1 + s2            -> [0x4032B4]
```

### Serial → `w0, w1, w2` (`0x4011BA`)

Lecture caractère par caractère, séparateur `-` (0x2D) :

```asm
4011d8  cmp eax,'9' ; jle -> v = c - '0'
4011dd  cmp eax,'A' ... 'F' -> v = 10..15     ; seules les MAJUSCULES sont des chiffres hexa
401225  sub eax,0x30                          ; toute autre lettre : c - '0' (ex. 'a' -> 49)
401228  add ebx,eax ; shl ebx,4               ; acc = (acc + v) << 4
401231  shr ebx,4                             ; fin de groupe : acc = valeur hexa
401234  mov [ecx+0x403304], ebx ; add ecx,2   ; dword écrit tous les 2 octets
```

Les groupes sont stockés comme **dwords à 2 octets d'écart** (`0x403304`, `0x403306`, `0x403308`) : chaque groupe écrase le mot haut du précédent, donc seuls les **16 bits bas** de chaque groupe comptent. C'est pour ça que `5-1dd-1bd` (minuscules) est refusé : `d` vaut `0x64 - 0x30 = 52`, pas 13.

### Calcul et comparaison (`0x40124C`, `0x4012FD`)

Chaque bloc fait `mov ax, [w_k] ; imul eax, eax, coef ; cdq ; idiv ecx` avec `ecx = 0x1F3 = 499` et garde le reste :

```
m1 = (15·w0 mod 499 + 18·w1 mod 499 + 21·w2 mod 499) mod 499    -> [0x403354]
m2 = (14·w0 + 17·w1 + 20·w2) mod 499 (même schéma)              -> [0x4033A4]
m3 = (16·w0 + 18·w1 + 19·w2) mod 499                            -> [0x4033F4]
```

(`mov ax, …` ne charge que 16 bits, mais le haut d'`eax` vaut toujours 0 à ce moment : les quotients précédents sont < 65536.)

`0x4012FD` empile `s1 mod 499`, `s2 mod 499`, `s3 mod 499`, puis fait `(m3 ^ s3') + (m2 ^ s2') + (m1 ^ s1')` et exige **0** : chaque XOR est ≥ 0, donc les trois égalités doivent tenir.

## Keygen

499 est premier et le déterminant de la matrice vaut −3 ≢ 0 (mod 499) : le système a une **solution unique** dans [0, 498]³, obtenue par Gauss-Jordan modulo 499 (`tools/kgm1-keygen.py`). On l'écrit en hexa majuscule.

Comme seul `w mod 499` compte, chaque mot peut aussi être augmenté d'un multiple de 499 (`0x1F3`) tant qu'il tient sur 16 bits : `1F8-1DD-1BD` passe aussi le `--check` du keygen pour `petik` (non testé sous wine).

## Vérification

Binaire d'origine sous `Xvfb` + wine, piloté par `tools/drive.c` (`SetDlgItemTextA` sur `0x3E9`/`0x3EA`, `WM_COMMAND 0x3EB`, puis lecture de la MessageBox) :

| Nom | Serial | Résultat wine |
|---|---|---|
| `petik` | `5-1DD-1BD` | **Excellent Work! / Serial is accepted!** |
| `crackmes` | `132-1DB-F6` | **Excellent Work! / Serial is accepted!** |
| `petik` | `5-1DD-1BE` | Wrong! / Invalid Serial. Try Again! |
| `petik` | `5-1dd-1bd` (minuscules) | Wrong! |
| `crackmes` | `5-1DD-1BD` (serial d'un autre nom) | Wrong! |

Sortie brute : [`analysis/wine-run.txt`](analysis/wine-run.txt).

## Notes

- Pas de crypto, comme promis : trois sommes du nom et un système linéaire 3×3 modulo 499.
- Les buffers ne sont remis à zéro qu'à la fermeture (`WM_CLOSE`) : un serial à moins de 3 groupes réutilise les mots de l'essai précédent. Le keygen produit toujours 3 groupes.
- Reverse 100 % statique (`objdump`), pas de GDB ni de debugger.
