# crackmes.de's naive_crackme (yanisto)

> [crackmes.one](https://crackmes.one/crackme/5ab77f5833c5d40ad448c3ee) · [`ORIGIN.yml`](ORIGIN.yml)

| | |
|---|---|
| **Auteur** | yanisto (miroir crackmes.de) |
| **Plateforme** | Linux ELF32 static (NASM) |
| **Type** | password 8 octets + checksum intégrité |

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/naive-crk.gz` | archive d’origine |
| `original/naive-crk` | ELF décompressé |
| `tools/naive-solve.py` | password + harness I/O |

## Réponse

| Password (8 bytes) | **`V7l$j^F;`** |

```bash
python3 tools/naive-solve.py -q
# V7l$j^F;
python3 tools/naive-solve.py --check
```

Le leurre `L4zyP4s5.` est déjà présent dans le binaire (zone `pass`) mais **échoue** le checksum.

## Premier regard

```text
ELF 32-bit LSB executable, Intel 80386, statically linked, not stripped
symbols: _check_pt, f_process, next, pass, stgraal, …
```

## Flow / pièges

1. **`e_entry` foireux** (`0x8048883`) → SIGSEGV immédiat. Le vrai `_start` est `0x80488bb` (hors de la zone LOAD hashée, donc patchable pour l’exec sans casser le prédicat).
2. **I/O croisés** : `write` sur **fd 0**, `read` password sur **fd 1** (il faut inverser les pipes).
3. `ptrace(TRACEME)` : si déjà tracé → message `ptraced !!` et sortie.
4. Décode XOR `0x1337` de l’invite, lecture de 8 octets dans `pass`, puis checksum.
5. Si OK → décode XOR `0x1977` du message « graal ».

## Prédicat

Sur l’image LOAD (`p_offset=0x1000`, `vaddr=0x8048000`) après le store final du décode invite en `0x8048251` :

```text
ecx=0; ebx=0
pour chaque dword w dans [0x8048000 .. 0x804846b] :
    ecx ^= w;  ecx = rol(ecx, 1);  ebx += ecx
ok ⇔ (ebx ^ 0x80483ba) == 0xc0ffee
```

Les 8 octets en `0x80483ba` sont le password (résolu via Z3 / force du checksum).

## Vérification

```bash
python3 tools/naive-solve.py --check
# … tip : choose ndisasm / hexdump / ur brain …
# OK
```

## Notes

- Ce n’est **pas** le string `L4zyP4s5.` (faux ami).
- Sans inversion fd0/fd1, le programme a l’air « mort » ou core.
