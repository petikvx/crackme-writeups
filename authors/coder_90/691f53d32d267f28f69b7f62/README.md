# Coder_90's KeyGenMeV3

| | |
|---|---|
| **ID** | [`691f53d32d267f28f69b7f62`](https://crackmes.one/crackme/691f53d32d267f28f69b7f62) ([`ORIGIN.yml`](ORIGIN.yml)) |
| **Auteur** | Coder_90 |
| **Plateforme** | Windows PE32+ x86-64, GUI Win32 (mingw, sans CRT lourde) |
| **SHA-256 (rar)** | `347f9efc340bc5d94e94655ceb68ac542fc6dc8dfa259448de3509975bcde503` |

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/keygenme.rar` | archive d'origine (mot de passe site `crackmes.one`) |
| `analysis/KeyGenMe.exe` | exe extrait (`7z x -pcrackmes.one`), SHA-256 `08f9aaaf…147f` |
| `tools/keygenmev3-solve.py` | keygen name → serial |
| `tools/live-check.sh` | preuve live : pilote le GUI sous Wine + Xvfb + xdotool |

## Réponse

Serial = hash 32 bits du nom, en **hexadécimal** (majuscules).

```bash
python3 tools/keygenmev3-solve.py --name petik     # name='petik' serial=F285F30F
tools/live-check.sh petik F285F30F                 # -> Success
```

| Name | Serial |
|---|---|
| `petik` | `F285F30F` |
| `Coder_90` | `9B7BFAF0` |

## Premier regard

- `file` : PE32+ GUI x86-64 ; `.text` n'a que 0x31a6 octets, mais `.data` pèse 3,6 Mo (remplissage, pas de packer : `diec` ne reconnaît rien, le code est lisible tel quel).
- `strings` : `KeygenMe v3.0`, `Name:`, `CHECK KEY`, `Invalid Key`, `Access Granted!`, titres de MessageBox `Success` / `Failed`.
- Pas d'IDA headless sur cette machine : tout est lu avec `objdump -d -M intel`.

## Flow

Fenêtre « KeygenMe » : deux EDIT (Name, Key) et un bouton `CHECK KEY`. Sur `WM_COMMAND` (0x111, id 1) le WndProc `0x140001a40` :

1. lit Name (`GetWindowTextA`, 0x100 max) et Key ;
2. calcule `h = hash(Name)` ;
3. convertit Key avec `strtoul(key, NULL, 16)` (appel `0x140003db0`, base `0x10`) ;
4. `h == key` → MessageBox « Access Granted! » / `Success`, sinon « Invalid Key » / `Failed`.

## Comment on trouve

**Ancrage** : `strings -a -t x` donne `Invalid Key` en 0x3796 (VA `0x140005196`) ; `grep` de cette VA dans `objdump -d` mène à `0x140001e3c`, juste après `cmp edi,eax` en `0x140001e1f`. En remontant : l'appel `0x140003db0(buf, 0, 0x10)` = conversion hex de la clé (`eax`), `edi` = hash du nom.

**Lecture du hash** (boucle inline en `0x140001ce0`–`0x140001d23`, copie « fonction » en `0x140001610`) avec `L = strlen(name)`, `c` = octet courant, `i` = index :

```asm
; init : edi=0x55555555 (h), ecx=0xdeadc0de (d), ebx/eax = -L
test r8b,1 ; je pair
  rol edi,0x1d ; add edi,r8d ; add edi,0xe5d4c3b3     ; c impair
pair:
  rol edi,0xc  ; xor edi,r8d ; add edi,0x90f01234      ; c pair
  mov r8d,ecx ; add r8d,edx          ; r = d + i
  lea ecx,[r8+rax]  ; xor ecx,r8d    ; d = (r - L) ^ r
  xor edi,ecx                        ; h ^= d
; fin (0x140001df9) :
imul edx,edx ; mov eax,edx ; shl eax,8 ; sub eax,edx   ; t = L*L*255
rol edi,0x1d ; add edi,ecx ; xor edi,eax               ; h = (rol(h,29)+d) ^ t
```

`shl 8 ; sub` = réduction de force de `L²*255` (`x*256 - x`).

**Pseudo-code** (reproduit dans le solveur) :

```python
h, d = 0x55555555, 0xDEADC0DE
for i, c in enumerate(name):
    h = (rol(h,29) + c + 0xE5D4C3B3) if c & 1 else ((rol(h,12) ^ c) + 0x90F01234)
    r = d + i;  d = ((r - L) ^ r);  h ^= d          # tout mod 2^32
t = L*L*255
serial = ((rol(h,29) + d) ^ t) & 0xFFFFFFFF
```

**Exemple `petik`** (L=5) → `0xF285F30F`. Le nom vide est géré (branche `0x140001ded`, mêmes constantes, L=0).

**Pièges** : (1) le hash est dupliqué (fonction + inline) ; c'est l'inline qui sert au check. (2) La clé est lue en base 16 par `strtoul`-like : `F285F30F` (> 0x7fffffff) passe, donc pas de saturation `strtol`. (3) Le titre de la fenêtre est `KeygenMe` (pas `v3.0`).

## Vérification (Wine 10 + Xvfb + xdotool, binaire extrait de l'archive d'origine)

```text
$ tools/live-check.sh petik F285F30F      -> Success    (OK)
$ tools/live-check.sh petik F285F30E      -> Failed     (KO, serial -1)
$ tools/live-check.sh Coder_90 9B7BFAF0   -> Success    (OK)
```

`tools/live-check.sh` détecte le titre de la MessageBox (`Success` / `Failed`) ; pas de screenshot (pas d'outil de capture dispo).

## Notes

- Pas de GDB ni de debugger live : reverse 100 % statique + preuve GUI sous Wine.
- Aucun anti-debug / packer ; les 3,6 Mo de `.data` sont du remplissage.
