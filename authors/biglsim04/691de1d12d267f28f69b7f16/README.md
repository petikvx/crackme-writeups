# Biglsim04's puzzle

| | |
|---|---|
| **ID** | [`691de1d12d267f28f69b7f16`](https://crackmes.one/crackme/691de1d12d267f28f69b7f16) · [`ORIGIN.yml`](ORIGIN.yml) |
| **Auteur** | Biglsim04 |
| **Plateforme** | Windows PE64 console, C++ MSVC 2022 (LTCG, CRT statique) |
| **SHA-256 (zip)** | `5bc42934ff7111b306e2adeffdf462ce686621e10876e08bbcb606d85f73b6ed` |

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/puzzle.zip` | archive d'origine (mot de passe zip `crackmes.one`, contient `puzzle.exe`) — non modifiée |
| `analysis/extracted/puzzle.exe` | exe extrait (`7z x -pcrackmes.one`) |
| `analysis/puzzle.asm` | `objdump -d -M intel` complet |
| `tools/puzzle-solve.py` | solveur (`-q`, `--check`) |

## Réponse

**Mot de passe : `MYPASS123`** (pas de login, donc pas de `petik` ici).

```bash
python3 -I tools/puzzle-solve.py -q          # MYPASS123
python3 -I tools/puzzle-solve.py --check     # lance puzzle.exe sous wine (xvfb-run)
```

## Premier regard

- `file` : PE32+ console x86-64 ; `diec` : MSVC 19.41, VS2022. Pas de packer.
- `strings` ne montre **aucun** message : « Enter password: », « Access Granted! » sont absents en clair (XOR `0x9f`, voir plus bas).
- Run : `Hello World!` puis `Enter password: ` puis `Access Denied!`.

## Flow

`entry 0x140004390` → CRT → `main = 0x1400029d0` → appelle `0x1400025c0` (le vrai travail) puis `0x1400029f0`.

`0x1400025c0` :
1. une petite « mini-VM » (`0x140002240`, handlers `0x140001ff0 / 0x140002030 / 0x1400020d0 / 0x140002100 / 0x1400021d0 / 0x140002200 / 0x140002210`, avec `rdtsc`, `imul`…) qui interprète un bytecode ; son résultat n'est **jamais** utilisé dans la comparaison → leurre ;
2. affichage des messages décodés (XOR 0x9f, voir ci-dessous) ;
3. lecture de la saisie (`0x14000c070`, getchar-like) dans un buffer de 0x40 octets ;
4. vérification longueur == 9 puis comparaison octet par octet ;
5. affichage « Access Granted! » ou « Access Denied! ».

## Comment on trouve

**Ancrage** : `objdump -d -M intel puzzle.exe`, on remonte `entry` → `main` (`0x1400029d0`) → `0x1400025c0`.

**Messages XOR 0x9f** : des immédiats DWORD empilés puis une boucle qui décode jusqu'au terminateur `0x9f` :

```asm
mov DWORD PTR [rbp-0x79],0xfaebf1da   ; 'E','n','t','e' ^ 0x9f (LE)
mov DWORD PTR [rbp-0x75],0xfeefbfed   ; 'r',' ','p','a'
...
xor al,0x9f ; call 0x140003280 (putchar-like) ; cmp al,0x9f ; jne
```
Décodés : `Enter password: `, et pour la fin `0xfafcfcde…` = `Access Granted!` / `Access Denied!`.

**Comparaison** (`0x140002840` – `0x1400028a7`) :

```asm
cmp rcx,0x9            ; longueur de la saisie == 9
lea rdi,[rip+0x28cdd]  ; 0x14002b550
movzx eax,BYTE PTR [rdx+rdi]
xor al,0x9f            ; octet attendu = table[i] ^ 0x9f
cmp cl,al              ; vs saisie[i]
```

**Décodage** : VA `0x14002b550` → offset fichier = `0x2b550 - 0x21000 + 0x20200 = 0x2a750`. Octets : `d2 c6 cf de cc cc ae ad ac` (suivis de `9f` terminateur) ; `^0x9f` → `4D 59 50 41 53 53 31 32 33` = `MYPASS123`.

**Pièges** : la mini-VM (rdtsc, constantes `0x45d9f3b`, `0xa5a5a5a5`, `0x539`) est du bruit anti-lecture, sans effet sur le résultat ; `strings` ne trouve rien car tout est XORé ; le zip est en AES (`unzip` refuse, utiliser `7z`).

## Vérification

Sous Wine (`xvfb-run -a wine puzzle.exe`, stdin) :

| Saisie | Sortie |
|---|---|
| `MYPASS123` | `Enter password: Access Granted!` |
| `wrong` | `Enter password: Access Denied!` |

Obtenu via `python3 -I tools/puzzle-solve.py --check`.

## Notes

Reverse 100 % statique (objdump) + preuve Wine ; ni GDB, ni IDA, ni debugger live utilisés → pas de section « Debug GDB ».
