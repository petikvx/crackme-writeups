# ray33ee's obscurio - 3

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/6a9ae805cab6678aefe9dcb2) · id `6a9ae805cab6678aefe9dcb2`

Crackme **Windows** PE64 console + bytecode `program.bin`.  
Auteur site : **ray33ee**. Série **obscurio** (#3 — VM custom stack, MBA, poly GF(p)).

Dossier : `authors/ray33ee/6a9ae805cab6678aefe9dcb2/` — [série auteur](../README.md) · [repo](../../../README.md).

| Fichier | Rôle |
|---|---|
| [`original/crackus.exe`](original/crackus.exe) | PE32+ host de la VM |
| [`original/program.bin`](original/program.bin) | bytecode (~1M opcodes) |
| [`original/obscurio3.zip`](original/obscurio3.zip) | archive site (zip imbriqué) |
| [`tools/obscurio3-solve.py`](tools/obscurio3-solve.py) | keygen name → password |
| [`tools/vm_run`](tools/vm_run.c) | interpréteur C fidèle (~0.07 s) |
| [`tools/extract_params`](tools/extract_params.c) | dump args/table depuis la VM |
| [`analysis/crackus.exe.i64.c`](analysis/crackus.exe.i64.c) | decc Hex-Rays du host |

## Réponse

Username + password **49 caractères** (`XXXX-` × 9 + `XXXX`). Exemple **`petik`** :

| | |
|---|---|
| Username | **`petik`** |
| Password | **`E768-16D7-B4E9-DE3D-C4F3-CCA7-7998-7985-771D-F87D`** |

```bash
python3 tools/obscurio3-solve.py -q
# E768-16D7-B4E9-DE3D-C4F3-CCA7-7998-7985-771D-F87D

python3 tools/obscurio3-solve.py --check E768-16D7-B4E9-DE3D-C4F3-CCA7-7998-7985-771D-F87D --wine-check
# user='petik' ... vm_run=yes
# wine=yes

# preuve live (cwd = original/ pour trouver program.bin)
printf 'petik\nE768-16D7-B4E9-DE3D-C4F3-CCA7-7998-7985-771D-F87D\n' \
  | WINEDEBUG=-all wine original/crackus.exe
# (depuis original/) → yes
```

---

## 1. Premier regard

```text
crackus.exe : PE32+ executable (console) x86-64, for MS Windows
program.bin : data (little-endian uint32 stream, ~4 MiB)
sha256 crackus.exe  4184e52d81b37b63e060d2ccd0e52188ca778593b272f9a0ef280e688bb55412
sha256 program.bin  cf6ab02b715bfe781ba7c3fe399518ad938479324136441b6d6298526993f3ad
```

Le ZIP site contient un autre ZIP → `crackus.exe` + `program.bin`.  
Prompts : `Enter username:` / `Enter password:` → `yes` / `no`.  
Le host charge `program.bin` et exécute une **VM stack** (opcodes PUSH/LOAD/STORE/JZ/CALL/ENTER/RET/NAND/SH/PICK/SWAP + I/O heap).

Décompilation host : `bash -ic 'decc original/crackus.exe'` → `analysis/crackus.exe.i64.c`.

---

## 2. Flow

1. READ username (heap base ~17), READ password (base ~134).
2. Dérive depuis le username **10 points** `a[i]` et **10 cibles** `t[i]` (mod 65521).
3. Parse le password : 10 limbs 16-bit (nibbles hex) + **9** séparateurs `-` (pas de tiret final) → longueur **49**.
4. Évalue le polynôme `r = Σ_{k=0..9} a^(9-k) · w[k]  (mod 65521)` pour chaque `a = a[i]` ; exige `r == t[i]`.
5. Accumule le succès dans `fp+24` ; vérifie aussi les fillers (`fp+14`) et `len == 49`.
6. MBA final (PC ~961470–963416) : besoin **stack_top == 1** et **fp+24 == 1** → PRINT `yes`, sinon `no`.

---

## 3. Prédicat

### Packing password

```text
positions i%5 == 4  (i = 0..48)  →  caractère '-' (ASCII 45)
autres positions                 →  hex majuscule des 10 limbs
longueur totale                  →  49  (compare MBA à la constante 49)
```

Exemple découpé :

```text
E768 - 16D7 - B4E9 - DE3D - C4F3 - CCA7 - 7998 - 7985 - 771D - F87D
```

Les 9 checks filler (HLOAD password[4,9,…,44] vs PUSH `#45`) mettent à jour `fp+14` (init 1). Un mauvais filler laisse `fp+14 = 0` → échec même si le poly est bon. Un 50ᵉ caractère (trailing `-`) fait échouer le check `len == 49`.

### Polynôme (GF(65521))

```text
r(a) = w[0]·a^9 + w[1]·a^8 + … + w[9]   (mod 65521)
exiger r(a[i]) = t[i]  pour i = 0..9
```

Keygen : extraire `(a[], t[])` via la VM (`tools/extract_params`), résoudre le système de Vandermonde, packer les `w[k]` en hex + tirets.

Pour **`petik`** :

```text
a = [30572, 13102, 42843, 38330, 57076, 49472, 23004, 18228, 15347, 46166]
t = [10926, 19391, 49510, 15989, 17209, 59684, 46930, 17694, 21649, 52591]
w = [59240, 5847, 46313, 56893, 50419, 52391, 31128, 31109, 30493, 63613]
```

### MBA / flags

- `fp+14` : fillers OK  
- `fp+16` : autre invariant (OK dès que packing/limbs cohérents)  
- `fp+24` : les 10 évaluations poly matchent `t[i]`  
- `fp+4`/`fp+5` en fin : base password + **longueur 49**  
- Combinaison MBA → condition du JZ en 963416 (`0` → branche `no`)

---

## 4. Vérification

```bash
python3 tools/obscurio3-solve.py --user petik
# password=E768-16D7-B4E9-DE3D-C4F3-CCA7-7998-7985-771D-F87D

python3 tools/obscurio3-solve.py --user alice -q
# 74FF-5961-C5DF-34B6-FCA8-EAA1-0932-2831-F31F-B6F1

./tools/vm_run   # stdin: user + password → yes
```

Wine (depuis `original/`) : `yes`.

---

## 5. Notes

- **Pas** un simple strcmp : poly + fillers + longueur, le tout noyé dans du NAND/SH MBA.
- Interpréteur Python trop lent (~10 s / 40 M steps) → `tools/vm_run` en C.
- obscurio 1/2 utilisent une VM *proche* mais pas compatible opcode-à-opcode.
- Patching du host interdit par l’auteur ; la soluce est un vrai keygen.
- `extract_params` coupe tôt dès que `a[]`/`t[]` sont remplis (évite les ~40 M steps complets pour le keygen).
