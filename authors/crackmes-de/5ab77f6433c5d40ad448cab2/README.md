# fishing_with_dila_v0.2 (dila)

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/5ab77f6433c5d40ad448cab2) · id `5ab77f6433c5d40ad448cab2`  
> Import crackmes.de — auteur **dila**. Série « Fishing with DiLA » (même shell dialog MASM32).

| Fichier | Rôle |
|---|---|
| [`original/fwdv2.zip`](original/fwdv2.zip) | archive |
| [`original/_u/v2.exe`](original/_u/v2.exe) | PE32 GUI |
| [`tools/fwdv2-solve.py`](tools/fwdv2-solve.py) | code + `--check` Wine |

## Réponse

| Champ | Valeur |
|---|---|
| Code (edit + bouton) | **`921`** (`0x399`) |

```bash
python3 tools/fwdv2-solve.py -q
# 921
python3 tools/fwdv2-solve.py --check
# MSG=Success! Thank you for playing ;)
```

## Premier regard

- PE32 GUI, MASM32, ~3 KB, dialog `#32770` titre *Fishing with DiLA v0.2*.
- `GetDlgItemInt` sur le champ, puis MessageBox *Success* / *Sorry, wrong code!*.
- Voir aussi `dila.nfo` (série pédagogique « fishing »).

## Prédicat

`mov ebx, 0x39A` ; `dec ebx` ; `cmp eax, ebx` → **`0x399 = 921`**.

## Vérification

Reverse : **objdump + Wine** (automation `tools/dila_gui_check.exe`). Pas de debugger.

## Notes

- Les strings « cool / frog / hardcoded whore » sont du leurre.
- Même squelette UI pour v0.1…v0.5 ; seul le check change.
