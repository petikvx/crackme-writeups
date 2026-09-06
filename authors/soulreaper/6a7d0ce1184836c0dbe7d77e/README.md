# soulreaper — Death Trap

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/6a7d0ce1184836c0dbe7d77e) · id `6a7d0ce1184836c0dbe7d77e`

Crackme **ELF64** PIE, GCC, stripped. Serial console via **double-fork** + deux hashs indépendants.  
Auteur : [soulreaper](https://crackmes.one/user/soulreaper).

Dossier : `authors/soulreaper/6a7d0ce1184836c0dbe7d77e/` — [famille](../README.md) · [repo](../../../README.md).

| Fichier | Rôle |
|---|---|
| [`sysupdate`](original/sysupdate) | binaire d’origine |
| [`death-trap-solve.py`](tools/death-trap-solve.py) | MITM + `--check` |
| [`sysupdate.i64.c`](original/sysupdate.i64.c) | Hex-Rays (`decc`) |

## Réponse

| | |
|---|---|
| Serial (16 chars) | **`mLE1AAHrQU3xAhAV`** |

(Plusieurs solutions ; charset alnum+`_` via MITM 4+4 × 2.)

```bash
python3 tools/death-trap-solve.py -q
# mLE1AAHrQU3xAhAV

printf 'mLE1AAHrQU3xAhAV\n' | ./original/sysupdate
# Valid serial
# Join us : https://t.me/+…

python3 tools/death-trap-solve.py --check
```

---

## 1. Premier regard

```text
file original/sysupdate
# ELF 64-bit LSB pie executable, x86-64, dynamically linked, stripped
sha256: 3330d82db5f499ec0ea28fe7f037c016371a5982106e129b1333ab976313f1e5
```

```text
Enter serial:
Valid serial / Invalid serial
Join us : https://t.me/+blTRfHi8oKJiN2E0
You Soul Has Been Taken By The Souls Reaper
```

Imports utiles : `pipe`, `fork`, `waitpid`, `read`/`write`, `scanf`.

---

## 2. Flow

```text
main
  pipe(P)
  printf "Enter serial: "; scanf("%49s", s)
  fork()
  ├── parent : write(P, s) ; waitpid(child)
  │            exit status OK → "Valid serial" + t.me
  │            sinon → "Invalid serial" + message Reaper
  └── child1 :
        read(P, buf)
        h1 = java_hash(buf[0:8])          # 31*h + c
        pipe(Q) ; fork()
        ├── child1-as-parent (middle) :
        │     flag = (h1 == 0x67c91e15) ? '1' : '0'
        │     write(Q, flag + buf[8:16] + '\0')
        │     waitpid(child2) ; exit(0) si child2 OK
        └── child2 :
              read(Q, msg)
              si msg[0] != '1' → exit(1)
              h2 = rol_hash(msg[1:9])     # 8 octets
              si h2 == 0x0c5b6c81 → exit(0)
              sinon exit(1)
```

Le parent ne voit que le **code de sortie** du premier enfant (qui attend le petit-fils). Succès = chaîne `exit(0)` jusqu’en haut.

---

## 3. Prédicat

Serial utile : **16 octets** (le reste de `%49s` est ignoré par les `strncpy` de 8).

### Partie A — `s[0:8]` (hash style Java `String.hashCode`)

```text
h = 0
pour c in s[0:8]:
    h = (31 * h + ord(c)) & 0xffffffff
OK ⇔ h == 0x67c91e15  (1741233685)
```

### Partie B — `s[8:16]` (ROL / TEA-ish)

```text
edx = 0xDEADBEEF
pour b in s[8:16]:
    eax = ROL32(edx ^ b, 5) - 0x61C88647
    edx = eax ^ (eax >> 16)
OK ⇔ edx == 0x0C5B6C81
```

Les deux doivent passer : le middle n’envoie `'1'` que si A OK ; le child2 refuse sinon, et refuse aussi si B rate.

---

## Debug GDB (pas à pas)

PIE + **fork** : activer le suivi des enfants.

```bash
gdb -q ./original/sysupdate
(gdb) set follow-fork-mode child    # ou parent selon l’étape
(gdb) set detach-on-fork off
(gdb) catch syscall fork
(gdb) run
```

### 4.1 Parent : prompt + envoi pipe

```text
(gdb) set follow-fork-mode parent
(gdb) break *main                  # offset fichier ~0x11e0
(gdb) run < <(printf 'mLE1AAHrQU3xAhAV\n')
(gdb) # après scanf : x/s $rsi-ish buffer
```

Sous GDB, `main` est à `base+0x11e0`. Après le 1er `fork`, rester sur le parent pour voir `waitpid` / messages.

### 4.2 Child1 : hash Java

```text
(gdb) set follow-fork-mode child
(gdb) break *0x5555555552c0        # boucle 31*h+c (ajuste base)
# ou break sur adresse relative une fois la base connue :
(gdb) starti
(gdb) print/x $_base()             # si dispo ; sinon info proc mappings
```

Boucle (fichier) vers `0x12c0` :

```text
ecx = ebx*31 ; ebx = byte + ecx
```

À la fin : `cmp ebx, 0x67c91e15` (vers `0x1404` côté middle).

### 4.3 Child2 : hash ROL

```text
(gdb) # 2e fork : follow child encore
(gdb) break *…+0x134d              # xor/rol/sub loop
(gdb) print/x $edx                 # part de 0xdeadbeef
(gdb) break *…+0x136c
(gdb) continue
(gdb) print/x $edx                 # 0xc5b6c81 si OK
```

### 4.4 Anti-confusion Hex-Rays

Le dump `sysupdate.i64.c` inverse parfois parent/enfant du 2ᵉ `fork`. Se fier à l’asm : `test eax,eax ; jne middle` → **enfant** = check ROL, **parent du 2ᵉ fork** = envoi `'0'/'1'` + `s[8:16]`.

### 4.5 Preuve sans stepper tous les forks

```bash
python3 tools/death-trap-solve.py --check
# Valid serial / OK
```

---

## 4. Vérification

```bash
printf 'mLE1AAHrQU3xAhAV\n' | ./original/sysupdate
# Valid serial
# Join us : https://t.me/+blTRfHi8oKJiN2E0

python3 tools/death-trap-solve.py --check
# OK
```

---

## 5. Notes

- Pas de username `petik` (serial seul).
- MITM 4+4 sur charset `[A-Za-z0-9_]` ~30s (`--solve`).
- Famille : [XorGate](../6a768ab608712c1a17cbacdd/), [Dead Terminal](../6a77c5d1df981859694944b8/).
