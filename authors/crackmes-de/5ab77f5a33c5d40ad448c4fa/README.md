# k_genme — macabre (crackmes.de)

- Page : https://crackmes.one/crackme/5ab77f5a33c5d40ad448c4fa · [`ORIGIN.yml`](ORIGIN.yml)
- Plateforme : Linux ELF32 i386, **KDE 3.5.5 / Qt 3.3.7** (GUI), strippé, « No anti-debugging used. Algo is fairly simple »
- Archive : `original/k-genme.rgz` (tar.gz) → `k-genme/crackme` + `Readme.txt`
- Règles de l'auteur : keygenme, pas de patch ni de self-keygen

## Réponse

Un **nom** (≥ 3 caractères) et **trois** champs de série :

| Name | Serial 1 | Serial 2 | Serial 3 |
|---|---|---|---|
| `petik` | `-2141864799` | `-547` | `-8189260` |
| `admin` | `1496450716` | `2471` | `16656280` |
| `Zorro` | `1019939346` | `2041` | `10067408` |

```bash
python3 -I tools/kgenme-solve.py petik
# name: petik / serial1: -2141864799 / serial2: -547 / serial3: -8189260
```

> Limite : KDE3/Qt3 absent de cette machine, le binaire ne se lance pas ; l'algorithme est lu dans le pseudo-C Hex-Rays (`crackme.i64.c`) et rejoué en Python (preuve statique, pas de test GUI).

## Premier regard

```text
$ ldd analysis/k-genme/crackme | grep "not found" | head -2
libkdeui.so.4 => not found   libqt-mt.so.3 => not found
$ strings -n 6 analysis/k-genme/crackme | grep -E "Congratz|Invalid|at least"
Name must be at least 3 characters!   Congratz!! Cracked!!! Now write a Keygen!!   Invalid Serial Number!
```

Une fenêtre avec 4 `QLineEdit` (name + 3 morceaux de série) et un slot `nameLostFocus()`.

## Comment on trouve

**Ancrage** : `bash -ic 'decc crackme'` → `crackme.i64.c` (1255 lignes). Les chaînes « Congratz » / « Invalid Serial Number » (lignes ≈ 645 / 652) situent la routine de validation :

```c
name = lineEdit0->text(); s1 = lineEdit1->text(); s2 = lineEdit2->text(); s3 = lineEdit3->text();
if (all non vides):
  if (len(name) <= 2) "Name must be at least 3 characters!"
  else {
    v23 = 0; v24 = 0; v25 = name[0]; v32 = 0;
    while (1) {
      v23 += v25;  ++v24;
      v32 += (v25 ^ 0x45) * v23;
      if (v24 == len(name)) break;
      v25 = name[v24];
      if (v23 != 0) v23 = (v23 - (v25 >> 1)) * v25;
    }
    str1 = setNum(75 * v23);               // base 10
    str2 = setNum(v23 / 0x44);  str2.truncate(4);
    str3 = setNum(v32);          str3.truncate(8);
    if (s1 == str1 && s2 == str2 && s3 == str3) "Congratz!! Cracked!!!"
```

**Détails qui comptent :**
- toutes les opérations sont des `int` 32 bits (dépassement silencieux) et `name[i]` est un `char` **signé** (`v25 >> 1` est un décalage arithmétique) ;
- `setNum` produit le signe `-` : `truncate(4)` / `truncate(8)` tronquent la chaîne **avec** le signe ;
- `v23 / 0x44` est une division signée tronquée vers zéro ; `v23` est celui de la **dernière** itération (après la mise à jour par `v25`, qui n'a pas lieu à la dernière itération car `break` précède).

Exemple `petik` (`70 65 74 69 6b`) — valeurs `(v23, v32)` après chaque ajout `v23 += v25` :

| i | `v25` | `v23` | `v32` |
|---|---|---|---|
| 1 | `p`=112 | 112 | 5 936 |
| 2 | `e`=101 | 6 363 | 209 552 |
| 3 | `t`=116 | 731 496 | 36 052 856 |
| 4 | `i`=105 | 76 801 725 | −879 638 540 |
| 5 | `k`=107 | −372 155 581 | −818 926 082 |

`75·v23 = −27 911 668 575` → modulo 2³² signé : **−2 141 864 799** ; `v23 / 68 = −5 472 876` → `-547` (4 premiers caractères) ; `v32 = −818 926 082` → `-8189260` (8 premiers caractères).

**Pièges :**
- Le tronquage à **4** et **8** caractères (signe compris) explique les longueurs inégales des 3 champs.
- Aucun anti-debug, mais KDE3 requis pour l'exécuter : la clé ne peut pas être vérifiée sur cette machine.

## Fichiers

- `analysis/k-genme/` : `crackme`, `Readme.txt`, `crackme.i64.c`
- `tools/kgenme-solve.py` : keygen (3 champs)
