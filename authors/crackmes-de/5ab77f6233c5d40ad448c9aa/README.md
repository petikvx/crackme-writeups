# connrs_crackme (connr)

> [crackmes.one](https://crackmes.one/crackme/5ab77f6233c5d40ad448c9aa) · DOS MZ + UPX — registration code 4 chiffres.

| Fichier | Rôle |
|---|---|
| [`original/Crackme.zip`](original/Crackme.zip) | ZIP site (contient `Crackme.exe`) |
| [`original/_u/Crackme.exe`](original/_u/Crackme.exe) | MZ DOS **UPX** (519 o) |
| [`analysis/Crackme.unpacked.exe`](analysis/Crackme.unpacked.exe) | après `upx -d` (838 o) |
| [`tools/connrs-crackme-solve.py`](tools/connrs-crackme-solve.py) | code + `--check` (statique / Unicorn) |

## Réponse

**Code d’enregistrement : `2813`**

```bash
python3 tools/connrs-crackme-solve.py -q
python3 tools/connrs-crackme-solve.py --check
```

## Premier regard

```text
original/_u/Crackme.exe: MS-DOS executable, MZ for MS-DOS
UPX 3.96 — dos/exe — 838 <- 519
```

ZIP imbriqué : `Crackme.zip` → `Crackme.exe`. Strings scrambleés tant que packé (`UPX!`, fragments `nter reg` / `Yay!`).

Unpack (copie sous `analysis/`, original intact) :

```bash
upx -d -o analysis/Crackme.unpacked.exe original/_u/Crackme.exe
```

## Flow

1. `ah=09` — affiche `Enter registration code: `
2. Boucle **4×** : `ah=08` (char sans echo) → `push ax` → echo `*` (`ah=02`)
3. Attend Enter (`al == 0x0D`)
4. Quatre `pop ax` + `cmp al` contre **`3`**, **`1`**, **`8`**, **`2`** (ordre pile = LIFO)
5. Succès → `Good job, Yay!` ; sinon → `Sorry, you suck … wraffels`
6. `Press enter to continue...`

Donc la saisie (ordre chronologique) est **`2` `8` `1` `3`**.

## Prédicat (extrait unpacké)

```asm
; cx=4 : read+push+echo '*'
; puis :
pop ax ; cmp al, '3'  ; dernier char
pop ax ; cmp al, '1'
pop ax ; cmp al, '8'
pop ax ; cmp al, '2'  ; premier char
```

## Vérification

Pas de DOSBox sur la machine de reverse. Preuve :

1. **Statique** — séquence `3C 33 / 3C 31 / 3C 38 / 3C 32` dans le `.exe` unpacké.
2. **Dynamique** — émulation Unicorn 16-bit + hooks `int 21h` (`tools/… --check`) :
   - `2813` → `Good job, Yay!`
   - `0000` / `3182` → `Sorry…`

## Notes

- Ce n’est **pas** un PE Windows ; Wine ne convient pas.
- Le message d’échec mentionne « wraffels » (typo / blague de l’auteur).
- Difficulté site : Assembler x86 / ~1.0.
