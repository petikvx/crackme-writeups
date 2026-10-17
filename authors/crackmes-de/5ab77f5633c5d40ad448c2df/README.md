# crackmes.de's lfalchs_1st_crackme by lfalch

| | |
|---|---|
| **ID** | [`5ab77f5633c5d40ad448c2df`](https://crackmes.one/crackme/5ab77f5633c5d40ad448c2df) |
| **Auteur (site)** | crackmes.de (crackme de lfalch) |
| **Auteur (local)** | crackmes-de |
| **Plateforme** | Java (Swing), multiplateforme |
| **Difficulté** | 1.0 |
| **SHA-256 (ZIP)** | `426343fc04061cd8286e32c86e2bd9c86fee85a82a985d55450b4b1ae7f92188` |

## Origine

- Page : https://crackmes.one/crackme/5ab77f5633c5d40ad448c2df
- Download : https://crackmes.one/download/crackme/5ab77f5633c5d40ad448c2df
- ZIP password : `crackmes.one`

Voir [`ORIGIN.yml`](ORIGIN.yml).

## Énoncé (`original/readme.txt`)

> Goal: Make a keygen — Rules: don't alter any of the classes in the jar, feel free to decompile —
> Bonus: the jar is obfuscated, the serial only consists of letters and numbers.

## Solution

**Serial pour `petik` : `0yfuu3g1cyic4fwl`** (la casse n'a pas d'importance : `0YFUU3G1CYIC4FWL` passe aussi).

```
$ python3 tools/lfalch-solve.py petik
petik -> 0yfuu3g1cyic4fwl
```

## Analyse

### 1. Contenu du jar

`Crackme1.jar` contient quatre classes dans `com.lfalch.crackme1` :
`Crackme` (main), `a` (le `JPanel` avec les champs Name / Serial), `b` (l'`ActionListener`
du bouton *Verify*) et `c` (la vérification). « Obfusqué » signifie seulement que les noms
de classes, champs et méthodes ont été réduits à une lettre : le bytecode se décompile
proprement avec CFR (`analysis/decompiled/`).

```
java -jar cfr.jar Crackme1.jar --outputdir analysis/decompiled
```

### 2. Initialisation

Dans `Crackme.main` :

```java
String string = "password123";
c.b("LFalch", string);      // c.b = "LFalch", c.c = "password123"
```

Le champ `c.b` vaut donc `"LFalch"`. Le champ `c.c` (`"password123"`) est un leurre :
il est XORé avec `0x10` à chaque vérification mais n'intervient jamais dans le résultat.

### 3. Vérification (`c.a(name, serial)`)

```java
if ((serial = serial.toLowerCase()).length() != 16) return false;
Random r = new Random(name.hashCode() | b.hashCode());   // b = "LFalch"
String attendu = "";
for (int i = 0; i < 16; i++)
    attendu += a[r.nextInt(a.length)];
// ... XOR inutile sur c ...
return attendu.equals(serial);
```

avec l'alphabet de 34 caractères `0 1 2 3 4 5 8 9 a … z` (les chiffres **6 et 7 sont absents**).

Le serial est donc entièrement déterminé par le nom :

1. `seed = nom.hashCode() | "LFalch".hashCode()` — OR bit à bit sur des `int` 32 bits signés
   (`String.hashCode()` = Σ `s[i]·31^(n-1-i)` modulo 2³²) ;
2. un `java.util.Random(seed)` (LCG 48 bits : `seed = (seed ^ 0x5DEECE66D) & (2⁴⁸-1)`,
   puis `seed = seed·0x5DEECE66D + 0xB`) ;
3. 16 appels `nextInt(34)` (34 n'étant pas une puissance de 2, on applique la boucle de rejet
   de `nextInt`), chacun indexant l'alphabet ;
4. la saisie est mise en minuscules avant la comparaison, d'où l'insensibilité à la casse.

Conséquence amusante du OR : beaucoup de bits de la graine sont déjà forcés à 1 par
`"LFalch".hashCode()`, donc des noms différents peuvent partager le même serial
(par exemple le nom vide et `LFalch` donnent tous les deux `2xienmkkrla3zz33`).

## Keygen

[`tools/lfalch-solve.py`](tools/lfalch-solve.py) réimplémente en Python `String.hashCode()` et
`java.util.Random.nextInt(bound)` (y compris la boucle de rejet), sans dépendance Java.

## Vérification

[`tools/Verify.java`](tools/Verify.java) appelle directement la classe d'origine
`com.lfalch.crackme1.c` (sans la modifier, conformément aux règles) :

```
$ javac -cp original/Crackme1.jar -d /tmp/v tools/Verify.java
$ java -cp original/Crackme1.jar:/tmp/v Verify petik 0yfuu3g1cyic4fwl LFalch 2xienmkkrla3zz33 petik 0000000000000000
petik 0yfuu3g1cyic4fwl -> true
LFalch 2xienmkkrla3zz33 -> true
petik 0000000000000000 -> false
```

## Contenu

```
original/   # ZIP d'origine, Crackme1.jar, readme.txt
analysis/   # decompiled/ (sources CFR)
tools/      # lfalch-solve.py (keygen), Verify.java (test sur la classe d'origine)
```

## Status

- [x] reverse
- [x] write-up
- [x] solveur
