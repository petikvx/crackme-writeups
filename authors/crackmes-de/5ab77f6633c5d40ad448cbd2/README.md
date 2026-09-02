# znycuks_1_crackme (ZNKKeygenme#1)

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/5ab77f6633c5d40ad448cbd2) · id `5ab77f6633c5d40ad448cbd2`  
> Import crackmes.de — auteur **znycuk**. Diff ~1.0.

Crackme **PE32 GUI** MASM32 : keygen HWID (`GetUserNameA` + `GetComputerNameA`) + seed 4 chars (RDTSC).

| Fichier | Rôle |
|---|---|
| [`original/_u/ZNKKeygenme#1.exe`](original/_u/ZNKKeygenme#1.exe) | binaire |
| [`tools/znk1-solve.py`](tools/znk1-solve.py) | keygen |
| [`analysis/ZNKKeygenme1.fixedseed.exe`](analysis/ZNKKeygenme1.fixedseed.exe) | seed forcé `Ab12` (preuve Wine) |

## Réponse

Exemple sous Wine (`UserName=petik`, `ComputerName=PTK-LAB`) :

| Champ | Valeur |
|---|---|
| Seed (affiché) | **`Ab12`** (fixe dans le harness) |
| User | **`petik`** |
| Computer | **`PTK-LAB`** |
| Serial | **`98BE-5573-73B5-4385`** |

```bash
python3 tools/znk1-solve.py --seed Ab12 --user petik --computer PTK-LAB -q
# 98BE-5573-73B5-4385

python3 tools/znk1-solve.py --seed Ab12 --user petik --computer PTK-LAB \
  --check 98BE-5573-73B5-4385 -q
# OK

# preuve live (seed patché Ab12) :
WINEDEBUG=-all wine analysis/livecheck4.exe analysis/ZNKKeygenme1.fixedseed.exe 98BE-5573-73B5-4385
# status='G00D J0B ! Now write your solution...'
```

## Prédicat (résumé)

1. Seed 4 chars ASCII (aléatoire via RDTSC, ou fixe pour le harness).
2. Table 8 dwords : pour `cl∈{0=user,1=computer}`, 4 transforms chaînées  
   `xor 0xABDEADAB` / `neg` / `shl 3` / `ror 1`, avec `(edx&~0xff)|1` après chaque store.
3. Pour chaque char du seed : index dans la table via nibbles high/low, `ror 8`, XOR char → 4 hex ASCII → bloc `AAAA`.
4. Serial = `AAAA-BBBB-CCCC-DDDD`.

## Notes

- Preuve **sans x32dbg** : objdump + keygen Python + Wine (`livecheck4` WriteProcessMemory / `WM_COMMAND`).
- Sur une autre machine, passer `--user` / `--computer` réels (`echo %USERNAME%` / `hostname`).
