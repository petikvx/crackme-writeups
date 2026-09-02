# crack_me (hexic / cLoNeTrOnE KeyGenMe #1)

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/5ab77f6433c5d40ad448cb0f) · id `5ab77f6433c5d40ad448cb0f`  
> Miroir crackmes.de listé sous **hexic** ; binaire / NFO : **cLoNeTrOnE** (Team FOFF, 2007). Diff ~1.0.

Crackme **PE32 GUI** MASM32 : name → serial.

| Fichier | Rôle |
|---|---|
| [`original/_u/KeyGenMe_#1_cLoNeTrOnE.exe`](original/_u/KeyGenMe_#1_cLoNeTrOnE.exe) | binaire |
| [`original/_u/file_id.diz`](original/_u/file_id.diz) | infos release |
| [`tools/crack-me-hexic-solve.py`](tools/crack-me-hexic-solve.py) | keygen |

## Réponse

| Champ | Valeur |
|---|---|
| Name | **`petik`** (4…60 chars ASCII) |
| Serial | **`13-0000021D-Z7`** |

```bash
python3 tools/crack-me-hexic-solve.py -q --check
# 13-0000021D-Z7
# check: OK
```

Succès : *Well Done Cracker !!!. Now, Code a KeyGen.?* / *WoW, Very Good Job.*

## Prédicat

Charset `@0x403235` : **`1AG4T3CX8ZF7R95Q`**.

```text
serial = AA + "-" + "%08X"(Σ name) + "-" + BB

AA[i] = CHARMAP[ name[i]   % 16 ]   for i = 0,1
BB[j] = CHARMAP[ name[L-2+j] % 16 ] for j = 0,1
```

## Notes

- Reverse **objdump** (pas de debugger).
- Serial **case-sensitive** (hex majuscule + charset).
