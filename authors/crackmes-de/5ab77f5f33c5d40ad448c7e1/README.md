# crackmes.de's cropta_1 by cropta

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/5ab77f5f33c5d40ad448c7e1) · id `5ab77f5f33c5d40ad448c7e1`

Crackme **MBR** livré comme image disque Bochs (multiplateforme via émulateur). Auteur d’origine : **cropta**.

| Fichier | Rôle |
|---|---|
| [`original/crackme.zip`](original/crackme.zip) | archive (mdp `crackmes.one`) |
| [`original/_u/bochs.img`](original/_u/bochs.img) | flat disk 20 cyl × 16 hd × 63 spt |
| [`original/_u/bochsrc`](original/_u/bochsrc) | config Bochs (chemins BIOS Windows d’époque) |
| [`original/_u/HardDisk`](original/_u/HardDisk) | préfixe 8 KiB (= 16 premiers secteurs de `bochs.img`) |
| [`tools/cropta1-solve.py`](tools/cropta1-solve.py) | solveur + `--check` (prédicat + Unicorn 16-bit) |
| [`analysis/sector0.bin`](analysis/sector0.bin) … `sector2.bin` | 3 seuls secteurs non nuls |

## Réponse

| | |
|---|---|
| **Password** | **`replicants`** (10 caractères, Blade Runner) |

```bash
python3 tools/cropta1-solve.py -q
python3 tools/cropta1-solve.py --check
```

## Premier regard

```text
bochs.img: DOS/MBR boot sector, ~10 MiB, 20160 secteurs
HardDisk : même MBR, tronqué à 8192 octets
```

Seuls les **secteurs 0, 1 et 2** contiennent des données. Strings :

- `Crack-Me MBR - find the pass`
- ciphertext affiché tel quel : `?"9%&,.;=<`
- secteur 1 = stub boot FR (« Table de partition non valide », …) — payload de « succès »

`bochsrc` pointe vers `c:/bochs/BIOS-…` : sous Linux, préférer l’analyse statique / Unicorn (ou adapter les `romimage` Bochs/QEMU).

## Flow

1. **Secteur 0 @0x7C00** : stub custom — `int 13h` lit **1 secteur**, CHS `(C=0,H=0,S=3)` → `0x0600`, puis `retf` vers `0000:0600`.
2. **Secteur 2 (fichier @0x400) @0x0600** : crackme.
   - Affiche la bannière, lit le clavier (`int 16h` AH=10h), écho (`int 10h`), Backspace / Enter.
   - Buffer saisie : **`0x0700`**, longueur dans `DI`.
3. Sur **Enter** :
   - Si `[0x0650] == 0xDB` : XOR in-place de **11 octets** @`0x0650` avec **`0x77`** (self-decrypt du checker).
   - `SI = 0x0621` (cipher), `BX = 0x0700` (input), `DI = 0` → saute au code déchiffré @`0x0650`.
4. Checker déchiffré :

```asm
; @0x0650 après XOR 0x77
lodsb                 ; al = expected[si++]
mov  cl, [bx+di]      ; cl = password[di]
add  cl, 3
xor  cl, 0x4A
cmp  al, cl
je   next
jmp  restart          ; @0x062E bannière
next:
cmp  di, 9
je   win              ; @0x06CA charge secteur CHS 2 → 0x7C00 (stub FR)
inc  di
jmp  0x0650
```

5. Échec → retour bannière. Succès → charge le secteur 1 (boot FR) en `0x7C00` et y saute (pas de string « Good boy », comportement distinct).

## Prédicat

Pour `i = 0..9` :

```text
expected[i] == (password[i] + 3) ^ 0x4A
expected    =  ?"9%&,.;=<
password    =  replicants
```

Inversion : `password[i] = (expected[i] ^ 0x4A) - 3`.

Le blob chiffré `@0x0650` (`db fd 7e f7 …`) sert d’anti-désassemblage tant que le XOR `0x77` n’a pas tourné (`fnstsw` / opcodes invalides pour Capstone en linéaire).

## Vérification

```bash
python3 tools/cropta1-solve.py --check
# cipher / derived / pred / emu ok+neg → OK
```

Preuve native sans Bochs : le solveur relit `bochs.img`, vérifie le marqueur `0xDB`, le lodsb `0xAC` après déchiffrement, le prédicat, et exécute la boucle cmp sous **Unicorn x86-16** (succès = IP atteint `0x06CA`).

Live Bochs/QEMU (optionnel) : corriger `romimage` / `vgaromimage`, booter `bochs.img`, saisir `replicants` + Enter → bascule sur le stub FR du secteur 1.

## Notes

- Ce n’est **pas** un OS complet : ~1,5 KiB utiles, le reste de l’image est zéro.
- `HardDisk` est redondant (copie courte de l’image).
- Pas de username / HWID — password fixe.
- Référence culturelle : *replicants* (Blade Runner), cohérente avec le style « cropta ».
