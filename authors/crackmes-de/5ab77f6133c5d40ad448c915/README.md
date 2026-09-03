# protreebrains_crackme_1 (protreebrain)

> [crackmes.one](https://crackmes.one/crackme/5ab77f6133c5d40ad448c915) · Serial GUI MASM32 — anti-debug + checksum.

| Fichier | Rôle |
|---|---|
| [`original/_u/crackme_1.exe`](original/_u/crackme_1.exe) | challenge |
| [`analysis/crackme_1.nodbg.exe`](analysis/crackme_1.nodbg.exe) | ODS NOPé (Wine) |
| [`tools/protreebrain1-solve.py`](tools/protreebrain1-solve.py) | serial + nodbg |

## Réponse

**Serial : `20062007`**

```bash
python3 tools/protreebrain1-solve.py -q
WINEDEBUG=-all wine analysis/crackme_1.nodbg.exe   # puis saisir 20062007
```

## Prédicat

Bouton ID `12345` :

1. Checksum junk sur `[0x401124, 0x40112F)` (message « Why you try patch… » si KO, **non bloquant**).
2. `IsDebuggerPresent` / fenêtre `OllyDbg - [CPU]` → refuse.
3. Sinon : `GetDlgItemInt(edit=2) == **20062007**` → *Good serial!…*

## Notes

- `OutputDebugStringA` avec une format-string `%s`×N **sans arguments** → crash fréquent sous Wine ; NOP `@0x40105B` pour la preuve.
- Pas de keygen name→serial : constante date-like `20062007`.
