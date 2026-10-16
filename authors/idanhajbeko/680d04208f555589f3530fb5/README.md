# idanhajbeko — babyFirstCrackme

| | |
|---|---|
| **ID** | [`680d04208f555589f3530fb5`](https://crackmes.one/crackme/680d04208f555589f3530fb5) |
| **Auteur** | idanhajbeko |
| **Plateforme** | Linux ELF64 PIE, C (`main.c`), non strippé ; deux `.exe` qui sont en réalité des ELF |
| **SHA-256 (zip)** | `8c4f4e2e3f78fa7744350ddafba9597cce9190530373779ac4ed7b2ed3353629` |

Voir [`ORIGIN.yml`](ORIGIN.yml).

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/babtFirstCrackme.zip` | archive d'origine (`main.exe`, `hints.exe`, `README.me`) |
| `analysis/x/babyFirstCrackme/` | contenu extrait |
| `tools/babyfirst-solve.py` | lit le mot de passe dans `main.exe` du zip (`-q`, `--check`) |

## Réponse

**Mot de passe : `!_-P@$$w0rD-_!`**

```bash
python3 tools/babyfirst-solve.py --check
echo '!_-P@$$w0rD-_!' | ./analysis/x/babyFirstCrackme/main.exe   # you did it that was easy
```

**Attention** : sur un mauvais mot de passe puis EOF, `main.exe` reboucle indéfiniment sur `Enter the password:` — toujours borner (`timeout`, `head`) quand on teste.

## Premier regard

`README.me` : « run `hints.exe` for some useful clues… try reversing the `hints.exe` too, I always like to hide a little something extra ».
Les deux `.exe` sont des **ELF Linux**. `strings main.exe` : `Enter the password: `, `%999s`, **`!_-P@$$w0rD-_!`**, codes couleurs ANSI, `The password is … incorrect`.

## Flow

`main.exe` (`main` @ `0x1279`) : `puts("Enter the password: ")`, `scanf("%999s", buf)`, `strcmp(buf, (char*)0x201f)` ;
égal → `getFlag()` (construit un message octet par octet sur la pile) et l'affiche en vert ; sinon « The password is incorrect » (en rouge) et on recommence.

## Comment on trouve

**Ancrage** : `objdump -d -M intel --no-show-raw-insn main.exe | awk '/<main>:/,/ret/'` et `objdump -s -j .rodata main.exe`.

```asm
12b2: call scanf               ; "%999s" (0x2019) -> [rbp-0x3f0]
12be: lea  rdx,[rip+0xd5a]     # 0x201f  -> secret
12cb: call strcmp ; test eax,eax ; jne 1315   ; 1315 = "incorrect" + reboucle
12ed: call getFlag             ; 1179 : 'y','o','u',' ','d','i','d',... écrits un octet à la fois
```

`.rodata` à `0x201f` : `21 5f 2d 50 40 24 24 77 30 72 44 2d 5f 21 00` = `!_-P@$$w0rD-_!`. Le « flag » affiché par `getFlag` est un message texte
(`you did it that was easy / if it wasnt so dammm you bad at this`), assemblé par des `mov BYTE PTR [rbp-0x..], imm8` : `strings` ne le voit donc pas.

**`hints.exe`** (optionnel, non résolu en détail) : ses chaînes disent « ENTER easy IN THE SECOND INPUT THEN YOU CAN ENTER THE 4 DIGIT CODE » ;
statiquement, `strcmp(second, "easy")` @ `0x23b4` et `cmp eax,0x4e2` (= **1250**) sur le code à 4 chiffres. Avec `N` à la première question il répond
« Good choice good bye :) » sans rien dévoiler ; la branche `Y` n'a pas été explorée.

## Vérification

```text
$ echo '!_-P@$$w0rD-_!' | ./main.exe
Enter the password:
you did it that was easy
if it wasnt so dammm you bad at this
$ echo wrong | timeout 2 ./main.exe | head -2
Enter the password:
The password is incorrect
```

## Notes

- Reverse statique + essais live, pas de GDB.
- L'extension `.exe` est trompeuse (ELF Linux).
