# crackmes.de's crackme_1_by_huskyhusky (huskyhusky)

> [crackmes.one](https://crackmes.one/crackme/5ab77f5633c5d40ad448c27b) · [`ORIGIN.yml`](ORIGIN.yml)

| | |
|---|---|
| **Auteur** | huskyhusky (miroir crackmes.de) |
| **Plateforme** | Linux ELF64 (static, stripped) |
| **Type** | password + mini-VM custom |

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/crackme.gz` | archive d’origine (gzip) |
| `original/crackme` | ELF64 7152 octets |
| `analysis/crackme.asm` | `objdump -d` |
| `analysis/crackme.i64.c` | Hex-Rays (`decc`) — peu lisible (dispatch VM) |
| `tools/huskyhusky-solve.py` | password + `--check` |

## Réponse

| Password (22 chars) | **`uoiaefdcgkbhqrywsvtxpz`** |

(Beaucoup d’autres solutions : toute chaîne de longueur 22 dont la somme pondérée vaut `75238`.)

```bash
python3 tools/huskyhusky-solve.py -q
# uoiaefdcgkbhqrywsvtxpz
python3 tools/huskyhusky-solve.py --check
# Please enter a password: Correct! =)
# OK
```

## Premier regard

```text
ELF 64-bit LSB executable, x86-64, statically linked, stripped
Entry 0x4000b0
.text @ 0x4000b0 (0x430) · .data @ 0x6004e0 (handlers + bytecode)
```

Pas de libc : syscalls `read` / `write` / `exit` uniquement. Les chaînes
(`Please enter a password:`, `Wrong!`, `Correct! =)`) sont des **dwords**
dans le bytecode VM (un caractère par insn `nop` / littéral).

```bash
gunzip -k -c original/crackme.gz > original/crackme   # déjà fait
file original/crackme
bash -ic 'decc original/crackme'   # → analysis/crackme.i64.c
```

## Flow

1. Init : `PC=0`, `r14 = 0x1f0/4 = 0x7c` (fin du programme = pile VM).
2. `r9 = 34` → `call print` (affiche le prompt).
3. `call read_check` : lit le password jusqu’à `\n`, calcule un checksum.
4. Si résultat `== 0` → message **Correct! =)** sinon **Wrong!**
5. `exit(0)`.

## Mini-VM

Chaque insn est un **dword** à `0x6008e8 + 4*PC` :

| Champ | Bits | Rôle |
|---|---|---|
| imm16 | 0..15 | immédiat / offset |
| base | 16..18 | registre opérande (`0` = aucun) |
| mem | 19 / 20 | deref ×1 (`0x8`) ou ×2 (`0x10`, fall-through) |
| dst | 21..23 | registre source/dest (`r8`…`r15`) |
| opcode | 24..31 | handler via table `@0x6004e0` |

Registres VM = `r8`…`r15` (getters/setters `@0x600868` / `@0x6008a8`).
Handlers utiles : `mov`/`add`/`sub`/`mul`/`mod`, `cmp`→`esi`,
sauts conditionnels, `call`/`ret`/`push`/`pop`, I/O char (`in` mode 6 /
`out` mode 7), `exit` si opérande `== 0xb`.

## Prédicat

Dans `read_check` :

```text
acc = -15000
k   = 1
pour chaque octet c du password (jusqu’à '\\n') :
    k = next_weight(k)     # « prochain presque-premier »
    acc += c * k
ok ⇔ (acc - 60238) == 0
    ⇔ sum(c_i * w_i) == 75238
```

`next_weight` incrémente jusqu’à un entier **accepté** par un test style
trial-division **buggé** :

- `isqrt` = méthode babylonienne 20 itérations (entier) ;
- diviseurs testés seulement dans **`[2, isqrt)`** (pas `isqrt` inclus).

Conséquence : la suite n’est **pas** la suite des nombres premiers. Elle
contient les impairs sans diviseur strictement inférieur à `isqrt(n)` —
donc les vrais premiers **et** des composites (`9`, `15`, `25`, `35`,
`49`, `121`, …) :

```text
w = 3,5,7,9,11,13,15,17,19,23,25,29,31,37,41,43,47,49,53,59,61,67,…
```

(Le `2` est sauté : `isqrt(2)=1` puis `2%2==0`.)

Pour du **printable ASCII**, la longueur minimale est **22**
(`32 * sum(w[:22]) ≤ 75238 ≤ 126 * sum(w[:22])`). Le solveur fait un DP
sur `a..z` et livre une solution canonique.

## Vérification

```bash
python3 tools/huskyhusky-solve.py --check
# OK

printf '%s\n' uoiaefdcgkbhqrywsvtxpz | ./original/crackme
# Please enter a password: Correct! =)
```

## Notes

- Hex-Rays sur le dispatch (`jmp [table+rbx*8]`) est illisible ; mieux vaut
  reconstruire la VM à la main / via émulateur Python.
- L’affichage imprime aussi le `\0` final des chaînes (artefact de la boucle
  `out` + `jne`) — sans impact sur le prédicat.
- Pas de username : exemple user `petik` N/A.
