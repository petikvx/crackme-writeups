# fishing_with_dila_v0.1 (dila)

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/5ab77f6433c5d40ad448cab0) · id `5ab77f6433c5d40ad448cab0`  
> Import crackmes.de — auteur **dila**. Série « Fishing with DiLA » (même shell dialog MASM32).

| Fichier | Rôle |
|---|---|
| [`original/fwdv1.zip`](original/fwdv1.zip) | archive |
| [`original/_u/v1.exe`](original/_u/v1.exe) | PE32 GUI |
| [`tools/fwdv1-solve.py`](tools/fwdv1-solve.py) | code + `--check` Wine |

## Réponse

| Champ | Valeur |
|---|---|
| Code (edit + bouton) | **`666`** (`0x29A`) |

```bash
python3 tools/fwdv1-solve.py -q
# 666
python3 tools/fwdv1-solve.py --check
# MSG=Success! Thank you for playing ;)
```

## Premier regard

- PE32 GUI, MASM32, ~3 KB, dialog `#32770` titre *Fishing with DiLA v0.1*.
- `GetDlgItemInt` sur le champ, puis MessageBox *Success* / *Sorry, wrong code!*.
- Voir aussi `dila.nfo` (série pédagogique « fishing »).

## Prédicat

`cmp eax, 0x29A` directement après `GetDlgItemInt` → **`666`**.

## Vérification

Reverse : **objdump + Wine** (automation `tools/dila_gui_check.exe`). Pas de debugger.

## Notes

- Les strings « cool / frog / hardcoded whore » sont du leurre.
- Même squelette UI pour v0.1…v0.5 ; seul le check change.
