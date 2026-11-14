# pyderall's TickTock

| | |
|---|---|
| **ID** | [`69857e26de90f62e94d90c2d`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/69857e26de90f62e94d90c2d) |
| **Auteur** | pyderall |
| **Plateforme** | C++ (console) — **aucun binaire fourni** : l'archive contient uniquement `crackme.cpp` |
| **SHA-256** | `894b2532d4cc5f55049ae7098c4a7e7dce024e9483f42a56b98786189bd532a4` (le ZIP) |

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/download.bin` | ZIP d'origine (mot de passe `crackmes.one`), contient `crackme.cpp` — non modifié |
| `analysis/source/crackme.cpp` | source extraite (`unzip -P crackmes.one`) |
| `tools/ticktock-solve.py` | keygen / `--check` |
| `tools/ticktock-port.c` | portage C fidèle de la validation, heure injectable (pour la preuve) |

## Réponse

Le serial dépend de l'**heure locale** : il n'existe pas de serial fixe.

```bash
python3 tools/ticktock-solve.py            # serial pour maintenant (ou prochaine fenêtre)
python3 tools/ticktock-solve.py -q         # serial seul ; attend la prochaine fenêtre valide si besoin
python3 tools/ticktock-solve.py --at 2026-11-14T12:00
```

Exemple : le 2026-11-14 (jour 318), à 12:15 locale → **`074Y-10FR-1ARJ`** (calculé pour 12:16, accepté grâce à la tolérance ±1 min).
Autre exemple obtenu en live : `02QV-140I-19Y7`. Pas d'username dans ce crackme (pas de `petik` à placer).

⚠ Seules ~3/97 des minutes admettent un serial (contrainte croisée, voir plus bas) : sur une journée complète, 39 serials valides (minute, +/-1 compris). Le solveur indique la prochaine fenêtre sinon.

## Premier regard

- `file`/`diec` ne voient qu'un **ZIP** (chiffré, `crackmes.one`) de 1418 octets → `crackme.cpp` (3786 o).
- Pas de strings trompeuses : tout est lisible. Prompt `Enter serial (XXXX-XXXX-XXXX): `, sortie `won` / `loose`.

## Flow

`main` → `std::cin >> input` → `validateSerialWithTolerance` :

1. `parseSerial` : longueur 14, `-` en positions 4 et 9, 3 blocs de 4 caractères base36 (`0-9`, `A-Z`/`a-z` = 10..35, insensible à la casse), chaque bloc ≤ 0xFFFF → `a,b,c`.
2. `k0 = (minuteOfDay, dayOfYear)` locaux (`tm_yday+1`).
3. Pour `delta ∈ {-1,0,1}` : `minuteOfDay += delta` (wrap 0..1439, `dayOfYear` inchangé) ; succès si `checkPartsMatch` **et** `checkCrossConstraint`.

## Comment on trouve

Ancrage : `crackme.cpp`, fonctions `buildToken`, `deriveParts`, `checkCrossConstraint` (tout est calculable : l'entrée n'influence pas la valeur attendue, c'est un *keygen* pur — on recalcule A,B,C comme le fait le programme).

```text
x     = minute ^ (yday << 16) ^ 0xC0FFEE11
x     = rotl32(x,7) + 0x9E3779B9
h     = FNV-1a32(les 4 octets de x, LE)          # offset 2166136261, prime 16777619
token = rotl32(h ^ 0xA5A5A5A5, 11)
A = (token ^ 0xBEEF) & 0xFFFF
B = ((token >> 16) + minute*7) & 0xFFFF
C = (A + B + yday*13) & 0xFFFF
```

Contrainte croisée : `(A ^ B) % 97 == minute % 97`. A et B étant pseudo-aléatoires, elle est vraie pour ~1/97 des minutes ; avec la tolérance ±1 on a ~3/97 d'instants valides. C'est le « piège » : le serial correct pour la minute courante peut ne pas être acceptable, il faut attendre une minute où `minute±1` satisfait la contrainte.

Encodage : chaque valeur 16 bits → 4 chiffres base36 majuscules (36⁴ = 1 679 616 > 65535, donc le garde `v > 0xFFFF` est toujours satisfait par nos valeurs).

Exemple (12:16, jour 318) : A,B,C → `074Y`, `10FR`, `1ARJ` (`074Y` = 0·36³+7·36²+4·36+34 = 9 250 ; etc.).

Pièges : la minute wrap à minuit sans toucher `dayOfYear` (le solveur le reproduit) ; `sizeof(x)=4` octets LE pour le FNV ; fuseau = heure **locale** de la machine.

## Debug GDB

Non utilisé : analyse 100 % statique (source fournie).

## Vérification

**Limite honnête** : aucun binaire n'est fourni et la machine n'a pas de compilateur C++ (`cc1plus` absent). La preuve est donc faite contre `tools/ticktock-port.c`, portage C ligne à ligne de `crackme.cpp` (même fonctions, mêmes constantes, heure injectable). Ce n'est pas le binaire d'origine (inexistant).

```bash
gcc -O1 -o /tmp/ticktock-port tools/ticktock-port.c
# horloge réelle (le solveur attend la fenêtre valide) :
S=$(python3 tools/ticktock-solve.py -q); /tmp/ticktock-port "$S"      # -> won   (ex. 02QV-140I-19Y7)
/tmp/ticktock-port AAAA-BBBB-CCCC                                      # -> loose
# heure injectée : minuteOfDay=736 (12:16), yday=318
/tmp/ticktock-port 074Y-10FR-1ARJ 736 318                              # -> won
```

Test exhaustif sur le 2026-11-14 : pour chacune des 1440 minutes, chaque serial produit par le solveur donne `won` (39/39) et sa variante au dernier caractère modifié donne `loose` (39/39).

## Notes

- Ce n'est pas un crackme « binaire » : l'intérêt est la lecture de la logique et la gestion de la fenêtre temporelle.
- Le serial n'est valable que ~3 minutes (une ou deux minutes consécutives selon la contrainte).
