# Secret message from a traveller

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/650c14b528b5870bef26308d) · id `650c14b528b5870bef26308d`

Crackme **floppy FAT12** (1,44 Mo), bootloader **x86 real mode** + payload **XTEA**.  
Auteur : **2bitsin**. Plateforme annoncée *Multiplatform* — en pratique un **PC IBM** (BIOS ROM PS/1).

| Fichier | Rôle |
|---|---|
| [`original/floppy.img`](original/floppy.img) | image disquette 2880×512 |
| [`analysis/extracted/SECUREOS.BIN`](analysis/extracted/SECUREOS.BIN) | fichier chiffré (FAT) |
| [`analysis/extracted/SECUREOS.dec.bin`](analysis/extracted/SECUREOS.dec.bin) | après XTEA (généré par le solveur) |
| [`analysis/screenshot01.png`](analysis/screenshot01.png) | framebuffer mode 13h (indices → gris) |
| [`tools/secret-message-solve.py`](tools/secret-message-solve.py) | decrypt + flag |

## Réponse

| | |
|---|---|
| **Flag** | **`teso{john_titor_was_here}`** |

```bash
python3 tools/secret-message-solve.py -q
# teso{john_titor_was_here}

python3 tools/secret-message-solve.py --check
# decrypt ok  sha256=f58544598d5104200ef9faf58cfbff6ecb30c2c89db9748c659094bc4b94e6da
# flag        teso{john_titor_was_here}
# OK
```

John Titor = le « voyageur » du titre (hoax time-travel / IBM 5100).

---

## Premier regard

```text
floppy.img: FAT12, OEM "ERR 401", label INPCWETRUST, 2880 sectors
SHA-256 6a40801cea09a0936cac64e76c3cab0a4c6139afaaed080774c75e95b19479ff
```

Root directory : volume label + **`SECUREOS.BIN`** (66 000 octets, cluster 3).  
Sous QEMU « stock », le boot affiche `ERR 401` en boucle (échec vérif BIOS).

## Flow (MBR @ `0000:7C00`)

1. `jmp` après le BPB ; sauve `DL` (drive) ; `INT 13h AH=08` pour heads/spt.
2. Charge la FAT puis le root, cherche l’entrée `SECUREOSBIN`.
3. Charge le fichier en **`0800:0000`** (linéaire `0x8000`).
4. **XTEA decrypt** in-place : pour chaque paragraphe `DS = 0x800 … BX-1`, deux blocs de 8 octets (`SI=0` puis `SI=8`).  
   - 64 rounds, `sum0 = 0x9E3779B9 * 64 = 0x8DDE6E40`  
   - clé lue en **`ES=0xE404`**, `DI=0` → physique **`0xE4040`**
5. Vérif « machine spéciale » : avec `DF=1`, ajoute 7 octets du MBR (`7DF2` descendant) sur **`F000:0000`** ; chaque somme doit être 0.  
   ⇒ la ROM doit contenir **`92F9674`** en clair à `F000:0`.
6. `JMPF 0800:0000` → payload (écran mode 13h + animation palette).

Constantes de verrou (MBR) :

```text
additions (ordre LODSB avec STD) : C7 CE BA C7 CA C9 CC
⇒ bytes ROM requis          : 39 32 46 39 36 37 34  = "92F9674"
```

## Prédicat — clé XTEA = ROM IBM PS/1

`92F9674` est le **P/N** de la ROM BIOS **IBM PS/1 2121** (US). Une image 256 KiB mappée en **`0xC0000–0xFFFFF`** place :

| Physique | Offset fichier ROM | Contenu utile |
|---|---|---|
| `0xF0000` | `0x30000` | `92F9674` (verif) |
| `0xE4040` | `0x24040` | clé XTEA 16 octets |

Mots clé little-endian (ASCII `/26/88R:EF8.*6.@`) :

```text
0x2f36322f  0x3a523838  0x1d384645  0x4080362a
```

Le solveur applique le même XTEA que le MBR et retrouve le plaintext (`mov ax,0x9000` …, bannière `Loading...`).

Voie « hardware » (sans patch) : QEMU avec cette ROM (`-bios` / mapping C0000) pour que decrypt + verif passent tout seuls. Voie analyse : decrypt offline + lecture du framebuffer (ci-dessous) — **pas besoin** de redistribuer la ROM copyrightée.

## Payload & flag

Après XTEA, le binaire :

1. Affiche `Loading...` (télétype `INT 10h`).
2. Passe en **mode 13h** (`AX=0x13`), blitte 64 000 indices depuis `087C:0000`.
3. Boucle : rotation / morphing de palette VGA (effet « plasma » cyan).

Le message n’est **pas** une chaîne ASCII dans le plaintext : il est **dessiné** dans le framebuffer indexé. Rendu gris des indices (autocontrast) :

![flag framebuffer](analysis/screenshot01.png)

→ **`teso{john_titor_was_here}`**

## Vérification

```bash
# Extract FAT (déjà fait sous analysis/extracted/) + XTEA + contrôles
python3 tools/secret-message-solve.py --check
```

Preuve visuelle : [`analysis/screenshot01.png`](analysis/screenshot01.png) (indices mode 13h, sans avoir besoin de QEMU).  
Avec un émulateur + image patchée (plaintext remplacé + `JMPF` à `7D00`) ou la vraie ROM PS/1, l’écran animé affiche le même flag.

## Notes

- OEM / message d’erreur `ERR 401` = le BPB + routine d’échec, pas un code HTTP.
- Label volume `INPCWETRUST` : clin d’œil « In PC we trust ».
- Ce n’est **pas** un keygen name→serial : un seul secret, la **machine** (ROM) + crypto XTEA.
- Patcher le MBR pour sauter decrypt/verif fonctionne aussi (write-up public cnathansmith) ; ici on reconstruit la clé légitime.
