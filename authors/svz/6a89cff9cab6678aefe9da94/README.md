# SVz's Orrery

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/6a89cff9cab6678aefe9da94) · id `6a89cff9cab6678aefe9da94`

Crackme **multiplateforme** (PE64 Windows + Mach-O universal macOS), **C/C++**, console.  
Auteur site : **SVz**. Difficulty **3.0** · quality **4.0**.

Dossier : `authors/svz/6a89cff9cab6678aefe9da94/` — [série auteur](../README.md) · [repo](../../../README.md).

| Fichier | Rôle |
|---|---|
| [`original/orrery-1.0.zip`](original/orrery-1.0.zip) | archive d’origine (site) |
| [`analysis/extracted/orrery-1.0/orrery.exe`](analysis/extracted/orrery-1.0/orrery.exe) | PE64 console (preuve Wine) |
| [`analysis/extracted/orrery-1.0/orrery`](analysis/extracted/orrery-1.0/orrery) | Mach-O universal (macOS) |
| [`analysis/extracted/orrery-1.0/README.md`](analysis/extracted/orrery-1.0/README.md) | README auteur (règles / hints) |
| [`tools/orrery-solve.py`](tools/orrery-solve.py) | keygen (survey → planètes → serial) |
| [`analysis/ok.txt`](analysis/ok.txt) | run live Wine (`petik` / jour courant) |

## Réponse

Keygen **par jour** : le ciel (5 planètes) change chaque jour Unix. Exemple pour **`petik`** le **2026-08-24** (Unix day `20689`) :

| | |
|---|---|
| Name | **`petik`** |
| Serial | **`MB4V-DSRS`** |
| Planètes | `(1,1) (4,1) (2,4) (5,4) (4,5)` |
| Fingerprint | `ORRERY{4D0BD3D5}` |

```bash
# survey du jour + keygen
python3 tools/orrery-solve.py --name petik --planets
# day 20689 (2026-08-24)  name='petik'
# planets: (1,1) (2,4) (4,1) (4,5) (5,4)
# MB4V-DSRS

python3 tools/orrery-solve.py -q
# MB4V-DSRS

# pin un jour (entier = jours depuis 1970-01-01, ou YYYY-MM-DD)
ORRERY_DAY=20686 python3 tools/orrery-solve.py -q --name petik
# HRP4-H5HC

ORRERY_DAY=20689 WINEDEBUG=-all wine analysis/extracted/orrery-1.0/orrery.exe petik MB4V-DSRS
#   system charted - ORRERY{4D0BD3D5}
```

Le tiret du serial est cosmétique (`MB4VDSRS` passe aussi).

---

## 1. Premier regard

ZIP site → `orrery-1.0.zip` (sha256 `beef25aa…`) contenant :

```text
orrery.exe   # PE32+ console x86-64, stripped, static
orrery       # Mach-O universal (x86_64 + arm64)
README.md    # règles du challenge
```

Banner / usage :

```text
orrery                 # telescope survey (32 sondes)
orrery <name> <serial> # validation
```

Messages clés : `absorbed` / `reflected` / `deflected to (x,y)`,  
`signal jammed: unreadable serial`, `the echoes do not line up`,  
`system charted - ORRERY{%08X}`.

Charset serial (Crockford-like, 32 symboles) :

```text
0123456789ABCDEFGHJKMNPQRSTVWXYZ
```

Format : **8 caractères** (`XXXX-XXXX`). Alphabet + tirets/espaces ignorés à la lecture.

Env **`ORRERY_DAY`** : entier = **jours depuis 1970-01-01**. Plage embarquée  
`0x50CE … 0x50CE+0xE44` → **2026-08-21 … 2036-08-20**. Hors plage →  
`the telescope has drifted out of range`. Sans variable → horloge système.

Hashes internes (après extraction) :

| Fichier | SHA-256 |
|---|---|
| `orrery.exe` | `b98a16bc879f602672c7b7c5a64e0aa4a4c9824bc9d1dffbe6bee0c95ac669ad` |
| `orrery` | `e7b111c058e66f86321b7ce75b2c1c8ef414f2989c40df970a9ae47621541006` |

---

## 2. Flow

1. Résoudre le **jour** (`ORRERY_DAY` ou `time()/86400`).
2. Pointer une entrée de **32 octets** dans la table `.rdata` (une par jour).
3. Sans args : afficher le **telescope survey** (32 sondes sur le bord d’une grille 10×10).
4. Avec `name` + `serial` :
   - décoder le serial (base32 × 8 → 40 bits) ;
   - vérifier checksum FNV-1a 10 bits ;
   - `planets_pack = name_hash XOR payload30` ;
   - placer 5 planètes, **rejouer** les 32 sondes, `memcmp` vs survey du jour ;
   - succès → fingerprint `ORRERY{…}` (FNV sur pack planètes + hash du nom).

Le binaire **ne stocke pas** les positions : seulement les échos. Forcer le branchement de succès imprime un fingerprint faux.

---

## 3. Grille et physique des sondes

Grille logique **10×10** (indices `0..9`). Planètes uniquement en **`(x,y) ∈ {1..8}²`** (8×8).  
32 entrées = cellules de bord **hors coins** (même ordre que l’init binaire, parcours row-major).

Chaque sonde avance en ligne droite. À chaque pas, on regarde la case **devant** et les deux **épaules** (diagonales perpendiculaires à la direction) — règles type **Black Box** :

| Résultat | Octet survey | Condition |
|---|---|---|
| absorbed | `0` | planète pile devant |
| reflected | `1` | les deux épaules occupées, **ou** épaule(s) alors qu’on est encore sur le bord |
| deflected | `y*10 + x + 2` | sortie en `(x,y)` après 0..n déviations à 90° |

Point subtil (bug facile en recon) : depuis le bord, chemin libre → on **entre** dans l’intérieur et on continue ; on n’émet pas tout de suite un code de sortie.

---

## 4. Encodage du serial

### Hash du nom

Trim espaces, `toupper`, FNV-1a-32 (`offset=0x811C9DC5`, `prime=0x01000193`), masque **30 bits** :

```text
name_hash = FNV1a(upper(trim(name))) & 0x3FFFFFFF
```

### Pack des 5 planètes

Pour une planète `(x,y)` : code 6 bits `((y-1)<<3) | (x-1)`.  
Les 5 codes sont **triés strictement** puis concaténés MSB-first → `planet_pack` sur 30 bits.

### Payload + checksum

```text
payload30 = name_hash XOR planet_pack
chk10     = FNV1a(le32(payload30)) & 0x3FF
full40    = (payload30 << 10) | chk10
```

`full40` → 8 symboles Crockford, affichage `ABCD-EFGH`.

À la validation : après XOR, insertion-sort + rejet si doublon → `signal jammed`.  
Survey ≠ replay → `the echoes do not line up`.

---

## 5. Table des surveys

PE `orrery.exe` : table à VA `0x1400051a0` (fichier `0x29a0`), **`3653` jours × 32 octets**.  
Index = `unix_day - 0x50CE`. Le keygen lit cette table directement (pas besoin de lancer le binaire pour obtenir le ciel du jour).

---

## 6. Solveur

[`tools/orrery-solve.py`](tools/orrery-solve.py) :

1. Charge la table depuis `orrery.exe`.
2. Prune les cellules « première case » incompatibles avec un non-absorb.
3. Énumère `C(cells, 5)` jusqu’à coller le survey (layouts ambigus exclus côté auteur).
4. Encode le serial pour `--name` (défaut **`petik`**).

```bash
python3 tools/orrery-solve.py --name petik --planets --check
python3 tools/orrery-solve.py -d 2026-08-21 -q
python3 tools/orrery-solve.py --survey -d 20689
```

`--check` relance `wine orrery.exe` avec `ORRERY_DAY` piné.

---

## 7. Vérification

```text
# analysis/ok.txt
day 20689 (2026-08-24)  name='petik'
planets: (1,1) (2,4) (4,1) (4,5) (5,4)
MB4V-DSRS
  system charted - ORRERY{4D0BD3D5}
```

Autre jour (`ORRERY_DAY=20686` / 2026-08-21) : `petik` → `HRP4-H5HC` → `ORRERY{A642C5F9}`.

---

## 8. Notes

- Ce n’est **pas** un patch / un dump de clé en mémoire : le prédicat est « rejouer les échos ».
- Un serial d’un autre jour (ou d’un autre nom) échoue — d’où le keygen obligatoire.
- Même physique / même table sur le binaire macOS ; la preuve ici est faite avec **Wine** sur `orrery.exe`.
- Quelques jours demandent jusqu’à ~1–2 min d’énumération Python ; le prune « non-absorb ⇒ pas de planète en première case » réduit déjà fortement l’espace.
