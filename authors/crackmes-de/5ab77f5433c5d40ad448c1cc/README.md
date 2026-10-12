# c_crackme_1 by ultrasound (crackmes.de)

- **Page** : <https://crackmes.one/crackme/5ab77f5433c5d40ad448c1cc>
- **Plateforme** : Windows PE32 GUI, MSVC 6 (C++ / Win32 API) — difficulté 2.0
- **Archive** : `original/CPP_Crackme1.zip` (mot de passe `crackmes.one`) → `CPP_Crackme1.exe` + `info.txt`
- **Statut** : résolu (keygen), vérifié par **émulation Unicorn de la vraie routine de vérification** (`0x401660`) — la GUI n'est pas pilotée sous wine/xvfb

## Solution

Mission (`info.txt`) : « Dont patch, too easy :) Make a keygen ». Name/Serial.

Le serial a la forme `ULT-<15 chiffres>-0141` (24 caractères) :

```
python3 tools/c-crackme-1-solve.py petik           ->  ULT-824815863156375-0141
python3 tools/c-crackme-1-solve.py --check petik   ->  ('Well Done!', 'Good serial!')
```

Algo (nom tronqué à 29 caractères) :

1. `b[i] = nom[i] ^ (i+1)` pour `i < len(nom)`, sinon `b[i] = ((T[i] ^ 0x5A) + i) % 0x39 + 0x41` (table de 30 dwords à `0x407030`), sur 30 octets.
2. `c = _swab(b)` (échange des octets deux à deux), puis chaque `c[i]` passe par `mov al, c[i] ; ror eax, 1` **sans remettre `eax` à zéro** (le bit 7 dépend de l'octet précédent).
3. `d[i] = (s ^ t) + s*t` avec `s = (int8)b[i]`, `t = (int8)c[i]` ; puis `d[i] += d[i+15]` pour `i < 15`.
4. Chiffre `i` = `(d[i] & 0xFF) % 9 + '0'`.

## Comment on trouve

1. `diec` : MSVC 6 (linker 5.12), pas de packer. `strings` ne montre ni « good » ni « wrong » : les messages sont chiffrés (déchiffrés par `sub_401b20` dans un buffer global `0x409754`).
2. Imports : `GetWindowTextA`, `lstrlenA`, `MessageBoxA`. Le seul gros appelant de `GetWindowTextA` sur l'edit du nom (`[0x40974c]`) est `sub_401660` → c'est le handler du bouton CHECK (listing dans `analysis/check.asm.txt`).
3. `0x401739–0x40178d` : boucle sur 30 dwords de `0x407030` → construction de `b[]` (nom XOR index+1, padding calculé depuis la table).
4. `call 0x401d8f(b, c, 30)` = `_swab` du CRT, puis boucle `ror eax,1` en `0x4017b0`, combinaison `(s^t)+s*t` en `0x4017d4`, repli `d[i]+=d[i+15]` en `0x401801`, et `% 9 + 0x30` en `0x401836`.
5. `0x401851–0x4018b6` : le serial « attendu » est construit en pile : `toupper(T[0..2]^0x63)` = `ULT`, `-`, 15 chiffres (`strncat`), `-`, puis `2413`.
6. **Piège** : `0x4019a9` ne compare que **20** caractères (`strncmp(serial, attendu, 0x14)`), et le serial doit faire ≥ 24 caractères. Ensuite `0x401a1c` teste `serial[20..23] ^ 0x63` == `S`,`R`,`W` et `serial[23] ^ 0x63 == serial[21] ^ 0x63` → `0141`. Le `2413` écrit dans le buffer est donc un leurre : `ULT-…-2413` est refusé.

## Vérification

- `tools/c-crackme-1-solve.py --check <nom> [serial]` charge le PE, mappe ses sections sous **Unicorn** et exécute la vraie fonction `0x401660` (code de l'auteur + CRT statique `_swab`/`strncat`/`strncmp`), en simulant uniquement `GetWindowTextA`, `lstrlenA` et `MessageBoxA`.
- `petik / ULT-824815863156375-0141` → `Well Done! / Good serial!` ; `petik / ULT-824815863156375-2413` → `Error! / Invalid serial!`.
- Keygen Python et émulation concordent sur `a`, `Ultrasound`, `crackmes.one`, un nom de 36 caractères (tronqué à 29) et `x y-z!`.
- Vérification par émulation du vrai code de vérif, pas par la GUI sous wine (fenêtre non pilotée ici).
