# toasterbirb — jump

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/6869287daadb6eeafb398fec) · id `6869287daadb6eeafb398fec`

Crackme **ELF64** NASM : pile dans `.text`, minefield `ud2`, saut relatif piloté par l’input.  
Auteur : [toasterbirb](https://crackmes.one/user/toasterbirb).

Dossier : `authors/toasterbirb/6869287daadb6eeafb398fec/` — [famille](../README.md) · [repo](../../../README.md).

| Fichier | Rôle |
|---|---|
| [`jump`](original/jump) | binaire d’origine |
| [`jump-solve.py`](tools/jump-solve.py) | contrainte + `--check` |

## Réponse

Mot d’encouragement : **4ᵉ caractère = `t`** (offset `0x74`).

| Exemple | |
|---|---|
| **`just`** | (Recommended) |
| `test` | OK aussi |

```bash
python3 tools/jump-solve.py -q
# just

printf 'just\n' | ./original/jump
# huh... you really did make the jump
# enjoy your stay :D

python3 tools/jump-solve.py --check
```

---

## 1. Premier regard

```text
ELF 64-bit LSB executable, x86-64, statically linked, stripped
sha256: 3ff79033b75ff19555ae42511385e077b7f949dc057677711ba096ccd32d8c42
entry: 0x40100e
```

```text
okay I need your help...
… big jump … ud2 minefield …
your encouraging word: 
huh... you really did make the jump / enjoy your stay :D
```

Sans le bon offset → `ud2` / SIGILL ou segfault.

---

## 2. Flow

```text
mov rsp, 0x401365          # pile factice (qwords = adresses de gadgets)
… prints …
read(stdin, buf@0x402000, 9)
ret → 0x40133c  mov rax, [buf]          # 8 premiers octets LE
ret → 0x401007  and rax, 0xff000000     # isole input[3] dans bits 24..31
ret → 0x401337  shr rax, 24
ret → 0x401000  and rax, 0xff
ret → 0x40114c  add rax, 0x40114c ; jmp rax
                # minefield ud2 …
0x4011c0        success messages
```

---

## 3. Prédicat

```text
landing = 0x40114c + (input[3] as u8)
succès ⇔ landing == 0x4011c0
       ⇔ input[3] == 0x74 == 't'
```

Le reste des octets (et le `\n`) est libre tant que `read` fournit au moins 4 bytes.

---

## 4. Vérification

```bash
printf 'just\n' | ./original/jump
# enjoy your stay :D
```

---

## 5. Notes

- Pile dans le binaire + gadgets `and`/`shr` : joli gadget chain pédagogique.
- Suite toasterbirb asm : `branchless-fixed`.
