# crackmes.de's my_little_first_crackme by mistero5050

| | |
|---|---|
| **ID** | [`5ab77f5833c5d40ad448c3ab`](https://crackmes.one/crackme/5ab77f5833c5d40ad448c3ab) ([`ORIGIN.yml`](ORIGIN.yml)) |
| **Auteur (site)** | crackmes.de (mistero5050) |
| **Plateforme** | Windows PE32 console, MinGW GCC 4.8.1 (C++) |
| **SHA-256 (zip)** | `a7a7b73b6f0b98d38b96eb1fa0ba506e17f602181f69e092ee7c39b4cdfa7d32` |

| Fichier | Rôle |
|---|---|
| `original/Crackme.zip` | archive d'origine (`ReadMe.txt` + `crackme.exe`, non modifiée) |
| `analysis/x/` | contenu extrait du zip (copie de travail) |
| `analysis/crackme.dis` | `objdump -d -M intel` |
| `tools/my-little-first-crackme-solve.py` | solveur (inverse le chiffrement) + `--check` Wine |

## Réponse

**Mot de passe : `congrats_on_resolving_this_crackme`** (34 caractères)

```bash
python3 -I tools/my-little-first-crackme-solve.py                 # affiche le mot de passe
python3 -I tools/my-little-first-crackme-solve.py -q --check analysis/x/crackme.exe   # preuve Wine
```

Pas de login : l'exemple `petik` ne s'applique pas.

## Premier regard

```
$ unzip -l original/Crackme.zip   # ReadMe.txt, crackme.exe (1,3 Mo)
$ diec crackme.exe                # PE32, MinGW GCC 4.8.1
$ strings -n 5 crackme.exe
Insert string (max 1000 char, min 4 char):
You lose
You win!
```

`ReadMe.txt` : « Do not patch – Find the password ». Le binaire est gros parce que libstdc++ est liée en statique ; le code utile est tout au début de `.text`. Les symboles C++ sont conservés (non strippé) : `encrypt(char*)`, `reverse`, `somma`, `scambia_dispari_pari`, `insert_soluzione(int*)`.

## Flow

`main` (`0x40186a`) :

1. `printf("Insert string…")`, `cin >> std::string`.
2. Rejet (« You lose ») si `len <= 3` **ou** `len` impair **ou** `len > g_max` (`g_max` = dword `0x478004`, initialisé à 1000 = `0x3e8`).
3. `g_max = len` (!) : la longueur saisie devient le paramètre de toutes les routines suivantes.
4. Copie la saisie dans un buffer, `encrypt(buf)`, `insert_soluzione(tab)`.
5. Compare `tab[i]` (int) à `(signed char)buf[i]` pour `i = 0..0x21` (34 octets) ; « You win! » si tout est égal.

## Comment on trouve

**Ancrage** : `strings -t x` donne `You win!` en `0x7d035` (VA `0x47f035`) ; `objdump -d -M intel --no-show-raw-insn crackme.exe` puis recherche de `0x47f035` → `main+0x212` (`0x401a7c`), juste après la boucle de comparaison `0x401a2a..0x401a7a` (`cmp [ebp-0x20], 0x21 ; jle`).

**La cible** – `insert_soluzione` (`0x4016ce`) est une suite de `mov dword [p+4k], imm32` ; les immediates sont des octets signés étendus (`0xffffffa5` = `-0x5b` = `0xa5`). 34 valeurs :

```
a5 8f b0 87 b4 81 b6 93 a1 8f b0 7f b4 85 b5 8f ae 96 ab 8e a9 7f b6 88 ab 93 a1 83 b4 81 a5 8b af 85
```

Le compare est `movsx eax, byte [buf+i] ; cmp edx, eax` : comparaison signée, cohérente avec ces valeurs.

**Longueur** : 34 valeurs comparées, et `g_max = len`, donc on prend `N = 34` (pair, ≥ 4, ≤ 1000 : le garde-fou passe). Une longueur supérieure laisserait des caractères libres après le 34ᵉ ; 34 est la solution « propre ».

**Le chiffrement** – `encrypt` (`0x40164f`) :

```c
for (i = 0; i < N; i++) key[i] = i % N;      // 0x401661 : idiv ecx, edx = i % N
for (r = 0; r < N; r++) {                    // N tours
    reverse(s);                  // 0x401545 : échange s[i] <-> s[N-1-i], i < N/2
    somma(s, key);               // 0x401593 : s[i] = s[i] + key[i]  (octet, mod 256)
    scambia_dispari_pari(s);     // 0x401611 : échange s[i] <-> s[i+1], i = 0,2,4,…
}
```

(`invertii` à `0x4015db`, un `not`, est défini mais jamais appelé : leurre.)

Chaque tour est une bijection (permutation + addition mod 256), donc on inverse en `N` tours dans l'ordre inverse : swap des paires, `- (i % N)` mod 256, `reverse`. Appliqué à la table cible, ça donne directement `congrats_on_resolving_this_crackme`. Le solveur vérifie aussi `encrypt(pw) == TARGET` en Python avant d'afficher.

**Pièges** : `g_max` est écrasé avec la longueur saisie, donc `key[]`, les boucles de `reverse` et de `somma` dépendent de `N` ; si on rejouait le chiffrement avec 1000 on aurait un résultat faux. Les bytes ≥ 0x80 de la cible viennent de l'extension de signe des imm32, pas d'une table 32 bits.

## Vérification

```
$ python3 -I tools/my-little-first-crackme-solve.py -q --check analysis/x/crackme.exe
congrats_on_resolving_this_crackme
Insert string (max 1000 char, min 4 char): You win!        # rc 0

$ printf 'petikpetik\n\n' | xvfb-run -a wine analysis/x/crackme.exe     # KO
Insert string (max 1000 char, min 4 char): You lose
```

## Notes

- Reverse 100 % statique + preuve Wine (`xvfb-run -a wine`) ; ni GDB, ni IDA, ni debugger live utilisés, donc pas de section « Debug GDB ».
- Le binaire n'a pas été patché (règle du ReadMe) ; `original/` est intact.
