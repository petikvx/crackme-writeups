# sys_linux_crackme — nobody / syscalo (crackmes.de)

- Page : https://crackmes.one/crackme/5ab77f5c33c5d40ad448c637 · [`ORIGIN.yml`](ORIGIN.yml)
- Plateforme : Linux ELF32 i386, dynamique, strippé ; textes en italien (« TROVARE IL SERIALE CORRETTO »)
- Archive : `original/crkme1sys.tgz` → `crkme1sys`
- Usage : saisie interactive (boucle tant que le serial est faux)

## Réponse

Le serial se saisit en **hexadécimal** (`scanf("%x")`) :

```
731940
```

(64 solutions avec l'octet haut à 0 : `731940`, `731941`, … ; voir `--all`)

```bash
python3 -I tools/crkme1sys-solve.py --check
# seriale (hex) : 731940 / check: OK (731940→Complimenti=True)
echo 731940 | ./analysis/crkme1sys | grep Complimenti
```

## Premier regard

```text
$ strings -n 6 analysis/crkme1sys
Crackme 1 by syscalo   TROVARE IL SERIALE CORRETTO   Inserisci il seriale:   Seriale errato, riprova!
Complimenti, hai trovato il seriale corretto!          %x
```

> Attention : sur un EOF de stdin le programme **boucle indéfiniment** (`scanf` échoue, « Seriale errato » à l'infini) : toujours le lancer avec `timeout` / `head`.

## Comment on trouve

**Ancrage** : `objdump -D -b binary -m i386 -M intel --adjust-vma=0x8048000 analysis/crkme1sys` (pas de section headers exploitables) ; la boucle principale @`0x8048379` : `printf("Inserisci il seriale: ")` puis `scanf("%x", &x)` (le format est `%x`, vu à `0x8048643`).

```asm
80483de: m8  = x                           ; [ebp-0x8]
 m0c = x & 0xff0000        ; m10 = x ^ 0x0f0f0f     ; m14 = x & 0xff00
 m18 = x ^ 0xf0f0f0        ; m1c = x & 0xff
 m10 += m1c   ; m0c += 0xff9f0000   ; m1c |= 0x37  ; m18 &= 0x45 ; m14 &= 0x1f00
 m1c = m1c / 0x11              (idiv)
 m14 ^= 0x1e00 ; m10 ^= m14 ; m0c ^= 0x150000
 m1c += m14
 m0c ^= m1c                    ; <-- seule valeur utile : m10 = m0c
804847d: m18 = 0x503090 & 0x111111 = 0x101010 ; /8 ; ×7 ; /2  =  0x70707   (constante cible)
80484c9: cmp m18, m10 ; je -> "Complimenti" (flag [ebp-4]=1)
```

Résolution à la main :

1. `m0c` final = `A ^ B` avec `A = ((x & 0xff0000) + 0xff9f0000) ^ 0x150000` et `B = ((x & 0x1f00) ^ 0x1e00) + q`, `q = ((x & 0xff) | 0x37) / 0x11` (entre 3 et 15).
2. `B` est petit (< 0x2000) donc `A` doit valoir `0x70707` à ses 13 bits bas près : `A = 0x00070000`, ce qui impose l'**octet 2 de x = 0x73** (`(0x73 + 0xff9f) & 0xffff = 0x12`, `0x12 ^ 0x15 = 0x07`).
3. Il faut alors `B = 0x70707 ^ 0x70000 = 0x0707` ⇒ `q = 7` et `(x & 0x1f00) ^ 0x1e00 = 0x700` ⇒ `x & 0x1f00 = 0x1900`.
4. `q = 7` ⇔ `(x & 0xff) | 0x37 ∈ {0x77, 0x7f}` (119 ≤ v < 136) : par exemple `x & 0xff = 0x40`.

D'où `x = 0x731940` (les bits 24–31 et 13–15 n'interviennent pas : `x = 0xFF73B940` passe aussi).

**Pièges :**
- `%x` : saisir `7543104` (décimal) échoue ; il faut `731940`.
- La boucle infinie sur EOF : tests avec `timeout` ; les « faux » serials rebouclent sans fin.
- La plupart des opérations sont mortes (`m18 &= 0x45`, `x ^= x`) : seul `m0c` compte.

## Vérification

```text
$ python3 -I tools/crkme1sys-solve.py --check          # analysis/verify.txt
check: OK (731940→Complimenti=True)
```

`737f7f` (octet 2 = 0x73 mais `x & 0x1f00 = 0x1f00`) et `1` échouent ; le binaire d'origine est exécuté avec un timeout d'une seconde.

## Fichiers

- `analysis/crkme1sys`, `analysis/dis.txt` (objdump binaire), `analysis/verify.txt`
- `tools/crkme1sys-solve.py` : modèle + énumération (`--all`) + `--check` natif
