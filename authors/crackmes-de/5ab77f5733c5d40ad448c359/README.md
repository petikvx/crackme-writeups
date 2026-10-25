# thorwak_crackme01_selfkeygenme_win32 — thorwak

| | |
|---|---|
| **ID** | [`5ab77f5733c5d40ad448c359`](https://crackmes.one/crackme/5ab77f5733c5d40ad448c359) ([`ORIGIN.yml`](ORIGIN.yml)) |
| **Auteur (site)** | crackmes.de (thorwak) |
| **Plateforme** | Windows PE32 GUI, MSVC 2008 (LTCG), Win32 natif |
| **SHA-256 (zip)** | `09fa5ddcf26c0469ae2dd25edc5c72b3a0465f4996bcc3bff282223dde86eee4` |

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/thorwakcm01.zip` | archive d'origine (`thorwakcm01.exe` + `readme.txt`) |
| `tools/thorwakcm01-solve.py` | keygen (`--name`, `-q`, `--check SERIAL`) |
| `tools/wine-drive.sh` | pilotage Wine/xdotool (menu, saisie, clic OK) pour la preuve live |
| `analysis/screenshot-*.png` | dialogue rempli, cas OK, cas KO |

## Réponse

Serial = fonction du nom (nom de plus de 3 caractères), format `XXXXX-XXXXX-XXXXX-XXXXX` en hexa minuscule.

| Nom | Serial |
|---|---|
| `petik` | **`3f1da-45031-6e6b4-123ae`** |

```bash
python3 tools/thorwakcm01-solve.py --name petik        # petik -> 3f1da-45031-6e6b4-123ae
python3 tools/thorwakcm01-solve.py -q --name petik
python3 tools/thorwakcm01-solve.py --name petik --check 3f1da-45031-6e6b4-123ae   # OK
```

## Premier regard

- `diec` : PE32, MSVC 9.0 (VS2008), GUI ; import `USER32` / `GDI32` / `KERNEL32`.
- Le readme annonce un « self-keygen » (le serial dépend du nom, un keygen autonome est un bonus).
- `strings -el` : menu `&File → &Register...`, `&Help → About`, dialogue « Register thorwakcm01 » (Name / Serial / OK / Cancel).
- `.rdata` : `Thanks for registering!`, `Please register!`, et trois formats `0%x` (@0x409338), `%x` (@0x40933c), `%s` (@0x409340).

## Flow

1. `WinMain` (0x401000) enregistre la classe et crée la fenêtre ; `WndProc` @0x40114d.
2. WM_COMMAND `0x67` (File→Register) ouvre le dialogue, procédure @0x4012c7.
3. Sur OK (id 1) : `GetDlgItemTextA(0x3ea, buf, 0x21)` = nom, `GetDlgItemTextA(0x9c40, buf2, 0x1e)` = serial.
4. Si `strlen(nom) > 3` : `serial_attendu = gen(nom)` (fonction @0x4013b2), puis comparaison octet par octet avec le serial saisi (sensible à la casse).
5. Égalité → `[0x40b764] = 1` + `InvalidateRect` ; au WM_PAINT (@0x401207) le texte devient vert « Thanks for registering! » (sinon rouge « Please register! »).

## Comment on trouve

**Ancrage** : `objdump -d -M intel thorwakcm01.exe --start-address=0x401000 --stop-address=0x401650`. Le point de décision est le flag global `0x40b764`, lu dans le WM_PAINT ; son unique écriture est dans la proc du dialogue en 0x401378, juste après la boucle de comparaison. En remontant, l'appel `call 0x4013b2` (ecx = buffer de sortie, pile = nom) est le générateur.

**Boucle de hash** (0x4013e3–0x401406) :

```asm
xor ecx,ecx                  ; i = 0
L: mov eax,ecx ; cdq ; idiv 10        ; edx = i % 10
   lea esi,[ebp+edx-0x2c]            ; &acc[i%10]  (12 octets mis à zéro avant)
   mov eax,ecx ; cdq ; idiv [len]    ; edx = i % len(nom)
   mov al,[nom+edx]
   xor al,cl                         ; nom[i%len] ^ (i & 0xff)
   add [esi],al                      ; acc[i%10] += ... (octet, wrap 8 bits)
   inc ecx ; cmp ecx,0xff ; jl L     ; i = 0..254
```

Donc `acc[i%10] = Σ (nom[i%len] ^ i) mod 256`, pour `i < 255`.

**Formatage** (0x401412–0x401485) : pour les 10 octets, `sprintf(p, b<0x10 ? "0%x" : "%x", b)` écrit 2 caractères hexa minuscules chacun (20 caractères dans un tampon local `ebp-0x20`). Puis quatre `sprintf(dst, "%s", ...)` découpent en blocs de 5 caractères séparés par `-` (octets `0x2d` posés en `[ebx+5]`, `+0xb`, `+0x11`) — **piège** : le premier `sprintf` copie depuis `ebp-0x11` (les 5 derniers caractères hexa), les suivants remontent (`ebp-0x16`, `ebp-0x1b`, `ebp-0x20`). Les blocs sont donc émis en **ordre inverse** : les NUL posés dans le tampon (`[ebp-0x11]=0`, etc.) servent à tronquer chaque bloc après coup.

**Exemple `petik`** (len 5) : accumulation sur 255 itérations → 10 octets → tampon hexa de 20 caractères dont les blocs, dans l'ordre du tampon, sont `123ae`, `6e6b4`, `45031`, `3f1da` ; émis en sens inverse : `3f1da-45031-6e6b4-123ae`.

Comparaison finale (0x401349–0x40136c) : `strcmp` inline classique, longueur 23 caractères, casse exacte (hexa **minuscule**).

## Vérification

Preuve live sous Wine/xvfb (le binaire d'origine, dézippé hors dépôt) : `xvfb-run -a -s "-screen 0 1024x768x24" bash tools/wine-drive.sh petik 3f1da-45031-6e6b4-123ae ok` (Alt+F, R, clics sur les champs, clic OK, capture `ffmpeg x11grab`).

| Cas | Résultat | Capture |
|---|---|---|
| dialogue rempli | — | [`screenshot-dialog-filled.png`](analysis/screenshot-dialog-filled.png) |
| `petik` / `3f1da-45031-6e6b4-123ae` | « Thanks for registering! » (vert) | [`screenshot-ok.png`](analysis/screenshot-ok.png) |
| `petik` / `3f1da-45031-6e6b4-123af` (dernier car. modifié) | « Please register! » (rouge) | [`screenshot-ko.png`](analysis/screenshot-ko.png) |

## Notes

- Aucun GDB ni debugger live utilisé : reverse statique (objdump) + preuve Wine.
- Pas de salt ni d'anti-debug ; seul piège : l'ordre inverse des blocs et les 255 (et non 256) itérations.
- Après un clic sur OK avec un serial faux le dialogue se ferme simplement, sans message.
- Sous Wine le focus initial du dialogue est sur Cancel : cliquer les champs plutôt que `Tab`.
