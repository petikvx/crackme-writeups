# crackmes.de's fjlj_crackme_3 by fjlj

> [crackmes.one](https://crackmes.one/crackme/5ab77f5533c5d40ad448c253) · [`ORIGIN.yml`](ORIGIN.yml)

| | |
|---|---|
| **Auteur** | fjlj (miroir crackmes.de) |
| **Plateforme** | Windows PE32 console (MinGW, logique patchée dans un sled de NOP) |
| **Type** | keygen name→serial (alphabet custom + nibble shuffle) |
| **Diff** | 2.0 |

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/New_crackme3.zip` | archive site (sha256 catalogue) |
| `original/New_crackme3.exe` | PE32 console |
| `tools/fjlj-crackme3-solve.py` | keygen + `--check` / `--run` (Wine) |

## Réponse

| Champ | Valeur |
|---|---|
| **name** | `petik` |
| **serial** | **`1612BDBE`** (8 hex) |

```bash
python3 tools/fjlj-crackme3-solve.py -q
# 1612BDBE
python3 tools/fjlj-crackme3-solve.py --check petik 1612BDBE
# check: OK
python3 tools/fjlj-crackme3-solve.py --run
# wine: YES
```

Sous Wine : `name?` → `petik` → ` Serial?` → `1612BDBE` → **`YES`**.

## Premier regard

```text
PE32 console MinGW, même squelette que fjlj_crackme_2
String embarquée dans le code : 43A0F9D7B8E1C625
Prompts : name? /  Serial? / YES / NO
```

`objdump` se perd sur les données au milieu du code ; Capstone / lecture hex + suivi des `call`/`jmp` suffit.

## Flow

1. Résolution dynamique de `puts` / `gets` via offsets depuis un `call $+5 ; pop` (pas d’IAT directe pour ces appels dans le sled).
2. `puts("name?")` + `gets` → buffer `0x43EBC0`.
3. `ebx ← 0x401404 + Σname` (32 bits, NUL inclus = +0).
4. Les 16 bits bas sont convertis en **4 hex** avec ordre de nibbles **HH, HL, LL, LH** (pas l’ordre big-endian classique).
5. Chaque chiffre est remappé via son **index** dans l’alphabet `43A0F9D7B8E1C625`, ré-encodé en hex → 4 autres caractères.
6. Le serial attendu est la **concaténation** des deux moitiés (8 caractères).
7. Comparaison octet à octet ; succès → `puts("YES")`.

## Comment on trouve

Alphabet @ `0x4013D9` (juste après un `jmp` qui saute par-dessus) :

```text
43A0F9D7B8E1C625
```

Conversion 16 bits → 4 nibbles (`0x401418`–`0x4014A8`) pour `dx = 0x1621` (`petik`) :

```text
HH=1 HL=6 LL=1 LH=2  →  "1612"
```

Scramble (`0x40146D`) : pour chaque char, cherche l’index dans l’alphabet puis `+0x30` / `+0x37` :

```text
'1'→11→'B'  '6'→13→'D'  '1'→'B'  '2'→14→'E'  →  "BDBE"
```

Le check (`0x401553`) compare d’abord contre la moitié « weird hex » encore dans le buffer name, puis bascule sur le buffer scramble @ `0x401606` — d’où le serial collé **`1612BDBE`**.

Formule :

```text
v      = (0x401404 + sum(name)) & 0xFFFF
hex4   = nibble_shuffle_HH_HL_LL_LH(v)     # ASCII hex
serial = hex4 + index_in_alphabet_as_hex(hex4)
```

## Vérification

| Cas | Résultat |
|---|---|
| `petik` / `1612BDBE` | `YES` (Wine) |
| `test` / `154CBF0C` | `YES` |
| `petik` / `BDBE` (moitié seule) | `NO` |

## Notes

- Même auteur / même style que `fjlj_crackme_2` (NOP sled + code Olly), mais prédicat différent (pas de SMC ici).
- L’alphabet est une permutation de `0`–`F` : tout nibble a une image.
- Exemple username toujours **`petik`**.
