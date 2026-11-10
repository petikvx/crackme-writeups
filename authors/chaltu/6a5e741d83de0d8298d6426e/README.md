# chaltu's FRONTLINES

| | |
|---|---|
| **ID** | [`6a5e741d83de0d8298d6426e`](https://crackmes.one/crackme/6a5e741d83de0d8298d6426e) · [`ORIGIN.yml`](ORIGIN.yml) |
| **Auteur** | chaltu |
| **Plateforme** | Windows PE64 console, Rust (MSVC), non packé |
| **SHA-256** (`original/download.bin`, ZIP) | `72198a6717fd9ca4cf1a4f279e9969fc5821ea90cd8a6c936585ba33aa4fbd8b` |
| **SHA-256** `crackme.exe` (extrait) | `b4c4969d17607c78feef7e1aee366e8de7948f955e6788c8d728a48c06ed9756` |

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/download.bin` | ZIP d'origine (mot de passe `crackmes.one`, contient `crackme.exe`) — non modifié |
| `analysis/crackme.exe`, `analysis/crackme.asm` | exe extrait + `objdump -d -M intel` |
| `tools/frontlines-solve.py` | solveur + vérification par émulation unicorn |

## Réponse

Menu principal, option **3 – Speak the Word of Victory** :

```text
LIONOFJUDAH
```

```bash
python3 tools/frontlines-solve.py          # affiche le mot
python3 tools/frontlines-solve.py -q       # mot seul
python3 tools/frontlines-solve.py --check [mot]   # émule la routine de comparaison du binaire
```

Pas de user/login : pas d'exemple `petik` applicable.

## Premier regard

- `download.bin` est un ZIP chiffré (`crackmes.one`) → `crackme.exe` (187 392 octets), PE32+ console, build Rust (chemins `rustc/2d8144…`, `src\main.rs`).
- `strings` montre un menu « THE ADWA CHRONICLE – 1896 » (citation de Ménélik II) :
  `1. List Chronicle Entries / 2. Total Expenditure / 3. Speak the Word of Victory / 4. Quit`,
  plus `Enter the word of victory >`, `The word is correct. The sealed entry opens...`.
- Leurres dans `.rdata` : des blobs base36 entrecoupés de `MENELIK1896`, `LOSTPAPER`, `BURNTNOTE`, et un texte « These are not checked against anything - they're just old paper » — l'auteur prévient que les « Chronicle entries » ne servent à rien.
- Modes cachés par argv : `--archive`, `--check1`, `--check2` (voir Notes).

## Flow

`main` → boucle de menu. Option 1 liste les « entrées », option 2 calcule un total (floats, sans lien avec la solution), option 3 lit une ligne sur stdin, la `trim`, puis la compare à une `String` reconstruite à l'exécution. Si égal : « The word is correct. The sealed entry opens... », sinon « That is not the word. The entry stays sealed. ».

## Comment on trouve

**Ancrage** : le prompt `Enter the word of victory > ` est à `0x1400234f0` (59 octets, collé à `src\main.rs` dans `.rdata`). Dans `crackme.asm` (`objdump -d -M intel --no-show-raw-insn`), `grep 1400234f0` donne trois sites : `0x140003254` (menu, option 3) et `0x140004109` / `0x140004348` (modes `--check1/--check2`, cf. Notes). Le site menu est le seul atteint en usage normal.

**Lecture** (`0x140003254`…`0x1400033df`) :

```asm
140003254  lea  rcx,[rip+..]      ; "Enter the word of victory > "
14000325b  call 0x140009f70       ; print
...        call 0x140006f10       ; read_line(stdin, buf)
1400032d3  call 0x140001000       ; str::trim  -> rax=ptr, rdx=len (input)
140003309  mov  r8d,0xb           ; reserve 11 octets dans un Vec<u8>/String
140003329  lea  rcx,[rip+..]      ; rcx = 0x140023c63  (blob chiffré, 11 octets)
; boucle r12 = 0..10 :
140003355  movzx r13d,BYTE PTR [r12+rcx]
14000335a  xor   r13b,0xaa
140003361  add   r13b,0xed        ; c = (b ^ 0xAA) + 0xED  (mod 256)
140003365  sets  r15b ; inc r15   ; octet >= 0x80 → encodage UTF-8 sur 2 octets (char::from(u8))
...
1400033c3  cmp  [rsp+0x28],rsi    ; len(input) == 11 ?
1400033d8  call 0x140020c5b       ; memcmp(input, decoded, len)
1400033df  test eax,eax ; je success (0x1400034ba)
```

Le mot n'apparaît donc jamais en clair dans `strings` : il est reconstruit octet par octet. À noter que `sets/inc` (longueur 1 ou 2) vient de la conversion `u8 as char` poussée dans une `String` — sans effet ici puisque tous les octets décodés sont ASCII.

**Décodage** : octets à `0x140023c63` (offset fichier `0x23c63-0x23000+0x21a00`) :

```text
f5 f6 c8 cb c8 f3 f7 c2 fd fe f1
```

Exemple pour le premier : `0xf5 ^ 0xaa = 0x5f`, `0x5f + 0xed = 0x14c → 0x4c = 'L'`. Idem pour tous : `L I O N O F J U D A H` → **`LIONOFJUDAH`** (« Lion of Judah », titre de Ménélik II, cohérent avec le thème).
Le chemin de succès (`0x1400034ba…`) redécode le même blob pour l'afficher.

**Pièges** : les pistes `MENELIK1896`, `LOSTPAPER`, `BURNTNOTE`, la table base36 de `0x140023830` et le XOR de `0x14000423b` (clé `MENELIK1896`, 11 octets cyclique) relèvent du mode `--archive` / de l'habillage ; ils ne participent pas à la comparaison du menu.

## Vérification

Pas de Wine ni de gdb dans l'environnement de travail : la preuve est faite par **émulation unicorn du code du binaire d'origine** (`--check`), pas par une exécution live. Le script extrait `crackme.exe` du ZIP, mappe les sections, place l'entrée (déjà trimmée) comme le ferait `0x140001000`, stubbe `Vec::reserve` (`0x140020d60`) et `memcmp` (`0x140020c5b`), puis exécute **les vraies instructions** de `0x1400032e5` à `0x1400033df` (boucle de décodage + test de longueur + comparaison).

```text
$ python3 tools/frontlines-solve.py --check
input='LIONOFJUDAH' -> ACCEPTÉ  ({'cmp': (b'LIONOFJUDAH', b'LIONOFJUDAH'), 'ok': True})
$ python3 tools/frontlines-solve.py --check LIONOFJUDAX
input='LIONOFJUDAX' -> REFUSÉ  ({'cmp': (b'LIONOFJUDAX', b'LIONOFJUDAH'), 'ok': False})
$ python3 tools/frontlines-solve.py --check lion
input='lion' -> REFUSÉ  ({'ok': False})   # longueur ≠ 11
```

Non testé en exécution réelle (Wine absent) : à rejouer sous `xvfb-run -a wine analysis/crackme.exe` → option 3 → `LIONOFJUDAH`. Pas de session GDB ni de debugger MCP : pas de section « Debug GDB ».

## Notes

- `--check1` / `--check2` (comparaison `argv[1] == "--check1"` à `0x140002554…`) lisent aussi une ligne et la comparent à de petits blobs (`exn\x1b` @`0x1400234dc`, `s\x1a\x1a\x18` @`0x1400234e6`) : octets non imprimables, donc inutilisables comme réponse ; je ne les ai pas poussés plus loin, ce n'est pas le chemin du menu.
- `--archive` affiche un texte et déchiffre un blob de 0x22 octets avec la clé cyclique `MENELIK1896` (`0x14000423b`, `out[i] = key[i%11] ^ data[i]`) ; non exploré en détail, hors prédicat.
- Les « entrées de chronique » (options 1/2) ne sont comparées à rien, comme l'indique le texte du binaire lui-même.
