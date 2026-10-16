# izijerry — int overflow

| | |
|---|---|
| **ID** | [`6894d8e98fac2855fe6fb3ff`](https://crackmes.one/crackme/6894d8e98fac2855fe6fb3ff) |
| **Auteur** | izijerry |
| **Plateforme** | Linux ELF64 PIE, C (`password.c`), non strippé |
| **SHA-256** | `2990d611ccd34b9378959470a706c5b930d0450223f62a49a81117d5dbd48010` |

Voir [`ORIGIN.yml`](ORIGIN.yml).

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/pass` | binaire d'origine |
| `tools/pass-solve.py` | affiche les formes valides (`-q`, `--check`) |

## Réponse

**Mot de passe : `-539222978`** (forme signée) — ou **`3755744318`** (`0xdfdc1c3e` non signé), qui passe aussi grâce à l'overflow.

```bash
python3 tools/pass-solve.py --check
echo -539222978 | ./original/pass     # Password Correct!!!
echo 3755744318 | ./original/pass     # Password Correct!!!
```

## Premier regard

`strings` : `input your password here: `, `%19s`, `Password Correct!!!`, `Incorrect Password!!!`, import `atoi`, symboles `GetPass`, `main`, variable `password.0`.
Le mot de passe est un **nombre**, pas une chaîne comparée.

## Flow

- `GetPass` @ `0x1159` : `printf(prompt)`, `scanf("%19s", password.0)` (buffer global @ `0x4040`), retourne son adresse.
- `main` @ `0x1198` : `n = atoi(GetPass())` puis `n == 0xdfdc1c3e` ? « Password Correct!!! » : « Incorrect Password!!! ».

## Comment on trouve

**Ancrage** : `objdump -d -M intel --no-show-raw-insn original/pass | awk '/<main>:/,/ret/'`.

```asm
11b5: call atoi
11ba: mov  DWORD PTR [rbp-0xc],eax        ; n : int 32 bits
11bd: cmp  DWORD PTR [rbp-0xc],0xdfdc1c3e ; cmp r/m32, imm32
11c4: jne  incorrect
```

- La comparaison est sur **32 bits** : `0xdfdc1c3e` vaut `3755744318` en non signé et `3755744318 - 2^32 = -539222978` en signé.
- `atoi` (glibc) = `(int) strtol(s, NULL, 10)` : une valeur > `INT_MAX` est lue en `long` puis **tronquée modulo 2^32**, donc
  `3755744318` donne bien `0xdfdc1c3e` — c'est « l'int overflow » du titre. Toute valeur `3755744318 + k·2^32` passe aussi
  (ex. `8050711614`, 10 chiffres, `scanf("%19s")` accepte jusqu'à 19 caractères).

**Piège** : lire la constante comme `3755744318` seulement, ou chercher une chaîne : la forme négative est la plus « naturelle » pour un `int`.

## Vérification

```text
-539222978   -> Password Correct!!!
3755744318   -> Password Correct!!!
8050711614   -> Password Correct!!!
539222978    -> Incorrect Password!!!
0            -> Incorrect Password!!!
```

## Notes

- Reverse statique + essais live, pas de GDB. Le comportement de `atoi` est celui de la glibc de la machine de test.
