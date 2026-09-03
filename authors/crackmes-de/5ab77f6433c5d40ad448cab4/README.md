# fishing_with_dila_v0.5 (dila)

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/5ab77f6433c5d40ad448cab4) · id `5ab77f6433c5d40ad448cab4`  
> Import crackmes.de — auteur **dila**. Série « Fishing with DiLA » (même shell dialog MASM32).

| Fichier | Rôle |
|---|---|
| [`original/fwdv5.zip`](original/fwdv5.zip) | archive |
| [`original/_u/v5.exe`](original/_u/v5.exe) | PE32 GUI |
| [`tools/fwdv5-solve.py`](tools/fwdv5-solve.py) | code + `--check` Wine |

## Réponse

| Champ | Valeur |
|---|---|
| Code (edit + bouton) | **`3210123`** (`0x30FB8B`) |

```bash
python3 tools/fwdv5-solve.py -q
# 3210123
python3 tools/fwdv5-solve.py --check
# MSG=Success! Thank you for playing ;)
```

## Premier regard

- PE32 GUI, MASM32, ~3 KB, dialog `#32770` titre *Fishing with DiLA v0.5*.
- `GetDlgItemInt` sur le champ, puis MessageBox *Success* / *Sorry, wrong code!*.
- Voir aussi `dila.nfo` (série pédagogique « fishing »).

## Prédicat

1. `GetDlgItemInt` → EAX.
2. Contrôle de flux « fishing » : `push eax` / `push gadget` / `call` opaque ; le gadget effectif fait `add ah, 0x20` puis `neg eax`.
3. `xor ax, 0xDEAF` ; `rol eax, 16` ; compare à **`0x3ADAFFCF`**.
4. Inverse → **`3210123`** (`0x30FB8B`). (Le uint32 « naïf » `0xFFCFE475` est rejeté / faux chemin.)

## Vérification

Reverse : **objdump + Wine** (automation `tools/dila_gui_check.exe`). Pas de debugger.

## Notes

- Les strings « cool / frog / hardcoded whore » sont du leurre.
- Même squelette UI pour v0.1…v0.5 ; seul le check change.
