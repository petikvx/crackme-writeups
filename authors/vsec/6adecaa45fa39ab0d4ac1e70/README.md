# VSEC's VSEC — `Pafet_Challenge.exe` (**NON RÉSOLU — analyse partielle**)

- ORIGIN : [`ORIGIN.yml`](ORIGIN.yml) — [crackmes.one](https://crackmes.one/crackme/6adecaa45fa39ab0d4ac1e70)
- Auteur : VSEC — Windows x64, C/C++ (VC++ 2019), 600 pts, 1 solve (arshi) au moment de l'analyse
- Consigne du site : « Require valid username and serial number — Goal: get the Flag »

| Fichier | Rôle |
|---|---|
| `original/Pafet_Challenge.exe` | binaire d'origine (PE32+ console, 4,3 Mo, CRT MSVC statique), sha256 `fe85e592…4d1a` |
| `analysis/vm_dispatch.c` | extrait Hex-Rays du dispatcher VM natif `sub_140396990` |
| `analysis/pafet.c` | dump `decc` complet (~600k lignes) |
| `tools/vmtrace.c` | traceur Win32 (debug API, à lancer sous Wine) : int3 sur le dispatcher VM, le décodeur de chaînes, SHA-256 |
| `tools/sha256-bruteforce.c` | brute-force SHA-256 multi-thread (OpenSSL, ~70 M/s) |

## État : ce qui est établi / ce qui manque

**Manque** : le username attendu (préimage SHA-256 d'une constante) et donc le serial. Pas de flag, pas de solveur : `status: pending`.

## Flow (confirmé à la trace sous Wine)

Le programme est une « VM » C++ obfusquée (machines à états aplaties, exceptions C++ `vm_main_Sig`, `vm_des_block_Sig`… utilisées comme flot de contrôle). Les chaînes sont chiffrées : décodeur `sub_140380840(idx)` (tables `dword_1403E8A58` offsets, `dword_1403E94D8` longueurs, `byte_1403EA790` données), portage Python fait et validé.

Chaînes utiles : 0 = `9419f86b97bd379906be72ea80517c075a499d0db0a37499132c2d203cc21420`, 4 = `Username: `, 5 = `Serial  : `, 6 = `[!] Invalid username`, 8 = `CMO{`, 9 = `[+] Correct!`, 10 = `[+] Flag: `, 12 = `[!] Wrong credentials`.

Opérations natives de la VM (`sub_140396990(closure, op, args)`, switch 0–23) :

1. op0 charge le hash (chaîne 0) ; op1–3 bannière ; op4/5 prompts ; op5/7 `getline` username puis serial.
2. **op8** : `SHA256hex(username) == chaîne 0` (`sub_1402831C0`, IV SHA-256 visible). Sinon → « Invalid username ».
3. op10 : `f(username)` ; op11 : `g(serial)` ; op12 concatène `f‖g` ; op13 tronque à 24 octets ; op14/15 complète par des `\0` → **clé 3DES de 24 octets**.
4. op16 : charge le chiffré (72 octets) :
   `6f56f79c3e348835aa3c3fc5f551d501dea5dfcdcf3a013b0e3f8292ff4954b3455024b373acad827d1fc843f19f3a9ca9907f072ef55099ceadf0798f782d09abb0a67da54ba93b`
5. **op19** : 3DES-ECB déchiffrement (DES standard, vérifié avec pycryptodome), **appliqué 3 fois de suite** (P = D³(C)).
6. op20 : le résultat doit commencer par `CMO{` et finir par `}` → op22 affiche « [+] Flag: … », sinon op23 « Wrong credentials ».

### Dérivation de la clé

- `f(username)` : on inverse le username ; pour la sortie j, `T0[c[n-1-j]] + 3·j (mod 256)`. Table T0 mesurée par sonde (op8 forcé à OK) sur ASCII 0x21–0x7e, sauf `A` (non mesuré) : `T0 = 0x9f − (c & ~7) + ((c & 7) ^ 2)` avec −0x40 en plus pour 0x40–0x5f. Vérifié : `petik` → `38 3d 3b 4f 3d`.
- `g(serial)` : `serial[i] XOR K[i]`, keystream fixe `K = de 18 89 41 a3 37 5d 3a …` (8 premiers octets connus ; `1234` → `ef2aba75`).
- Exemple `petik` / `1234` : clé = `383d3b4f3d ef2aba75` + 15 octets nuls.

Conséquence : seul le couple (username exact, serial exact) donne le bon flag ; le serial n'est pas contraint par un check séparé — c'est la réussite du déchiffrement (`CMO{…}`) qui valide.

## Méthode / pièges (utile pour reprendre)

- `decc` : ~5 min, dump énorme ; le prédicat est noyé dans la VM → préférer tracer.
- **Wine + stdin** : tubes/fichiers donnent « Invalid username » immédiat → utiliser un pty et `\r`.
- **gdb sous Wine** : peu fiable (breakpoints perdus, hw bp/catch syscall KO). `tools/vmtrace.c` (CreateProcess `DEBUG_ONLY_THIS_PROCESS`, int3 manuels) fonctionne :
  `x86_64-w64-mingw32-gcc -O2 -o vmtrace.exe tools/vmtrace.c` puis `wine vmtrace.exe <exe> trace.txt` (variable `FORCE8=1` force op8 à OK, pour sonder `f`/`g` sans connaître le username).
- Émulation Unicorn de la CRT : bloquée au 1er `throw` C++ (pas d'unwinding SEH) → abandonnée.
- Chargement du PE en DLL : IAT non résolue → abandonné.

## Tentatives sur la préimage SHA-256 (toutes négatives)

- Brute-force exhaustif : `[a-zA-Z0-9]` longueurs 1–6 ; `[a-z0-9]` longueurs 1–6 (7 interrompu).
- ~33 k candidats ciblés : VSEC/Pafet/CMO/elite/admin/petik + variantes leet/casse/chiffres, mots de `/usr/share/dict` avec variantes de casse.
- Recherche web du hash : rien.

## Pistes pour la suite

1. Username probablement un mot/phrase hors dictionnaire ou long (≥7) : essayer hashcat/john avec rockyou + règles, thème « Pafet », « VSEC », « CMO » (préfixe de flag), pseudos de l'auteur.
2. Chercher l'indice dans le dump (`analysis/pafet.c`) : chaînes/commentaires de l'auteur, éventuel username en clair dans un autre chemin de la VM.
3. Écrire/ajouter le solveur dès que le username est trouvé : pour le serial, énumérer `S`, calculer `g(S)` avec le keystream (à étendre au-delà de 8 octets en sondant), clé = `f‖g‖0`, 3×3DES-ECB sur C, tester `CMO{…}`. Rappel : une clé courte (K2=K3) dégénère en DES simple, mais les octets inconnus du keystream restent à mesurer.
4. Le site dit « no limitation » : une alternative est de patcher/émuler pour sauter op8 — mais le flag dépend de la clé, donc le serial correct reste nécessaire.
