# toasterbirb

Auteur local : **`toasterbirb`** (site : [toasterbirb](https://crackmes.one/user/toasterbirb)).

Voir [`author.yml`](author.yml) · [`catalog.yml`](catalog.yml) (id ↔ sha256).

## Progression

| # | Titre | ID | Plateforme | Solution |
|---|---|---|---|---|
| 1 | [yap](6a77541805a9e80a907242fe/) | [`6a775418…`](https://crackmes.one/crackme/6a77541805a9e80a907242fe) | Linux x86-64 | seed `Your prize:` → `flag{shaney_would_have_liked_this}` |
| 2 | [flags](686918c6aadb6eeafb398fbd/) | [`686918c6…`](https://crackmes.one/crackme/686918c6aadb6eeafb398fbd) | Linux ELF64 NASM | `24800` (bits 1..5 / ZF) |
| 3 | [off_by_one](68692100aadb6eeafb398fd3/) | [`68692100…`](https://crackmes.one/crackme/68692100aadb6eeafb398fd3) | Linux ELF64 NASM | `DXUPWYfU` |
| 4 | [branchless branching](68692679aadb6eeafb398fdf/) | [`68692679…`](https://crackmes.one/crackme/68692679aadb6eeafb398fdf) | Linux ELF64 NASM | `petik→rn%5ielsrArvz"""` |
| 5 | [branchless](68692748aadb6eeafb398fe3/) | [`68692748…`](https://crackmes.one/crackme/68692748aadb6eeafb398fe3) | Linux ELF64 NASM | `5$` (len/sum fib∩prime) |
| 6 | [jump](6869287daadb6eeafb398fec/) | [`6869287d…`](https://crackmes.one/crackme/6869287daadb6eeafb398fec) | Linux ELF64 NASM | `just` / `test` (byte[3]=`t`) |
| 7 | [branchless-fixed](68c1f30a224c0ec5dcedbeda/) | [`68c1f30a…`](https://crackmes.one/crackme/68c1f30a224c0ec5dcedbeda) | Linux ELF64 NASM | `5$` (DLC fix `idiv rcx`) |
| 8 | [main.cpp](6869233eaadb6eeafb398fdb/) | [`6869233e…`](https://crackmes.one/crackme/6869233eaadb6eeafb398fdb) | Linux polyglotte bash/C++ | `even_more_secure_password` en 3ᵉ arg, ≥ 4 args (`bash main.cpp a b <pw> d`) |
| 9 | [argc](68698837aadb6eeafb399017/) | [`68698837…`](https://crackmes.one/crackme/68698837aadb6eeafb399017) | Linux ELF64 PIE C | 5-6 args, `argv[1]==argv[2]` (`_start` fait argc>>1) — `petik petik a b c` |
| 10 | [shellcoding](6869167eaadb6eeafb398fb4/) | [`6869167e…`](https://crackmes.one/crackme/6869167eaadb6eeafb398fb4) | Linux ELF64 PIE strippé | fichier `get_number.png` = shellcode `90 89 f8 83 e0 01 83 c0 02 c3` (f(t)=2+(t&1)) |

Les six ELF NASM (flags → branchless-fixed) ont une section **Debug GDB (pas à pas)** dans leur `README.md` (adresses, breakpoints, commandes).  
`yap` est hors série asm (C++).

## Ajouter un crackme

```bash
./scripts/add-crackme.sh --author toasterbirb <id>
```
