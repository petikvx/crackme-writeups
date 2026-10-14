# arm_crack1 — blankwall (crackmes.de)

- Page : https://crackmes.one/crackme/5ab77f5a33c5d40ad448c52b · [`ORIGIN.yml`](ORIGIN.yml)
- Plateforme : Linux **ARM** EABI5, **Thumb-2**, dynamique (`ld-linux.so.3`), strippé ; anti-debug `ptrace` + `alarm(50)`
- Archive : `original/Arm_crackme.zip` → `Arm_crackme/arm_crack1` + `README` (« Get the flag without patching… »)
- Usage : lit une ligne sur stdin

## Réponse

```
this_is_flag
```

```bash
python3 -I tools/arm-crack1-solve.py --check
# check: OK (clé→WAY TO GO SOLVED IT!; littéral→['yes FAIL'] ; 'petik1234567'→[…])
```

Le message de succès est `WAY TO GO SOLVED IT!` ; saisir le littéral présent dans le binaire (`` `TU_KU_KRXMS ``) déclenche le leurre `YOU Sol... OOOPS YOU DIDNT` + `system("yes FAIL")`.

## Premier regard

```text
$ file arm_crack1
ELF 32-bit LSB executable, ARM, EABI5 version 1 (SYSV), dynamically linked, interpreter /lib/ld-linux.so.3, stripped
$ strings -n 4 arm_crack1 | grep -E "WELCOME|WAY|FAIL|DEBUG|STALE"
WELCOME TO ARM CRACK ME LEVEL 1 or MAYBE IT WAS 2????? …   WAY TO GO SOLVED IT!   yes FAIL   DEBUGGING... Bye   STALE CONNECTION
```

Pas de `qemu-user` sur la machine : désassemblage `capstone`/IDA (Thumb-2) et émulation de `main` avec `unicorn`.

## Comment on trouve

**Ancrage** : `bash -ic 'decc arm_crack1'` → `analysis/Arm_crackme/arm_crack1.i64.c` (307 lignes) ; `main` @`0x88d4` (mode **Thumb**, adresse impaire `0x88d5`).

```c
d = malloc(12); memcpy(d, "`TU_KU_KRXMS", 12);          // littéral de 12 octets
fgets(s, 13, stdin); if (strlen(s) != 12) exit(1);
if (cmp(d, s) == 1) { printf("YOU Sol... OOOPS"); system("yes FAIL"); }   // LEURRE : le littéral brut
for (i = 0; i < 12; i++) d[i] = f(d[i]);                // sub_877C : if (a>10) return a+20  =>  d[i] += 20
memcpy(v7, s, 12);
v3 = sub_8874(v8, v7, "`TU_KU_KRXMS", d);               // = cmp(littéral, d) - …
if (v3 == 1) puts("WAY TO GO SOLVED IT!");
```

`cmp` (`sub_86A8`) renvoie `1` si égal sur 12 octets, `9` si différent.
`sub_8874(a1, a2, a3, a4)` : `memcpy(a1, a4, 12)` (donc `a1 = d`) ; `v10 = cmp(a1, a2=s)` ; `v8 = cmp(a3, a4) = cmp(littéral, d) = 9` ; `while (v10 <= 7) v10 += cmp(a1, a2)` ; retourne `v8 - v10`.

- Si `s == d` (donc `littéral + 20`) : `cmp = 1` → `v10` monte de 1 à 8 → retourne `9 - 8 = 1` ✓.
- Sinon `cmp = 9` → pas de boucle → `9 - 9 = 0`.

Le mot de passe est donc le littéral dont chaque octet a +20 : `` ` T U _ K U _ K R X M S `` → `t h i s _ i s _ f l a g` :

| octet | +20 | | octet | +20 |
|---|---|---|---|---|
| `` ` `` 0x60 | `t` 0x74 | | `K` 0x4b | `_` 0x5f |
| `T` 0x54 | `h` 0x68 | | `R` 0x52 | `f` 0x66 |
| `U` 0x55 | `i` 0x69 | | `X` 0x58 | `l` 0x6c |
| `_` 0x5f | `s` 0x73 | | `M` 0x4d | `a` 0x61 |
| | | | `S` 0x53 | `g` 0x67 |

**Pièges :**
- Le **leurre** : saisir directement `` `TU_KU_KRXMS `` est « presque » juste mais lance `yes FAIL` (boucle infinie) ; la vraie clé est décalée de +20.
- Anti-debug : `ptrace(PTRACE_TRACEME)` < 0 ⇒ « DEBUGGING... Bye » ; `alarm(0x32)` + `SIGALRM` ⇒ « STALE CONNECTION » après 50 s.
- `fgets(s, 13)` : 12 caractères exactement (le `\n` ne tient pas).
- Binaire **Thumb-2** : un désassemblage en mode ARM ne donne que du bruit ; PLT en ARM (`blx` fait basculer).

## Vérification

```text
$ python3 -I tools/arm-crack1-solve.py --check          # analysis/verify.txt
check: OK (clé→WAY TO GO SOLVED IT!; littéral→['yes FAIL'] ; 'petik1234567'→[…])
```

Émulation unicorn (Thumb-2) de `main` avec la PLT hookée (`malloc`, `memcpy`, `fgets`, `puts`, `printf`, `ptrace`, `system`, `exit`…) : la clé → `WAY TO GO SOLVED IT!`, le littéral brut → `system("yes FAIL")`, une autre saisie → rien.

## Fichiers

- `analysis/Arm_crackme/` : `arm_crack1`, `README`, `arm_crack1.i64.c` (Hex-Rays) ; `analysis/verify.txt`
- `tools/arm-crack1-solve.py` : calcule la clé + `--check` (unicorn ARM Thumb-2)
