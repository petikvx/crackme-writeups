# jeffli6789 — x86

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/5f01df5633c5d4285070948b) · id `5f01df5633c5d4285070948b`

ELF64 PIE : un entier patch un **shellcode** `add`/`sub` puis `cmp eax, imm`.  
Auteur : [jeffli6789](https://crackmes.one/user/jeffli6789).

| Fichier | Rôle |
|---|---|
| [`x86`](original/x86) | binaire |
| [`x86-solve.py`](tools/x86-solve.py) | MITM + `--check` |

## Réponse

| | |
|---|---|
| Clé | **`374274518`** (`0x164ef9d6`) |

```bash
python3 tools/x86-solve.py -q
python3 tools/x86-solve.py --check
# Well done!
```

---

## 1. Premier regard

```text
ELF 64-bit LSB pie executable, x86-64, dynamically linked, stripped
sha256: 21fce10a973e8e82d756305520c87a01b473eeb0aa4cae7dc3812aa1fc2f14ab
scanf int → mprotect RWX → call shellcode @ .data
```

---

## 2. Flow / prédicat

```text
scanf("%d", &key)
for bit in key (LSB first, 32 slots):
  shellcode[5+5*i] = 0x05 if bit else 0x2d   # add eax,imm / sub eax,imm
mprotect(page, RWX)
call shellcode
  mov eax, 0x3df2f794
  … 32× add/sub …
  cmp eax, 0x7a612770
  sete al ; ret
→ Well done! si AL≠0
```

Meet-in-the-middle 16+16 bits → clé unique `0x164ef9d6`.

---

## Debug GDB (pas à pas)

ELF64 **PIE**, stripped, dynamiquement lié. Offsets stables ; adresses runtime = `base + offset` (souvent `0x555555400000 + …`).

### 3.1 Trouver `main` et le shellcode

```bash
gdb -q ./original/x86
(gdb) starti
(gdb) # laisser le loader ; ou :
(gdb) break *0x5555554006b0    # main (offset fichier ~0x6b0) — ajuste si base ≠
(gdb) run < <(printf '374274518\n')
(gdb) x/40i $rip
```

Repères (offsets depuis la base du binaire) :

| Offset | Rôle |
|---|---|
| `+0x6b0` | `main` — `scanf("%d")` |
| `+0x6f8` / `+0x70f` | patch `movb $0x05` (`add`) / `$0x2d` (`sub`) |
| `+0x73b` | `mprotect(page, …, PROT_RWX=7)` |
| `+0x742` | `call` shellcode `@ .data` (souvent `base+0x201020`) |
| `+0x76e` | branche `"Well done!"` |

### 3.2 Voir le patch bit à bit

```text
(gdb) break *0x5555554006dd    # juste après scanf
(gdb) run < <(printf '374274518\n')
(gdb) print *(int*)($rsp+4)    # clé = 374274518 = 0x164ef9d6
(gdb) break *0x55555540071b    # fin de la boucle de patch
(gdb) continue
(gdb) x/40bx 0x555555601025    # octets opcode 05/2d tous les 5 bytes
```

Chaque bit LSB→MSB de la clé choisit `add eax, imm` (`0x05`) ou `sub eax, imm` (`0x2d`) dans le template shellcode.

### 3.3 Exécuter le shellcode sous GDB

```text
(gdb) break *0x555555400742    # call shellcode
(gdb) continue
(gdb) stepi                    # entre dans .data désormais RWX
(gdb) x/20i $rip
# mov eax, 0x3df2f794
# … 32× add/sub …
# cmp eax, 0x7a612770
# sete al ; ret
(gdb) finish
(gdb) print $al                # 1 si OK
```

Avec une mauvaise clé : `AL=0` → `puts` d’échec.

### 3.4 Dériver sans le solveur

Sous GDB, dumper les 32 immediats du template **avant** patch, noter seed `0x3df2f794` et cible `0x7a612770`, puis MITM 16+16 (comme `x86-solve.py`) — ou tester `$eax` après le shellcode en forçant des bits.

---

## 3. Vérification

```bash
printf '374274518\n' | ./original/x86
# Well done!
```

---

## 5. Notes

- Famille jeffli6789 : aussi [wallpaper](../69a2911b7a778cfffbfb67ca/), [Maze](../5f009fa233c5d42850709479/).
