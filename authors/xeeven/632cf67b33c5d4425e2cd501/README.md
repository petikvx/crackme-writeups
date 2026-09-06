# Xeeven's FindThePassword1

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/632cf67b33c5d4425e2cd501) · id `632cf67b33c5d4425e2cd501`

Crackme **ELF32** Linux, NASM (source commentée fournie).  
Auteur site : **Xeeven**.

| Fichier | Rôle |
|---|---|
| [`original/findthepassword1.bin`](original/findthepassword1.bin) | binaire |
| [`original/findthepassword1.tar.7z`](original/findthepassword1.tar.7z) | archive site |
| [`original/readme.asm`](original/readme.asm) | source NASM commentée |
| [`tools/findthepassword1-solve.py`](tools/findthepassword1-solve.py) | password |
| [`analysis/ok.txt`](analysis/ok.txt) | Congratulations |

## Réponse

| Input | Valeur |
|---|---|
| Password | **`8675309`** |

```bash
python3 tools/findthepassword1-solve.py -q
printf '8675309\n' | ./original/findthepassword1.bin 2<&0
# Congratulations!
```

> **Piège** : `sys_read` utilise **`ebx = 2`** (stderr), pas stdin. Il faut `2<&0` (ou attacher un tty).

---

## Analyse

Comparaison `repe cmpsb` (10 octets) vs `data_const_password` = `'8675309', 0xA`.  
`jecxz` → succès si ECX revient à 0.

Hashes : voir `ORIGIN.yml`. Difficulty **1.2**.

---

## Debug GDB (pas à pas)

ELF32 **statique / stripped**. Entry `0x8049000`. Comme Lucky Numbers : **`read` sur fd 2**.

```bash
gdb -q ./original/findthepassword1.bin
(gdb) starti
(gdb) break *0x8049074          # sys_read eax=3, ebx=2
(gdb) run 2<&0
(gdb) print $ebx                # 2
(gdb) x/s 0x804a0c6             # password attendu "8675309\n" (data)
```

| Adresse | Rôle |
|---|---|
| `0x8049074` | `read(2, 0x804a0d0, 0x20)` |
| `0x804909a` | `repe cmpsb` 10 octets vs password |
| `0x80490b7` | succès → Congratulations |

```text
(gdb) break *0x804909a
(gdb) continue
# saisir 8675309
(gdb) x/10cb $edi
(gdb) x/10cb $esi
```

