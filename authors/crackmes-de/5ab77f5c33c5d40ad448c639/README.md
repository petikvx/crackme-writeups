# blaad (blaadme2) — nobody / blAAd (crackmes.de)

- Page : https://crackmes.one/crackme/5ab77f5c33c5d40ad448c639 · [`ORIGIN.yml`](ORIGIN.yml)
- Plateforme : Linux ELF32 i386, **Qt 1.44** (`libqt.so.1`), non strippé (C++)
- Archive : `original/blaadme.tar.gz` → `blaadme2` + `blaadme.txt` (« bisogna trovare un seriale (la criptatura è semplice) »)

## Réponse

Un serial de **15 caractères** ; le 8ᵉ est libre :

```
219576501436587          (2195765 ? 1436587 ; le « ? » = n'importe quel caractère non nul, ici 0)
```

```bash
python3 -I tools/blaad-solve.py --check
# serial : 219576501436587 / check: OK (modèle=True, émulation: 'YEAAHHH! U WIN' / 'No No No Try Again!')
```

> Qt 1.x n'est pas installable ici : le binaire ne se lance pas. La preuve est l'**émulation unicorn** de la routine `Controllo::decodifica` du binaire d'origine (appels `QLineEdit::text`, `qstrcpy`, `QMessageBox::information` court-circuités).

## Premier regard

```text
$ strings -n 6 analysis/blaadme2 | grep -iE "serial|YEAA|blAAd|No No"
SSSSERIAL :   YEAAHHH! U WIN   tOo Much blAAd! 2   No No No Try Again!
$ nm analysis/blaadme2 | grep -E "decodifica|Controllo"
0804a3fc T decodifica__9Controllo    08049fc0 T __9ControlloP7QWidgetPCc
```

## Comment on trouve

**Ancrage** : `nm` (non strippé) → `Controllo::decodifica` @`0x804a3fc` (slot du bouton) ; désassemblage `objdump -d -M intel`.

```asm
804a408: copie 15 octets de 0x804ab3c -> ref[ebp-0x24]            ; ref = cf dc df ce 05 cc cb 8a 8f 9a a9 ad bb b9 ce
804a425: text__C9QLineEdit(this+0x74) ; qstrcpy(ser[ebp-0x14], text)
804a447: for i = 0 .. 14 (cmp i, 0xe ; jle) :  j = 14 - i
   804a484..4a490: ser[j] = ser[j] ^ ser[i]
   804a4b3..4a4e7: ser[j] = ser[j] ^ ((0xffc8 - (10*i & 0xff)) & 0xff)        ; c_i
   804a50a..4a518: ser[j] = ser[j] + (i + 1)
   804a535..4a53b: if (ref[j] != ser[j]) { ok = 0 ; break }
804a550: ok ? information("YEAAHHH! U WIN", "tOo Much blAAd! 2") : information("No No No Try Again!")
```

**Inversion** : à l'itération `i`, `ser[i]` vaut :
- l'original `o[i]` si `i ≤ 6` (il n'a pas encore été touché) ;
- `ref[i]` si `i ≥ 8` (déjà fixé et validé à l'itération `14 − i`) ;
- `o[7] ^ o[7] = 0` pour `i = 7` : l'itération 7 est un test constant `c_7 + 8 = 0x8a = ref[7]` ✓ et `o[7]` est **libre**.

D'où : pour `i = 8..14` : `o[14−i] = ((ref[14−i] − (i+1)) & 0xff) ^ c_i ^ ref[i]` ; pour `i = 0..6` : `o[14−i] = (((ref[14−i] − (i+1)) & 0xff) ^ c_i) ^ o[i]`.
Résultat : `o = 32 31 39 35 37 36 35 ?? 31 34 33 36 35 38 37` = `2195765 ? 1436587`.

**Pièges :**
- Les itérations se recouvrent (`j = 14−i` puis `i = 14−j'`) : il faut inverser dans le bon ordre (les 7 derniers `o[j]` d'abord).
- La copie `qstrcpy` dans un tampon de 15 octets déborde d'un octet pour un serial de 15 caractères (NUL) : sans effet sur la validité.
- Les chaînes sont en italien/anglais déformé (« tOo Much blAAd! »), le message de succès est le **titre** de la boîte (ordre des arguments `QMessageBox::information`).

## Vérification

```text
$ python3 -I tools/blaad-solve.py --check          # analysis/verify.txt
check: OK (modèle=True, émulation: 'YEAAHHH! U WIN' / 'No No No Try Again!')
```

## Fichiers

- `analysis/blaadme2`, `analysis/blaadme.txt`, `analysis/dis.txt` (objdump), `analysis/verify.txt`
- `tools/blaad-solve.py` : inversion de la routine + émulation unicorn de `decodifica`
