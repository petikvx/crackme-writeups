# crackmes.de's keygencrackme_1 by zyen

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/5ab77f6633c5d40ad448cc6a) · id `5ab77f6633c5d40ad448cc6a`

Crackme **PE32 GUI** VB6 (forme elliptique). Auteur d’origine : **zyen**.

| Fichier | Rôle |
|---|---|
| [`original/KgME.exe`](original/KgME.exe) | binaire |
| [`original/KgME.exe.asm`](original/KgME.exe.asm) | dump IDA |
| [`tools/zyen-kgme-solve.py`](tools/zyen-kgme-solve.py) | serial |

## Réponse

| Champ | Valeur |
|---|---|
| Serial (numérique) | **`3610`** |

```bash
python3 tools/zyen-kgme-solve.py -q
# 3610
```

---

## Prédicat

`Form_Load` fixe `FontSize = 19` (`0x13`).

Au check (`IsNumeric` + non-vide) :

```text
Val(Text) == FontSize * FontSize * 10
          == 19 * 19 * 10
          == 3610
```

Asm : `imul cx, si` puis `imul cx, 0Ah` avec `si = [Form+34h]` (FontSize), puis `fcomp` vs `Val` du serial.

OK : *Registrado* / titre *KeyGenMe Zyen 1.1*.

---

## Notes

- Message si vide / non numérique : *No seas garrulo y escribe algo*.
- Malgré le nom « KeyGenMe », le serial est **fixe** (lié à la FontSize hardcodée).
