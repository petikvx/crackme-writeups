# qpdudusydi's Rust Crackme (XOR) Easy

| | |
|---|---|
| **ID** | [`6af34bd84b6d53e8802ed4e6`](https://crackmes.one/crackme/6af34bd84b6d53e8802ed4e6) · [`ORIGIN.yml`](ORIGIN.yml) |
| **Auteur** | qpdudusydi |
| **Plateforme** | Windows PE64, console, Rust (MSVC) |
| **SHA-256** (`download.bin`) | `c0fa50224b86e253e8cf39315c0a04d026d7823d6d457f6b6e2decc6352ae746` |

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/download.bin` | en fait un **ZIP** (mot de passe `crackmes.one`) contenant `rustpj.exe` |
| `tools/rustpj-solve.py` | solveur : lit les octets dans le binaire, XOR, `--check` via Wine |

## Réponse

**`Cr4ckm3_Rus7_x0r`**

```bash
python3 -I tools/rustpj-solve.py -q
python3 -I tools/rustpj-solve.py --check   # Wine : bonne réponse = Correct!, petik = Wrong!
```

(Pas de username ici : le crackme ne demande qu'une réponse unique.)

## Premier regard

- `download.bin` : `diec` ne voit qu'un ZIP ; `strings` montre `rustpj.exe`. Extraction hors de `original/` :
  `unzip -P crackmes.one original/download.bin -d /tmp/rc`.
- `rustpj.exe` : PE64 (DIE annonce MSVC/CRT, mais les chemins `\.rustup\toolchains\stable-x86_64-pc-windows-msvc` et `src\main.rs` prouvent du Rust).
- Strings utiles : `Crackme Rust (XOR)`, `Put in your answer:`, `Wrong!`, `Correct!`. Le titre annonce déjà le XOR.
- Lancé sous `xvfb-run -a wine rustpj.exe` : lit une ligne sur stdin, affiche `Wrong!` ou `Correct!`.

## Flow

`main` (VA `0x140002f20`) : affiche le banner et le prompt → construit un tableau d'octets sur la pile → `read_line` → `trim` → compare avec le tableau déchiffré → `Correct!` / `Wrong!`.

## Comment on trouve

1. **Ancrage** : les offsets des chaînes dans `.rdata` (`Wrong!` = fichier `0x1d110` → RVA `0x1df10`, `Correct!` → `0x1df17`) sont recherchés dans `.text` via les `lea reg,[rip+disp]`. Résultat : `lea` en `0x1400030b6` (Wrong) et `0x1400030d2` (Correct), donc `main` autour de `0x140002f20`. `objdump -d -M intel --start-address=0x140002f00 --stop-address=0x1400031a0 rustpj.exe`.
2. **Lecture** : juste après le prompt, 17 écritures d'immediates d'un octet :

   ```asm
   140002f6d  mov BYTE PTR [rbp+0x27],0x19
   140002f71  mov BYTE PTR [rbp+0x28],0x28
   ...                                     ; 0x6e 0x39 0x31 0x37 0x69 0x05 0x08 0x2f 0x29 0x6d 0x05 0x22 0x6a
   140002fa9  mov BYTE PTR [rbp+0x36],0x28
   140002fad  mov BYTE PTR [rbp+0x37],0x5a ; <- clé XOR
   ```
   Piège : `rbp+0x27..0x36` fait 16 octets (la longueur testée `cmp rax,0x10` dans la fonction de comparaison `0x140001310`), et `rbp+0x37` n'est **pas** un 17e caractère : son adresse est passée en `r9` (`lea r9,[rbp+0x37]` en `0x14000307e`) au closure de transformation de l'entrée, c'est l'octet de clé.
3. **La comparaison** (`call 0x140001310` en `0x1400030a2`, `rdx = &[rbp+0x27]`) retourne un booléen (`test al,1` → `jne Correct`). Elle contient un `xor al,[rax]` (`0x1400013fe`) : chaque octet saisi est XORé avec la clé `0x5a` puis comparé à la table.
4. **Décodage** : `table[i] ^ 0x5a` :

   | idx | 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 10 | 11 | 12 | 13 | 14 | 15 |
   |---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
   | enc | 19 | 28 | 6e | 39 | 31 | 37 | 69 | 05 | 08 | 2f | 29 | 6d | 05 | 22 | 6a | 28 |
   | ^5a | C | r | 4 | c | k | m | 3 | _ | R | u | s | 7 | _ | x | 0 | r |

   → `Cr4ckm3_Rus7_x0r`. Le XOR est symétrique, donc la réponse = table ^ clé.

## Vérification

Sous Wine, binaire d'origine extrait du ZIP :

```text
$ echo Cr4ckm3_Rus7_x0r | xvfb-run -a wine rustpj.exe   → Correct!
$ echo Cr4ckm3_Rus7_x0   | xvfb-run -a wine rustpj.exe   → Wrong!   (15 car.)
$ echo petik             | xvfb-run -a wine rustpj.exe   → Wrong!
```

`tools/rustpj-solve.py --check` rejoue les cas OK et KO.

## Notes

- Aucun GDB / x64dbg utilisé : reverse 100 % statique + preuve Wine (pas de section debug).
- Le « XOR » est une obfuscation triviale : la clé et la table sont côte à côte dans `main`.
- Le contenu de `original/` n'a pas été modifié (ZIP lu en mémoire / extrait sous `/tmp`).
