# Cappybara — BabyRev

| | |
|---|---|
| **ID** | [`6784f8a84d850ac5f7dc5173`](https://crackmes.one/crackme/6784f8a84d850ac5f7dc5173) |
| **Auteur** | Cappybara |
| **Plateforme** | Linux ELF64 PIE, C, non strippé (symbole `flag`) |
| **SHA-256** | `0f1af1a8a6ed155eaf74a4849fc35de05e34bdc2f1862c40a8bb6d87f29d08d0` |

Voir [`ORIGIN.yml`](ORIGIN.yml).

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/babyrev` | binaire d'origine |
| `tools/babyrev-solve.py` | extrait le mot de passe, le code et déchiffre le flag (`-q`, `--check`) |

## Réponse

| Saisie | Valeur |
|---|---|
| Password (1ʳᵉ saisie) | `Sup3rS3cr3tP455W0rd` |
| Secret code (2ᵉ saisie) | `1337` (`0x539`) |
| **Flag** | **`CTFlearn{W4s_1T_Th4T_H4rd?}`** |

```bash
printf 'Sup3rS3cr3tP455W0rd\n1337\n' | ./original/babyrev
python3 tools/babyrev-solve.py --check
```

## Premier regard

`strings` : `Welcome to baby rev challenge`, `Input the password:`, `Input the secret code now:`, `Sup3rS3cr3tP455W0rd`, `Correct!`, `Wrong password!`, `Wrong code!`,
et un **appât** : `CTFlearn{"naughty_naughty_using_strings_are_we?"}` (le vrai flag n'est pas en clair). Le symbole `flag` (`nm`) est une table de 27 dwords en `.rodata` (`0x2060`).

## Flow

`main` @ `0x11e9` : `puts`, `fgets(buf, 0x20, stdin)`, `puts`, `scanf("%d", &code)`.
Ordre des tests : **code d'abord** (`cmp eax,0x539` → « Wrong code! »), puis `strcmp(buf, secret)` (→ « Wrong password! »), puis déchiffrement et affichage du flag.

## Comment on trouve

**Ancrage** : `objdump -d -M intel --no-show-raw-insn original/babyrev | awk '/<main>:/,/ret/'` et `objdump -s -j .rodata`.

```asm
1226: call fgets               ; buf [rbp-0x30], 0x20 octets
1250: call scanf               ; "%d" -> [rbp-0x38]
1258: cmp  eax,0x539           ; code == 1337 ?  sinon "Wrong code!"
1281: call strcmp              ; strcmp(buf, 0x212e)  sinon "Wrong password!"
12a2..12d1: boucle i = 0..0x1a (cmp eax,0x1a ; jbe)
   edx = flag[i]               ; dword @ 0x2060 + 4*i
   eax = i + 0x69
   al  = eax ^ edx             ; putchar(al)
```

Flag : `chr(((i + 0x69) ^ table[i]) & 0xff)` pour `i` de 0 à 26, ce qui donne `CTFlearn{W4s_1T_Th4T_H4rd?}` (27 caractères).

**Piège testé** : `fgets` conserve le `\n`, et la constante comparée **contient elle aussi un `\n`** (octets `...57 30 72 64 0a 00` à `0x212e`). La saisie normale
`Sup3rS3cr3tP455W0rd⏎` passe donc. Ma première idée (envoyer un NUL après le mot de passe pour « couper » le `\n`) échoue avec « Wrong password! » : c'est justement le `\n` qui est attendu.
Autre point : l'ordre inversé (code testé avant le mot de passe) fait qu'un mauvais code masque un bon mot de passe (« Wrong code! »).

## Vérification

```text
$ printf 'Sup3rS3cr3tP455W0rd\n1337\n' | ./original/babyrev
...
Correct!
Here is your flag
CTFlearn{W4s_1T_Th4T_H4rd?}
$ printf 'Sup3rS3cr3tP455W0rd\n1336\n' | ./original/babyrev   -> Wrong code!
$ printf 'wrong\n1337\n' | ./original/babyrev                  -> Wrong password!
```

## Notes

- Reverse statique + essais live, pas de GDB.
