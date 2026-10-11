# Crackme15 (FireWorx)

| | |
|---|---|
| **ID** | [`5ab77f5433c5d40ad448c17f`](https://crackmes.one/crackme/5ab77f5433c5d40ad448c17f) |
| **Auteur (site)** | crackmes.de (réimport) — auteur original **FireWorx** |
| **Plateforme** | Windows, Win32 GUI, Delphi + ASPack 1.0x |
| **Difficulté** | 1.0 |
| **SHA-256 (zip)** | voir `ORIGIN.yml` |

## Solution

Nom / serial, à keygenner. Pour le nom `petik` :

```
MU1373807 
```

⚠️ avec **un espace final** (le serial est `"MU" + nombre + " "`). Autres serials valides pour `petik` : `MU1375372 `, `MU1378110 `, `MU1380852 ` (k = 3…5).

Formule (divisions entières signées, tronquées vers 0) :

```
pour k = 2 … len(nom) :
  esi = k²/4 + 0x926
  a   = esi²/8 − 0x980
  edi = (k·esi)/12 + 0x639 − 0x19
  v   = k/edi + 2·edi + 2·a + esi
  serial valide = "MU" + IntToStr(v) + " "
```

Le contenu du nom n'est pas lu, seule sa longueur (≥ 2) fixe les `k` acceptés.

## Premier regard

- `diec` : Borland Delphi / Turbo Linker 2.25, **ASPack** → code chiffré sur disque.
- Lancé sous Wine (`xvfb-run`), dump de `0x400000` via `/proc/<pid>/mem` : image décompressée.

## Comment on trouve

1. Dans le dump, la table des méthodes publiées de `TForm1` ne contient qu'un handler intéressant : `Button1Click` à `0x441A34` ([`analysis/Button1Click.asm`](analysis/Button1Click.asm)).
2. Il lit le nom (`TEdit +0x2C4`), prend `Length(nom)` et boucle `ebx = 2 … Length(nom)`.
3. Calcul arithmétique ci-dessus (`0x441A83…0x441ADF`), puis `IntToStr` (`0x407648`).
4. Deux constantes AnsiString : `"MU"` à `0x441B90` et `" "` à `0x441B9C` ; `LStrCatN` assemble `"MU" + nombre + " "`.
5. Comparaison (`LStrCmp`) avec le serial (`TEdit +0x2C8`) ; égalité → message `Very Shaggadelic`.

## Vérification

- [`tools/crackme15-solve.py`](tools/crackme15-solve.py) recalcule `v(k)` en Python et **émule avec Unicorn les vrais octets** du calcul extraits du dump : identiques pour k = 2…5.
- GUI non pilotée ici : la vérification repose sur l'émulation du code réel et la lecture du désassemblage de la concaténation/comparaison, pas sur une saisie live.

## Fichiers

- [`tools/crackme15-solve.py`](tools/crackme15-solve.py) — `python3 tools/crackme15-solve.py petik`
- [`analysis/Button1Click.asm`](analysis/Button1Click.asm)
