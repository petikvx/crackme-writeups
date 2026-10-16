# crackmes.de's crackme1 by dlap

| | |
|---|---|
| **ID** | [`5ab77f5633c5d40ad448c2d8`](https://crackmes.one/crackme/5ab77f5633c5d40ad448c2d8) |
| **Auteur (site)** | crackmes.de (auteur original : **dlap**, `dlap@mail.ru`) |
| **Auteur (local)** | crackmes-de |
| **Plateforme** | MS-DOS (MZ, TLINK 5.0 / asm) |
| **Difficulté** | 2.0 |
| **SHA-256 (EXE)** | `b836fef8c84b30d55d843546a5cb0c3abd724681a87a8374470361c43c4cdab7` |

Voir [`ORIGIN.yml`](ORIGIN.yml).

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/my_crackmes.zip` | archive interne du ZIP crackmes.one |
| `original/CRACKME1.EXE` | binaire DOS (757 octets) |
| `original/readme.txt` | readme UTF-16 LE de dlap (« You have to patch it ») |
| `analysis/CRACKME1-patched.EXE` | EXE avec JE→JNE |
| `analysis/code-ndisasm.txt` | désassemblage 16-bit de l'image |
| `analysis/good-message.txt` | message déchiffré |
| `tools/dlap-crackme1-solve.py` | déchiffrement + patch (`--check`, `--patch`) |

## Réponse

**Patchme** (pas de password / serial).

1. Patch fichier offset **`0x22F`** : opcode **`74` → `75`** (`JE` → `JNE`).
2. Message correct affiché après touche :

```
You got it. Now write a solution, and send to me. DLAP@mail.ru
```

Sans patch, le checksum tombe juste et le programme affiche le leurre **`May be later...`**.

```bash
python3 tools/dlap-crackme1-solve.py --check
python3 tools/dlap-crackme1-solve.py -q
# → You got it. Now write a solution, and send to me. DLAP@mail.ru
```

## Premier regard

```
$ file original/CRACKME1.EXE
MS-DOS executable, MZ for MS-DOS
$ diec original/CRACKME1.EXE
MSDOS
  Linker: Borland TLINK(5.0)
$ strings -n 4 original/CRACKME1.EXE
First CrackMe by DLAP
Try to patch it
Press any key to test...
May be later...
```

Header MZ : `e_cparhdr = 0x20` → image à l'offset fichier **`0x200`**, `CS:IP = 0000:0000`.
Sous DOS EXE, `DS` pointe sur le PSP (`load_seg - 0x10`), donc `DS:0100` = début de l'image = `CS:0000`.

Le readme (UTF-16) demande explicitement de **patcher** pour obtenir le « correct message ».

## Flow

1. `AH=09` : affiche `DS:015A` = « First CrackMe by DLAP / Try to patch it / Press any key… ».
2. `AH=07` : attend une touche.
3. Checksum sur **3 octets** à `ES:002D` (`ES=CS`) :
   - `xor ax, ax` puis 3× `add al, es:[di]` / `inc di`
   - `add ah, 1` → `AX = 0x0171` (somme `0x3B+0xC2+0x74 = 0x171`)
   - `div bl` avec `BL=3` → **`AX = 0x007B`**
4. `cmp ax, 0x7B` / **`JE`** vers le leurre `AH=09` « May be later... » puis exit.
5. Sinon (chemin « échec ») : boucle à partir de `DS:01B5` :
   - lit un octet, s'arrête sur `'$'`
   - `sub dx, ax` (donc `DL -= 0x7B`) puis `AH=02` (putc)
   - → affiche le **vrai** message déchiffré

Les octets à `CS:002D..002F` sont précisément les opcodes `cmp ax, dx` / début du `JE` (`3B C2 74`) : le checksum est auto-référentiel et **vaut toujours 0x7B** sur le binaire d'origine. D'où le JE toujours pris.

## Comment on trouve le prédicat

### Ancrage strings + ndisasm

```bash
ndisasm -b 16 -e 0x200 original/CRACKME1.EXE | head -40
```

Après l'attente clavier : boucle de somme, `div`, `cmp ax, 0x7B`, `JE +0x1D` vers l'offset qui charge `DX=01A0` (« May be later... »).
Juste après le `$` de ce leurre (fichier `0x2B5`) : blob non-ASCII qui, soustrait de `0x7B`, donne du texte clair.

### Patch minimal

Inverser le test : **`JE` → `JNE`** à `0x22F`. Le checksum reste `0x7B`, mais on tombe dans la boucle de déchiffrement avec la bonne clé.

Autres variantes possibles (readme : « few ways ») :

- NOP le `JE` (toujours déchiffrer) ;
- patcher la constante `0x7B` pour forcer l'inégalité tout en gardant `AX=0x7B` comme clé ;
- patcher directement le leurre / écraser avec le plaintext.

### Vérification

```bash
python3 tools/dlap-crackme1-solve.py --check
# simule checksum + déchiffrement ; assert message GOOD
python3 tools/dlap-crackme1-solve.py --patch analysis/CRACKME1-patched.EXE
# DOSBox : monter analysis/, lancer CRACKME1-patched.EXE, taper une touche
```

## Solveur

[`tools/dlap-crackme1-solve.py`](tools/dlap-crackme1-solve.py) — username exemple N/A (patchme).
