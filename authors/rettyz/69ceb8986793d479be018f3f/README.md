# rettyz's Easy Rust crackme

| | |
|---|---|
| **ID** | [`69ceb8986793d479be018f3f`](https://crackmes.one/crackme/69ceb8986793d479be018f3f) · [`ORIGIN.yml`](ORIGIN.yml) |
| **Auteur** | rettyz |
| **Plateforme** | Windows PE64, Rust (`src\main.rs`), console |
| **SHA-256 `original/download.bin`** | `83ae3e28…13b739` (c'est un **ZIP**, mdp `crackmes.one`) |
| **SHA-256 de l'exe extrait** | `1c035d70ddf980b15be1a7707ac3bdf85a54c486992f94526da66e77800f8f21` |

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/download.bin` | archive d'origine (non modifiée) |
| `analysis/extracted/rust-crackme-easy.exe` | exe extrait du zip (`7z x -pcrackmes.one`) |
| `tools/rettyz-solve.py` | relit les constantes dans l'exe ; `-q`, `--check` (Wine) |

## Réponse

| Champ | Valeur |
|---|---|
| Username | **`crackers`** |
| Password | **`passhunt`** |

Pas de calcul : les deux valeurs sont fixes, donc le nom d'exemple `petik` n'est **pas** accepté (voir vérification).

```bash
python3 tools/rettyz-solve.py --check
```

## Premier regard

- `original/download.bin` : `diec` → « ZIP ». Il faut le dézipper (`7z x -pcrackmes.one`) ; l'exe est en `analysis/extracted/`.
- `diec` : PE64, MSVC linker 14.44 (toolchain Rust `x86_64-pc-windows-msvc`).
- `strings` : `Please enter your username:`, `Please enter your password:`, `WRONG!!!`, `Correct!!!`, `src\main.rs`. Aucune chaîne `crackers`/`passhunt` lisible : elles sont dans des immediates.

## Flow

`main` (0x140001000) boucle : affiche le prompt user, `read_line`, prompt password, `read_line`, trim des deux (`0x140001480`), compare, puis `WRONG!!!` et retour au début, ou `Correct!!!` et sortie.

## Comment on trouve

Ancrage : les adresses des chaînes (parsing PE en Python, .rdata 0x140019380…) puis `objdump -d -M intel --start-address=0x140001000`. Pas besoin d'IDA : `main` est la première fonction de `.text`.

```asm
call 0x140001480            ; trim(user)     -> rsi (ptr), rbx (len)
call 0x140001480            ; trim(password) -> rax (ptr), rdx (len)
cmp  rbx,0x8 / jne WRONG    ; user  : longueur 8
movabs r8,0x7372656b63617263
cmp  QWORD PTR [rsi],r8     ; user == imm64 ?
cmp  rdx,0x8 / jne WRONG    ; pass  : longueur 8
movabs rcx,0x746e756873736170
cmp  QWORD PTR [rax],rcx    ; pass == imm64 ?
je   Correct
```

Décodage des immediates en little-endian (octet de poids faible en premier) :

- `0x7372656b63617263` → `63 72 61 63 6b 65 72 73` → `crackers`
- `0x746e756873736170` → `70 61 73 73 68 75 6e 74` → `passhunt`

Chaque longueur est vérifiée à 8, donc la comparaison d'un seul qword équivaut à la comparaison de la chaîne entière.

Piège : `strings` ne montre pas ces valeurs (elles sont dans l'opcode `movabs`, et le seul `passhunt` trouvé en `.text` est ce movabs, à 0x14000110f).

## Vérification

Binaire d'origine (extrait) sous Wine :

```bash
printf 'crackers\npasshunt\n' | xvfb-run -a wine analysis/extracted/rust-crackme-easy.exe   # Correct!!!
printf 'petik\nx\ncrackers\npasshunt\n' | xvfb-run -a wine ...   # WRONG!!! (petik refusé) puis Correct!!!
printf 'crackers\npasshunT\ncrackers\npasshunt\n' | xvfb-run -a wine ...   # WRONG!!! puis Correct!!!
```

`tools/rettyz-solve.py --check` → `check: OK`. (Pas de screenshot : sortie console.)

## Notes

- GDB et x64dbg n'ont pas été utilisés (reverse 100 % statique + preuve Wine) ; pas de section GDB.
- Le zip n'a pas été décompressé par `add-crackme.sh` : l'exe extrait vit sous `analysis/` pour laisser `original/` intact.
