# linux_crackme (Level:2) — cyrex (crackmes.de)

- Page : https://crackmes.one/crackme/5ab77f5633c5d40ad448c2d6 · [`ORIGIN.yml`](ORIGIN.yml)
- Plateforme : Linux ELF32 i386, dynamique, **non strippé** (`debug_info`), GCC/GNU AS 2.15
- Archive : `original/crackme_01.tgz` → `crackme_01/crackme` (extrait sous `analysis/`)

## Réponse

```
47ghf6fh37fbgbgj
```

```bash
python3 -I tools/linux-crackme-solve.py --check     # password: 47ghf6fh37fbgbgj  ·  check: OK
echo 47ghf6fh37fbgbgj | ./analysis/crackme_01/crackme
# -[ Good, You're ready to begin linux reversing ]-
```

Pas de nom d'utilisateur : un seul mot de passe, fixe.

## Premier regard

```text
$ file analysis/crackme_01/crackme
ELF 32-bit LSB executable, Intel 80386, dynamically linked, not stripped
$ strings -n 6 analysis/crackme_01/crackme | head
-[ Linux CrackMe (Level:2) by cyrex ]-
-[ TODO: You have to get the valid Password ]-
Enter Password:
47ghf6fh37fbgbgj
-[ Good, You're ready to begin linux reversing ]-
-[ Ohhhh, your skills are bad try again later ]-
```

## Comment on trouve

**Ancrage** : `objdump -d -M intel analysis/crackme_01/crackme` → `main` @`0x8048450` (symbole présent).

```asm
8048489: lea  eax,[ebp-0x20]      ; buf (32 octets)
804848c: push eax
804848d: push 0x80486a1           ; "%s"
8048492: call scanf
804849d: push 0x80486a4           ; "47ghf6fh37fbgbgj"  (constante en clair, .rodata)
80484a2: lea  eax,[ebp-0x20]
80484a6: call strcmp              ; strcmp(buf, "47ghf6fh37fbgbgj")
80484b0: test eax,eax
80484b2: jne  80484c6             ; != 0 -> "Ohhhh, your skills are bad…"
80484b7: push 0x80486c0           ; "Good, You're ready to begin linux reversing"
```

L'adresse `0x80486a4` pointe directement vers la chaîne `47ghf6fh37fbgbgj` (dans le premier `LOAD`, offset fichier `0x6a4`) : le mot de passe est comparé tel quel, sans transformation. C'est un « Level 2 » de découverte : on trouve la chaîne avec `strings` et on la valide en regardant le `strcmp`.

**Pièges :** aucun (la chaîne qui ressemble à du bruit est bien le secret ; ce n'est pas un leurre). `scanf("%s")` sans borne → débordement possible de `buf` (32 octets), non nécessaire ici.

## Debug GDB (pas à pas)

```gdb
gdb -nx -batch analysis/crackme_01/crackme \
    -ex 'break *0x80484a6' \                  # juste avant l'appel à strcmp
    -ex 'run < in.txt' \                      # in.txt = "wrong"
    -ex 'x/s *(char**)($esp+4)' \             # 2ᵉ argument : la constante
    -ex 'x/s *(char**)$esp'                   # 1er argument : la saisie
```

```text
Breakpoint 1, 0x080484a6 in main ()
0x80486a4:  "47ghf6fh37fbgbgj"
0xffffc828: "wrong"
```

(sortie complète dans `analysis/gdb.txt`.) Le premier argument est la saisie, le second la constante attendue.

## Vérification

```text
$ echo 47ghf6fh37fbgbgj | ./analysis/crackme_01/crackme      # analysis/ok.txt
-[ Good, You're ready to begin linux reversing ]-
$ echo petik | ./analysis/crackme_01/crackme                 # analysis/ko.txt
-[ Ohhhh, your skills are bad try again later ]-
```

## Fichiers

- `analysis/crackme_01/crackme` : binaire extrait · `analysis/ok.txt`, `analysis/ko.txt`, `analysis/gdb.txt`
- `tools/linux-crackme-solve.py` : lit la constante dans le binaire + `--check`
