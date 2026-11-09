# acheylate's Patch It, Cli Game

| | |
|---|---|
| **ID** | [`6aeca2894ab951a9999da415`](https://crackmes.one/crackme/6aeca2894ab951a9999da415) · [`ORIGIN.yml`](ORIGIN.yml) |
| **Auteur** | acheylate |
| **Plateforme** | Linux ELF64 PIE, Rust, stripped |
| **SHA-256** | `3ad5605c536d95bfb45fb1d4a075de870a2df65fe4891d524815680b90eeb9fd` |

| Dossier | Contenu |
|---|---|
| `original/guessnumber` | binaire d'origine (non modifié) |
| `tools/guessnumber-solve.py` | solveur (gdb + FIFO) |

## Réponse

Il n'y a **pas de serial** : le jeu tire un nombre secret dans `1..1000` à chaque lancement
(RNG système, pas de seed) et laisse **3 essais** (+ un « ennemi » qui devine aussi). Impossible
de gagner à coup sûr sans lire/patcher le secret. Le solveur lit le secret dans la frame de `main`
sous gdb puis le tape sur stdin → victoire au 1er essai.

```bash
python3 tools/guessnumber-solve.py          # joue une partie, affiche la sortie
python3 tools/guessnumber-solve.py -q       # n'affiche que le secret
python3 tools/guessnumber-solve.py --check  # 5 parties, exit 0 si 5/5 gagnées
```

Alternative « patch » (à appliquer sur une copie, jamais sur `original/`) : le compteur d'essais
est un `u16` en `.data` (`0x5b2c0`) ; le rendre énorme permet une recherche dichotomique à la main.

## Premier regard

```bash
file original/guessnumber      # ELF 64-bit PIE, stripped
strings -n 5 original/guessnumber | grep -iE 'guess|attempt|random'
```

Chaînes Rust utiles (`.rodata` 0x77c0–0x7900) : `Game started, guess the number from 1 to 1000`,
`attempts left: `, `guessed is less`, `guessed number is greater`, `You guessed the random number`,
`Enemy guessed the random number`, `Ran out of attemps`, ` The number was: `,
`cannot sample empty range` (→ `rand::gen_range`).

Lancement normal : efface l'écran (`ESC[2J`), alterne « Player's turn! » (lecture d'une ligne) et
« Enemy's turn! » (l'ennemi tire dans l'intervalle restant, avec une pause de 0,5 s
`clock_nanosleep` = `0x1dcd6500` ns).

## Flow

1. Init : secret = `gen_range(1..=1000)`, essais = 3 ; bornes `lo=1`, `hi=1000` sur la pile (`mov [rsp+0x88],0x3e8`, `[rsp+0x8c]=1` en `0x12ace`).
2. Boucle (`0x12af0`) : sleep 0,5 s → tour joueur (`read` stdin, parse, comparaison, message less/greater) → tour ennemi (`gen_range(lo..=hi)`).
3. Joueur ou ennemi trouve : `You guessed…` / `Enemy guessed…` ; essais épuisés : `Ran out of attemps`.

## Comment on trouve

*Ancrage* : `objdump -d -M intel` + xrefs RIP-relatifs vers les chaînes (`grep '# 78..'`) : le message
de victoire `0x785b` est chargé en `0x14009`, `Ran out of attemps` en `0x13f03`, le décrément du
compteur d'essais `dec WORD PTR [rip+…]` en `0x13b28` (cible `0x5b2c0`, u16 global).
Le code std Rust (fmt, stdout lock) noie la logique ; le plus rentable est le dynamique.

*Dynamique* : le secret est une simple valeur `u32` vivante dans la frame de `main`. Au premier
`read(0, …)` on dump la pile :

```
0x7fffffffd410: 0   0   4   737      <- [3 essais+1 ?]  puis le secret
0x7fffffffd440: …   1000  1          <- bornes hi / lo
```

Relancé trois fois, la 4ᵉ valeur change à chaque exécution (97, 759, 291, …) = le nombre secret
(vérifié : saisi, il fait gagner). Il est à **`$rsp + 0xac`** au moment du syscall `read` sur fd 0
(`rsp` du syscall, même profondeur d'appel quelle que soit la pile → offset stable).

## Debug GDB (pas à pas)

```bash
cp original/guessnumber /tmp/g && chmod +x /tmp/g     # l'original n'est pas +x
printf '1\n' > in.txt
cat > cmds.gdb <<'EOF'
set pagination off
catch syscall read
commands 1
  silent
  if $rdi != 0
    continue
  end
end
run < in.txt > out.txt
x/4dw $rsp+0xa8
EOF
gdb -q -batch -x cmds.gdb /tmp/g
```

- `catch syscall read` + condition `$rdi == 0` : on saute les `read` du loader (ld.so lit des fichiers) et on s'arrête sur le 1er `read` stdin.
- PIE : gdb désactive l'ASLR (base `0x555555554000`) ; pas besoin des adresses absolues grâce à l'offset relatif à `rsp`.
- Piège : le programme sort en lisant EOF (`Error in input stream`) si stdin est vide ; d'où le FIFO du solveur qui ne fournit le secret qu'une fois lu.

## Solveur

`tools/guessnumber-solve.py` : copie le binaire dans un dossier temporaire (+x), génère le script gdb
ci-dessus avec `printf "SECRET=%d\n", *(int*)($rsp+0xac)` puis `detach`, lit `SECRET=` sur la sortie
de gdb, écrit le nombre dans le FIFO relié à stdin de l'inférieur, et contrôle la sortie
(`You guessed the random number`).

## Vérification

```text
$ python3 tools/guessnumber-solve.py --check
secret=356 win=True
secret=179 win=True
secret=365 win=True
secret=131 win=True
secret=369 win=True
5/5 victoires
```

Sortie d'une partie (secret = 505) :

```text
Player's turn!
Enter your guess: attempts left: 2
You guessed the random number
 Player Won!!!

 The number was: 505
```

Cas KO : saisir `50` donne `guessed is less`, `attempts left: 2`, puis `1`… (essais décrémentés à chaque tour) ; la fin `Ran out of attemps` n'a pas été observée de bout en bout (non vérifiée).

## Notes

- Ce n'est **pas** un keygen : aucun secret fixe, aucune dépendance à `petik` (pas de username).
- Le secret vient du RNG système (thread_rng) → rien à « rejouer » sans lire la mémoire ou patcher.
- L'offset `0xac` est propre à ce build (SHA-256 ci-dessus).
