# keygen (tvk_crackme_1) — tvk6843 (crackmes.de)

- Page : https://crackmes.one/crackme/5ab77f5e33c5d40ad448c745 · [`ORIGIN.yml`](ORIGIN.yml)
- Plateforme : Linux ELF32 i386, C++ (libstdc++), strippé
- Archive : `original/keygen.zip` → `tvk_crackme_1`
- Usage : `./tvk_crackme_1 <name> <serial>`

## Réponse

Serial de **24 caractères** (3 mots de 32 bits en hexadécimal d'alphabet `0123456789AbCdEf`) **dépendant de l'heure** (minutes et heures locales, nibble bas). Le succès se reconnaît à l'**arithmétique juste** du message : `Your solution is 6 + 29 = 35` (échec : `5 + 24 = 32`, résultat décalé de 3).

```bash
python3 -I tools/tvk1-solve.py petik            # serial pour l'heure courante (à saisir dans la minute)
./analysis/tvk_crackme_1 petik <serial>          # Your solution is 6 + 29 = 35
python3 -I tools/tvk1-solve.py petik --check    # génère + exécute immédiatement
# check: OK (21:21 → 'Your solution is 6 + 29 = 35' ; serial altéré → 'Your solution is 5 + 24 = 32')
```

Exemple pour `petik` à **12:00** : `0002d5100003C4510004b392`

## Premier regard

```text
$ ./analysis/tvk_crackme_1 petik 1234
Your solution is 5 + 4 = 12                 <- 5 + 4 ≠ 12 : mauvais serial (écart de 3)
$ strings -n 6 analysis/tvk_crackme_1 | grep -E "solution|0123"
Your solution is %d + %d = %d    0123456789AbCdEf
```

## Comment on trouve

**Ancrage** : `main` @`0x8048801` (argument de `__libc_start_main`). L'affichage se fait par `0x804869c(a, b, c)` = `printf("Your solution is %d + %d = %d", a, b, c)` avec `c = a + b` seulement en cas de succès.

```asm
8048865: localtime(time())                       ; (min, h)
80488bf: buf = name + chr(0x41 + (tm_min & 0xf)) + chr(0x42 + (tm_hour & 0xf))     ; malloc(L+2)
8048914: pour i = 0..2 :
   804892e: H_i = hash(buf, L+2, i) @0x80486c5      ; i·0xef41 + 0x2cdc3 + Σ buf[k]·k
   804893e: V_i = decode(serial + 8·i) @0x8048710   ; 8 caractères -> nibbles via la table @0x8048b4f
   804895d: flag &= (H_i == V_i)
804898e: relit l'heure : si (min + 1) < min' : flag = 0 (garde-fou de durée)
8048a03: flag ? print(L+1, len(serial)+5, len(serial)+L+6)  [succès, arithmétique juste]
              : print(L,   len(serial),   len(serial)+L+3) [échec, résultat décalé de 3]
```

**Pièges :**
- Réussite = **pas de message d'erreur** mais une addition correcte : une lecture rapide « Your solution is … » laisse croire que tout est faux.
- `tm_min`/`tm_hour` ne contribuent que par leur nibble bas (`& 0xf`) : 16 minutes ≡ même serial.
- `argc` doit valoir 3 : sans les deux arguments le programme affiche `argc + 1 = …` (échec).
- Les octets de `name` sont des `unsigned` (`movzx`).

## Vérification

```text
$ python3 -I tools/tvk1-solve.py petik --check          # analysis/verify.txt
check: OK (21:21 → 'Your solution is 6 + 29 = 35' ; serial altéré → 'Your solution is 5 + 24 = 32')
```

## Fichiers

- `analysis/tvk_crackme_1`, `analysis/dis.txt`, `analysis/verify.txt`
- `tools/tvk1-solve.py` : keygen (heure courante ou `--at`) + `--check`
