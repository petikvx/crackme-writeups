# idanhajbeko's The Rabbit Hole

| | |
|---|---|
| **ID** | [`6a91838fcab6678aefe9db6c`](https://crackmes.one/crackme/6a91838fcab6678aefe9db6c) ([`ORIGIN.yml`](ORIGIN.yml)) |
| **Auteur** | idanhajbeko |
| **Plateforme** | Windows PE64 console (MinGW, non strippé) |
| **SHA-256** | `f5581e5d2f1697a48d41cf17aeaccb2f25fc95a6503674f978ecf962c63a668a` |

| Fichier | Rôle |
|---|---|
| `original/main.exe` | binaire d'origine (non modifié) |
| `tools/rabbit-hole-solve.py` | solveur / générateur de séquence / `--check` via Wine |

## Réponse

Il faut saisir, ligne par ligne (le nom d'abord) :

| Étape | Entrée |
|---|---|
| Nom | somme des octets = **510** — `petik` fait 541, donc impossible : exemple le plus proche **`petiL`** |
| 1-3 | `go right` ×3 |
| 4-5 | `go forward` ×2 |
| 6 | `look around` |
| 7 | `follow the rabbit` |
| 8 | `the red pill` |

```bash
python3 -I tools/rabbit-hole-solve.py            # affiche tout
python3 -I tools/rabbit-hole-solve.py -q         # une entrée par ligne (stdin du jeu)
python3 -I tools/rabbit-hole-solve.py --check    # rejoue contre original/main.exe (xvfb-run wine)
```

## Premier regard

`file` : PE32+ console x86-64, MinGW (symboles présents : `rabbit`, `terminal`, `encode`, `translate`, `identity`, `observe`, `mirror`…). Le jeu est un faux shell `whoami@unknown:/isThisHome$` avec un lapin. `strings` ne montre que le texte du jeu ; les commandes et les mots de passe sont **obfusqués** dans `.rdata` (`;!"0E4?/<+3`, `0!N7-6%6`, `YHEEHPGMAXGKTUUBM`, …).

## Flow

1. `main` (0x140001fa3) → `takeName` (nom, `fgets` 50) → `terminal` → `rabbit`.
2. `terminal` (0x140001b30) : boucle de commandes. Chaque ligne est passée à `encode` puis comparée (`strcmp`) à 5 constantes : `observe`, `shift0..3` (x±1, y±1).
3. `observe` (0x14000186e) calcule `w = mirror(x + iy)` et teste 5 cibles ; la 5ᵉ met `state = 1` (« Wow a rabbit! »).
4. Si `state == 1`, la ligne suivante est passée à `translate` et comparée à `hashedCommand` → `rabbitSpiral` (« Following the rabbit… »).
5. `rabbit` (0x140001ecc) : `identity(name) == hashedName` sinon `fail(1)` ; puis une dernière phrase : `encode(translate(ligne)) == ";.6#.*;&'&3*%"` sinon `fail(2)` (« Cant give that to you »). Succès → `endingAnimation`.

## Comment on trouve

Outils : `objdump -d -M intel` (l'`decc`/IDA n'était pas disponible dans cet environnement) ; pas de GDB, pas de debugger live.

- **Nom** — `identity` (0x140001580) n'est qu'une somme des octets ; `hashedName` (`.data` 0x140006028) = `0x1fe` = **510**. Sans ça `terminal` affiche `whoami` et `rabbit` fait `fail(1)`. `petik` = 112+101+116+105+107 = 541 ≠ 510 ; `petiL` = 434+76 = 510.
- **`encode`** (0x140001472) : clé `"Wonderland"` (immédiats `0x616c7265646e6f57` + `0x646e61`, LE). `b = key[i%10] ^ c` ; si `(int8)b <= 0x2f` ou `b == 0x7f` : `b = b % 33 + 0x21` (division magique `imul 0x7d`, `shl 5; add` = ×33). Non injectif, d'où une recherche par force brute par caractère (`invert_encode`) : sur `[a-z ]` la préimage est unique et lisible.
- **Commandes** (pointeurs `.data` 0x140006000-0x140006020) : `;!"0E4?/<+3` → `look around`, `0!N7-6%6` → `go right`, `0!N)!59` → `go left`, `0!N#+!<!=!` → `go forward`, `0!N'%2(7073=` → `go backwards`. Mapping dans `terminal` : `shift0`=x+1, `shift1`=x−1, `shift2`=y+1, `shift3`=y−1.
- **`observe` / `mirror`** : `z = (x, y)` ; `mirror` renvoie `100·z / (z+1)` (`__divdc3`, constantes 100.0 et 1.0 en `.rdata`, cas spécial `z == -1`). Cibles `.rdata` 0x140007100-0x140007148 ; la dernière vaut `80 + 10i` (« Wow a rabbit! »). On résout `z = w/(100−w) = (80+10i)/(20−10i) = 3 + 2i` → **x=3, y=2** : `go right`×3, `go forward`×2, puis `look around`. Un déplacement remet `state` à 0, donc `look around` doit être juste avant la phrase suivante.
- **`translate`** (0x1400017a1) : `c % 26 + 'A'` (division magique `imul 0x4f`, `×0x1a`). `hashedCommand` = `YHEEHPGMAXGKTUUBM` ; l'espace (32%26=6) donne `G`, les minuscules `follow`, `the`, `rabbit` donnent les autres lettres → `follow the rabbit`.
- **Phrase finale** : `rabbit` n'enlève **pas** le `\n` de `fgets`, donc `translate('\n')` = `K` et la cible de 13 octets contient ce `K` final. Les 12 premiers octets, décodés (XOR « Wonderland ») donnent `MAXGKXWGIBEE`, soit `translate("the red pill")` (`the`, espace→`G`, `red`, espace, `pill`).

## Vérification

```text
$ python3 -I tools/rabbit-hole-solve.py --check
...  CHECK: OK       # « Wow a rabbit! », « Following the rabbit... », « what do you want? », animation finale, pas de « Cant give »
```

Cas KO réels contre `original/main.exe` (Wine) :

- nom `petik` (somme 541) : le jeu reste sur `whoami`, puis « rabbit>> Who are you? » (`fail(1)`) ;
- dernière phrase `the blue pill` : « Cant give that to you » (`fail(2)`).

## Notes

- Le nom `petik` est refusé par le binaire (somme ≠ 510) ; c'est la seule exception à l'utilisateur d'exemple.
- Plusieurs entrées peuvent produire la même sortie de `encode`/`translate` (modulo) ; le solveur choisit les préimages minuscules/espace.
- Écrans de victoire : séquences ANSI (le `--check` filtre les codes d'échappement).
