# fatmikes_crackme_2 by fatmike

| | |
|---|---|
| **ID** | [`5ab77f5533c5d40ad448c21c`](https://crackmes.one/crackme/5ab77f5533c5d40ad448c21c) · [ORIGIN](ORIGIN.yml) |
| **Auteur** | FaTmiKE (réimport crackmes.de, local `crackmes-de`) |
| **Publié** | 2018-03-25 (crackme de 2005) |
| **Plateforme** | Windows PE32 GUI (MSVC 6), packé UPX 1.24 |
| **Difficulté** | 2.0 |
| **SHA-256 exe** | `885541b4572a4db087148857f4487b994db2e2392791ecfe32cc0fff39aebdf7` |

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/Crackme2.zip`, `original/Crackme2.exe`, `original/rules.txt` | archive + binaire d'origine (non patché) + règles |
| `analysis/Crackme2-unpacked.exe` | `upx -d` (pour le désassemblage uniquement) |
| `analysis/disasm.txt` | `objdump -d -M intel` de l'exe dépacké |
| `analysis/stage2-decrypted.bin` / `.asm` | les 23 dwords de `0x409148` déchiffrés avec `KEWL` / `SHIT` |
| `tools/fatmike2-solve.py` | keygen (`--check`) |
| `tools/dlgdrive.c`, `tools/verify-wine.sh` | preuve live sous wine/Xvfb (WM_SETTEXT + WM_COMMAND) |
| `analysis/wine-run.txt` | sortie de la preuve live |

## Réponse

Objectif (`rules.txt`) : activer la fonction désactivée. Le serial fait 19 caractères `xHHx-xHHx-xHHx-xHHx` : les `HH` dépendent du nom, les `x` sont une clé fixe (`KEWL` + `SHIT`) qui déchiffre la fonction cachée.

**Nom `petik` → serial `K95E-W2CL-S7FH-I13T`**

```bash
python3 tools/fatmike2-solve.py                 # petik K95E-W2CL-S7FH-I13T
python3 tools/fatmike2-solve.py Fatmike         # Fatmike K3CE-W7AL-SD0H-I2FT
python3 tools/fatmike2-solve.py petik --check K95E-W2CL-S7FH-I13T   # OK
tools/verify-wine.sh petik K95E-W2CL-S7FH-I13T  # ... Congratulations, you did it! :-)
```

## Premier regard

```
Crackme2.exe: PE32 executable (GUI) Intel 80386, UPX compressed
diec : MSVC 6.0 (12.00.8168), Packer UPX(1.24)[NRV, brute]
```

`upx -d` suffit. Presque aucune chaîne en clair : le message de réussite est XORé par `0xC8` (`0x40904C`, 0xF6 octets, routine `0x401430`) et le texte « only available in the registered version » est un NOT octet par octet (`0x401290`). Les API utiles (`MessageBoxA`, `GetDlgItemTextA`, `wsprintfA`) sont appelées par une table de pointeurs remplie en `0x4019B1` (`[0x409268]`, `[0x409270]`, `[0x409274]`) : `rg 4080bc` ne trouve donc pas d'appel direct.

## Dialogue et commandes

Le `DialogProc` (`0x401450`) traite `WM_COMMAND` avec une table de saut (`wParam - 0x3E8`) :

| ID | Rôle |
|---|---|
| `0x3EC` | champ Name |
| `0x3EF` | champ Serial |
| `0x3E8` | Check → `0x4014F4` |
| `0x3EA` | « fonction désactivée » → `call [0x409258]` |
| `0x3E9` | Exit |

Au départ `[0x409258] = 0x4018E0`, qui affiche « This function is only available in the registered version! ».

## Étape 1 : la partie dépendant du nom (`0x4014F4`)

```asm
GetDlgItemTextA(0x3EC, name, 0x32)  -> len_n ; > 3 sinon sortie
GetDlgItemTextA(0x3EF, 0x409218, 0x32) -> len_s ; == 0x13 (19)
serial[4] == serial[9] == serial[14] == '-'
esi = Σ movsx(name[i])            ; somme signée des octets
esi = esi * 0xDEADBEEF            ; imul 32 bits
wsprintfA(buf, "%X", esi)         ; format pointé par [0x409144]
buf[0..7] == serial[1,2,6,7,11,12,16,17]
```

Si tout passe : `[0x409258] = [0x40928C] = 0x4012B0`, les champs Name/Serial et le bouton Check sont désactivés (`EnableWindow(…, 0)`) et le bouton `0x3EA` reste actif.

`%X` n'est pas paddé : il faut `h ≥ 0x10000000` pour avoir 8 chiffres (un serial ne peut pas contenir d'octet nul). Pour `petik` : Σ = 541, `541 * 0xDEADBEEF mod 2^32 = 0x952C7F13`.

## Étape 2 : la fonction cachée (`0x4012B0`)

Les 8 caractères « libres » du serial servent de clé :

```asm
[0x409290] -> K1 = s[0]<<24 | s[3]<<16 | s[5]<<8 | s[8]
[0x409294] -> K2 = s[10]<<24 | s[13]<<16 | s[15]<<8 | s[18]
call 0x401110      ; dw[0x409148 + 4i] ^= (i pair ? K1 : K2), i = 0..22
call 0x401770      ; dw[20] == 0x00097BE8 && dw[5] == 0x0D8BD1FF ?
                   ;   oui -> recopie les 23 dwords en 0x401770 et y saute
                   ;   non -> [0x409298] = 1, retour au message « registered version »
```

Un seul dword clair connu par clé suffit :

```
K1 = enc[20] ^ 0x00097BE8 = 0x4B45574C = "KEWL"
K2 = enc[5]  ^ 0x0D8BD1FF = 0x53484954 = "SHIT"
```

Le code déchiffré (`analysis/stage2-decrypted.asm`) lance la musique (`0x401D00`, module XM), déchiffre le texte `0xC8` et appelle `MessageBoxA(hDlg, "..::[FaTmiKE 2oo5]::.. Congratulations, you did it! :-) …", …)`, puis `0x402140`.

D'où le serial : `K` `HH` `E` - `W` `HH` `L` - `S` `HH` `H` - `I` `HH` `T`.

## Vérification live

`tools/verify-wine.sh` lance l'exe **original** (packé) sous `wine` + Xvfb, puis `tools/dlgdrive.c` remplit les champs par `WM_SETTEXT`, envoie `WM_COMMAND 0x3E8`, relit l'état des boutons, clique `0x3EA` et lit le texte de la boîte qui s'ouvre :

```
avant : Check(0x3e8)=1 Name=1 Serial=1 Fonction(0x3ea)=1
apres : Check(0x3e8)=0 Name=0 Serial=0 Fonction(0x3ea)=1
  fenetre : Information
    [..::[FaTmiKE 2oo5]::... Congratulations, you did it! :-) ...]
```

Avec un serial valide pour l'étape 1 seulement (`0950-02C0-07F0-0130`), les champs sont bien grisés mais `0x3EA` affiche toujours « only available in the registered version! » : c'est le piège du crackme, la partie libre du serial compte aussi.
