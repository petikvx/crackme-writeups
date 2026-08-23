# crackmes.de's crackmenx2final.exe by arthi

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/5ab77f6633c5d40ad448cc2b) · id `5ab77f6633c5d40ad448cc2b`

Crackme **PE32 GUI** VB6, packé **FSG 2.0**. Auteur d’origine : **arthi**.

| Fichier | Rôle |
|---|---|
| [`original/CrackmeNX2Final.exe`](original/CrackmeNX2Final.exe) | FSG packed |
| [`analysis/CrackmeNX2Final.unpacked.exe`](analysis/CrackmeNX2Final.unpacked.exe) | dump dépacké |
| [`analysis/source/CrackmeNX2Final.unpacked.exe.i64.c`](analysis/source/CrackmeNX2Final.unpacked.exe.i64.c) | Hex-Rays |
| [`analysis/shot-after-ok.png`](analysis/shot-after-ok.png) | preuve Wine |
| [`tools/arthi-nx2-solve.py`](tools/arthi-nx2-solve.py) | password |

## Réponse

| Champ | Valeur |
|---|---|
| Password | **`havingfunyet`** |

```bash
python3 tools/arthi-nx2-solve.py -q
# havingfunyet
```

OK Wine : *You Are A Winner !*

---

## Prédicat

Après unpack FSG, deux alphabets de substitution (91 chars) :

```text
plain  = abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789()…
cipher = X5STU,.LMZYcde012tu89()\?@#xvwI/:[]EFjklAP…
```

L’entrée est encodée `plain→cipher` et comparée à la constante **`LX(Me.,9e?U8`** (= encode(`havingfunyet`)).

Anti-debug strings encodées : `SIWDEBUG`, `RegmonClass`, `FileMonClass`, etc.

---

## Notes

- Packer FSG 2.0 — reverse sur le dump mémoire / unpacked.
- Champ UI : *Password:* (pas de username).
