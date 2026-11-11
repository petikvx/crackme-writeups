# illusionxxx's simple crackme

| | |
|---|---|
| **ID** | [`6929c3af2d267f28f69b8196`](https://crackmes.one/crackme/6929c3af2d267f28f69b8196) · [`ORIGIN.yml`](ORIGIN.yml) |
| **Auteur** | illusionxxx |
| **Plateforme** | Windows PE64 (MinGW-w64, C++/iostream, console) |
| **SHA-256** (`original/download.bin`) | `52fb92e1616f562cf0f01dda1f7b5d6e257341634ac8906d95985f601cf15dd3` |

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/download.bin` | ZIP du site (mdp `crackmes.one`) contenant `a.exe` — **non modifié** |
| `analysis/x/a.exe` | `a.exe` extrait pour l'analyse |
| `tools/simple-crackme-solve.py` | solveur + `--check` (émulation unicorn de la vraie routine) |

## Réponse

**Mot de passe : `d7pghz8m`** (pas de nom d'utilisateur → pas d'exemple `petik`)

```bash
python3 tools/simple-crackme-solve.py          # password = d7pghz8m
python3 tools/simple-crackme-solve.py -q       # d7pghz8m
python3 tools/simple-crackme-solve.py --check  # unicorn : d7pghz8m OK, AAAAAAAA KO
```

## Premier regard

- `original/download.bin` n'est pas un exécutable mais un **ZIP** (`PK`, entrée `a.exe`, 16 896 octets) :
  `python3 -c "import zipfile;zipfile.ZipFile('original/download.bin').extractall('analysis/x',pwd=b'crackmes.one')"`.
- `a.exe` : PE32+ x86-64, 9 sections (`.text .data .rdata .pdata .xdata .bss .idata .tls .reloc`), runtime MinGW-w64 (chaînes `Mingw-w64 runtime failure`).
- `strings` utiles dans `.rdata` : `Wrong!\n` (0x140004000), `Good Job!` (0x140004008), `Welcome to simple crackme\n` (0x140004012). Le reste est du bruit CRT (`_matherr`, pseudo-relocations).

## Flow

`main` (0x140002a40) : affiche le banner, lit une ligne (`getline` sur `cin`), calcule `XOR(saisie)`, compare octet par octet à une chaîne globale de 8 octets ; match → `Good Job!`, sinon → `Wrong!` puis `exit(1)`.

## Comment on trouve

Ancrage : `objdump -d -M intel a.exe` (pas de symboles). Les `lea rdx,[rip+…]` vers les chaînes de `.rdata` mènent directement à `main` : `0x140002a6d` charge `Welcome…` (0x140004012), `0x140002cef` charge `Wrong!` (0x140004000), et `0x140001570` (appelé en `0x140002be1`) imprime `Good Job!` (0x140004008).

1. **Transformation** — après `getline`, `main` appelle `0x140001470(out=r12, in=rbp)` :

```asm
140001470  push rbx
140001471  xor  eax,eax
140001476  mov  rcx,rdx            ; rcx = std::string d'entrée
140001479  mov  rdx,[rdx+8]        ; rdx = size()  (la « clé » = la longueur)
14000147d  jmp  140001491
140001480  mov  r8,[rcx]           ; ptr données
140001483  add  r8,rax             ; + i
140001486  add  rax,1
14000148a  xor  [r8],dl            ; saisie[i] ^= (len & 0xff)
14000148d  mov  rdx,[rcx+8]
140001491  cmp  rax,rdx
140001494  jb   140001480
```
   Chaque octet est donc XORé avec la **longueur de la saisie** (le reste de la fonction n'est que le move du `std::string`).

2. **Comparaison** — `0x140002bb0…` :

```asm
140002b9c  mov  rcx,[0x140007048]       ; taille attendue = 8
140002baa  mov  r8,[0x140007040]        ; ptr vers la chaîne attendue
140002bc0  movzx edx,byte [r9+rax]      ; octet transformé
140002bc9  cmp  dl,[r8+rax-1]
140002bce  jne  140002cea               ; -> Wrong!
140002bd4  cmp  rax,rcx / jne 140002bc0 ; 8 tours
```
   La **taille 8 est fixée** (`cmp rax,rcx`, `rcx=8`) : seule une saisie de longueur 8 peut matcher → clé XOR = 8.

3. **Chaîne attendue** — construite par le ctor statique `0x140002d30` (std::string globale, SSO) :
```asm
140002d4c  movabs rax,0x653072606f783f6c   ; -> 140007050
140002d5d  mov    qword [140007048],8
```
   LE : `6c 3f 78 6f 60 72 30 65` = `l?xo`0re` (piège : pas du texte clair, c'est le résultat du XOR).

4. **Inversion** : `saisie[i] = attendu[i] ^ 8`

| i | attendu | ^8 | car. |
|---|---|---|---|
| 0 | 6c | 64 | `d` |
| 1 | 3f | 37 | `7` |
| 2 | 78 | 70 | `p` |
| 3 | 6f | 67 | `g` |
| 4 | 60 | 68 | `h` |
| 5 | 72 | 7a | `z` |
| 6 | 30 | 38 | `8` |
| 7 | 65 | 6d | `m` |

→ `d7pghz8m`.

Pièges : le ZIP déguisé en `.bin` ; la clé XOR n'est pas une constante mais `size()` ; le grand nombre de fonctions CRT/libstdc++ (reloc pseudo, TLS…) qui noient `main`.

## Vérification

Ni Wine ni GDB ne sont installés sur la machine de travail : **pas de run live sous Wine**, donc pas de section Debug GDB. La preuve est une **émulation unicorn du code réel du PE** (`--check`) : on charge `a.exe` (en-têtes + `.text`), on émule la vraie routine `0x140001470` sur un `std::string` SSO contenant la saisie, puis on compare le résultat à l'imm64 lu dans le binaire :

```text
$ python3 tools/simple-crackme-solve.py --check
unicorn: 'd7pghz8m' -> OK ; 'AAAAAAAA' -> KO
```

Cas KO : `AAAAAAAA` (longueur 8 mais mauvais octets). Toute saisie de longueur ≠ 8 est rejetée par la comparaison de taille. La partie `getline`/affichage n'est pas émulée (lecture statique).

## Notes

- Limitation honnête : validé par émulation de la routine de transformation + lecture statique de la comparaison, pas par exécution console complète.
- Pas de patch, `original/` intact.
