# crackme_3_by_sharpe (sharpe)

> [crackmes.one](https://crackmes.one/crackme/5ab77f6233c5d40ad448c9e1) · Keygenme #3 — code encryption + GetVersion.

| Fichier | Rôle |
|---|---|
| [`original/_u/three.exe`](original/_u/three.exe) | challenge |
| [`analysis/three.real.exe`](analysis/three.real.exe) | decrypt permanent (pour `--check`) |
| [`tools/sharpe3-solve.py`](tools/sharpe3-solve.py) | keygen |

## Réponse

| Name | Serial |
|---|---|
| **`AAAAAAAA`** | **`$$$$$$$$mbc`afgd`** |

(`petik` produit souvent un NUL → inutilisable dans l’edit.)

```bash
python3 tools/sharpe3-solve.py -q --user AAAAAAAA
python3 tools/sharpe3-solve.py --check
```

## Prédicat

1. Anti-debug `IsDebuggerPresent`.
2. Blob `@0x4011AB` (13 dwords) chiffré avec **`xor 0xCF0EB0A1`** ; déchiffré autour de l’algo puis rechiffré.
3. Algo (une fois clair) : pour chaque octet du name + padding, mélange `GetVersion` (`ebx` avec `xchg bh,bl`) et XOR constants `.data` `0xCF,0x0F,0xA1`.
4. Un second générateur en clair (`4011FE`) est un **leurre** (et le fail path « Sorry » est mort — mauvais serial = silence).

## Notes

Serial **dépend de `GetVersion`** (Wine/Windows). Recalculer sur la machine cible.
