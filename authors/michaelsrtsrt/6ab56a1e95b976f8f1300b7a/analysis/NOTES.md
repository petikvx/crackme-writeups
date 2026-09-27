# Notes — Basics::AHardcodedKeyGoneWrong

Statut : **parked** (`2026-09-27`). Pas de clé, pas de flag. Ne pas marquer solved.

Brouillons VM (chemins Windows, pas le solveur) : `tools/kc_emu.py`, `tools/kc_tab2.py`, dump `tools/kc_tab2.bin`.

## Binaire

- `original/keycheck.exe` — PE64 console, Mingw-w64, image `0x140000000`
- sha256 `d9330a7d06ba9acffc4819e36be4e95aad9cd6d21ad4389512e17bd74a6fcf01`
- `main` aplati : `0x140002a90`. Sous Wine, `fgets` 64 octets puis `key: rejected` (exit 0). Pas de `strncmp` sur ce thread.
- Émulation Unicorn de `main` : retour `0xA0216D4`, ni `Accepted` ni `Rejected`.

## Deux coffres ouverts, textes non lus

`sub_140011FF0` vérifie le MAC puis déchiffre.

Coffre chaînes, bloc `0x140028608` (charge 0xA0). Cinq fiches, chiffré 49 octets en `0x14002D160` :

| Id | Décalage | Longueur |
|---|---|---|
| `0xF44A64A1` | 0 | 6 |
| `0xCBB564DF` | 6 | 3 |
| `0xB9170251` | 9 | 22 |
| `0xFB285D2E` | 31 | 9 |
| `0xBFB96DDB` | 40 | 9 |

Seconde table, `unk_140028760` via `sub_1400087C0` : 614 couples (clé, valeur), 9854 octets, MAC valide, charge `0x2660`. Valeur lue :

```text
stocké ⊕ H(clé, 0x10000002) ⊕ H(clé, 0x25C66DFD)
```

`H` = `sub_140014510`. Contrôle : `sub_140007ED0(0x25061C292E7500EF)` = `0x8C8771434F86E397`, égal à la formule.

Les quatre id que `main` combine ne sont **pas** dans le coffre chaînes :

`0x0BDD0F79`, `0xDE4A4AB5`, `0xF164718D`, `0x233B6937`

`sub_140009DA0` renvoie une chaîne vide pour ceux-là. Les cinq vraies fiches, même avec un tweak, sortent des octets (`af e0 f5 66 16 00`, …), pas `Accepted` / `Rejected`.

## Reprise

Retrouver le tweak (ou le chemin) qui rend les fiches `0xF44A64A1` … `0xBFB96DDB` lisibles dans `sub_140009DA0`, puis la comparaison après `fgets`. Les constantes `rol` / `xor` / `add` autour des appels s'annulent : elles arrivent telles quelles dans `main`.
