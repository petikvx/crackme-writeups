# Kryptos — Hecate linux/unix

| | |
|---|---|
| **ID** | [`6a5010dac630e9c9509785f6`](https://crackmes.one/crackme/6a5010dac630e9c9509785f6) ([`ORIGIN.yml`](ORIGIN.yml)) |
| **Auteur** | Kryptos |
| **Plateforme** | Linux ELF64 PIE, stripped, C++ (libstdc++), console |
| **Difficulté** | 2.0 |
| **SHA-256** | `0cccfa3e391533258c2ec6d8478cde30e8bef7e4789e500b317964d43c51b424` |

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/hecate` | binaire |
| `tools/hecate-solve.py` | keygen name → serial |

## Réponse

```bash
python3 tools/hecate-solve.py petik -q
# 82FE-6815-2A35
```

| Nom | Serial |
|---|---|
| `petik` | `82FE-6815-2A35` |

```bash
name:   petik
serial: 82FE-6815-2A35
Access granted.
```

## Premier regard

```bash
file original/hecate      # ELF64 PIE, stripped, C++ (libstdc++)
strings -n 6 original/hecate
#   name:    serial:    %04X-%04X-%04X   Access granted.   Access denied.
```

Format de serial classique `XXXX-XXXX-XXXX`. Imports `memcmp`, `toupper`, `snprintf` — un keygen name→serial standard.

## Flow

```
Hecate

name:   <nom>
serial: <serial>
Access granted. | Access denied.
```

## Comment on trouve

**Ancrage.** MCP `ida` sur le binaire strippé : `main` (`0x1180`) décompile proprement malgré le C++ (deux `std::getline` bien reconnus).

**Lecture.** Deux lectures successives (`cin >> name`, `cin >> serial`) :

```c
if (name.length() <= 3) { puts("Access denied."); return 1; }
for (c : serial) c = toupper(c);          // le SERIAL saisi est mis en majuscules…
                                           // …mais PAS le nom : le hash se fait sur le nom brut !
uint32_t A = fnv1a32(name);               // FNV-1a 32 bits, seed 0x811C9DC5, prime 0x01000193
uint16_t L    = name.length();
uint16_t mul  = 0x1234 * L;
uint32_t xorv = A ^ mul;
uint32_t tmp  = (A >> 11) + 3*xorv;
char buf[15];
snprintf(buf, 15, "%04X-%04X-%04X",
         xorv & 0xFFFF,
         tmp  & 0xFFFF,
         ((tmp ^ xorv) & 0xFFFF) ^ 0xC0DE);
if (serial == buf) puts("Access granted.");
```

**Piège repéré à la lecture.** La boucle `toupper` dans le pseudo-code opère sur le buffer `s1` (la variable qui reçoit le **second** `getline`, donc le **serial**), pas sur `v25` (le **nom**, premier `getline`) — facile à confondre tant les deux `std::string` ont des noms de variables Hex-Rays proches (`v25`/`v26` vs `s1`/`v29`). Une première tentative de solveur qui met le **nom** en majuscules avant de hasher donne systématiquement « Access denied. » — le hash FNV-1a doit porter sur le nom **tel quel**, casse comprise.

**Assemblage.** `A = fnv1a32("petik")`, `L = 5`, `mul = 0x1234*5 & 0xFFFF = 0x5A10`, `xorv = A ^ mul`, `tmp = (A>>11) + 3*xorv` ; les trois champs hex du serial s'en déduisent directement (code dans [`tools/hecate-solve.py`](tools/hecate-solve.py)).

**Pièges.**
- `0xC0DE` apparaît en clair dans le calcul du 3ᵉ champ — un clin d'œil, pas une clé secrète à retrouver.
- Le nom doit faire **strictement plus de 3 caractères** (`AB`, 2 car., refusé avant même le calcul).
- Aucun anti-debug, pas de GDB nécessaire : reverse 100 % statique (MCP `ida`), vérifié par exécution directe.

## Vérification

```bash
printf 'petik\n82FE-6815-2A35\n' | ./original/hecate
# name:   serial: Access granted.

printf 'petik\nFFFF-FFFF-FFFF\n' | ./original/hecate
# name:   serial: Access denied.

printf 'ab\nFFFF-FFFF-FFFF\n' | ./original/hecate
# name:   serial: Access denied.   (nom trop court, refuse avant comparaison)
```

## Notes

- Ce n'est pas un hash cryptographique : FNV-1a 32 bits, trivialement inversible dans le sens direct (générer un serial valide), pas dans le sens « retrouver le nom depuis un serial donné ».
- Comparaison sensible à la casse du nom mais pas du serial (`toupper` appliqué au serial saisi avant `memcmp`) — notre solveur génère déjà le serial en majuscules (`%04X` produit des lettres hexa majuscules par construction).
