# pof_kgme_0x01 — pof_es (crackmes.de)

- Page : https://crackmes.one/crackme/5ab77f5a33c5d40ad448c532 · [`ORIGIN.yml`](ORIGIN.yml)
- Plateforme : Linux ELF32 i386, **compressé gzexe** (script `sh` + gzip) → ELF sans section headers
- Archive : `original/pof-kgme-0x01.zip` → `pof-kgme-0x01/pof-kgme1` + `readme.txt`
- Règles : trouver le mot de passe, **pas de patch** ; bonus : outils GPL, keygen

## Réponse

```
796666880
```

(une des 15 solutions purement numériques ; voir la règle ci-dessous)

```bash
python3 -I tools/pof-kgme-solve.py --check
# password : 796666880   (15 solutions purement numériques ; --all)
# check: OK (796666880→OK=True, modèle==binaire=True)
echo 796666880 | ./analysis/pof-kgme-0x01/kgme.unpacked      # Password OK!
```

## Premier regard

```text
$ head -3 analysis/pof-kgme-0x01/pof-kgme1       # gzexe
#!/bin/sh
skip=44
$ tail -n +44 pof-kgme1 | gzip -dc > kgme.unpacked      # (décompression seule, sans exécuter le script)
$ strings -n 5 kgme.unpacked | grep -E "Password|KGME"
[ ===== pof KGME 0x01 ===== ]   Password:   Password OK!   Password Incorrect!
```

## Comment on trouve

**Ancrage** : `objdump -D -b binary -m i386 -M intel --adjust-vma=0x8048000 analysis/pof-kgme-0x01/kgme.unpacked` (pas de section headers) ; entrée `0x80483f4` : bannière, `printf("Password: ")`, `scanf("%s")`, `call 0x804835c`.

```asm
804835c: check(pw)
8048379:   al = pw[ebx] ; [esp+3] = al                        ; copie un caractère
8048390:   sscanf(&[esp+3], "%d", &tmp)                       ; tmp inchangé si le caractère n'est pas un chiffre
8048395:   ebp += tmp                                          ; somme cumulée
804839c:   cmp ebp,0x38 ; jne … ; push esi ; call 0x804830f   ; dès que la somme == 56 : f(pw)
80483ba: call 0x80482ef                                        ; « Password Incorrect! » + exit
804830f: f(pw) : sscanf(pw, "%d", &n)                          ; n = entier de tête (écrit dans le slot [esp])
8048325:   g(n) = 0x80482d0 : (n >> 8) == 0x2f7c2c  ->  flag@0x804a014 = 1
8048336:   test BYTE [esp],1 ; jne …                           ; n IMPAIR -> abandon silencieux
804833c:   cmp flag,1 ; … "Password OK!" ; exit(0)
```

Règle complète : le mot de passe commence par un entier `n` avec `(n >> 8) == 0x2f7c2c`, soit
`796666880 ≤ n ≤ 796667135`, **pair** (le bit 0 testé est celui de `n`, le slot de `sscanf`), et la somme
cumulée des chiffres atteint exactement 56 à un moment du parcours (un caractère non-chiffre rajoute à nouveau
le dernier chiffre : `tmp` n'est pas modifié par `sscanf` en échec).

Exemple `796666880` : somme des chiffres `7+9+6+6+6+6+8+8+0 = 56` ✓, `n` pair ✓, `n >> 8 = 0x2f7c2c` ✓.
Le solveur énumère les 256 valeurs de la plage avec le modèle (15 purement numériques valides) et le confronte au binaire.

**Pièges :**
- `sscanf` écrit `n` dans un emplacement de pile **réutilisé** comme « drapeau » : le test de parité est discret (`test BYTE [esp],1`).
- Un non-chiffre ne remet pas `tmp` à 0 : il rajoute le dernier chiffre à la somme (`796666932a` valide à cause de ça).
- Le script gzexe lance l'ELF dans un `mktemp` : on décompresse à la main (`tail -n +44 | gzip -dc`) pour travailler sur le binaire.

## Vérification

```text
$ echo 796666880 | ./kgme.unpacked      # analysis/verify.txt
[ ===== pof KGME 0x01 ===== ]
Password: Password OK!
$ echo 796666881 | ./kgme.unpacked       # impair
Password: Password Incorrect!
```

## Fichiers

- `analysis/pof-kgme-0x01/` : `pof-kgme1` (gzexe), `kgme.unpacked`, `readme.txt`, `dis.txt` ; `analysis/verify.txt`
- `tools/pof-kgme-solve.py` : modèle (+ `--all`) et `--check` natif
