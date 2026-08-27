# CrackNotMe's CFM #777 — The Stochastic Casino

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/6a8f5412dbb3353b753965d9) · id `6a8f5412dbb3353b753965d9`

Crackme **PE32+ console** (x86-64), C++ MSVC.  
Auteur site : **CrackNotMe** · tagline `pwned.space`.

| Fichier | Rôle |
|---|---|
| [`original/CFM777.exe`](original/CFM777.exe) | binaire d’origine |
| [`analysis/CFM777.exe.i64.c`](analysis/CFM777.exe.i64.c) | Hex-Rays (`decc`) |
| [`analysis/ciphertext.bin`](analysis/ciphertext.bin) | blob 613 B déchiffré au jackpot |
| [`tools/cfm777_crypto.py`](tools/cfm777_crypto.py) | ARX 77 rounds + decrypt (**validé live x64dbg**) |
| [`tools/_decode_strings.py`](tools/_decode_strings.py) | strings UI XOR |

## Status — PARKED

- [x] reverse structure / flow / honeypots
- [x] crypto ARX + decrypt (preuve debugger)
- [ ] recovery de l’**état final** (7×u64) → VIP pass 50 chars
- [ ] solveur + write-up « solved »

**Blocage** : le prédicat affiche un buffer déchiffré et gagne ssi `strstr(..., "7-7-7 JACKPOT")`. Trouver l’état final unique qui rend ce plaintext lisible (flag `pwn{…}`) résiste aux approches Z3/GA naïves (honeypot anti-IA + espace 448 bits). Reprise : partir de `tools/cfm777_crypto.py` + seed machine, inverser l’ARX une fois l’état final connu.

## Réponse (pas encore)

| | |
|---|---|
| **VIP pass** | *à trouver* (exactement **50** caractères) |
| **Honeypot (FAKE)** | `pwn{777_c4s1n0_j4ckp0t_ez_w1n}` — `argc > 999` / strings leurres |

## Ce qui est établi

1. **Input** : 50 chars → état 56 B = `pass[0:50] + b"_777!\x00"` (asm `0x3737375F`, pas `7777` — Hex-Rays ment).
2. **Seed** environnemental (`sub_140005B50`) : CRC `.text` ⊕ const = 0 si binaire intact ; DJB2(`explorer.exe`) ⊕ const = 0 ; reste rdtsc nibble + infos process + BeingDebugged.
3. **77 rounds** ARX 7 reels (cascades), **bijectif** — `forward` / `backward` dans `cfm777_crypto.py`, match état live sous x64dbg.
4. **Decrypt** splitmix + XOR octets d’état → 613 B ; succès si contient `7-7-7 JACKPOT`.
5. Leurres : oracle temp XOR `0x77`, strings « AI analysis complete », seed fantôme `CASINO_SLOT_RNG_SEED=…`.

## Reprise rapide

```bash
# crypto déjà OK
python3 -c "import sys; sys.path.insert(0,'tools'); import cfm777_crypto as C; print(C.PAD)"

# sous x64dbg : VIP de test 50 chars
# petik_CFM777_test_VIP_pass_AAAAAAAAAAAAAAAAAAAAAAA
```
