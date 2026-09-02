# clone (haggar)

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/5ab77f6533c5d40ad448cb5b) · id `5ab77f6533c5d40ad448cb5b`  
> Import crackmes.de — auteur **haggar**. Diff ~1–2 (keygenme, no patch).

Crackme **PE32 GUI** (template FHCF) : name → serial **8 hex**.

| Fichier | Rôle |
|---|---|
| [`original/_u/clone.exe`](original/_u/clone.exe) | binaire |
| [`original/_u/RaedMe.txt`](original/_u/RaedMe.txt) | consignes |
| [`tools/clone-solve.py`](tools/clone-solve.py) | keygen |

## Réponse

| Champ | Valeur |
|---|---|
| Name | **`petik`** (≥ 5 chars) |
| Serial | **`AC1C7A6F`** |

```bash
python3 tools/clone-solve.py -q --check
# AC1C7A6F
# check: OK
```

Succès UI : MessageBox *Well done!…* / titre *clone - defeated!* / *Bravo!*

## Prédicat

1. `len(name) ≥ 5`, serial = 8 caractères `[0-9A-F]`.
2. Cible 32-bit : somme des octets `name[4:]`, puis enchaînement `bswap` / XOR / ADD/SUB avec constantes  
   `0x03022006`, `0xDEADC0DE`, `0xEDB88320`, `0xD76AA478`, `0xB00BFACE`, `0x0BADBEEF`, + dword LE `name[0:4]`.
3. Serial décodé nibble par nibble : `(n<<4|n) ⊕ {12,56,90,CD} + {34,78,AB,EF}` → `bswap` → compare.

## Notes

- Reverse **objdump** uniquement (pas de debugger).
- Keygen offline round-trip `encode(decode)` vérifié.
