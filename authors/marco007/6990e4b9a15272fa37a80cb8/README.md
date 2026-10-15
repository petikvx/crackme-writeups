# marco007 — time based riddle

| | |
|---|---|
| **ID** | [`6990e4b9a15272fa37a80cb8`](https://crackmes.one/crackme/6990e4b9a15272fa37a80cb8) ([`ORIGIN.yml`](ORIGIN.yml)) |
| **Auteur** | marco007 |
| **Plateforme** | Linux ELF64 PIE, **non strippé**, C++ (libstdc++), console |
| **Difficulté** | 2.0 |
| **SHA-256** | `3ac0c828158f65c6bc3f5402128e48da65a99c9a826836f930947240558b477b` |

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/crackme_ctf` | binaire (nom interne) |
| `tools/time-riddle-solve.py` | lance le binaire avec les 4 bonnes réponses |

## Réponse

Répondre aux 4 énigmes, **dans l'ordre**, en moins de 10 secondes au total :

```bash
printf 'keyboard\nmap\nfootsteps\nm\n' | ./original/crackme_ctf
```

| Énigme | Réponse |
|---|---|
| *What has keys but can't open locks?* | `keyboard` |
| *I have cities but no houses…* | `map` |
| *The more you take, the more you leave behind…* | `footsteps` |
| *What comes once in a minute, twice in a moment, but never in a thousand years?* | `m` |

```
FLAG{TIME_TRAVELER}
```

## Premier regard

```bash
file original/crackme_ctf     # ELF64 PIE, C++, NON strippé
nm -C original/crackme_ctf | grep decrypt
#   decrypt_flag(int)
strings -n 6 original/crackme_ctf
#   icwzmypb   bkkpopalo    (fragments chiffrés — pas de "jxm"/"h", trop courts pour strings -n6)
#   What has keys but can't open locks? / … / Incorrect!
```

Binaire **non strippé** : les noms C++ démanglés (`decrypt_flag(int)`) orientent directement vers la fonction clé.

## Flow

```
<énigme 1>: <réponse>
<énigme 2>: <réponse>
<énigme 3>: <réponse>
<énigme 4>: <réponse>

FLAG{...}        (ou "Incorrect!" si trop lent)
```

## Comment on trouve

**Ancrage.** `main` (`0x11f0`) décompile (bruyamment, beaucoup de code SIMD vectorisé par le compilateur) mais se lit. Deux vecteurs globaux C++ construits par l'initialiseur statique `_GLOBAL__sub_I__Z7riddles…` : `riddles` (les 4 questions, texte en clair) et `riddles_a` (les 4 « réponses officielles », **chiffrées par décalage de César**). Repérés en lisant la mémoire `.rodata` juste avant `_DYNAMIC` via le MCP `ida` (`ida_bytes.get_bytes` sur la zone `0x4d60`‑`0x4da0`) plutôt que de faire confiance aux noms de symboles donnés par Hex-Rays à l'intérieur du constructeur (bornes erronées pour `riddles`, correctes par coïncidence pour `riddles_a`).

**Le piège : un décryptage qui ne sert à rien.** Pour chaque énigme `i`, le code **déchiffre bien** `riddles_a[i]` avec un décalage de César `shift = 24 - i` :

```c
for (c : riddle_a[i])
    if (isalpha(c)) {
        base = isupper(c) ? 'A' : 'a';
        c = base + ((c - base - shift) mod 26);
    }
```

…mais le résultat est stocké dans un buffer local **jamais comparé** à la réponse saisie par l'utilisateur (`src`) : il est juste libéré (`operator delete`) et la boucle continue. **Aucune vérification individuelle des réponses n'existe dans le programme** — c'est un leurre statique qui, à la lecture rapide, donne l'impression d'un `if (answer == decrypt(riddles_a[i]))`.

**Le vrai gate, après la boucle :**
1. **Chrono** : `elapsed = steady_clock::now() - start` ; si `elapsed > 0x2540BE3FF ns` (**10 secondes**) → `"Incorrect!"`, sans même toucher au flag.
2. **Checksum** : toutes les réponses saisies sont concaténées (`src`) et `v44 = somme des octets ASCII` de cette concaténation (calculée via une réduction SIMD `pmovsxbw`/`paddd` — juste une somme vectorisée, rien de cryptographique).
3. `decrypt_flag(v44)` XOR un blob chiffré fixe de 19 octets (`xmmword_31D0` + 4 octets de constante) avec un flux dépendant de `v44` et de la position, puis affiche le résultat.

**Décodage des réponses « officielles ».** Même si le programme ne les vérifie jamais, ce sont elles qui donnent le **bon** checksum (donc le vrai flag) — à retrouver en appliquant le César inverse aux 4 fragments chiffrés :

| i | `riddles_a[i]` | shift `24-i` | Décodé |
|---|---|---|---|
| 0 | `icwzmypb` | 24 | `keyboard` |
| 1 | `jxm` | 23 | `map` |
| 2 | `bkkpopalo` | 22 | `footsteps` |
| 3 | `h` | 21 | `m` |

Les 4 décodages correspondent exactement au sens des 4 énigmes (clavier, carte, empreintes de pas, la lettre « M » — unique lettre apparaissant 2× dans *minute*, 1× dans *moment*, 0× dans *thousand years*) : confirmation sémantique forte avant même de tester.

**Pièges.**
- Ne pas s'arrêter au déchiffrement César trouvé « en dur » dans le binaire en pensant avoir trouvé LE check — il est mort, seul le **checksum global + la limite de temps** comptent réellement.
- Répondre correctement mais **trop lentement** (>10 s, ou en tapant manuellement avec hésitation) donne aussi « Incorrect! » — passer les réponses via `printf … | ./crackme_ctf` (pipe), pas en saisie interactive, pour rester largement dans les temps.
- N'importe quelle autre réponse (bonne longueur ou pas) fait quand même sortir **un flag**, mais illisible (checksum faux → XOR faux) — voir § Vérification, cas KO.

## Vérification

```bash
printf 'keyboard\nmap\nfootsteps\nm\n' | ./original/crackme_ctf
# ... FLAG{TIME_TRAVELER}

printf 'wrong\nwrong\nwrong\nwrong\n' | ./original/crackme_ctf
# ... $ngv}rcN                      (checksum faux -> charabia, pas de message d'erreur explicite)

printf 'keyboard\nmap\nfootsteps\nn\n' | ./original/crackme_ctf
# ... AMBFtUJLB^WS^WFMBS~            (une seule réponse fausse -> flag totalement différent)
```

## Notes

- Pas de GDB utilisé : reverse 100 % statique (MCP `ida`, binaire non strippé) + vérification par exécution directe (pipe, pour respecter la limite de 10 s).
- Le vecteur `riddles_a` est un véritable **honeypot de lecture** : il *ressemble* à la logique de vérification, mais ne l'est pas — seul le calcul de checksum post-boucle compte.
