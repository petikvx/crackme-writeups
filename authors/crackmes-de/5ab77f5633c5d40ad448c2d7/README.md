# linux_crackme_02 (Level:3) — cyrex (crackmes.de)

- Page : https://crackmes.one/crackme/5ab77f5633c5d40ad448c2d7 · [`ORIGIN.yml`](ORIGIN.yml)
- Plateforme : Linux ELF32 i386, dynamique, **strippé** ; anti-debug `ptrace`
- Archive : `original/crackme_02.tgz` → `crackme` (extrait sous `analysis/`)

## Réponse

Deux conditions :

1. mot de passe **`7gb5fjf8v4bg8fb34f`** ;
2. le fichier **`/tmp/crackme_89nfnjfiefheufeue`** doit **exister** (vide suffit).

```bash
touch /tmp/crackme_89nfnjfiefheufeue
echo 7gb5fjf8v4bg8fb34f | ./analysis/crackme
# -[ You have successfully reversed/cracked/sniffed This Crackme
python3 -I tools/linux-crackme-02-solve.py --check     # crée/supprime le fichier lui-même
```

## Premier regard

```text
$ strings -n 6 analysis/crackme
Are you trying to Debug me?
-[ Linux CrackMe (Level:3) by cyrex ]-   -[ Checking Stage 1 Now..... / Stage 2 Now....
7gb5fjf8v4bg8fb34f        /tmp/crackme_89nfnjfiefheufeue
-[ Bad did you forgot something?          -[ You have successfully reversed/cracked/sniffed This Crackme
```

## Flow

`main` @`0x8048520` :

1. `ptrace(PTRACE_TRACEME,0,1,0)` ; retour `< 0` (débogueur déjà attaché) → `Are you trying to Debug me?` et sortie.
2. `scanf("%s", buf)` (`buf` = `ebp-0x400`).
3. **Stage 1** : `strcmp(buf, 0x80488b6)` = `"7gb5fjf8v4bg8fb34f"`. Différent → `Game Over`, `main` retourne.
4. **Stage 2** : `fopen("/tmp/crackme_89nfnjfiefheufeue", "r")` (`0x8048920`, mode `0x8048908`) ; `NULL` → `Bad did you forgot something?` + `exit(0)`.
5. Les deux passés → message de succès (« Email me your solution to eth0@list.ru »).

## Comment on trouve

**Ancrage** : `objdump -d -M intel --no-show-raw-insn analysis/crackme` autour de `0x8048520` (binaire strippé : `main` retrouvé par l'argument de `__libc_start_main` à `0x804845c`).

```asm
80485d1: push 0x80488b6          ; "7gb5fjf8v4bg8fb34f"
80485d6: lea  eax,[ebp-0x400]    ; saisie
80485dd: call strcmp
80485e7: test eax,eax ; jne 8048600   ; -> Game Over
8048614: push 0x80488eb ; call printf  ; "Checking Stage 2 Now...."
8048627: push 0x8048908          ; "r"
804862c: push 0x8048920          ; "/tmp/crackme_89nfnjfiefheufeue"
8048631: call fopen
8048641: cmp  [ebp-0x404],0 ; jne 8048667   ; NULL -> "Bad did you forgot something?" ; exit(0)
```

Les deux constantes sont en clair dans `.rodata` ; la seule subtilité est de comprendre que l'étape 2 attend un **fichier préexistant** (« forgot something »), son contenu n'est jamais lu.

**Pièges :** sous débogueur le `ptrace(TRACEME)` échoue (affiche « Are you trying to Debug me? ») — il suffit de lancer le binaire normalement ou de neutraliser le saut sur une copie. Rien d'autre.

## Vérification

```text
$ echo 7gb5fjf8v4bg8fb34f | ./analysis/crackme          # fichier absent   (analysis/no-file.txt)
-[ Stage 1 Cleared / -[ Checking Stage 2 Now.... / -[ Bad did you forgot something?
$ touch /tmp/crackme_89nfnjfiefheufeue; echo 7gb5fjf8v4bg8fb34f | ./analysis/crackme   (analysis/ok.txt)
-[ You have successfully reversed/cracked/sniffed This Crackme
$ echo petik | ./analysis/crackme
-[ Checking Stage 1 Now..... / -[ Game Over
```

## Fichiers

- `analysis/crackme` · `analysis/ok.txt`, `analysis/no-file.txt` : preuves
- `tools/linux-crackme-02-solve.py` : lit les constantes et vérifie les 3 cas
