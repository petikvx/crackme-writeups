# drscm3 — drspliff (crackmes.de)

- Page : https://crackmes.one/crackme/5ab77f5733c5d40ad448c307 · [`ORIGIN.yml`](ORIGIN.yml)
- Plateforme : Linux ELF32 i386, **statique** strippé (mini-libc), 2007 ; `c.enc` doit être dans le répertoire courant
- Archive : `original/crack.tar.gz` → `crack` + `c.enc` (extraits sous `analysis/`)

## Réponse

| Prompt | Valeur |
|---|---|
| `User ID:` | **`123`** (0x7b) |
| `License:` | **`7sd9gwigE`** |

```bash
cd analysis && (echo 123; sleep 0.5; echo 7sd9gwigE) | ./crack.rwx     # → Thanks!
python3 -I tools/drscm3-solve.py --check    # brute-force des 255 IDs puis validation
```

> `crack.rwx` = copie de `crack` dont le `PT_LOAD` RW est passé en RWX (voir « Pièges »), créée par le solveur ; `original/` n'est pas touché.

## Premier regard

```text
$ file crack
ELF 32-bit LSB executable, Intel 80386, statically linked, stripped
$ strings -n 6 crack | grep -iE "User ID|c\.enc|Error|urandom"
User ID:      c.enc      Error: Please enter a number between 0x01 and 0xFF      /dev/urandom
```

Aucune chaîne de licence ou de succès dans le binaire : elles sont dans `c.enc` (4096 octets chiffrés) → code auto-déchiffré.

## Flow

`main` @`0x8048580`/`0x80483xx` (trace `strace`) :

1. `open("/dev/urandom")`, lit 2 octets (initialisation inutilisée pour la solution).
2. `read(0, …)` : **User ID**, doit être dans `[1, 0xFF]` (`lea eax,[edx-1]; cmp eax,0xfe`) sinon « Error: Please enter a number between 0x01 and 0xFF ».
3. Génère 0x400 mots d'un **Mersenne Twister MT19937** (`init_genrand` @`0x8048100`, constantes `0x6c078965`, `0x19660d`, `0x5d588b65`, `0x80000000`, `0x9908b0df`) amorcé par une init_by_array fonction de l'ID ; un octet par mot → 4096 octets de flux (`[0x804d0e0..]`).
4. `read("c.enc", 4096)` en `0x804c0e0`, puis `buf[i] ^= flux[i]` (boucle @`0x80484b5`).
5. `mprotect(0x804c0e0, 0x1000, PROT_READ|PROT_EXEC)` puis `call (0x804c0e0 + esi)` où `esi` = (sortie MT mod 0xff) + constante, **dépend de l'ID**.
6. Le code déchiffré s'exécute : écrit `License: `, lit 11 octets, compare au motif `7sd9gwigE!` jusqu'au `!`, écrit `Thanks!` ou `Oops!`.

## Comment on trouve

**Ancrage** : `strace` (open/read/mprotect), `objdump -d -M intel --no-show-raw-insn analysis/crack`, puis `gdb` pour dumper le tampon déchiffré.

1. Le XOR avec un flux MT rend toute recherche de chaînes vaine. L'ID n'a que 255 valeurs → on **teste toutes les valeurs** et on regarde si le tampon déchiffré ressemble à du code :

   ```gdb
   gdb -nx -batch ./analysis/crack -ex 'run < id.txt' \
       -ex 'dump binary memory dump.bin 0x804c0e0 0x804d0e0'
   ```

   (le programme plante après le `mprotect` : on lit le tampon au moment du SIGSEGV). Critère : nombre d'octets nuls et occurrences de `cd 80` (`int 0x80`). **ID 123 : 79 octets nuls et 3 `int 0x80`** ; tous les autres : ≤ 27 nuls, aucun `cd 80`.
2. Désassemblage du dump de l'ID 123 (`analysis/decrypted-id123.bin`, base `0x804c0e0`) : la fonction commence en `0x804c125` (`55 89 e5 57 56 53 e8 00 00 00 00 5b …` : prologue + `call $+5; pop ebx`), c'est bien l'adresse appelée pour cet ID (`gdb -ex 'break *0x80484eb'` → `eax=0x804c125`, `esi=0x45`).
3. Le cœur du check :

   ```asm
   804c1c8: mov  al,[ebp-0x48]      ; motif : "7sd9gwigE!" copié depuis 0x804c22f
   804c1cb: cmp  al,0x21            ; '!' = fin du motif -> succès
   804c1dd: cmp  al,[ecx]           ; ecx = saisie (ebp-0x58)
   804c1df: jne  0x804c207          ; -> "Oops!"
   804c1e1: inc  edi ; mov al,[edi] ; inc ecx
   804c1e7: jne  0x804c1dd
   804c1e9: write(1, "Thanks!") ...
   ```

   La licence est donc le motif sans le `!` : **`7sd9gwigE`** (les caractères suivants de la saisie ne sont pas lus).

**Pièges :**
- `mprotect(0x804c0e0, …)` : adresse non alignée sur une page → `EINVAL` ; le code exécute des *données* (segment RW) : `SIGSEGV` (NX) sur tout système moderne. D'où la copie RWX du solveur (`setarch -X` ne suffit pas).
- Le premier `read(0, …, 2048)` lit **tout** le pipe : avec `printf '123\n7sd…\n' | ./crack` la licence est « consommée » par le prompt de l'ID et on obtient `Oops!`. Il faut envoyer la licence plus tard (`sleep`) ou saisir au clavier.
- Le préfixe `Lice` + `%\xc1\x04\x08` à l'écran (au lieu de `License: `) est cosmétique : le `push ebx` du code déchiffré écrase un local selon l'alignement de pile ; sans effet sur la comparaison.

## Debug GDB (pas à pas)

```gdb
gdb -nx -batch ./analysis/crack.rwx \
    -ex 'break *0x80484eb' \         # juste avant `call eax` (saut dans le code déchiffré)
    -ex 'run < id.txt' \             # id.txt = "123"
    -ex 'info registers eax esi'
# eax = 0x804c125   esi = 0x45
```

Pour l'ID 5 : `eax = 0x804c1e0`, `esi = 0x100`, et le tampon déchiffré est du bruit (`e9 14 e8 fc …`) → SIGSEGV. Dump complet du tampon : `-ex 'dump binary memory dump.bin 0x804c0e0 0x804d0e0'` (point d'arrêt = le crash après `mprotect`).

## Vérification

```text
$ (echo 123; sleep .5; echo 7sd9gwigE) | ./analysis/crack.rwx     # analysis/ok.txt
… Thanks!
$ (echo 123; sleep .5; echo petik)     | ./analysis/crack.rwx     # analysis/ko.txt
… Oops!
```

## Fichiers

- `analysis/crack`, `analysis/c.enc` : extraits de l'archive ; `analysis/decrypted-id123.bin` : tampon déchiffré (ID 123) ; `analysis/dis.txt` : objdump ; `analysis/ok.txt`, `analysis/ko.txt`
- `tools/drscm3-solve.py` : crée la copie RWX, retrouve l'ID par force brute, valide
