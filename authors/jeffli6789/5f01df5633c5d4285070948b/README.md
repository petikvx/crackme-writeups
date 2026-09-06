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

## 3. Vérification

```bash
printf '374274518\n' | ./original/x86
# Well done!
```

---

## 5. Notes

- Famille jeffli6789 : aussi [wallpaper](../69a2911b7a778cfffbfb67ca/), [Maze](../5f009fa233c5d42850709479/).
