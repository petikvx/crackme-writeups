# fatmikes_crackme1___fixed_version by fatmike

| | |
|---|---|
| **ID** | [`5ab77f5533c5d40ad448c21d`](https://crackmes.one/crackme/5ab77f5533c5d40ad448c21d) · [ORIGIN](ORIGIN.yml) |
| **Auteur** | FaTmiKE (réimport crackmes.de, local `crackmes-de`) |
| **Publié** | 2018-03-25 (crackme de février 2005, version corrigée) |
| **Plateforme** | Windows PE32 GUI (MSVC 6), packé UPX 1.24 |
| **Difficulté** | 2.0 |
| **SHA-256 exe** | `7975ee0aeeb6cfe65f69fe85466f141ed110d87e9383c001cd8946773b1b3873` |

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/Crackme1.zip`, `original/Crackme1/Crackme#1.exe`, `original/Crackme1/rules.txt` | archive + binaire d'origine (non patché) + règles |
| `analysis/Crackme1-unpacked.exe` | `upx -d` (désassemblage uniquement) |
| `analysis/disasm.txt` | `objdump -d -M intel` de l'exe dépacké |
| `analysis/patch-decrypted.bin` / `.asm` | les 48 octets déchiffrés avec le serial, écrits en `0x40141F` |
| `tools/fatmike1-solve.py` | retrouve la clé par texte clair connu, `--check` |
| `tools/dlgdrive.c`, `tools/verify-wine.sh` | preuve live sous wine/Xvfb |
| `analysis/wine-run.txt` | sortie de la preuve live |

## Réponse

Pas de nom : un seul serial valide (`rules.txt` : « There is only one valid serial »).

**`cip-kicks-ass`**

(« cip » = le site de l'auteur, `http://cip.myz.info/`, présent dans le binaire.)

```bash
python3 tools/fatmike1-solve.py                       # clé depuis le crib : cip-kicks-ass
python3 tools/fatmike1-solve.py --check cip-kicks-ass # hash OK | code = 6a 40 68 14 80 40 00 ...
tools/verify-wine.sh cip-kicks-ass                    # fenetre : Information [Well done!]
```

## Premier regard

```
Crackme#1.exe: PE32 executable (GUI) Intel 80386, UPX compressed
diec : MSVC 6.0, Packer UPX(1.24)[NRV, brute]
```

`upx -d` suffit. Imports intéressants : `WriteProcessMemory`, `OpenProcess`, `GetCurrentProcessId` (auto-modification du code), `GetDlgItemTextA`, `MessageBoxA`. Chaînes en clair dans `.data` : `Information` (`0x408014`), `Well done!` (`0x408020`), `Try again!` (`0x40806C`).

Le `rules.txt` mentionne la correction de la « fixed version » : `0040141Ch: ADD ESP, 8` devient `ADD ESP, 4` (nettoyage de la pile après `call 0x4011C6`, qui ne prend qu'un argument).

## Le bouton Check (`WM_COMMAND 0x3E8`)

```asm
4013f7  GetDlgItemTextA(hDlg, 0x3EB, 0x4080C4, 0x32) -> [0x408130] = longueur
401412  push 0x40141F
401417  call 0x4011C6        ; argument = adresse où écrire le code
40141c  add  esp, 4
40141f  90 x 48              ; trou de 48 NOP, rempli à l'exécution
40144f  jmp  0x4014A6
```

`0x4011C6` :

```c
for (i = 0, j = 0; i < 0x30; i++, j++) {
    if (serial[j] == 0) j = 0;                 // la clé tourne sur le serial
    dec[i] = serial[j] ^ enc[i];               // enc = 48 octets en 0x40802C
}
copie = strncpy(malloc(0x32), dec, 0x30);
if (hash(0x16049, copie) == 0xFE65 && len == 13)
    WriteProcessMemory(OpenProcess(PROCESS_VM_WRITE|VM_OPERATION, 0, GetCurrentProcessId()),
                       0x40141F, dec, 0x30, 0);
else
    MessageBoxA(hDlg, "Try again!", "Information", MB_ICONINFORMATION);
```

`0x40115B` est un hash type ELF (`h = (h<<4) + c ; si h & 0xF0000000 : h ^= top>>24 ; h ^= top`) qui **s'arrête au premier octet nul**, puis `h % 0x16049`.

## Retrouver la clé : texte clair connu

Les 48 octets déchiffrés deviennent du code qui s'exécute juste après le `call`. La branche d'échec montre comment l'auteur appelle `MessageBoxA` : `push 40h / push "Information" / push "message" / mov reg,[0x408134] / push reg / call [MessageBoxA]`. Avec « Well done! » (`0x408020`), les premiers octets attendus sont :

```
6a 40 68 14 80 40 00 68 20 80 40 00 a1      ; push 40h / push 408014h / push 408020h / mov eax,[...]
```

XOR avec `enc[0..12]` → **`cip-kicks-ass`** (13 caractères, exactement la longueur demandée). Le code complet déchiffré (`analysis/patch-decrypted.asm`) :

```asm
40141f  push 0x40 / push 0x408014 / push 0x408020 / push [0x408134]
401431  call MessageBoxA            ; "Well done!"
401437  EndDialog(hDlg, 0)
401443  PostQuitMessage(0)
40144b  xor eax, eax / jmp 0x4014C9
```

## Le piège du hash

`dec[6]` vaut `0x00` (octet haut de `push 0x408014`), donc le hash ne porte que sur `dec[0..5]`, c'est-à-dire sur les 6 premiers caractères `cip-ki`. N'importe quel `cip-ki???????` passe le test `0xFE65` et le crackme écrit alors du code faux en `0x40141F`, qui plante : sous wine, `cip-kicks-asz` ne donne ni « Well done! » ni « Try again! », le processus meurt. Le seul serial qui se comporte correctement est donc `cip-kicks-ass`, ce que confirme le texte clair.

## Vérification live

`tools/verify-wine.sh` lance l'exe **original** (packé) sous wine + Xvfb, `tools/dlgdrive.c` remplit le champ `0x3EB` par `WM_SETTEXT`, poste `WM_COMMAND 0x3E8` (la boîte est modale, d'où `PostMessage`) et lit les fenêtres du processus :

```
$ tools/verify-wine.sh cip-kicks-ass
  fenetre : Information
    [OK]
    [Well done!]
$ tools/verify-wine.sh wrongserial12
  fenetre : Information
    [OK]
    [Try again!]
```
