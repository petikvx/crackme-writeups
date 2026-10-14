# crackme2 (crackme02) — seveb (crackmes.de)

- Page : https://crackmes.one/crackme/5ab77f5e33c5d40ad448c78d · [`ORIGIN.yml`](ORIGIN.yml)
- Plateforme : Linux ELF32 **et** ELF64 (`crackme02_32bit`, `crackme02_64bit`), C, non strippés
- Archive : `original/crackme02.tar.gz`
- Usage : `Please enter your serial:` (stdin)

## Réponse

Serial de **21 caractères**, par exemple :

```
da-1003-08X32-aaaa-da
```

```bash
python3 -I tools/crackme02-solve.py --check
# check: OK (accepté=True, altérés rejetés=True)
echo da-1003-08X32-aaaa-da | ./analysis/crackme02_64bit      # … Good job you made it!
```

Forme générale : `da-NNNN-v3v2Xv1v0-????-da` avec `NNNN` ∈ {1003, 1023, …, 1983} (50 valeurs) et `v` = chiffres de `7·⌊NNNN/3⌋ + 42`.

| N | serial |
|---|---|
| 1003 | `da-1003-08X32-aaaa-da` |
| 1503 | `da-1503-43X01-aaaa-da` |
| 1983 | `da-1983-45X31-aaaa-da` |

## Premier regard

```text
$ echo 1234 | ./analysis/crackme02_64bit
Please enter your serial: your serial is invalid
$ strings -n 4 analysis/crackme02_64bit | grep -E "serial|%21s|Welcome"
Please enter your serial:   %21s   your serial is invalid   Welcome to Crackme 02
```

## Comment on trouve

**Ancrage** : `bash -ic 'decc crackme02_64bit'` (non strippé : `main`, `pepper`, `gaia`, `Thor`, `salt`, `hades`).

```c
main  : scanf("%21s", user) ; strlen == 21 ; user[0..2] == "da-" ; N = atoi(user[3..6])
        N doit être dans firstFour[] (rempli par salt() : i ∈ [1..2000], i % 20 == 3 et i > 1000)
pepper: user[7] == '-' ; user[10] == 'X' ; user[13] == '-' ;
        v = 2*(N/3 + 16) ; si v <= 999 : v = 7*(N/3) + 42 ; s = sprintf("%d", v) ;
        s2 = { s[3], s[2], 'X', s[1], s[0] } ; strncmp(user[8..12], s2, 6) == 0
gaia  : user[13] == '-' ; user[14] <= user[16] ; user[17] >= user[15]
Thor  : user[18..20] == "-da" ; affiche « Good job you made it! » (scarab[i] et anhilla[i] entrelacés)
```

Exemple `N = 1003` : `N/3 = 334` ; `2·(334+16) = 700 ≤ 999` donc `v = 7·334 + 42 = 2380` ; `s = "2380"` ; `s2 = s[3] s[2] 'X' s[1] s[0] = "08X32"` ; milieu libre `aaaa` (`'a' ≤ 'a'`, `'a' ≥ 'a'`).

**Pièges :**
- `salt()` et `serial()`/`anubis()`/`luna()` sont du **bruit** (calculs non utilisés, `anubis` renvoie 84) : seul `firstFour[]` compte.
- `strncmp(…, 6)` compare 6 octets : les 5 caractères + le NUL implicite (octet haut de `v6` = 0) : la longueur effective est 5.
- `v` doit avoir 4 chiffres : pour `N` dans la plage, `7·⌊N/3⌋ + 42` ∈ [2380, 4651] (4 chiffres) ✓.
- Comparaisons de `gaia` en `char` signé : rester en ASCII imprimable.

## Vérification

```text
$ echo da-1003-08X32-aaaa-da | ./analysis/crackme02_64bit      # analysis/verify.txt
Please enter your serial: Good job you made it!
$ echo da-1003-08X32-aaaa-db | ./analysis/crackme02_64bit
Please enter your serial: your serial is invalid
```

## Fichiers

- `analysis/crackme02_32bit`, `analysis/crackme02_64bit`, `analysis/dis.txt`, `analysis/verify.txt`, `analysis/crackme02_64bit.i64.c`
- `tools/crackme02-solve.py` : générateur (N au choix) + `--check` sur les 2 binaires
