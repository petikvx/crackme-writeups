# crackme_2 by thefox (crackmes.de)

- **Page** : <https://crackmes.one/crackme/5ab77f5533c5d40ad448c1e0>
- **Plateforme** : Windows **PE32** GUI (dialogue), win32asm **MASM**, non packé — difficulté 1.0
- **Archive** : `original/crackme2.zip` → `crackme2.exe` + `readme.txt`
- **Statut** : résolu (keygen), vérifié par **émulation Unicorn du vrai code** du binaire (GUI non pilotable en headless)

## Solution

```
python3 tools/crackme2-thefox-solve.py petik            →  C4CP-Z3DP
python3 tools/crackme2-thefox-solve.py --check "The FoX" petik
'The FoX' -> G5ZV-OFLJ   [emu: WELL DONE! | AAAA-AAAA: OH SHIT...]
'petik'   -> C4CP-Z3DP   [emu: WELL DONE! | AAAA-AAAA: OH SHIT...]
```

Le couple d'exemple du `readme.txt` (`The FoX` / `G5ZV-OFLJ`) est bien régénéré par le keygen.

### Algorithme

1. **Nom** (`GetDlgItemTextA`, id `0x2bc`, ≥ 3 caractères) → deux DWORD `h0`, `h1` :
   ```
   edx = h0 = h1 = 0
   pour chaque octet c :  ebx = c*0x24 ; edx ^= ebx ; h0 += edx
                          edx += ebx ; ebx ^= edx ; h1 += ebx
   ```
2. Les 8 octets `h0‖h1` (little-endian) passent chacun dans **une de 6 mini-fonctions** à `0x401000 + 4*(b % 6)` :
   `add al,49` · `sub al,99` · `xor al,32` · `ror al,4` · `rol al,3` · `and al,F0`.
   Avant chaque appel, l'**immédiat** de la fonction choisie est xoré par `cl` (code **auto-modifiant**) ;
   `cl` part de `0x69` et subit `rol cl,7` à chaque octet. Les immédiats sont restaurés depuis `0x403202` au début de chaque vérif.
3. Résultat `al % 40` → index dans une table de 40 octets (`0x4031da`) qui contient les caractères du serial **moins 0x55**.
4. Comparaison avec le serial transformé (voir ci-dessous) → `WELL DONE!` / `OH SHIT...`.

### Le piège côté serial

- Le serial n'est pas lu au clic : à chaque **EN_CHANGE** (id `0x2bd`), le handler met un flag `[0x4031d9]=1` puis fait `WM_GETTEXT` (wParam = 10) dans `0x4031d0`.
  Le flag est l'octet **juste après** les 9 caractères : il n'est remis à 0 que par le NUL terminal si le serial fait **exactement 9 caractères** (ou plus, tronqué). Sinon la vérif refuse tout.
- Les `-` sont retirés et chaque caractère subit `-0x55`, en place.
- `repz cmpsb` avec `ecx = 9` : le 9ᵉ octet n'a aucune importance (ecx tombe à 0 même s'il diffère) → seuls 8 caractères comptent. Format `XXXX-XXXX`.

## Comment on trouve

1. `strings` : `WELL DONE!` / `OH SHIT...`, imports `GetDlgItemTextA`, `SendMessageA`, `DialogBoxParamA` → appli dialogue.
2. `objdump -d -M intel` : le `.text` fait 0x244 octets. Au début, six stubs `nop ; op al,imm ; ret` de 4 octets chacun — table de saut indexée par `lea ebx,[edx*4+0x401000]` puis `call ebx` dans la routine `0x40113a`.
3. Le `xor byte [ebx+2], cl` juste avant le `call` montre qu'on patche l'immédiat de la fonction appelée (section `.text` en écriture).
4. Le DlgProc (`0x401039`) : `WM_COMMAND` id `0x2bd` + notification `0x300` (EN_CHANGE) → lecture/transformation du serial ; id `0x29b` → vérif.
5. `.data` : table `0x4031da` (`f2 f6 fb …` = `G 5 Z …` − 0x55) et copie des immédiats `49 99 32 04 03 f0` à `0x403202`.

## Vérification

- Le crackme est une GUI sans pilote headless fiable : `tools/crackme2-thefox-solve.py --check` charge les sections du PE dans **Unicorn** et exécute **le vrai code** :
  la transformation EN_CHANGE (`0x4010bc`–`0x4010da`) puis la routine `0x40113a` (stubs auto-modifiants compris), `GetDlgItemTextA` étant simulé.
  Le message retourné est `WELL DONE!` pour le serial généré, `OH SHIT...` pour `AAAA-AAAA`.
- Le keygen retrouve le couple officiel `The FoX` / `G5ZV-OFLJ` du `readme.txt`.
