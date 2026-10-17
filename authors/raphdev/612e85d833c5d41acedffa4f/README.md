# RaphDev — PleaseCrackMe

| | |
|---|---|
| **ID** | [`612e85d833c5d41acedffa4f`](https://crackmes.one/crackme/612e85d833c5d41acedffa4f) |
| **Auteur** | RaphDev |
| **Plateforme** | Linux ELF64 PIE, C, non strippé |
| **SHA-256** | `950f8f580268676dea4fe08860da32efb92ac724020ae4885287c86c44202310` |

Voir [`ORIGIN.yml`](ORIGIN.yml).

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/PleaseCrackMe` | binaire d'origine |
| `tools/pleasecrackme-solve.py` | calcule le mot de passe (`--user`, `--number`, `-q`, `--check`) |

## Réponse

`password[i] = username[i] + number` (`number` entre 1 et 9, au choix). Exemple avec `petik` et `number=5` :

| Username | Number | Password |
|---|---|---|
| `petik` | `5` | `ujynp` |

```bash
printf 'petik\n5\nujynp\n' | ./original/PleaseCrackMe   # You are succesfully logged in
python3 tools/pleasecrackme-solve.py --check
```

## Premier regard

`strings` : `Type in your Username: `, `Type in a number beetween 1 and 9: `, `Type in the password: `, `You are succesfully logged in`, `Wrong password`. Trois saisies successives, aucune constante secrète.

## Flow

`main` @ `0x11e9` : lit le nom, lit le nombre (refusé si `<= 0` ou `> 9`), calcule un mot de passe dérivé, lit la saisie, `strcmp`.

## Comment on trouve

**Ancrage** : `objdump -d -M intel --no-show-raw-insn original/PleaseCrackMe | awk '/<main>:/,/ret/'`.

```asm
12a0: movzx eax,BYTE PTR [username+i]
12a7: add  eax,[number]          ; username[i] + number
12b3: mov  [password_calc+i],dl  ; (octet par octet, boucle sur strlen(username))
1309: call strcmp                ; strcmp(saisie, password_calc)
```

Chaque caractère du nom est décalé de `number` (modulo 256, `add` 8 bits).

## Vérification

```text
$ printf 'petik\n5\nujynp\n' | ./PleaseCrackMe   -> You are succesfully logged in
$ printf 'petik\n5\nwrong\n' | ./PleaseCrackMe   -> Wrong password
$ printf 'petik\n0\nx\n' | ./PleaseCrackMe        -> Error: Number is too small
```

## Notes

- Reverse statique + essais live ; pas de GDB.
