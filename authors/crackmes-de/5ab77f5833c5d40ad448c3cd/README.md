# crackmes.de's trevils_keyegnme_2 — keygenme.exe (trevil)

| | |
|---|---|
| **ID** | [`5ab77f5833c5d40ad448c3cd`](https://crackmes.one/crackme/5ab77f5833c5d40ad448c3cd) ([`ORIGIN.yml`](ORIGIN.yml)) |
| **Auteur (site)** | crackmes.de (Trevil // FHCF) |
| **Plateforme** | Windows PE32 GUI (dialogue), assembleur pur, non packé, sans anti-debug |
| **SHA-256 (zip)** | `aa5b8751c8a6255010d97296c45cf447e96936921ec74cdae7b3c48bdbc732d8` |
| **SHA-256 (`keygenme.exe`)** | `834c75a2d52bb08ae554aa42066846c5f4ef17b73cd8cf0299ab01cd508aeb11` |

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/keygenme2.zip` | archive d'origine (contient `keygenme.exe` + `Readme.txt`), non modifiée |
| `tools/trevil-keygenme2-solve.py` | keygen (`-q`, `--check`, `--user`, `--a`, `--b`) |
| `analysis/screenshot-fill.png` / `screenshot-ok.png` / `screenshot-ko.png` | preuve live Wine/xvfb |

## Réponse

Trois champs en plus du nom : **A** et **B** (exactement 10 chiffres chacun, libres) et un **serial de 64 caractères hex**.

| Name | A | B | Serial |
|---|---|---|---|
| `petik` | `1234567890` | `2654435769` | `b6b173a62ae886a4d63b851efb4237a5d63b851efb4237a5d63b851efb4237a5` |

```bash
python3 tools/trevil-keygenme2-solve.py                 # petik, A/B par défaut
python3 tools/trevil-keygenme2-solve.py --user petik -q # serial seul
python3 tools/trevil-keygenme2-solve.py --check         # auto-test
```

Le serial dépend de (nom, A, B) : changer A ou B donne un autre serial valide.

## Premier regard

```bash
unzip original/keygenme2.zip -d /tmp/x          # keygenme.exe, Readme.txt
file keygenme.exe                               # PE32 GUI, 4 sections
strings -n 5 keygenme.exe
objdump -d -M intel --no-show-raw-insn keygenme.exe
```

Strings utiles : `Flying.....Horse` (16 octets → clé), `Username must not exceed 24 chars.`, `Field A must be exactly 10 chars.`, `Field A/B must be numbers only.`, `The serial field must be 64 chars.`, `Seems to be something wrong with that serial.`, `That's one correct serial!!`. Le `Readme.txt` confirme : pas de packer, pas d'anti-debug, asm.

## Flow

Handler du bouton **Check** (ID `0x3f2`) → `0x401133` :

1. `GetDlgItemTextA` du nom (`0x3e9`) dans `0x40318c`, longueur `≤ 0x18` sinon erreur (`0x401262`).
2. Champ A (`0x3ea`) dans `0x40322c` : longueur `== 0xa`, puis `0x4017c2` vérifie que ce sont des chiffres `'0'..'9'`, puis `0x401840` = atoi maison (`ecx = ecx*10 + digit`, wrap 32 bits) → `[0x40322c]`.
3. Champ B (`0x3eb`) idem dans `0x4032cc` → entier.
4. Serial (`0x3ed`) dans `0x40336c`, longueur `== 0x40`.
5. `0x401494` : convertit 8 groupes de 8 caractères hex en 8 dwords (`0x4034ac..0x4034c8`) via `0x401878` (hex→int, premier caractère = nibble de poids fort).
6. `0x4012ee` : appelle 4 fois `0x401716` (déchiffrement d'un bloc de 8 octets) sur `0x4034ac`, `+8`, `+0x10`, `+0x18`, avec la clé `0x403004`.
7. `lstrcmpA(0x4034ac, 0x40318c)` : le texte déchiffré (arrêt au premier `\0`) doit être égal au **nom**. Succès → « That's one correct serial!! ».

## Comment on trouve le prédicat

### Ancrage

`objdump` : le handler `0x401133` enchaîne les contrôles de longueur puis les appels `0x401494` / `0x4012ee` / `lstrcmpA` (`call 0x4017fc` → thunk `jmp [0x402008]`, import `lstrcmpA`). Le cœur crypto est `0x401716`.

### Lecture du cœur (`0x401716`, commenté)

```asm
mov esi,[ebp+0xc]            ; clé : 4 dwords de "Flying.....Horse" (LE)
mov eax,[esi] ... mov edx,[esi+0xc]
mov [0x40317c],eax  ... mov [0x403188],edx    ; K0..K3
mov ebx,[ebp+8]              ; pointeur bloc
mov edx,[0x40322c]           ; edx = sum = champ A  (!)
mov esi,[ebx]                ; v0
mov edi,[ebx+4]              ; v1
mov ebp,0x20                 ; 32 tours
boucle:
  eax=(v0<<4)+K2 ; ebx=(v0>>5)+K3 ; ecx=v0+sum ; ecx^=eax^ebx ; v1 -= ecx
  eax=(v1<<4)+K0 ; ebx=(v1>>5)+K1 ; ecx=v1+sum ; ecx^=eax^ebx ; v0 -= ecx
  sub edx,[0x4032cc]         ; sum -= champ B  (delta)
  dec ebp ; jne boucle
```

C'est la boucle de **déchiffrement TEA** classique, avec deux changements :

- somme initiale = **A** (au lieu de `delta*32`) ;
- delta = **B** (au lieu de `0x9E3779B9`).

Le chiffrement TEA standard décrémente `sum` de `delta` à chaque tour de déchiffrement ; ici les valeurs sont donc contrôlées par l'utilisateur, d'où les deux champs de 10 chiffres.

### Inversion

Le prédicat est « Dec(serial) commence par le nom ». Comme `lstrcmpA` s'arrête au `\0`, il suffit de chiffrer le nom complété de `\0` jusqu'à 32 octets (4 blocs) avec l'inverse exact de la boucle :

```python
for i in range(31, -1, -1):        # tours à l'envers
    s  = (A - i*B) & M             # sum du tour i
    v0 = (v0 + f(v1, s, K0, K1)) & M
    v1 = (v1 + f(v0, s, K2, K3)) & M
# f(v,s,ka,kb) = ((v<<4)+ka) ^ (v+s) ^ ((v>>5)+kb)
```

Sérialisation : chaque dword chiffré → `%08x` (MSB d'abord, ce que fait `0x401878`), v0 puis v1, 4 blocs → 64 car.

Exemple `petik` : `70 65 74 69 6b 00 00 00` → bloc 0 = `b6b173a6 2ae886a4` ; les 3 blocs suivants sont tous nuls (32 `\0`), donc identiques : `d63b851e fb4237a5` × 3. Le serial final se lit `b6b173a62ae886a4` + `d63b851efb4237a5` ×3.

### Pièges

- `0x401878` accepte les majuscules (`sub al,0x57` + `adc`) mais le keygen sort du minuscule, plus simple.
- Le fait que seul le **premier** bloc compte (nom ≤ 8 car.) est trompeur : les 4 blocs sont tous déchiffrés mais la comparaison s'arrête au `\0` du bloc 0 ; pour un nom plus long, les blocs suivants portent le reste du nom. Les blocs d'après le `\0` sont libres (le keygen met des zéros).
- Focus Tab dans le dialogue : le champ Name est actif au lancement ; Tab enchaîne Name → A → B → Serial (multiligne) → Check.

## Vérification

Binaire d'origine sous Wine, saisie via `xdotool` dans `xvfb-run` :

```bash
unzip -o original/keygenme2.zip -d /tmp/live && cd /tmp/live
S=$(python3 tools/trevil-keygenme2-solve.py -q)
xvfb-run -a -s "-screen 0 800x600x24" bash -c '
  wine keygenme.exe & sleep 6; xdotool windowfocus $(xdotool search --onlyvisible --name . | head -1)
  for s in petik 1234567890 2654435769 '"$S"'; do xdotool type --delay 60 "$s"; xdotool key Tab; done
  xdotool key Return; sleep 2   # screenshot'
```

| Cas | Résultat |
|---|---|
| OK : `petik` / `1234567890` / `2654435769` / serial ci-dessus | « That's one correct serial!! Now.. write a tutorial and a keygen, :) » — [`screenshot-ok.png`](analysis/screenshot-ok.png) (saisie : [`screenshot-fill.png`](analysis/screenshot-fill.png)) |
| KO : même chose avec le serial modifié (`b6b1…` → `b6b2…`) | « Seems to be something wrong with that serial. » — [`screenshot-ko.png`](analysis/screenshot-ko.png) |

## Notes

- Pas de GDB / x64dbg / IDA MCP utilisés : reverse 100 % statique (`objdump`) + preuve live Wine.
- Ce n'est pas un TEA « standard » : sum initial et delta sont fournis par l'utilisateur ; la clé est constante.
- Le nom est limité à 24 caractères (`petik` convient).
