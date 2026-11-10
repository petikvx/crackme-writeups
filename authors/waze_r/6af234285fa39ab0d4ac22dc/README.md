# Waze_r's rick_theroll_morty (`the_gate.exe`)

| | |
|---|---|
| **ID** | [`6af234285fa39ab0d4ac22dc`](https://crackmes.one/crackme/6af234285fa39ab0d4ac22dc) ([`ORIGIN.yml`](ORIGIN.yml)) |
| **Auteur** | Waze_r |
| **Plateforme** | Windows PE64 console, MinGW-w64 (GCC 16.2, UCRT), non packé |
| **SHA-256** | `77d8c3aed6cf0b5832a6100d4bee58782a13f6c2c0be1b1e8305d9556e2b7847` |

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/the_gate.exe` | binaire d'origine (intact) |
| `tools/the-gate-solve.py` | solveur : rejoue le prédicat et affiche le flag ; `--check` vérifie sous Wine |

## Réponse

**Phrase à saisir : `never gonna give you up`**
(insensible à la casse, espaces/tabulations de début et de fin ignorés)

Flag affiché : **`CMO{n3v3r_g0nna_run_4round_4nd_desert_y0u}`**

```bash
python3 -I tools/the-gate-solve.py          # phrase + flag
python3 -I tools/the-gate-solve.py -q --check   # flag seul + preuve sous wine
```

Pas de notion d'utilisateur ici (pas de nom/serial) : le crackme attend une phrase unique.

## Premier regard

```text
$ file original/the_gate.exe   → PE32+ console x86-64, 12 sections
$ strings -n 6 original/the_gate.exe
  ####  THE GATE  ####
  speak the phrase and the gate opens.
  (hint: it's a big meme. a clue was left for you elsewhere.)
  ... FLAG: %.*s / [x] ACCESS DENIED. / the gate does not move. you are... let down.
never gonna let you down
```

- Le hint désigne le « meme » (Rickroll). Le « clue left elsewhere » est la section PE atypique **`.raze`** (VA `0x140007000`) qui contient `never gonna let you down`.
- **Piège** : cette chaîne est un leurre. Elle n'est pas la bonne phrase (testée : `ACCESS DENIED`). Le texte « let down » du message d'échec est un clin d'œil. La bonne est le premier vers : `never gonna give you up`.
- Pas de flag en clair dans le binaire : il est chiffré, donc la phrase sert de clé.

## Flow

```text
main (0x140003c40)
  affiche la bannière, lit une ligne (fgets, 0x200)
  → saute les espaces/tabs de tête, tolower() sur chaque octet (arrêt à \r \n), rtrim espaces/tabs
  → SHA-256(phrase)                       (0x140001bf0 + boucle 0x140001760)
  → clé = ces 32 octets, AES-256 (aeskeygenassist/aesdec, AES-NI)
  → déchiffre 48 octets @0x1400061a0 (3 blocs)
  → pad = dernier octet ; doit être dans 1..16 (PKCS7)
  → SHA-256(plain[:48-pad]) == 32 octets @0x140006180 (memcmp)
  → oui : "the gate swings open." + printf("FLAG: %.*s", 48-pad, plain)
  → non : "[x] ACCESS DENIED." + "the gate does not move..."
```

## Comment on trouve

**Ancrage** : `strings -t x` donne `THE GATE` en offset fichier `0x3a60` = VA `0x140006060` (`.rdata` à `0x3a00` ↔ `0x140006000`). Le seul `lea rcx,[rip+…]` vers cette adresse est dans la fonction `0x140003c40` (le vrai `main`, appelé via `0x140003b40`/CRT depuis `0x1400013b5`). On la lit avec `objdump -d -M intel` :

```asm
140003c59  lea  rcx,[rip+0x2400]   ; 0x140006060  "####  THE GATE  ####"
...
140003cb3  call fgets             ; buffer @rsp+0x250, 0x200 octets
140003d1a  call rdi               ; rdi = [0x14000c478] = tolower, un appel par octet
140003d79  lea  r8,[rsp+0x20]     ; sortie 32 octets
140003d7e  mov  rdx,rbx           ; longueur de la phrase (après rtrim)
140003d88  call 0x140001bf0       ; SHA-256(phrase)
140003dad  aeskeygenassist xmm4,xmm1,0x1 ... 0x40   ; expansion de clé AES-256 (rcon 1,2,4,..,0x40)
...
14000416d  movzx eax,BYTE PTR [rsp+0x6f]   ; dernier octet déchiffré = octet de padding
140004172  lea  edx,[rax-0x1] ; cmp edx,0xf ; ja ...   ; pad ∈ [1,16]
140004190  call 0x140001bf0       ; SHA-256 du clair sans padding → rsp+0x160
14000419b  lea  rdx,[rip+0x1fde]  ; 0x140006180 : 32 octets attendus
1400041aa  call memcmp(…, 0x20)
1400041b3  test eax,eax ; je 0x1400041f8   ; égal → "swings open" + FLAG: %.*s
```

**Identification des primitives** (les noms `fgets`, `tolower`, `memcmp`, `aesdec` sont déduits du comportement et des arguments, le binaire étant strippé) :
- `0x140001760` : constantes visibles par blocs (rotations 7/18/3 puis 17/19/10 dans le `pslld/psrld`, tableau `0x428a2f98…` à `0x1400061e0`) → SHA-256 vectorisé SSE.
- `aeskeygenassist` avec rcon 1,2,4,8,0x10,0x20,0x40 et la structure à deux demi-clés de 16 octets → AES-256 ; la clé fait donc 32 octets = exactement un SHA-256. La boucle finale (`0x1400040e4`, 3 tours de 0x10) traite 3 blocs de 16 octets sans chaînage, soit de l'**ECB**.
- Blob chiffré `0x1400061a0..0x1400061cf` (48 octets), hash attendu `0x140006180..0x14000619f` :
  `30080f90 88eb6217 9ea8140f 69f8036e aff6ee72 bfad4872 f4824648 18ca475d`.

**Assemblage de la réponse** : la phrase est inversible seulement par candidat. Le hint (meme + « big ») suggère le Rickroll. On teste les vers : `SHA256("never gonna give you up")` = `6f024c51…66b93` comme clé AES-256-ECB sur le blob donne un clair terminé par un padding valide, et son SHA-256 égale les 32 octets attendus. C'est ce test d'intégrité qui rend la preuve non ambiguë : une mauvaise phrase donne un clair aléatoire qui échoue au `memcmp` (ou au test de padding). `never gonna let you down` (le leurre de `.raze`) échoue.

**Pièges** :
- La section `.raze` et le texte « let down » orientent vers un faux vers.
- Le `tolower` + trim rend la saisie tolérante : `  Never Gonna Give You Up ` fonctionne aussi (testé).
- Le flag n'existe jamais en clair ; `strings` ne le montre pas.

## Solveur (`tools/the-gate-solve.py`)

Rejoue exactement le prédicat avec `cryptography` (AES-ECB) : `strip(" \t").lower()` → SHA-256 → déchiffrement du blob lu **dans le binaire** → PKCS7 → vérification SHA-256 du clair contre les 32 octets attendus. Une autre phrase peut être testée avec `--phrase`, ce qui permet aussi de tester un dictionnaire de vers de la chanson.

## Vérification

```text
$ python3 -I tools/the-gate-solve.py -q --check
CMO{n3v3r_g0nna_run_4round_4nd_desert_y0u}
binaire (wine): OK

$ echo "never gonna give you up" | xvfb-run -a wine original/the_gate.exe
  the gate swings open.
  FLAG: CMO{n3v3r_g0nna_run_4round_4nd_desert_y0u}

$ python3 -I tools/the-gate-solve.py --phrase "never gonna let you down" --check
flag  : None
binaire (wine): KO            # le leurre de .raze → "ACCESS DENIED"

$ printf '  Never Gonna Give You Up \n' | xvfb-run -a wine original/the_gate.exe   # casse/espaces tolérés
  FLAG: CMO{n3v3r_g0nna_run_4round_4nd_desert_y0u}
```

## Notes

- Reverse 100 % statique (`objdump`) + preuve live sous Wine ; ni GDB, ni x64dbg, ni IDA n'ont été utilisés (pas de section Debug GDB).
- Ce que ce n'est pas : un simple `strcmp`. La phrase n'apparaît nulle part dans le binaire, seul le chiffrement + hash d'intégrité la valide.
- Le binaire d'origine dans `original/` n'a pas été modifié.
