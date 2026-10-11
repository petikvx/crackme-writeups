# Crackme12 (FireWorx)

| | |
|---|---|
| **ID** | [`5ab77f5433c5d40ad448c17e`](https://crackmes.one/crackme/5ab77f5433c5d40ad448c17e) |
| **Auteur (site)** | crackmes.de (réimport) — auteur original **FireWorx** |
| **Plateforme** | Windows, Win32 GUI, Delphi + ASPack 1.08.03 |
| **Difficulté** | 1.0 |
| **SHA-256 (zip)** | voir `ORIGIN.yml` |

## Solution

Schéma nom / société / serial (le `.nfo` demande un keygen). Seule la **longueur** de `nom + société` compte :

```
L      = len(nom + société)
f(k)   = ((((123·k) div L) << 5) − 0x2C115C + 0x872EB0) xor 0x12
serial = IntToStr(f(k))   pour un k ∈ [1, len(serial)]
```

Exemple avec nom `petik`, société `petik` (L = 10) :

```
5971654
```

(les autres valeurs valides pour cette longueur : `5972038`, `5972422`, `5972838`, `5973222`, `5973606`, `5974022`, k = 2…7).

## Premier regard

- `diec` : Borland Delphi, Turbo Linker 2.25, **ASPack 1.08.03** → pas de désassemblage statique utile.
- Lancé sous Wine (`xvfb-run`), puis dump de l'image `0x400000` via `/proc/<pid>/mem` : l'ASPack est déjà décompressé en mémoire.

## Comment on trouve

1. Dans le dump, la table de méthodes publiées de `TForm1` donne `Button2Click` (et `Image2DblClick`) ; le handler de vérification est à `0x455410` ([`analysis/Button2Click.asm`](analysis/Button2Click.asm)).
2. Il lit trois `TEdit` (`GetText`, `0x423624`) : `+0x2C4`, `+0x2C8` (concaténés avec `LStrCat3` → `s`), puis `+0x2CC` (le serial, passé à `StrToInt` qui lève une exception si ce n'est pas un entier).
3. Boucle `edi = 1 … Length(serial)` :
   - `eax = (123·edi) idiv Length(s)`
   - `eax = (eax << 5) − 0x2C115C + 0x872EB0` puis `xor 0x12`
   - `IntToStr(eax)` comparé au texte du serial (`LStrCmp`) ; égalité → `MessageDlg` avec le caption du label `+0x2E8` (message de réussite).
4. Les contenus de nom/société ne servent pas, seule leur longueur cumulée intervient. Comme le résultat a 7 chiffres pour des noms courts, le serial fait 7 caractères et tout `k ≤ 7` convient.

## Vérification

- [`tools/crackme12-solve.py`](tools/crackme12-solve.py) calcule `f(k)` et **émule avec Unicorn les vrais octets** du handler (`0x455476…0x455490`, extraits du dump) : résultat identique pour k = 1…7.
- GUI non pilotée ici : la vérification repose sur l'émulation du code réel de calcul + la lecture du désassemblage de la comparaison, pas sur un clic live.

## Fichiers

- [`tools/crackme12-solve.py`](tools/crackme12-solve.py) — `python3 tools/crackme12-solve.py petik petik`
- [`analysis/Button2Click.asm`](analysis/Button2Click.asm)
