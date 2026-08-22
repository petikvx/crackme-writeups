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
