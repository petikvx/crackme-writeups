# keygenme_2_by_nicohogtag by nicohogtag

| | |
|---|---|
| **ID** | [`5ab77f5333c5d40ad448c0d5`](https://crackmes.one/crackme/5ab77f5333c5d40ad448c0d5) |
| **Auteur (site)** | crackmes.de (auteur original : nicohogtag) |
| **Auteur (local)** | crackmes-de |
| **Plateforme** | Windows PE32 console, C++ MinGW |
| **Difficulté** | 1.5 |
| **SHA-256 (zip)** | `767e2541ce49a21ecef912c6df416a9fabb93bbc11baae31cbf68431381d011f` |

## Résultat

Keygen (règle : *NO PATCHING*, écrire un keygen). Exemple : nom **`petikpetik`** → serial **`608202596`**.

```
$ python3 tools/crackmes-de-keygenme_2_nicohogtag-solve.py petikpetik
petikpetik 608202596
```

Vérifié live sous wine : `Congrats, now write me keygen!` (et `Sorry, try again!` avec un mauvais serial).

## Comment on trouve

1. `diec` : PE32 console MinGW, pas de packer. `strings` donne `Enter your username ::`, `Enter your serial ::`, `Congrats, now write me keygen!`.
2. La chaîne `Enter your serial` est à `0x440105` ; `objdump -d` montre une seule référence, dans `_main` (`0x40144a`). Tout l’algo tient entre `0x401437` et `0x401503` (extrait dans [`analysis/main.asm.txt`](analysis/main.asm.txt)).
3. Variables locales :
   - `[ebp-0x8]` : buffer nom de **8 octets** (initialisé à zéro depuis `.rdata`), rempli par `cin >> char*` ;
   - `[ebp-0xc]` : serial lu par `cin >> int` ;
   - `[ebp-0x10]` = `s = 0`, `[ebp-0x18]` = `a = 0x80899`, `[ebp-0x1c]` = `m = 7`.
4. Boucle `i = 0..9` (`cmp [ebp-0x20],9 ; ja`) : **10 octets** lus à partir de `ebp-8`, en `movsx` (char signé) :
   ```
   s += c ; a += s
   ```
5. Puis (arithmétique 32 bits signée) :
   ```
   m = 7 * (a + s)
   m = m * (m - s + 13 * (a / 2))      ; a/2 tronqué vers 0 (sar + correction de signe)
   m = |m|
   serial == m ?
   ```
   Le `13*` vient de `eax = h ; eax += eax ; eax += h ; shl eax,2 ; eax += h`.

### Le piège : 10 octets lus dans un buffer de 8

Les indices 8 et 9 tombent sur `[ebp+0]` / `[ebp+1]`, c’est-à-dire les deux octets bas du **saved EBP** : avec un nom court, le serial dépend de l’adresse de pile (non reproductible). Avec un nom de **9 ou 10 caractères**, `cin` écrase ces octets par le nom et son `\0` terminal, et le calcul devient déterministe (le programme va jusqu’au message, puis `system("pause")`). Le keygen exige donc 9–10 caractères (`petikpetik` = 10).

## Solveur

[`tools/crackmes-de-keygenme_2_nicohogtag-solve.py`](tools/crackmes-de-keygenme_2_nicohogtag-solve.py) réimplémente la boucle avec wrap 32 bits signé.

Vérification :

```
printf 'petikpetik\n608202596\n' | xvfb-run -a wine "Keygen #2 by Nicohogtag.exe"
→ Congrats, now write me keygen!
```

## Contenu

```
original/   # zip d'origine (non modifié)
analysis/   # désassemblage de _main
tools/      # keygen
```

## Status

- [x] reverse
- [x] write-up
- [x] solveur
