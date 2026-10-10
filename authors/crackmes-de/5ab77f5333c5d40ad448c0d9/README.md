# skcrackme_1 by sknine9

| | |
|---|---|
| **ID** | [`5ab77f5333c5d40ad448c0d9`](https://crackmes.one/crackme/5ab77f5333c5d40ad448c0d9) |
| **Auteur (site)** | crackmes.de (auteur original : sknine9) |
| **Auteur (local)** | crackmes-de |
| **Plateforme** | Java Swing (JAR, multiplateforme) |
| **Difficulté** | 1.0 |

## Résultat

`readme.txt` : *« It's very easy, make a keygen :) »*. Exemple : nom **`petik`** →

```
232 61 158 220 87 92 183 65 140 155 77 47 42 68 236 251
```

```
$ python3 tools/crackmes-de-skcrackme_1-solve.py petik
petik -> 232 61 158 220 87 92 183 65 140 155 77 47 42 68 236 251
```

Vérifié live (JAR original, sous `xvfb-run`, via [`tools/Verify.java`](tools/Verify.java) qui remplit les champs et clique *Check*) : dialogue **`Congratulations / Valid key`** ; un serial faux (`1 2 3 4 5 6 7 8`) donne `:P / Invalid Key, try again`.

## Comment on trouve

1. Le ZIP contient `SKCrackMe.jar` (3 classes `eu.sknine.skcrackme1.*`, noms obfusqués légèrement). `javap -c -p` suffit (voir [`analysis/javap-KClass-XClass.txt`](analysis/javap-KClass-XClass.txt)).
2. `UClass` = la fenêtre : `e()` est le champ **Name**, `d()` le champ **Serial**, `a()` le bouton **Check**.
3. `KClass.actionPerformed` met `var = 1337` puis appelle `a()` :
   - nom > 15 caractères → `Invalid Name` ;
   - le serial est découpé par `split(" ")` (la constante #115 est un espace, `javap` l'affiche vide), chaque morceau `Integer.parseInt`, puis
     `b[i] = (byte)((byte)x - var*32/(16*16))` = `x - 167` ;
   - `b` est **déchiffré** en DES (ECB/PKCS5 par défaut) avec la clé `"13248657"`,
   - le résultat passe dans `XClass.xmpio()` : un second **déchiffrement DES** avec la clé `"13377331"`,
   - les octets obtenus, convertis en `char`, doivent être égaux (`equals`) au nom → `Valid key`.
   Toute exception (padding faux, parse) tombe sur `Invalid Key`.
4. Keygen = chemin inverse : `c = DES_enc("13248657", DES_enc("13377331", nom))`, puis pour chaque octet signé Java `x = b + 167`, joints par des espaces (seul `(byte)x` compte, donc toute valeur ≡ mod 256 marche aussi).

## Solveur

[`tools/crackmes-de-skcrackme_1-solve.py`](tools/crackmes-de-skcrackme_1-solve.py) (pycryptodome), et le harness de vérification :

```
javac -cp SKCrackMe.jar Verify.java
xvfb-run -a java -cp SKCrackMe.jar:. Verify petik "232 61 158 220 87 92 183 65 140 155 77 47 42 68 236 251"
→ DIALOG: Congratulations / Valid key
```

## Status

- [x] reverse
- [x] write-up
- [x] solveur
