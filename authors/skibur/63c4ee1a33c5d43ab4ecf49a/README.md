# skibur — Just In Time

| | |
|---|---|
| **ID** | [`63c4ee1a33c5d43ab4ecf49a`](https://crackmes.one/crackme/63c4ee1a33c5d43ab4ecf49a) |
| **Auteur** | skibur |
| **Plateforme** | Linux ELF64 PIE, C, **strippé** |
| **SHA-256** | `7598383b9e8388c91766f80aeb58fdeb8df58969a319f2bd8aac3ce608fdb414` |

Voir [`ORIGIN.yml`](ORIGIN.yml).

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/ski000` | binaire d'origine |
| `tools/justintime-solve.py` | fournit le mot de passe, réessaie jusqu'à la bonne fenêtre temporelle (`-q`, `--check`) |

## Réponse

**Mot de passe : `%djk(9^{.f@1F4X`** (15 caractères), accepté **seulement si la seconde courante se termine par 1, 4 ou 7** — et à envoyer **sans retour à la ligne final**.

```bash
printf '%s' '%djk(9^{.f@1F4X' | ./original/ski000      # Correct password.  Congratulation!
python3 tools/justintime-solve.py --check               # réessaie jusqu'à tomber sur la bonne seconde
```

## Premier regard

Binaire strippé (`nm` : no symbols). `strings` : `Enter password: `, `localtime`, `time`, mais aucun message de succès/échec lisible (ils sont construits par décodage d'octets, comme le mot de passe). Le titre et l'import `localtime` orientent vers une dépendance au temps réel.

## Flow

`main` (@ `0x1422`, retrouvé via le `lea rdi,[rip+…]` de `_start`) : `time()` + `localtime()` **une seule fois**, lecture du mot de passe (`fgets`, 0x18 octets max, qui **exit(1) immédiatement** si EOF avant tout caractère), puis deux contrôles successifs :
1. `check_time` @ `0x11ba` : compare 14 des 15 octets (indices 0 à 13 ; l'indice 14 est libre) à des constantes, certaines décalées par `n` ;
2. `check_len` @ `0x1189` : `strlen(pw) == 15`.

Si les deux renvoient 0 : message de succès ; sinon, message d'échec.

## Comment on trouve

**Ancrage** : binaire strippé → `main` retrouvé depuis `_start` (`lea rdi,[rip+0x367] # 0x1422`), puis `objdump -d -M intel original/ski000 --start-address=0x11ba --stop-address=0x1389` (raw bytes conservés pour éviter toute erreur de transcription).

```asm
11c9: mov rax,[rip+0x2ea0]  # 0x4070        ; struct tm* rempli par localtime()
11d0: mov ecx,[rax]                          ; tm_sec
...                                           ; deux divisions par constantes magiques
120e: mov [rbp-0x8],eax     ; (tm_sec % 10)
121c: mov [rbp-0x8],edx     ; n = (tm_sec % 10) % 3      <- n ∈ {0, 1, 2} seulement
```

Puis 14 comparaisons sur `pw[0..13]` : 8 directes (`cmp al,imm8`) et 6 décalées par `n` (`movsx edx,al ; shl edx,n ; cmp edx,cible`), avec cibles `0xc8, 0xd4, 0x50, 0xf6, 0x80, 0x68` (octets 1, 2, 4, 7, 10, 13).

Pour qu'un octet positif (`movsx` ne doit pas basculer en négatif) satisfasse `octet << n == cible`, il faut `octet = cible / 2ⁿ`, avec `cible` divisible par `2ⁿ` et le quotient `< 128`. En testant `n = 0, 1, 2` sur les 6 cibles : seul **`n = 1`** donne six quotients tous `< 128` (`100, 106, 40, 123, 64, 52`) ; `n=0` échoue (`0xc8=200 ≥ 128`, et `movsx` le rendrait négatif), `n=2` échoue (`0xf6/4` non entier). Donc la réponse n'existe que pour `n=1`, atteint quand `(tm_sec % 10) % 3 == 1`, c'est-à-dire quand le chiffre des unités des secondes vaut **1, 4 ou 7**.

Assemblage (indices 0 à 14, le 15ᵉ étant libre) : `% d j k ( 9 ^ { . f @ 1 F 4` + un caractère quelconque → **`%djk(9^{.f@1F4X`**.

## Debug GDB (pas à pas)

GDB a été indispensable, pas seulement pour confirmer mais pour **déboguer ma propre résolution** : un premier essai échouait systématiquement même pendant la bonne seconde, jusqu'à ce que l'instrumentation GDB révèle la cause.

```bash
gdb -q ./original/ski000
(gdb) break *0x55555555521c      # juste après le calcul de n (PIE, base 0x555555554000)
(gdb) run                        # (fournir le mot de passe sur stdin au préalable)
(gdb) p                      # n observé directement, ex.  = 1
(gdb) break *0x55555555537e      # chemin succès de check_time (eax <- 0)
(gdb) break *0x555555555385      # chemin échec
(gdb) continue
```

En répétant ces 25 lancers (script `for`), **chaque `edx==1` correspondait bien au chemin succès** de `check_time` — mais le programme final affichait quand même « Incorrect password. » ! En poursuivant l'exécution (second `continue`) jusqu'à la fin, le message restait faux à chaque fois, y compris pour `edx==1`. La cause : mon entrée shell (`<<<`, qui ajoute un `\n`) faisait `strlen(pw) == 16`, donc le **second** contrôle (`check_len`, `strlen==15`) échouait systématiquement, masquant la réussite du premier. Rejouer avec `printf '%s'` (sans `\n`) a immédiatement confirmé le succès.

## Vérification

```text
$ printf '%s' '%djk(9^{.f@1F4X' | ./ski000     # pendant une seconde finissant par 1/4/7
Enter password: Correct password.  Congratulation!
$ printf '%s\n' '%djk(9^{.f@1F4X' | ./ski000    # AVEC retour à la ligne -> toujours refusé
Enter password: Incorrect password.
```

## Notes

- Le mot de passe fonctionne environ 30 % du temps réel (3 secondes sur 10) ; le solveur boucle jusqu'à la bonne fenêtre.
- Reverse statique (adresses calculées, pas de symboles) + débogage GDB intensif pour localiser un piège de mon propre fait (le `\n`), pas seulement celui de l'auteur.
