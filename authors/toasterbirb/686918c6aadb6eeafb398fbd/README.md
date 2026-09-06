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

## 4. Debug GDB (pas à pas)

Binaire **static / stripped** → pas de symboles. On travaille en adresses absolues (pas de PIE).

### 4.1 Lancer et cartographier

```bash
gdb -q ./original/flags
(gdb) set pagination off
(gdb) info files          # Entry point: 0x401000 ; .text / .data / .bss
(gdb) x/40i 0x401000      # disasm depuis l’entrée
```

Repères utiles dans le listing :

| Adresse | Rôle |
|---|---|
| `0x40103a` | `syscall` = `read(0, 0x402090, 8)` |
| `0x40103c`–`0x401050` | calcule `0`, `pushf` → `r10`, masque `r10 &= 0xf0` |
| `0x401067` | tête de boucle (`cmp rcx,0` / `je`) |
| `0x401074` | `and r10b, bl` (le bit ZF est en jeu) |
| `0x40107f` | `popf` puis `je` → tour suivant si ZF encore set |
| `0x4010b6` | succès → `"Thanks, that's perfect!"` |
| `0x401089` | échec |

### 4.2 Break après le `read`, inspecter le buffer

```bash
printf '24800xxx' > /tmp/flags.in
gdb -q ./original/flags
(gdb) break *0x40103c
(gdb) run < /tmp/flags.in
(gdb) x/8cb 0x402090
# 50 '2'  52 '4'  56 '8'  48 '0'  48 '0'  120 'x' …
```

### 4.3 Suivre la boucle ZF (step / break)

Option A — **single-step** depuis `0x40103c` :

```text
(gdb) stepi          # jusqu’à pushf / pop r10 / and $0xf0
(gdb) print/x $r10   # après le masque : ZF (bit 6) encore présent
(gdb) break *0x401074
(gdb) continue
(gdb) print/x $rcx   # cl = 5,4,3,2,1 selon le tour
(gdb) print/x $rbx   # bl = buf[i] << cl
(gdb) print/x $r10   # r10b &= bl ; bit 6 doit rester 1
(gdb) stepi          # push r10 ; inc rax ; dec rcx ; popf ; je …
```

Option B — **script** sur chaque tour (avant `popf`) :

```text
(gdb) break *0x40107f
(gdb) commands
> silent
> printf "cl=%d bl=%02x r10b=%02x\n", $rcx, $rbx & 0xff, $r10 & 0xff
> continue
> end
(gdb) continue
```

Si un tour casse ZF → `je` rate → branche échec `0x401089`.

### 4.4 Confirmer le succès sous GDB

```text
(gdb) break *0x4010b6
(gdb) run < /tmp/flags.in
# hit → x/s 0x40203d  → "Thanks, that's perfect!"
(gdb) continue
```

Astuce : pour **dériver** la contrainte sans le solveur, mettre un input `\xff\xff\xff\xff\xff…`, breaker sur `0x401074`, et noter quel bit de `bl` doit rester allumé pour garder ZF (bit `6-cl` de l’octet d’entrée).

---

## 5. Vérification

```bash
printf '24800xxx' | ./original/flags
# Thanks, that's perfect!

python3 tools/flags-solve.py --check 24800
# OK
```

---

## 6. Notes

- Pas de `strcmp` / hash : contrainte **bitfield** + RFLAGS.
- Beaucoup de solutions (`24801`, bytes `\x02\x04\x08\x10\x20`, …).
- Suite toasterbirb asm : `off_by_one`, `branchless*`, `jump`, `branchless-fixed`.
