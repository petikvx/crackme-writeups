# fishing_with_dila_v0.4 (dila)

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/5ab77f6433c5d40ad448cab3) · id `5ab77f6433c5d40ad448cab3`  
> Import crackmes.de — auteur **dila**. Série « Fishing with DiLA » (même shell dialog MASM32).

| Fichier | Rôle |
|---|---|
| [`original/fwdv4.zip`](original/fwdv4.zip) | archive |
| [`original/_u/v4.exe`](original/_u/v4.exe) | PE32 GUI |
| [`tools/fwdv4-solve.py`](tools/fwdv4-solve.py) | code + `--check` Wine |

## Réponse

| Champ | Valeur |
|---|---|
| Code (edit + bouton) | **`1337`** (`0x539`) |

```bash
python3 tools/fwdv4-solve.py -q
# 1337
python3 tools/fwdv4-solve.py --check
# MSG=Success! Thank you for playing ;)
```

## Premier regard

- PE32 GUI, MASM32, ~3 KB, dialog `#32770` titre *Fishing with DiLA v0.4*.
- `GetDlgItemInt` sur le champ, puis MessageBox *Success* / *Sorry, wrong code!*.
- Voir aussi `dila.nfo` (série pédagogique « fishing »).

## Prédicat

Après `GetDlgItemInt`, `call` vers un check (string bait \` !! LOOK HERE: \` au milieu du code) :

```
mov ebx, 0x29C
imul ebx, ebx, 2
inc ebx          ; 0x539 = 1337
cmp eax, ebx
```

## Vérification

Reverse : **objdump + Wine** (automation `tools/dila_gui_check.exe`). Pas de debugger.

## Notes

- Les strings « cool / frog / hardcoded whore » sont du leurre.
- Même squelette UI pour v0.1…v0.5 ; seul le check change.
