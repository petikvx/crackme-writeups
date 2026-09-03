# fishing_with_dila_v0.3 (dila)

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/5ab77f6433c5d40ad448cab1) · id `5ab77f6433c5d40ad448cab1`  
> Import crackmes.de — auteur **dila**. Série « Fishing with DiLA » (même shell dialog MASM32).

| Fichier | Rôle |
|---|---|
| [`original/fwdv3.zip`](original/fwdv3.zip) | archive |
| [`original/_u/v3.exe`](original/_u/v3.exe) | PE32 GUI |
| [`tools/fwdv3-solve.py`](tools/fwdv3-solve.py) | code + `--check` Wine |

## Réponse

| Champ | Valeur |
|---|---|
| Code (edit + bouton) | **`111`** (`0x6F`) |

```bash
python3 tools/fwdv3-solve.py -q
# 111
python3 tools/fwdv3-solve.py --check
# MSG=Success! Thank you for playing ;)
```

## Premier regard

- PE32 GUI, MASM32, ~3 KB, dialog `#32770` titre *Fishing with DiLA v0.3*.
- `GetDlgItemInt` sur le champ, puis MessageBox *Success* / *Sorry, wrong code!*.
- Voir aussi `dila.nfo` (série pédagogique « fishing »).

## Prédicat

`movsx ebx, byte [\"ooh, what do we have here?\"]` puis `cmp eax, ebx` → **`o = 111`**.

## Vérification

Reverse : **objdump + Wine** (automation `tools/dila_gui_check.exe`). Pas de debugger.

## Notes

- Les strings « cool / frog / hardcoded whore » sont du leurre.
- Même squelette UI pour v0.1…v0.5 ; seul le check change.
