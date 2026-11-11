# whekkees's my first simple crack me by whekkees

| | |
|---|---|
| **ID** | [`69b18083ddd6176826ae8947`](https://crackmes.one/crackme/69b18083ddd6176826ae8947) · [`ORIGIN.yml`](ORIGIN.yml) |
| **Auteur** | whekkees |
| **Plateforme** | Windows PE64 console (MSVC Release, C++ `iostream`) |
| **SHA-256** (zip `download.bin`) | `f5c035dcf70db04111097c92f90b94f70bb2eebf79f1cfcf119b019bfc6bfb17` |

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/download.bin` | ZIP (mot de passe `crackmes.one`) contenant `crackme.exe` (18 944 octets) |
| `tools/whekkees-solve.py` | affiche la réponse ; `--check` émule le check du PE avec unicorn |

## Réponse

| Login | Password |
|---|---|
| **`whekkees`** | **`qwert`** |

```bash
python3 tools/whekkees-solve.py        # login / password
python3 tools/whekkees-solve.py -q     # whekkees:qwert
python3 tools/whekkees-solve.py --check
```

Le login est fixe (pas de keygen) : le crackme ne dérive rien de l'entrée, donc `petik` est refusé (« Wrong login »).

## Premier regard

- `download.bin` est un ZIP, pas un exe : `unzip -P crackmes.one original/download.bin -d /tmp/wk` → `crackme.exe`.
- PE64 MSVC (PDB `C:\sancikovich\crackme\x64\Release\crackme.pdb`), imports CRT/`msvcp`.
- `strings` : `Please enter your login: `, `Wrong login`, `Please enter your password: `, `Access`, `Wrong password`. Aucune chaîne de login/password en clair : les constantes sont des *immediates* dans le code.

## Flow

`login` lu avec `cin >>` dans un `std::string` → comparé à une constante de 8 octets → `password` lu → comparé à une constante de 5 octets → `Access` sinon `Wrong password` / `Wrong login`.

## Comment on trouve

Ancrage : `objdump -d -M intel crackme.exe`, puis recherche des `lea rdx,[rip+…]` vers les messages (`.rdata` 0x140003408 « Please enter your login », 0x140003428 « Wrong login », 0x140003458 « Access », 0x140003460 « Wrong password »). Tout se passe dans la fonction `0x1400012a0` (appelée par `main`).

```asm
1400012f2: lea rdx,[0x140003408]     ; "Please enter your login: "
140001300: call 0x140001610           ; cout << …
140001310: call 0x1400017f0           ; cin >> login  (std::string en [rbp-0x28], size en [rbp-0x18])
140001315: mov DWORD [rbp-0x50],0x6b656877   ; 'w','h','e','k'  (u32 little-endian)
14000131c: mov DWORD [rbp-0x4c],0x7365656b   ; 'k','e','e','s'
14000132b: cmp QWORD [rbp-0x18],0x8           ; longueur == 8 sinon « Wrong login »
140001351: cmp BYTE [rcx+rdx],al              ; boucle octet par octet, 8 itérations
```

Décodage : les deux immediates sont lus en LE → `77 68 65 6b` = `whek`, `6b 65 65 73` = `kees` → **`whekkees`** (le nom de l'auteur).

Même schéma pour le mot de passe :

```asm
140001386: mov DWORD [rbp-0x50],0x72657771   ; 'q','w','e','r'
14000138d: mov BYTE  [rbp-0x4c],0x74         ; 't'
140001399: cmp QWORD [rbp-0x38],0x5           ; longueur == 5
1400013bb: cmp rdx,5 / jl                     ; compare 5 octets → « Access »
```

`71 77 65 72` + `74` = **`qwert`**. Le buffer `[rbp-0x50]` est réutilisé pour les deux constantes ; l'`std::string` SSO (≤ 15 octets) est inline, d'où le `cmova rcx,rdi` qui choisit buffer inline/heap selon la capacité (`cmp r14,0xf`).

Pièges : `strings` ne montre pas les secrets (immediates `mov`), et le fichier `.bin` est un zip.

## Debug GDB / live

Non utilisé : ni `gdb`, ni `wine`, ni debugger MCP disponibles sur cette machine. Reverse 100 % statique + émulation (voir ci-dessous).

## Vérification

`--check` mappe le PE sous unicorn, exécute `0x1400012a0` en hookant `cout <<` (0x140001610, capture le message) et `cin >>` (0x1400017f0, injecte la saisie dans la `std::string`) :

```text
whekkees:qwert -> ['Access']
whekkees:wrong -> ['Wrong password']
petik:qwert    -> ['Wrong login']
```

Limite honnête : preuve par émulation de la fonction de check du binaire d'origine (non modifié), pas par une exécution Wine native (indisponible ici).

## Notes

- Comparaison classique, pas d'anti-debug, pas de transformation : c'est un « first crackme ».
- Rien n'a été patché ; `original/` est intact.
