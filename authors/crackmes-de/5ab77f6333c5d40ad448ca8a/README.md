# crackmes.de's easy_linux_crackme (lord)

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/5ab77f6333c5d40ad448ca8a) · id `5ab77f6333c5d40ad448ca8a`

ELF32 NASM (dans `blah.tar.gz`). Auteur : **lord**.

| Fichier | Rôle |
|---|---|
| [`original/blah.tar.gz`](original/blah.tar.gz) | archive |
| [`original/blah`](original/blah) | ELF |
| [`tools/easy-linux-crackme-solve.py`](tools/easy-linux-crackme-solve.py) | doc + check gdb |
| [`analysis/ok.txt`](analysis/ok.txt) | `Okej!` |

## Réponse

| Condition | Valeur |
|---|---|
| `getgid()` | **`0xdead`** (57005) |

Pas de password clavier. Le binaire appelle `sys_getgid` (`eax=0x2f` / `int 0x80`) et exige `eax == 0xdead` pour afficher **`Okej!`**.

```bash
# sans root (preuve) :
python3 tools/easy-linux-crackme-solve.py --check

# avec privileges :
# sudo setpriv --reuid=$(id -u) --regid=57005 --clear-groups ./original/blah
```

## Prédicat

```asm
mov eax, 0x2f      ; sys_getgid
int 0x80
cmp eax, 0xdead
jne exit
; write "Okej!\n"
```

Binaire **statique** → pas de `LD_PRELOAD` sur getgid.
