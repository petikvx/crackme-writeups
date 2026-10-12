# fatmikes_crackme1 by fatmike

| | |
|---|---|
| **ID** | [`5ab77f5533c5d40ad448c21f`](https://crackmes.one/crackme/5ab77f5533c5d40ad448c21f) · [ORIGIN](ORIGIN.yml) |
| **Auteur** | FaTmiKE (réimport crackmes.de, local `crackmes-de`) |
| **Publié** | 2018-03-25 (crackme de février 2005, version **originale**) |
| **Plateforme** | Windows PE32 GUI (MSVC 6), packé UPX 1.24 |
| **Difficulté** | 2.0 |
| **SHA-256 exe** | `31d1219455f278ea84007a3765795323c88ae8df7e726367f9a685641c98de3a` |

C'est la première version du Crackme #1 de FaTmiKE. La version corrigée a déjà son write-up détaillé :
[fatmikes_crackme1___fixed_version](../5ab77f5533c5d40ad448c21d/). Ici on montre que les deux binaires ne
diffèrent que par un octet de code, donc que le serial est le même, et on le vérifie sur l'exe original.

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/Crackme1.zip`, `original/Crackme1/Crackme#1.exe`, `original/Crackme1/rules.txt` | archive + binaire d'origine (non patché) + règles |
| `analysis/Crackme1-unpacked.exe` | `upx -d` (désassemblage uniquement) |
| `analysis/disasm.txt` | `objdump -d -M intel` de l'exe dépacké |
| `analysis/diff-vs-fixed.txt` | `cmp -l` contre l'exe dépacké de la fixed version |
| `analysis/patch-decrypted.bin` / `.asm` | les 48 octets déchiffrés avec le serial, écrits en `0x40141F` |
| `tools/fatmike1-orig-solve.py` | retrouve la clé par texte clair connu, `--check` |
| `tools/dlgdrive.c`, `tools/verify-wine.sh` | preuve live sous wine/Xvfb |
| `analysis/wine-run.txt` | sortie de la preuve live |

## Réponse

Pas de nom, un seul serial valide (`rules.txt` : « There is only one valid serial ») :

**`cip-kicks-ass`**

```bash
python3 tools/fatmike1-orig-solve.py                       # clé depuis le crib : cip-kicks-ass
python3 tools/fatmike1-orig-solve.py --check cip-kicks-ass # hash OK | code = 6a 40 68 14 80 40 00 ...
tools/verify-wine.sh cip-kicks-ass                         # fenetre : Information [Well done!]
```

## Premier regard

```
Crackme#1.exe: PE32 executable (GUI) Intel 80386, UPX compressed
diec : MSVC 6.0 (Linker 6.00.8168), Packer UPX(1.24)[NRV, brute]
```

`upx -d` suffit, comme pour la fixed version. Mêmes imports (`WriteProcessMemory`, `OpenProcess`,
`GetCurrentProcessId`, `GetDlgItemTextA`, `MessageBoxA`) et mêmes chaînes (`Well done!` en `0x408020`,
`Try again!` en `0x40806C`).

## Différence avec la fixed version

Après `upx -d`, la comparaison octet par octet des deux exe ne donne que 4 différences :

```
$ cmp -l analysis/Crackme1-unpacked.exe ../5ab77f5533c5d40ad448c21d/analysis/Crackme1-unpacked.exe
   241 256 111      \
   242 201 151       > champ CheckSum de l'en-tête PE (offset 0xF0)
   243  23  32      /
  5151  10   4      offset 0x141E = immédiat du add esp en 0x40141C
```

```asm
; version originale                         ; fixed version
401412  push 0x40141F                       401412  push 0x40141F
401417  call 0x4011C6                       401417  call 0x4011C6
40141c  add  esp, 8      ; 83 c4 08         40141c  add  esp, 4      ; 83 c4 04
40141f  90 x 48          ; trou rempli      40141f  90 x 48
```

`0x4011C6` ne prend qu'un argument (l'adresse où écrire le code), donc l'original dépile 4 octets de trop.
C'est le « Known bug » du `rules.txt` (plantage sous Windows 2000 SP4). Les 48 octets chiffrés de
`0x40802C`, la routine de déchiffrement et le hash sont identiques, donc la solution aussi.

## Rappel de la vérification (détails dans la fixed version)

`0x4011C6` calcule `dec[i] = serial[i % 13] ^ enc[i]` sur 48 octets, exige `len == 13` et
`hash_ELF(dec) % 0x16049 == 0xFE65`, puis écrit `dec` en `0x40141F` avec `WriteProcessMemory`.
Le code déchiffré doit être l'appel `MessageBoxA(hDlg, "Well done!", "Information", 0x40)` ;
le texte clair connu `6a 40 68 14 80 40 00 68 20 80 40 00 a1` XOR `enc[0..12]` donne `cip-kicks-ass`.
Le hash s'arrête au premier octet nul (`dec[6]`), donc il ne couvre que `cip-ki` : un serial comme
`cip-kicks-asz` passe le hash mais écrit du code faux, et le processus plante sans message.

## Vérification live

`tools/verify-wine.sh` lance l'exe **original** (packé) sous wine + Xvfb, et `tools/dlgdrive.c` remplit
le champ `0x3EB`, poste `WM_COMMAND 0x3E8`, puis lit les fenêtres du processus. Malgré le `add esp, 8`,
wine affiche bien le message avant la fin du handler :

```
$ tools/verify-wine.sh cip-kicks-ass
  fenetre : Information
    [OK]
    [Well done!]
$ tools/verify-wine.sh cip-kicks-asz      # hash OK mais mauvais code : rien, le processus meurt
$ tools/verify-wine.sh wrongserial12
  fenetre : Information
    [OK]
    [Try again!]
```
