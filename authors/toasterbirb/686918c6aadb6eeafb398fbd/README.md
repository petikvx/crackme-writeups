# toasterbirb — flags

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/686918c6aadb6eeafb398fbd) · id `686918c6aadb6eeafb398fbd`

Crackme **ELF64** NASM, static, stripped. Jeu sur le **Zero Flag** (RFLAGS).  
Auteur : [toasterbirb](https://crackmes.one/user/toasterbirb).

Dossier : `authors/toasterbirb/686918c6aadb6eeafb398fbd/` — [famille](../README.md) · [repo](../../../README.md).

| Fichier | Rôle |
|---|---|
| [`flags`](original/flags) | binaire d’origine |
| [`README.md`](README.md) | ce write-up |
| [`flags-solve.py`](tools/flags-solve.py) | exemple + `--check` |

## Réponse

Pas une unique string : **5 premiers octets** tels que le bit `(i+1)` est set sur l’octet `i`.

| Exemple | Pourquoi |
|---|---|
| **`24800`** | `'2'` bit1, `'4'` bit2, `'8'` bit3, `'0'` bits4+5 |

```bash
python3 tools/flags-solve.py -q
# 24800

printf '24800xxx' | ./original/flags
# … Thanks, that's perfect!

python3 tools/flags-solve.py --check
```

---

## 1. Premier regard

```text
file original/flags
# ELF 64-bit LSB executable, x86-64, statically linked, stripped
sha256: 97d2b331ad925cdf8f55e6b1720c91ab4d3a6187adc55bd94c88dd4c0d890274
```

```text
You like flags? I like flags! Can I have a zero one please:
Thanks, that's perfect!
I don't think that's the flag I was looking for...
```

« zero one » = **ZF** (zero flag), pas le littéral `01`.

---

## 2. Flow

```text
write(prompt)
sys_read(stdin, buf@0x402090, 8)
rax = 7 - 10 + 3   → 0   ; pushf → r10 ; r10 &= 0xf0   (garde AF/ZF…)
rcx = 5
pour chaque octet (shift rcx = 5..1) :
    r10b &= (buf[i] << rcx)
    popf(r10) ; si !ZF → fail
si ZF encore → "Thanks, that's perfect!"
```

---

## 3. Prédicat

Après l’`add` qui produit 0, **ZF=1**. Le masque `0xf0` conserve notamment le bit ZF (bit 6 de RFLAGS).

À chaque tour, `shl bl, cl` puis `and r10b, bl` : pour que ZF survive, le bit 6 du résultat doit rester 1 ⇒ l’octet d’entrée doit avoir le bit `(6 - cl)` :

| i | cl | bit requis |
|---|---|---|
| 0 | 5 | bit **1** |
| 1 | 4 | bit **2** |
| 2 | 3 | bit **3** |
| 3 | 2 | bit **4** |
| 4 | 1 | bit **5** |

Octets 5–7 lus mais **non testés**.

---

## 4. Vérification

```bash
printf '24800xxx' | ./original/flags
# Thanks, that's perfect!

python3 tools/flags-solve.py --check 24800
# OK
```

---

## 5. Notes

- Pas de `strcmp` / hash : contrainte **bitfield** + RFLAGS.
- Beaucoup de solutions (`24801`, bytes `\x02\x04\x08\x10\x20`, …).
- Suite toasterbirb asm : `off_by_one`, `branchless*`, `jump`, `branchless-fixed`.
