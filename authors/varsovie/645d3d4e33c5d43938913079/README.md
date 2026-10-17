# Varsovie — GDB basics

| | |
|---|---|
| **ID** | [`645d3d4e33c5d43938913079`](https://crackmes.one/crackme/645d3d4e33c5d43938913079) |
| **Auteur** | Varsovie |
| **Plateforme** | Linux ELF64 PIE, C++ (`main.cpp`), non strippé |
| **SHA-256** | `a25eff06677800739d8ea319272f0dca3af740f0b21ef63be3236a0906366e6c` |

Voir [`ORIGIN.yml`](ORIGIN.yml).

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/a.out` | binaire d'origine |
| `tools/gdbbasics-solve.py` | recalcule le nombre attendu en int32 (`-q`, `--check`) |

## Réponse

**Nombre à saisir : `219283456`** (`0x0D120000`) → « There is the flag : **I_LOVE_YOU** »

```bash
echo 219283456 | ./original/a.out      # There is the flag : I_LOVE_YOU
python3 tools/gdbbasics-solve.py --check
```

## Premier regard

`strings` : `Enter a number : `, `There is the flag : I_LOVE_YOU`, `I cannot provide you a flag !`. Le flag est donc visible, mais ne s'affiche que pour la bonne valeur.
Le titre « GDB basics » suggère de lire la valeur attendue dans un débogueur.

## Flow

`main` @ `0x1155` : `x = 2` ; `for (i = 2; i <= 19; i++) x *= i;` (int 32 bits) ; `scanf("%d", &n)` ; `n == x` → flag, sinon refus.

## Comment on trouve

**Ancrage** : `objdump -d -M intel --no-show-raw-insn original/a.out | awk '/<main>:/,/ret/'`.

```asm
115d: mov DWORD PTR [rbp-4],2        ; x = 2
1164: mov DWORD PTR [rbp-8],2        ; i = 2
116b: cmp DWORD PTR [rbp-8],0x13 ; jg fin    ; tant que i <= 19
1174: imul eax,DWORD PTR [rbp-8]     ; x *= i   (32 bits)
11ad: cmp DWORD PTR [rbp-4],eax      ; x == n (n = saisie, [rbp-0xc])
```

Mathématiquement `x = 2 · 19! = 243 290 200 817 664 000`, mais **le produit déborde en 32 bits** : le résultat stocké est le résultat tronqué modulo 2³², soit `0x0D120000 = 219283456`.
Piège : calculer `2·19!` en précision infinie donne la mauvaise valeur… sauf que `scanf("%d")` tronque lui aussi l'entrée trop grande vers 32 bits, donc saisir `243290200817664000` est **aussi** accepté (vérifié) ; le comportement de `scanf` sur un dépassement est indéfini en C, ne pas s'y fier.

## Debug GDB (pas à pas)

C'est le sens du titre : on laisse le programme calculer `x` puis on le lit au moment de la comparaison.

```bash
gdb -q ./original/a.out
(gdb) break *0x5555555551ad      # cmp [rbp-4],eax  (PIE : base 0x555555554000 + offset 0x11ad)
(gdb) run                        # saisir un nombre quelconque (ou : run < /dev/null)
(gdb) x/dw $rbp-4                # 0x7fffffffdadc: 219283456
```

Observé : `x/dw $rbp-4` → `219283456`. Piège PIE : l'adresse n'est valide qu'après `run` (base `0x555555554000`) ; avant, utiliser `break main` puis `info proc mappings`.

## Vérification

```text
$ echo 219283456 | ./a.out   -> There is the flag : I_LOVE_YOU
$ echo 219283457 | ./a.out   -> I cannot provide you a flag !
$ echo 0         | ./a.out   -> I cannot provide you a flag !
```

## Notes

- Preuve statique (solveur) + GDB (lecture de `[rbp-4]` au `cmp`).
