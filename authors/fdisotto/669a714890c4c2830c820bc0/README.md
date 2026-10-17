# fdisotto — good_boy

| | |
|---|---|
| **ID** | [`669a714890c4c2830c820bc0`](https://crackmes.one/crackme/669a714890c4c2830c820bc0) |
| **Auteur** | fdisotto |
| **Plateforme** | Linux ELF64 PIE, C, **strippé** |
| **SHA-256** | `2e2eed74ac69420c6abd3b0bb6a33547ea827b70c777d66d63ae711fb372a253` |

Voir [`ORIGIN.yml`](ORIGIN.yml).

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/good_boy` | binaire d'origine |
| `tools/goodboy-solve.py` | relit les immediates dans le code (`-q`, `--check`) |

## Réponse

**Mot de passe : `h4x0r`**

```bash
python3 tools/goodboy-solve.py --check
echo h4x0r | ./original/good_boy      # Good boy!
```

## Premier regard

`strings -n 4` : `Enter the password: `, `%255s`, `Good boy!`, `Bad boy!` et… `h4x0` : un fragment seulement. Le mot de passe n'est **pas** stocké d'un bloc :
il est monté sur la pile par deux `mov` d'immediates, donc `h4x0` apparaît (4 octets) mais pas le `r` final. C'est le piège classique : `h4x0` est refusé.

## Flow

Binaire strippé : `main` est la cible du `lea rdi,[rip-0xd8]` de `_start` (@ `0x1191` → `0x10c0`).
`printf("Enter the password: ")` puis `scanf("%255s", [rsp+0x10])` et deux comparaisons de la saisie avec les valeurs posées sur la pile.

## Comment on trouve

**Ancrage** : `objdump -d -M intel --no-show-raw-insn original/good_boy --start-address=0x10c0 --stop-address=0x1160`.

```asm
10cb: mov  edx,0x72                       ; 0x72 = 'r'
10ef: mov  WORD PTR [rsp+0xe],dx          ; octets 72 00   ("r", NUL)
10f4: mov  DWORD PTR [rsp+0xa],0x30783468 ; octets 68 34 78 30 = "h4x0"  (little-endian)
...
110f: call scanf                          ; saisie -> [rsp+0x10]
1114: mov  eax,[rsp+0x10] ; cmp [rsp+0xa],eax ; jne Bad   ; saisie[0..3] == "h4x0"
1147: movzx eax,WORD PTR [rsp+0x14] ; cmp [rsp+0xe],ax ; jne Bad   ; saisie[4..5] == "r\0"
```

Les deux zones se touchent en mémoire : `[rsp+0xa .. +0xd]` = `h4x0` puis `[rsp+0xe .. +0xf]` = `r\0`, soit la chaîne C `"h4x0r"` (le NUL en prime).
La saisie, lue par `scanf("%255s")`, est NUL-terminée : elle doit donc valoir exactement `h4x0r` (le second `cmp` compare aussi le NUL, qui interdit `h4x0rr`).

Piège : `0x30783468` se lit à l'envers (little-endian) : `68 34 78 30` = `h 4 x 0`.

## Vérification

```text
$ echo h4x0r  | ./original/good_boy   -> Good boy!
$ echo h4x0   | ./original/good_boy   -> Bad boy!
$ echo h4x0rr | ./original/good_boy   -> Bad boy!
$ echo H4x0r  | ./original/good_boy   -> Bad boy!
```

## Notes

- Reverse statique + essais live ; pas de GDB.
