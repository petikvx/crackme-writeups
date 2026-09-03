# databus_keygenme1 (databus)

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/5ab77f6333c5d40ad448ca70) · id `5ab77f6333c5d40ad448ca70`  
> Import crackmes.de — auteur **databus**.

| Fichier | Rôle |
|---|---|
| [`original/keygenme.zip`](original/keygenme.zip) | archive |
| [`original/_u/keygenme1.exe`](original/_u/keygenme1.exe) | PE32 GUI MASM32 |
| [`tools/databus-solve.py`](tools/databus-solve.py) | keygen + `--check` |

## Réponse

| Champ | Valeur |
|---|---|
| Name | **`petikk`** (longueur **paire** ≥ 5 ; `petik` est impair → refusé) |
| Serial | **`DDCCBE47-BB997C8E`** |

```bash
python3 tools/databus-solve.py -q --user petikk
# DDCCBE47-BB997C8E
python3 tools/databus-solve.py --check
# MSG=Good job!
```

## Prédicat

1. `len(name) >= 5` et **pair**.
2. Checksum : `sum_i (name[i] + (len-i))` pour i=0..len-1 (= `sum(name) + len(len+1)/2`).
3. Serial 17 caractères `AAAAAAAA-BBBBBBBB` (le byte `[8]` est forcé à 0) ; hex **majuscules**.
4. `A = checksum + 0xDDCCBBAA` ; `B = 2*A` (constante `.data` `@0x403218`).
5. Petit filtre « nibble » sur A et B (ne pas avoir `CL==0` trop tôt).

## Vérification

objdump + Wine GUI (`tools/databus_gui_check.exe`).

## Notes

- README.txt du ZIP : *Write a keygen for the keygenme*.
