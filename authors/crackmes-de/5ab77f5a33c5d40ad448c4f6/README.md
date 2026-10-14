# infector_unpackme — macabre (crackmes.de)

- Page : https://crackmes.one/crackme/5ab77f5a33c5d40ad448c4f6 · [`ORIGIN.yml`](ORIGIN.yml)
- Plateforme : Linux ELF32 i386 **KDE 3 / Qt 3** (GUI, `libkdeui.so.4`, `libqt-mt.so.3`), strippé, 78 Ko
- Archive : `original/inf-unpackme.tgz` → `inf-unpackme/unpackme` + `Readme.txt`
- Objectif de l'auteur : « Create an Unpacker » ; sub-goal 1 : mot de passe de l'hôte ; **sub-goal 2 : mot de passe de l'« Infector »** (LED rouge → verte), sans patch

## Réponse

**Mot de passe Infector : `breed`** (5 caractères).

```bash
python3 -I tools/infector-solve.py --check
# check: OK (Π('breed') = -1488344688, 180 solutions)
python3 -I tools/infector-solve.py --all | head   # les 180 chaînes imprimables possibles (breed est la seule qui soit un mot)
```

Le mot de passe de l'**hôte** n'a pas de valeur fixe : il est choisi à l'infection (« No host password » / « There is no attached host » si rien n'est embarqué), ce binaire ne contient pas d'hôte. La routine de chiffrement est décrite plus bas (`unxor()` dans le solveur).

> Limite : les bibliothèques KDE3/Qt3 sont absentes de cette machine, le binaire ne se lance pas ; la preuve est **statique** (pseudo-C Hex-Rays + vérification du calcul), pas une exécution de la GUI.

## Premier regard

```text
$ ./analysis/inf-unpackme/unpackme
error while loading shared libraries: libkdeui.so.4: cannot open shared object file
$ strings -n 5 analysis/inf-unpackme/unpackme | grep -iE "green|red|yellow|infect|host"
green  red  yellow  No Host Password  Infect file  Could open target for reading …
```

## Comment on trouve

**Ancrage** : `bash -ic 'decc unpackme'` → `unpackme.i64.c` (3647 lignes) ; les chaînes `"red"` / `"green"` situent la routine d'activation, `sub_0804DAC0` :

```c
// sub_0804DAC0 — appelée quand on valide le champ « mot de passe infector »
QString pw = *(entry+152);
if (len(pw) != 5) { LED = "red"; menu désactivé; return; }
int p = 1;
for (i = 0; i < len(pw); i++) p *= (signed char) pw[i];   // int32, avec dépassement
if (p == -1488344688) { LED = "green"; menu « Infect » activé; }
else                  { LED = "red";  menu désactivé; }
```

Le test porte uniquement sur le **produit** des 5 octets (modulo 2³², signé) : de nombreux mots de passe conviennent.

**Recherche** : `-1488344688 mod 2³² = 2806622608 = 0xa749a990` (valuation 2-adique 4). Pour chaque triplet de caractères imprimables, le produit des deux derniers est déterminé (inverse modulo `2^(32-v)`), on regarde s'il existe parmi les 9025 produits de paires → **180 solutions** (`--all`) ; la seule qui soit un mot de dictionnaire est `breed` (`98·114·101·101·100 = 11 396 557 200 ≡ 2806622608 mod 2³²`). Les 60 anagrammes alphanumériques (`bdeer`, `beder`, …) conviennent aussi.

**Chiffrement de l'hôte** (`sub_0804DC40`, pour l'unpacker) : pour chaque octet `b` de l'hôte, avec la clé `K` (le mot de passe hôte) et l'indice `k` :

```
si b == 0 ou b == K[k] : sortie = b          (indice inchangé)
sinon                  : sortie = b ^ K[k] ; k = (k+1) mod len(K)
```

et la vérification du mot de passe hôte compare les 4 derniers octets déchiffrés à un marqueur (`a1+0x44`), sinon « Invalid Host Password! ».

**Pièges :**
- Le produit utilise des `char` **signés** et un `int` 32 bits : les caractères ≥ 0x80 contribueraient négativement (non utilisés ici).
- `len == 5` est testé avant (sinon rouge sans calcul).
- Le crackme interdit de patcher pour le sub-goal 2 : la solution ci-dessus n'en a pas besoin.

## Vérification

```text
$ python3 -I tools/infector-solve.py --check
check: OK (Π('breed') = -1488344688, 180 solutions)
```

## Fichiers

- `analysis/inf-unpackme/` : `unpackme`, `Readme.txt`, `unpackme.i64.c` (Hex-Rays)
- `tools/infector-solve.py` : recherche des mots de passe + réplique du XOR de l'hôte
