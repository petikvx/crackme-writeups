# exzettabyte — Weird

| | |
|---|---|
| **ID** | [`65727e2035240bf986f0ff19`](https://crackmes.one/crackme/65727e2035240bf986f0ff19) |
| **Auteur** | exzettabyte |
| **Plateforme** | Linux ELF64 **statique**, non PIE, **packé UPX** (335 696 → 871 984 octets une fois dépacké) |
| **SHA-256** | `e33b975e33c3d5088b0025ba5e22b8e02a4f2aa96878409c65f792178a123981` |

Voir [`ORIGIN.yml`](ORIGIN.yml).

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/weird` | binaire d'origine (packé UPX, non modifié) |
| `analysis/weird.unpacked` | version dépackée (`tools/upx-3.96 -d -o analysis/weird.unpacked original/weird`) |
| `tools/weird-solve.py` | dépacke, décode le flag, preuve sous gdb (`-q`, `--check`) |

## Réponse

**Flag : `flag{9aec9b0277379453e49889427efe7e7b}`**

```bash
./original/weird                       # Something weird   <- rien d'autre
python3 tools/weird-solve.py --check
```

Le programme **n'affiche jamais le flag tout seul** : il faut exécuter la fonction `secret` (voir « Debug GDB »).

## Premier regard

`file` : ELF64 statique, « no section header ». `strings` : `UPX!` et « the UPX executable… » → packé. Lancé tel quel, il affiche seulement `Something weird`.
Dépacké (`tools/upx-3.96 -d`, sortie sous `analysis/`) : binaire statique avec symboles ; `nm` montre `main` @ `0x401ddb` **et** `secret` @ `0x401d05`, et la chaîne `Flag : %s`.

## Flow

`main` @ `0x401ddb` : `puts("Something weird")` puis `return 0`. **`secret` n'est appelée par personne.**

## Comment on trouve

**Ancrage** : `objdump -d -M intel --no-show-raw-insn analysis/weird.unpacked --start-address=0x401d05 --stop-address=0x401ddb` :

```asm
401d20: movabs rax,0x6c6830726e68656f     ; octets 6f 65 68 6e 72 30 68 6c  "oehnr0hl"
401d2a: movabs rdx,0x3a3e3e3b396b306a
401d3c: movabs rax,0x303d6c3a3c3d303e
401d46: movabs rdx,0x6f6c3e3b3d303131
401d58: mov DWORD PTR [rbp-0x10],0x3e6c3e6c
401d5f: mov WORD  PTR [rbp-0xc],0x746b    ; 8+8+8+8+4+2 = 38 octets = 0x26
401d69: mov BYTE PTR [rbp-0x41],0x9       ; clé XOR
401d6d: mov QWORD PTR [rbp-0x38],0x26     ; longueur
401d7f: boucle : buf[i] ^= 0x9
401dbf: call printf("Flag : %s", buf)
```

`secret` assemble 38 octets avec des immediates (little-endian), les XOR avec `0x09`, et les affiche : `flag{9aec9b0277379453e49889427efe7e7b}`. Le solveur refait exactement cela.
Piège : les chaînes sont stockées XORées, donc `strings` ne montre pas le flag, même dépacké.

## Debug GDB (pas à pas)

La fonction n'étant jamais appelée, on l'exécute à la main **sur le binaire d'origine packé** : on laisse le stub UPX se dépacker, puis on s'arrête sur le premier `write` (l'impression de `Something weird`), moment où le code d'origine est en mémoire à ses adresses finales (non PIE).

```bash
gdb -q ./original/weird
(gdb) catch syscall write
(gdb) run                                   # arrêt sur le write de "Something weird"
(gdb) delete                                # sinon l'appel suivant redéclenche le catchpoint
(gdb) call ((int(*)())0x401d05)()           # secret(), par adresse (le packé n'a plus de symboles)
(gdb) call ((int(*)(void*))0x418260)(0)     # fflush(0) (adresse relevée dans le binaire dépacké)
# Flag : flag{9aec9b0277379453e49889427efe7e7b}
```

Pièges :
- un `hbreak *0x401ddb` ne s'est pas déclenché sur le binaire packé (le point d'arrêt n'a pas arrêté le programme) ;
- sans `delete`, le `call` (qui fait un `write`) retombe sur le catchpoint ;
- sans `fflush`, la sortie reste dans le tampon de stdio et est perdue quand gdb tue le processus (stdout est un pipe).

## Vérification

```text
$ python3 tools/weird-solve.py --check
38 octets, XOR 0x9  ->  flag = flag{9aec9b0277379453e49889427efe7e7b}
gdb (binaire d'origine packé) : OK | exécution normale : Something weird
```

## Notes

- Preuve live sur le **binaire d'origine** (packé) ; l'analyse statique est faite sur la copie dépackée sous `analysis/`.
