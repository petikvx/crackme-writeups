# crackmes.de's tiny_crackme (yanisto)

> [crackmes.one](https://crackmes.one/crackme/5ab77f5833c5d40ad448c3ed) · [`ORIGIN.yml`](ORIGIN.yml)

| | |
|---|---|
| **Auteur** | yanisto (miroir crackmes.de) |
| **Plateforme** | Linux ELF32 tiny (static, headers corrompus) |
| **Type** | password 4 octets + checksum SMC |

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/tiny-crackme.gz` | archive d’origine |
| `original/tiny-crackme` | ELF 795 octets |
| `tools/tiny-solve.py` | password + harness I/O |

## Réponse

| Password (4 bytes) | **`72 90 40 cd`** (`r\x90@\xcd`, dword LE `0xcd409072`) |

```bash
python3 tools/tiny-solve.py -q
# 729040cd
python3 tools/tiny-solve.py --check
# -> Success !! Congratulations...
```

## Premier regard

```text
ELF 32-bit LSB executable, Intel 80386, statically linked, corrupted section header size
Entry 0x200008  (code dans e_ident[8+] : mov bl,0x2a ; jmp body)
LOAD @ 0x200000, filesz 0x31b, RWE
```

## Flow

1. Entry dans le padding ELF : `mov bl,0x2a` puis saut vers le stub.
2. Anti-disasm `jmp $+1`, puis `call` routine qui **XOR-décrypte** `[0x20004b ..)` avec la clé dword **`0x3f5479f1`**.
3. XOR-décode la bannière avec la clé en clair **`0xbeefc0da`** (`[0x200292]`).
4. `ptrace` check.
5. Lit **4 octets** (fd 1) en `0x200296`.
6. Checksum : somme des dwords depuis `0x200008` (longueur `0x2df`), XOR `0x5508046b`, compare au dword password.

## Prédicat

Après décryptages :

```text
ebx = 0
pour i in 0 .. (0x2df>>2)-1 :
    ebx += dword[0x200008 + 4*i]
ebx ^= 0x5508046b
ok ⇔ ebx == dword_password   # en 0x200296
```

Le password participe lui-même à la somme (bytes à `0x296..0x299`) → équation linéaire résolue (Z3).

## I/O

Comme `naive_crackme` : **write → fd 0**, **read ← fd 1**. Utiliser le solveur.

## Vérification

```bash
python3 tools/tiny-solve.py --check
# OK
```

## Notes

- `file` annonce des section headers corrompus : normal pour un tiny ELF.
- Password non ASCII complet (octet `0x90`).
