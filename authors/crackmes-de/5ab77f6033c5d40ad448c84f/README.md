# crackmes.de's epicurus (D4ph1)

> [crackmes.one](https://crackmes.one/crackme/5ab77f6033c5d40ad448c84f) · [`ORIGIN.yml`](ORIGIN.yml)

| | |
|---|---|
| **Auteur** | D4ph1 (miroir crackmes.de) |
| **Plateforme** | Windows PE32 GUI (MASM32) |
| **Type** | name + **clic** + serial (géométrie) |

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/D4ph1_-_Epicurus.zip` | archive |
| `original/D4ph1-Epicurus.exe` | PE |
| `original/Readme.txt` | énoncé (UTF-16) |
| `tools/epicurus-solve.py` | keygen (Unicorn) |

## Réponse

| Champ | Exemple |
|---|---|
| Name | **`petik`** |
| Clic | **icône** (hotzone ≈ (154–184)×(94–128), ex. `(170,110)`) |
| Serial | **`EE0E-8AFF8715-EB04`** |

```bash
python3 tools/epicurus-solve.py -q --name petik
# petik:EE0E-8AFF8715-EB04
python3 tools/epicurus-solve.py --name petik --check
# verify : OK
```

### Apopthegm (cible #2)

Avec un **name de longueur 1**, le MessageBox révèle :

> **Nothing isn`t created by nothing.Epicurus,341-270 BCE**

(confirmé par l’auteur sur crackmes.de).

## Flow

1. `WM_LBUTTONDOWN` stocke `(x,y)` dans `0x40321C` / `0x40321E`.
2. **Check Me** exige un clic dans le rectangle autour de l’icône (`DrawIcon` à `(0x99,0x5F)`).
3. Name (len 1..15) → dérivés + traitement nibbles.
4. Géométrie : distances aux points `(0x9B,0x7F)` / `(0xB7,0x7F)`, isqrt custom, intersections.
5. Serial hex `AAAA-BBBBBBBB-CCCC` construit puis comparé (à l’envers) au champ Serial.

## Notes

- Tip auteur : le keygen doit prendre **plus que le name** → ici le **clic**.
- Pas de patch / self-keygen (règles readme).
- Dépend de `unicorn` pour rejouer les routines natives (isqrt table + géométrie).
