# crackmes.de's crackme_nasm / CrackMe_ASM (rezk2ll)

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/5ab77f6533c5d40ad448cb71) · id `5ab77f6533c5d40ad448cb71`

Crackme **ELF32** NASM, non strippé. Auteur : **rezk2ll**.

| Fichier | Rôle |
|---|---|
| [`original/CrackMe_ASM.zip`](original/CrackMe_ASM.zip) | archive |
| [`original/CrackMe_ASM`](original/CrackMe_ASM) | ELF |
| [`original/blah.txt`](original/blah.txt) | note |
| [`tools/crackme-nasm-solve.py`](tools/crackme-nasm-solve.py) | solveur |
| [`analysis/ok.txt`](analysis/ok.txt) | `you are correct !` |

## Réponse

| Input | Valeur |
|---|---|
| Flag / password | **`S3CrE+Fl4G!`** |

```bash
python3 tools/crackme-nasm-solve.py -q
printf 'S3CrE+Fl4G!\n' | ./original/CrackMe_ASM
# Flag : you are correct !
```

## Prédicat

Après le prompt, le binaire **écrit** dans le BSS la constante :

```text
S 3 C r E + F l 4 G !
```

Puis :

```asm
mov ecx, dword [expected]   ; "S3Cr"
mov ebx, dword [input]
cmp ecx, ebx
```

Seul le **premier dword** est comparé — `S3Cr…` suffit techniquement ; la chaîne complète est le password « officiel » construit par le code.

## Debug GDB (pas à pas)

ELF32 **statique**, **non strippé**, entry `_start` `@0x8048080`. Syscalls bruts (`int 0x80`).

```bash
gdb -nx -q ./original/CrackMe_ASM
(gdb) set debuginfod enabled off
(gdb) starti
(gdb) x/40i $eip
```

| Adresse | Rôle |
|---|---|
| `0x8048080` | `write(1, …)` prompt |
| `0x8048096` | `read(0, buf@0x80491a8, 0xb)` |
| `0x80480b1`…`0x80480ed` | écriture BSS `S3CrE+Fl4G!` `@0x80491b3` |
| `0x80480f4` / `0x80480fa` | charge expected / input (dwords) |
| `0x8048100` | `cmp ecx, ebx` — prédicat |
| `0x8048132` | `success` → `you are correct !` |

```text
(gdb) break *0x8048100
(gdb) run
# saisir S3CrE+Fl4G!
(gdb) x/s 0x80491a8          # input
(gdb) x/s 0x80491b3          # expected construit
(gdb) print/x $ecx           # 0x72433353 ("S3Cr" LE)
(gdb) print/x $ebx           # même valeur si OK
(gdb) continue               # → you are correct !
```

Seul le **premier dword** compte : un input qui commence par `S3Cr` passe aussi le `cmp`.

## Notes

- Échec → message + `ClearTerminal` (attend `\n`) + reboucle `_start`.
- Symbole source `new.asm` dans la table des symboles.
