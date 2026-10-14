# ritz_crackme_for_linux — nobody / ritz (crackmes.de)

- Page : https://crackmes.one/crackme/5ab77f5c33c5d40ad448c638 · [`ORIGIN.yml`](ORIGIN.yml)
- Plateforme : Linux ELF32 i386, NASM 0.98 (« Regole: far apparire il messaggio di conferma senza patchare il file. »)
- Archive : `original/crkme1ritz.tgz` → `ritzcrkme1`
- Usage : `./ritzcrkme1` dans un dossier contenant le fichier **`keykey`**

## Réponse

1. créer le fichier **`keykey`** de 20 octets : `34 9d dc 31 d9 dc ae 67 6d fb ec 9a 7f 8f fb 53 c6 85 e1 82` ;
2. saisir le serial `petikAAAA123456@AAA` (19 caractères).

```bash
python3 -I tools/ritz-solve.py -o .          # écrit ./keykey et affiche le serial
./analysis/ritzcrkme1                          # Serial: petikAAAA123456@AAA  ->  Serial esatto, complimenti!
python3 -I tools/ritz-solve.py --check         # check: OK (ok=True, keykey altéré→non=True, B^D=0→True)
```

> Le succès est suivi d'un `sys_exit` brut : la sortie standard (tamponnée) est perdue en pipe ; sur un terminal le message apparaît (le `--check` utilise un pseudo-terminal).

## Premier regard

```text
$ strings -n 6 analysis/ritzcrkme1 | grep -iE "Serial|keykey|Regole"
Ritz CrackMe for Linux #1   Regole: far apparire il messaggio di conferma senza patchare il file.
Serial:   Serial errato, ritenta.   Serial esatto, complimenti!   keykey
```

## Comment on trouve

**Ancrage** : `objdump -D -b binary -m i386 -M intel --adjust-vma=0x8048000 analysis/ritzcrkme1` (sections tronquées) ; point d'entrée `0x8048350`, boucle utile @`0x8048430..0x8048560` ; le segment de données est à `vaddr - 0x8049000` dans le fichier.

```asm
804843?: scanf("%s", s)                         ; s @0x80496fa
8048455: eax=dw(s+0) ebx=dw(s+5) ecx=dw(s+10) edx=dw(s+15)
         eax^=ebx ; ecx^=edx ; eax^=ecx ; [s+0]=eax ; [s+10]=ecx
8048485: cl = [0x804973d] ; rol eax,cl ; rol ebx,cl ; eax^=ebx ; [0x804973e]=eax   ; écrit aussi [0x8049741]
80484a6: cl = [0x8049741] ; eax=dw(s+5) ; ebx=dw(s+15) ; ror eax,cl ; ror ebx,cl ; eax^=ebx ; rol eax,cl
80484b5: [0x804971a] = eax                     ; diviseur Dv = B ^ D  (rotations qui s'annulent)
80484bb: open("keykey") ; read(fd, 0x80496da, 0x14) ; close
80484f6: eax = dw(buf) ; cdq ; idiv [0x804971a]  ; edx = reste
8048506: pour i in 0..4 : dw(buf+4i) ^= edx
8048524: repz cmpsb(buf, K = 0x80496c6, 0x14) -> "Serial esatto, complimenti!" sinon "Serial errato"
```

Équation : `f_i ^ rem = K_i` avec `rem = signed(f_0) mod (B ^ D)`. Le plus simple : `rem = 0` ⇒ `f = K` et `Dv` doit diviser `f_0 = 0x31dc9d34` : on prend `Dv = 1` en choisissant `B ^ D = 1` (`B = "AAAA"`, `D = "@AAA"`). Les octets `s[0..4]` (`petik`), `s[9..14]` sont libres.

**Pièges :**
- `B ^ D = 0` ⇒ `idiv` par 0 ⇒ `SIGFPE` (le `--check` le vérifie).
- `scanf("%s")` s'arrête à un blanc ; le serial doit faire ≥ 19 caractères (les 4 dwords aux offsets 0, 5, 10, 15).
- Le fichier `keykey` est lu **dans le répertoire courant** (chemin relatif) ; sans lui `buf` reste nul et la comparaison échoue.
- `exit` brut après le message de réussite : rien en pipe, utiliser un TTY (`script`, ou `pty`).

## Vérification

```text
$ python3 -I tools/ritz-solve.py --check       # analysis/verify.txt
check: OK (ok=True, keykey altéré→non=True, B^D=0→True)
```

## Fichiers

- `analysis/ritzcrkme1`, `analysis/dis.txt`, `analysis/verify.txt`
- `tools/ritz-solve.py` : crée `keykey`, donne le serial, `--check` en pseudo-terminal
