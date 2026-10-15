# QERR0R — CrackIt;)

| | |
|---|---|
| **ID** | [`69a65ee60f5b9757a6a5f73f`](https://crackmes.one/crackme/69a65ee60f5b9757a6a5f73f) ([`ORIGIN.yml`](ORIGIN.yml)) |
| **Auteur** | QERR0R |
| **Plateforme** | Linux ELF64 PIE, stripped, C++ (libstdc++), console |
| **Difficulté** | 1.8 |
| **SHA-256** | `7fb92886db1f4de6208bb6be40de8e56d8d9381de6a934b4de5c73551172c6e6` |

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/crackit` | binaire |
| `tools/crackit-solve.py` | flag en dur (concaténation de littéraux) |

## Réponse

```bash
python3 tools/crackit-solve.py -q
# CTF{My_S3cr3t_Fl4g}W0WY0uF0undM3{0r N0t}
./original/crackit "CTF{My_S3cr3t_Fl4g}W0WY0uF0undM3{0r N0t}"
# You cracked me!
```

## Premier regard

```bash
file original/crackit      # ELF64 PIE, stripped, C++
strings -n 6 original/crackit
#   usage: ./crackit <flag>
#   You cracked me!
#   Try again, You can do it!
```

Pas de littéral complet « CTF{...} » visible d'un bloc dans `strings` — le flag est **découpé en petits morceaux** éparpillés dans `.rodata` (chacun trop court pour attirer l'œil individuellement), reconstitués par concaténation au runtime.

## Flow

```bash
./crackit <flag>
# You cracked me!  |  Try again, You can do it!
```

## Comment on trouve

**Ancrage.** MCP `ida` : `main` (`0x1260`) décompile bien malgré le C++. Elle construit une chaîne `s2` en itérant sur un tableau de 11 pointeurs `const char*` (`&stru_3D98 - 88` .. `&stru_3D98`, soit 11×8 octets) via `sub_16B0` (un simple constructeur générique de `std::string` à partir d'un tableau de littéraux C — rien de chiffré), puis compare `argv[1]` à cette chaîne via `memcmp`.

**Lecture.** Dump des 11 pointeurs et de leur contenu (`ida_bytes.get_strlit_contents`) :

| # | Morceau |
|---|---|
| 1 | `CTF{` |
| 2 | `My_` |
| 3 | `S3c` |
| 4 | `r3t_` |
| 5 | `Fl4g` |
| 6 | `}W0W` |
| 7 | `Y0u` |
| 8 | `F0und` |
| 9 | `M3` |
| 10 | `{0r ` |
| 11 | `N0t}` |

**Assemblage.** Simple concaténation dans l'ordre du tableau : `CTF{` + `My_` + `S3c` + `r3t_` + `Fl4g` + `}W0W` + `Y0u` + `F0und` + `M3` + `{0r ` + `N0t}` → **`CTF{My_S3cr3t_Fl4g}W0WY0uF0undM3{0r N0t}`** (41 caractères) — c'est la chaîne **entière**, y compris l'accolade fermante du premier `CTF{...}` et le texte malicieux qui suit, qui constitue le flag complet attendu par `argv[1]`.

**Pièges.**
- Le flag ressemble à `CTF{My_S3cr3t_Fl4g}` et s'arrêter là (un `}` fermant en plein milieu) donne « Try again » — il faut prendre la concaténation **complète** des 11 morceaux, accolades supplémentaires comprises.
- Découpage volontairement non-aligné sur les mots pour gêner un simple `strings | grep CTF` (aucun morceau ne forme un mot lisible seul, hormis `CTF{`).

## Vérification

```bash
./original/crackit "CTF{My_S3cr3t_Fl4g}W0WY0uF0undM3{0r N0t}"
# You cracked me!

./original/crackit "CTF{My_S3cr3t_Fl4g}"
# Try again, You can do it!   (flag tronque a la premiere accolade fermante)

./original/crackit
# usage: ./crackit <flag>
```

## Notes

- Pas de calcul, pas de chiffrement : juste un éclatement du littéral en morceaux pour gêner l'extraction statique naïve.
- Pas de GDB utilisé : reverse 100 % statique (MCP `ida`), vérifié par exécution directe.
