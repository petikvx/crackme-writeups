# ezloom — really easy

| | |
|---|---|
| **ID** | [`691fd9362d267f28f69b7f89`](https://crackmes.one/crackme/691fd9362d267f28f69b7f89) |
| **Auteur** | ezloom |
| **Plateforme** | Linux ELF64 PIE, C (`simp_password.c`), non strippé |
| **SHA-256** | `e165d5efea2c1b44de9f8041e409fd41580d37035430f8f983eca8277c79f05a` |

Voir [`ORIGIN.yml`](ORIGIN.yml).

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/simp-password` | binaire d'origine |
| `tools/simp-solve.py` | lit le mot de passe dans l'ELF (`-q`, `--check`) |

## Réponse

**Mot de passe : `iloveicecream`**

```bash
python3 tools/simp-solve.py --check
echo iloveicecream | ./original/simp-password    # I love ice cream too!
```

## Premier regard

`strings -n 4 original/simp-password` : `Enter password: `, `%41s`, `iloveicecream`, `I love ice cream too!`, `Wrong try again.`.
Le secret saute aux yeux : il est juste avant le message de succès.

## Flow

`main` : `printf("Enter password: ")`, `scanf("%41s", buf)` (buffer `[rbp-0x40]`), `strcmp(buf, secret)`, puis `puts` du succès ou de l'échec.

## Comment on trouve

**Ancrage** : `objdump -d -M intel --no-show-raw-insn original/simp-password | awk '/<main>:/,/ret/'`.

```asm
11e4: lea  rax,[rip+0xe19]   # 0x2004 "Enter password: "
1224: call strcmp            ; rdi = buf, rsi = lea [rip+0xdfc] = 0x201a
122b: jne  123e              ; différent -> "Wrong try again." (0x203e)
122d: lea  rax,[rip+0xdf4]   # 0x2028 "I love ice cream too!"
```

`objdump -s -j .rodata` : à `0x201a` on lit `69 6c 6f 76 65 69 63 65 63 72 65 61 6d 00` = `iloveicecream`. Aucune transformation.

## Vérification

```text
$ echo iloveicecream | ./original/simp-password
Enter password: I love ice cream too!
$ echo bad | ./original/simp-password
Enter password: Wrong try again.
```

## Notes

- Reverse statique uniquement (pas de GDB). `scanf("%41s")` dans un buffer de 0x40 octets : léger débordement possible, hors sujet ici.
