# werrec

Auteur local : **`werrec`** (site : [werrec](https://crackmes.one/user/werrec)).

Voir [`author.yml`](author.yml) · [`catalog.yml`](catalog.yml).

## Progression

| # | Titre | ID | Plateforme | Solution |
|---|---|---|---|---|
| 1 | [Retro OEM License Check](6aafdc79dbb3353b75396911/) | [`6aafdc79…`](https://crackmes.one/crackme/6aafdc79dbb3353b75396911) | Windows PE64 (console, MinGW) | **solved** — serial `0000Z-OEM-1234560-77776` (keygen `tools/werrec-oem-solve.py`) ; `FLAG0-OEM-1337133-HAHA1` = leurre |
| 2 | [LATTICE4](6ab0036b48cda5a2aaa3de87/) | [`6ab0036b…`](https://crackmes.one/crackme/6ab0036b48cda5a2aaa3de87) | Windows PE64 (console, MinGW) | **solved** — serial `L4tT1cE4Gf256Z3x` (pas de user ; `tools/lattice4-solve.py`) → `flag{GF256_lattice_beats_hand_math}` |

## Ajouter un crackme

```bash
./scripts/add-crackme.sh --author werrec <id-ou-url>
```
