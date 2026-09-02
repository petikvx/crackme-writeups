# slayers_crackme_1 (KeyMe #1)

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/5ab77f6533c5d40ad448cb6b) · id `5ab77f6533c5d40ad448cb6b`  
> Import crackmes.de — auteur **savage** / Slayer. Diff ~1.0.

Crackme **PE32 GUI** (KeyMe) : **pas de patch** — keygen uniquement.

| Fichier | Rôle |
|---|---|
| [`original/_u/KeyMe1.exe`](original/_u/KeyMe1.exe) | binaire |
| [`original/_u/Readme.txt`](original/_u/Readme.txt) | consignes |
| [`tools/slayer-keyme1-solve.py`](tools/slayer-keyme1-solve.py) | keygen clipboard + `reg.key` |

## Réponse

Deux étapes UI :

1. **Step 1** — mettre le **ComputerName** exact dans le presse-papiers, puis le bouton Step1 → *Step 1 ok → now Register it!*
2. **Register** — placer `reg.key` (8 octets) à côté de l’exe, bouton Register → *Good work. You have done it!*

Exemple Wine (`ComputerName=PTK-LAB`) :

| | |
|---|---|
| Clipboard | **`PTK-LAB`** |
| Checksum | `sum(b'PTK-LAB\\0')` = **`0x1EB`** (491) |
| `reg.key` | `eb 01 00 00 00 00 00 00` (d0=0x1EB, d1=0) |

```bash
python3 tools/slayer-keyme1-solve.py --computer PTK-LAB -q --check
# 000001EB-00000000
# check: OK

python3 tools/slayer-keyme1-solve.py --computer PTK-LAB --write-key analysis/reg.key
# puis copier reg.key à côté de KeyMe1.exe, clipboard=PTK-LAB, Step1 + Register
```

## Prédicat

```text
sum = Σ GetComputerNameA bytes  (inclut le NUL final)
Step1:  clipboard[0..len-1] == name[0..len-1]
        ⇔  sum - Σ clipboard = 0

Register (reg.key ≥ 8 octets):
        (dword0 ^ dword1) + step1_acc  == sum
        (après Step1 OK, step1_acc = 0)
        ⇔  dword0 ^ dword1 == sum
```

## Notes

- Reverse 100 % **objdump** (pas de debugger).
- Toute paire `(d0,d1)` avec `d0^d1==sum` convient.
