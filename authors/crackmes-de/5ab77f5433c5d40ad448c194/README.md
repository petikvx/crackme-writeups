# libertyordeaths_linux_keygenme_2 — LibertyorDeath (réimport crackmes.de)

- **Page** : [crackmes.one](https://crackmes.one/crackme/5ab77f5433c5d40ad448c194)
- **Plateforme** : Linux ELF32 i386 (GCC 4.2.3, strippé) — difficulté 2.0
- **Publication** : 2018-03-25
- **Règles** (ReadMe) : pas de patch, keygen préféré. Le `source.rar` fourni est chiffré (mot de passe envoyé par l'auteur), on s'en passe.

## Solution

Le serial dépend du **nom** et du **hostname** de la machine :

```
A = 0x13 + Σ octets(hostname)
B = (dernier_caractère(nom) + len(hostname)) * (len(hostname) + len(nom))
serial = "%i-%i-%s" % (A, B, nom[:2] + hostname[:2])
```

Exemple sur la box (`grok-bot-vm-411329652`) : `petik` → **`1606-3328-pegr`**.

```
$ python3 tools/crackmes-de-libertyordeaths_linux_keygenme_2-solve.py petik
1606-3328-pegr
$ printf 'petik\n1606-3328-pegr\n' | ./keygenme
Input name: Input serial: Yay good job!
```

## Comment on trouve

1. `strings` : `gethostname`, `getchar`, `sprintf`, `strncat`, `strncmp`, formats `%i` et `-` dans `.rodata` → serial construit par concaténation puis comparé (`strncmp(..., 0xff)`).
2. `objdump -d -M intel` sur `main` (0x80485d4) :
   - `gethostname(buf, 100)`, puis `strncpy(h2, buf, 2)` : les 2 premiers caractères du hostname sont gardés.
   - Boucle sur le hostname : `acc = 0x13; acc += (signed char)c` ; l'index final vaut `len(hostname)`. `sprintf(serial, "%i", acc)`.
   - Lecture du nom caractère par caractère avec `getchar()` jusqu'à `\n` : les 2 premiers caractères sont stockés dans `n2`, et à **chaque** caractère `t = c + len(host)` est écrasé — seul le dernier compte. Après la boucle `t *= len(host) + len(nom)`.
   - `serial += "-" + "%i"(t) + "-" + (n2 + h2)`, puis `gets()` du serial et `strncmp`.
3. Pas d'anti-debug ici ; aucune session GDB n'a été nécessaire, la lecture statique suffit.

## Vérification

Vérifié en natif sur la box : le serial du keygen donne `Yay good job!`, un serial bidon donne `Nope sorry.`.
