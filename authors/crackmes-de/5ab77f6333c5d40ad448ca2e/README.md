# smple_unpackme_v0.1 (simple_re)

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/5ab77f6333c5d40ad448ca2e) · id `5ab77f6333c5d40ad448ca2e`  
> Import crackmes.de — auteur **simple_re**. UnpackMe MinGW (pas UPX).

| Fichier | Rôle |
|---|---|
| [`original/UnpackMe.zip`](original/UnpackMe.zip) | archive |
| [`original/_u/UnpackMe.exe`](original/_u/UnpackMe.exe) | PE32 GUI « packed » |
| [`analysis/UnpackMe.restored.exe`](analysis/UnpackMe.restored.exe) | PE restauré |
| [`tools/unpackme-solve.py`](tools/unpackme-solve.py) | restaure les thunks |

## Réponse

Livrable = binaire **restauré** (imports corrects, plus de self-mod sur les stubs) :

```bash
python3 tools/unpackme-solve.py --check
# LoadCursorA thunk 0x40516c OK
# → analysis/UnpackMe.restored.exe
```

Fenêtre titre : *Restore Exe to original state* (pas de serial).

## Prédicat / packing

Les stubs `jmp dword ptr [iat]` dans `.text` pointent vers **de mauvais slots IAT** (ex. `LoadCursorA` → `0x405100` au lieu de `0x40516C`).

Avant chaque appel, le code fait `mov byte ptr [thunk+2], imm8` pour corriger temporairement le low-byte de l’adresse absolue, puis le remet.

Restauration offline :

1. Réécrire les 12 thunks USER32/KERNEL32 concernés vers le bon IAT.
2. NOP les `mov byte ptr [thunk+2], …` (self-mod).

## Vérification

Wine : l’original et le restored ouvrent la même fenêtre `WindowsApp` / *Restore Exe to original state*.

## Notes

- `diec` : MinGW, **pas** UPX (`tools/upx-3.96` → NotPacked).
- Hex-Rays : `analysis/UnpackMe.exe.i64.c` (via `decc`).
