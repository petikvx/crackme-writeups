# destructeur — Sh4ll10

| | |
|---|---|
| **ID** | [`5ccf3bf333c5d4419da559bd`](https://crackmes.one/crackme/5ccf3bf333c5d4419da559bd) |
| **Auteur** | destructeur |
| **Plateforme** | Linux ELF64, C++, **non-PIE** (adresses fixes), non strippé |
| **SHA-256** | `8e6e1d9b2492c68c8a62d2df790838aa83f7496aeabda230e12dc4845cb9cf8c` |

Voir [`ORIGIN.yml`](ORIGIN.yml).

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/Sh4ll10.bin` | binaire d'origine |
| `tools/sh4ll10-solve.py` | valeur à saisir (`-q`, `--check`) |

## Réponse

**Saisir `0x400665`** (pas un mot de passe texte : une valeur lue par `scanf("%p", …)`).

```bash
echo 0x400665 | ./original/Sh4ll10.bin
python3 tools/sh4ll10-solve.py --check
```

## Premier regard

```bash
file original/Sh4ll10.bin    # ELF64, non-PIE, not stripped
strings -n 5 original/Sh4ll10.bin
```

Chaînes : `Give me your password: `, `Good boy`, `Bad boy`, et une chaîne leurre `er2rg2e1h94flagergjerj` (contient « flag » noyé dans du bruit — jamais utilisée). Symboles `goodBoy()`, `badBoy()`.

## Flow

`main` construit dynamiquement le format `"%p"` sur la pile (`'%'` + (`'s'` XOR `3`) = `'p'`), lit la saisie avec `scanf("%p", …)` dans un buffer 8 octets, calcule `addr = valeur_saisie - 115` (`'s' = 0x73 = 115`), puis exécute **`call rax`** sur cette adresse calculée. `goodBoy()` et `badBoy()` appellent `exit()` et ne reviennent jamais — tout le code après le `call` (un `strcmp` mort) n'est **jamais atteint** dans aucun chemin réel.

## Comment on trouve

**Ancrage** : `objdump -d -M intel --no-show-raw-insn original/Sh4ll10.bin | awk '/<main>:/,/^$/'`.

```asm
400649: movzx eax,[rbp-0x9]  ; 's' = 0x73
40064d: xor eax,0x3          ; 's'^3 = 'p'  -> construit "%p" dynamiquement
40066a: call scanf("%p", &buf)         ; buf = valeur hexadecimale saisie
400673: movsx rdx,[rbp-0x9] ; neg rdx  ; rdx = -0x73 (= -115)
40067b: add rax,rdx                     ; rax = buf - 115
400686: call rax                        ; SAUTE directement a cette adresse !
```

Puisque le binaire est **non-PIE** (adresses absolues fixes), `goodBoy()` est à une adresse connue à l'avance (`0x4005f2`, lisible directement dans le désassemblage). Il suffit de fournir une valeur telle que `valeur - 115 == adresse(goodBoy)` :

```python
GOOD_BOY = 0x4005F2
ANSWER = GOOD_BOY + 0x73   # 0x73 = 115 = 's'
# -> 0x400665
```

`call rax` exécute alors littéralement `call goodBoy`, qui affiche `Good boy` puis `exit(0)` — sans jamais repasser par le `strcmp` mort qui suit dans `main`.

## Vérification

```bash
$ echo 0x400665 | ./original/Sh4ll10.bin
Give me your password: Good boy

$ echo 0x1234 | ./original/Sh4ll10.bin
Give me your password: Segmentation fault (core dumped)
```

(N'importe quelle autre valeur saute dans de la mémoire arbitraire → le plus souvent un segfault immédiat, rarement un hasard vers `badBoy`.)

## Notes

- Pas de GDB nécessaire : toutes les adresses sont statiques (binaire non-PIE), directement lisibles dans `objdump`.
- Le `strcmp` visible après le `call rax` est un **leurre total** : code mort, jamais exécuté dans aucun scénario, puisque les deux chemins (`goodBoy`/`badBoy`) terminent le programme avant d'y revenir.
- La chaîne `er2rg2e1h94flagergjerj` (contenant « flag ») est également un leurre : jamais référencée par le code.
