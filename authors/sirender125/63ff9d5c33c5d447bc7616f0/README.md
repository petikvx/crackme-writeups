# SirEnder125 — MyFirstCrackme

| | |
|---|---|
| **ID** | [`63ff9d5c33c5d447bc7616f0`](https://crackmes.one/crackme/63ff9d5c33c5d447bc7616f0) |
| **Auteur** | SirEnder125 |
| **Plateforme** | Linux ELF64 PIE, C, non strippé (`test`) |
| **SHA-256** | `62e1efae025e4c16f174e87d09b82c6d983add6e81af2027ed946faeff319106` |

Voir [`ORIGIN.yml`](ORIGIN.yml).

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/crackme` | binaire d'origine |
| `tools/myfirstcrackme-solve.py` | fournit le mot de passe + un PIN valide (`-q`, `--check`) |

## Réponse

| | |
|---|---|
| **Mot de passe** | `crackmes4ever:)` |
| **PIN** | n'importe quelle chaîne de **15 caractères** (ex. `111111111111111`) |

```bash
printf 'crackmes4ever:)\n111111111111111\n' | ./original/crackme
# Crackme solved! Comment on the crackmes.one website for more crackmes!
python3 tools/myfirstcrackme-solve.py --check
```

## Premier regard

`strings` : `crackmes4ever:)`, `Enter the password: `, `Correct! No enter your pin: `, `Crackme solved!…`, `Incorrect! But the password was correct!`.
Le mot de passe est en clair ; reste à comprendre la condition du PIN.

## Flow

`main` @ `0x11e9` : `scanf("%s", buf)`, `test(buf, password)` @ `0x1275` : `strcmp(buf, password)` ; si égal, affiche l'invite du PIN et **relit dans le même buffer `buf`** (le mot de passe est écrasé par le PIN) ; `strlen(buf) == 15` → « Crackme solved!… », sinon « Incorrect! But the password was correct! ».

## Comment on trouve

**Ancrage** : `objdump -d -M intel --no-show-raw-insn original/crackme | awk '/<test>:/,/ret/'`.

```asm
1297: call strcmp            ; strcmp(buf, password)
129e: jne  "That one was incorrect!"
12af: call printf            ; "Correct! No enter your pin: "
12ca: call scanf             ; scanf("%s", buf)   <- RÉUTILISE buf, le mot de passe est perdu
12d6: call strlen ; cmp rax,0xf ; jne   ; strlen(pin) == 15
```

Il n'y a **aucune comparaison de contenu** pour le PIN, seulement sa longueur (`0xf = 15`, exactement la longueur de `crackmes4ever:)`). N'importe quelle chaîne de 15 caractères convient.

## Vérification

```text
$ printf 'crackmes4ever:)\n111111111111111\n' | ./crackme   -> Crackme solved! ...
$ printf 'crackmes4ever:)\n11111111111111\n'  | ./crackme   -> Incorrect! But the password was correct!  (14 car.)
$ printf 'wrong\n'                              | ./crackme   -> Oh, no! That one was incorrect!
```

## Notes

- Reverse statique + essais live ; pas de GDB.
