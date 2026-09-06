# BitFriends's nasm crack

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/5ea48a1433c5d47611746436) · id `5ea48a1433c5d47611746436`

Crackme **ELF64** Linux, asm NASM statique (syscalls only), non strippé.  
Auteur site : **BitFriends**.

| Fichier | Rôle |
|---|---|
| [`original/nasm_crack`](original/nasm_crack) | binaire d’origine |
| [`tools/nasm-crack-solve.py`](tools/nasm-crack-solve.py) | extrait / vérifie le password |
| [`README.md`](README.md) | ce write-up |

## Réponse

| Input | Valeur |
|---|---|
| Password | **`supersecret`** |

```bash
python3 tools/nasm-crack-solve.py -q
# supersecret

python3 tools/nasm-crack-solve.py --check
# OK

printf 'supersecret\n' | ./original/nasm_crack
# Enter your password: Correct!
```

Pas de username : password fixe en clair dans `.data`.

---

## 1. Premier regard

```
file original/nasm_crack
# ELF 64-bit LSB executable, x86-64, statically linked, not stripped

SHA-256 4872e271d6f4a012fd317804b783512abbeb233c0b5efbeb847435acc72eb5a5
Entry   0x401028 (_start)
Source  write.asm (encore dans .symtab)
```

Chaînes / labels utiles :

| VA | Label | Contenu |
|---|---|---|
| `0x402000` | `msg1` | `Enter your password: ` (len1 = 0x16) |
| `0x402016` | `correct` | `Correct!\n` (lenc = 9) |
| `0x40201f` | `wrong` | `Wrong!\n` (lenw = 7) |
| `0x402026` | `passwd` | `supersecret\0` |
| `0x402031` | `input` | buffer BSS (read 0x10 octets) |

Code : `_start`, `correct_func`. Aucune libc — I/O via `syscall` (`write`/`read`/`exit`).

---

## 2. Flow

```
_start
    write(1, msg1, 0x16)          ; prompt
    read (0, input, 0x10)         ; ≤ 16 octets (souvent « …\n »)
    rdi = passwd ; rsi = input ; ecx = 0x0b
    repz cmpsb                    ; compare 11 octets
    je  correct_func              ; → « Correct!\n » + exit(0)
    write(1, wrong, 7)            ; « Wrong!\n »
    exit(0)
```

`correct_func` : `write(Correct!)` puis `exit(0)`.

---

## 3. Prédicat

Comparaison mémoire brute sur **11** octets (`ecx = 0xb`) entre `input` et `passwd` :

```
passwd = "supersecret"   # 11 caractères ASCII
```

Le `\0` après `passwd` n’entre pas dans le `cmpsb`. Un `\n` éventuel en fin de ligne (12ᵉ octet lu) n’est pas comparé non plus — `printf 'supersecret\n'` et `printf 'supersecret'` passent tous les deux.

Aucun hash, XOR, ni keygen : le password est littéralement dans le binaire (`strings` suffit).

---

---

## Debug GDB (pas à pas)

ELF64 **statique**, non stripé.

```bash
gdb -q ./original/nasm_crack
(gdb) x/s 0x402026
# supersecret
(gdb) break *_start+79          # repz cmpsb
(gdb) run < <(printf 'supersecret\n')
(gdb) x/11cb $rdi               # passwd
(gdb) x/11cb $rsi               # input
(gdb) stepi
# je correct_func
```

| Adresse | Rôle |
|---|---|
| `0x40105c` | `read` → `@0x402031` |
| `0x401077` | `repz cmpsb` ecx=11 |
| `correct_func` `0x401000` | `"Correct!"` |

## 4. Vérification

```bash
python3 tools/nasm-crack-solve.py -q          # → supersecret
python3 tools/nasm-crack-solve.py --check     # → OK (live)
printf 'nope\n' | ./original/nasm_crack       # Wrong!
```

---

## 5. Notes

- Challenge débutant NASM / syscalls Linux x64.
- `exit` renvoie toujours `0`, même sur mauvais password — le critère live est la chaîne `Correct!`.
- Fichier source d’origine nommé `write.asm` (table des symboles).
