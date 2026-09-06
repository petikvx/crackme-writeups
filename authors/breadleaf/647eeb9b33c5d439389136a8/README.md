# breadleaf — Password and Username guess

> [crackmes.one](https://crackmes.one/crackme/647eeb9b33c5d439389136a8) · C++ ELF64

Deux strings séparées par un espace. Lambda = somme des codes du **username** ; OK si `len(password) == sum`.

## Réponse

| User | Password |
|---|---|
| **`petik`** | n’importe quelle string de **541** caractères |

```bash
python3 tools/password-username-solve.py --check
# … y
```
