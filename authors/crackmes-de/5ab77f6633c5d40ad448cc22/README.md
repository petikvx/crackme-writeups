# crackmes.de's crackme by twist

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/5ab77f6633c5d40ad448cc22) · id `5ab77f6633c5d40ad448cc22`

Crackme / **keygenme** **PE32 GUI** VB6. Auteur d’origine : **twist**.

| Fichier | Rôle |
|---|---|
| [`original/Crackme.exe`](original/Crackme.exe) | binaire |
| [`original/README.txt`](original/README.txt) | objectif keygen |
| [`analysis/source/Crackme.exe.i64.c`](analysis/source/Crackme.exe.i64.c) | Hex-Rays |
| [`tools/twist-crackme-solve.py`](tools/twist-crackme-solve.py) | keygen |

## Réponse

| Champ | Valeur |
|---|---|
| Name (ex.) | **`petik`** |
| Serial | **` 103.3103448275862`** (espace initial VB `Str$`) |

```bash
python3 tools/twist-crackme-solve.py -q --user petik
#  103.3103448275862
```

---

## Flow / prédicat

```text
n = Name
serial ?= CStr( Asc(Left(n,1)) * Asc(Right(n,1)) / Asc(Mid(n,3,1)) )
```

Hex-Rays : `rtcLeftCharVar` / `rtcRightCharVar` / `rtcMidCharVar(..., 3, 1)` + `rtcAnsiValueBstr` (Asc) + division flottante + `__vbaStrR8` + `__vbaStrCmp`.

OK : *Well done! Now write a tutorial…*

---

## Notes

- Objectif auteur : **keygen** (pas de patch / self-keygen).
- Longueur name ≥ 3 (sinon Mid invalide).
