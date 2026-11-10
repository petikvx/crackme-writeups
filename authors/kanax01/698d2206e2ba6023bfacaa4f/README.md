# Kanax01's Fixed Easy Crackme

| | |
|---|---|
| **ID** | [`698d2206e2ba6023bfacaa4f`](https://crackmes.one/crackme/698d2206e2ba6023bfacaa4f) · [`ORIGIN.yml`](ORIGIN.yml) |
| **Auteur** | Kanax01 (local : `kanax01`) |
| **Plateforme** | Windows PE64 console, C++ MSVC (`std::cin` / `std::cout`) |
| **SHA-256 `download.bin`** | `7424d10b70b565ad8064796cf99bd73551efec4d30a61c017ffa53fd34051264` |

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/download.bin` | ZIP chiffré (mot de passe `crackmes.one`) contenant `CrackMeEasy.exe` — non modifié |
| `analysis/extracted/CrackMeEasy.exe` | exe extrait (SHA-256 `afca1271…799d`) |
| `analysis/crackme.asm` | `objdump -d -M intel --no-show-raw-insn` |
| `tools/kanax01-easy-solve.py` | solveur : lit le mot de passe dans le `.data` du PE (`--check`, `-q`) |
| `tools/kanax01-easy-emu.py` | preuve par émulation unicorn de la comparaison de `main` (OK + KO) |

## Réponse

**Mot de passe : `EasyPassword`** (pas de username, donc pas d'exemple `petik` à dériver).

```bash
python3 -I tools/kanax01-easy-solve.py -q --check
# EasyPassword
```

## Premier regard

```bash
python3 -c "import zipfile;zipfile.ZipFile('original/download.bin').extractall('analysis/extracted',pwd=b'crackmes.one')"
strings -n 5 analysis/extracted/CrackMeEasy.exe
objdump -d -M intel --no-show-raw-insn analysis/extracted/CrackMeEasy.exe > analysis/crackme.asm
```

`download.bin` n'est pas un PE mais un ZIP. L'exe est un PE32+ MSVC lié à `MSVCP140.dll` (iostream). Les `strings` donnent
`Welcome!!!`, `Please Enter The Password:`, ` Congrats!!! You Cracked The Code`, ` Wrong Password, Please Try Again`, ` Enter To Exit`,
et… `EasyPassword`, qui n'est référencé nulle part dans `.rdata` : indice qu'il vit dans `.data`.

## Flow

`main` @ `0x1400012a0` : affiche le bandeau, `cin >> std::string` (fonction `0x140001700`), compare à une `std::string` globale, affiche le
message OK ou KO, puis attend Entrée.

## Comment on trouve

1. **Ancrage** : les messages sont dans `.rdata` (`0x1400033c8…`). Dans `main`, la comparaison est :

```asm
14000130f: lea  rdx,[rip+0x3da2]          # 0x1400050b8  = global std::string (buffer SSO)
140001316: cmp  QWORD PTR [0x1400050d0],0xf   # capacité > 15 ? sinon SSO inline
14000131e: cmova rdx,[0x1400050b8]        # (heap pointer si capacité > 15)
140001326: mov  r8,[rsp+0x30]             # r8 = taille de la saisie
140001342: cmp  r8,[0x1400050c8]          # taille saisie == taille du global ?
140001349: jne  0x140001362               # -> « Wrong Password »
14000134b: test r8,r8 ; je 0x140001359    # (taille 0 -> OK)
140001350: call 0x140002843               # thunk memcmp(saisie, global, r8)
140001357: jne  0x140001362               # != 0 -> Wrong
140001359: lea  rdx,[0x1400033f8]         # « Congrats!!! You Cracked The Code »
```

2. **Le global** `0x1400050b8` n'est pas construit à l'exécution : aucune écriture dedans hors destructeur (`0x1400029d0`, qui remet
   size=0/cap=0xf). Il est **statiquement initialisé dans `.data`** (constexpr-ish SSO). Dump :

```text
objdump -s -j .data CrackMeEasy.exe
 1400050b0 01000000 00000000 45617379 50617373   ........EasyPass
 1400050c0 776f7264 00000000 0c000000 00000000   word............   <- size = 0x0c
 1400050d0 0f000000 00000000 ...                                    <- cap  = 0x0f
```

   Layout MSVC `std::string` : 16 octets de buffer SSO (`EasyPassword\0`), `size=0xc` @ `+0x10`, `capacity=0xf` @ `+0x18`.
   `strings` ne montre que `EasyPassword` : l'offset fichier `0x3eb8` correspond à VA `0x1400050b8` (`.data` file off `0x3e00` ↔ VA `0x140005000`).
3. **Prédicat** : `saisie == "EasyPassword"` (taille 12 puis `memcmp` des 12 octets, sensible à la casse).
4. **Pièges** : la chaîne n'est pas dans `.rdata` avec les autres messages ; le test de capacité `cmova` sert à choisir buffer SSO vs pointeur
   heap (ici SSO car cap = 15). La longueur est testée avant `memcmp`.

## Debug GDB / live

Pas de GDB (statique + émulation) et pas de Wine sur la machine de reverse : **la preuve live sur le binaire n'a pas pu être faite sous Wine**.
À la place, `tools/kanax01-easy-emu.py` charge les sections du PE réel dans unicorn et rejoue `0x140001342 → 0x140001369` (memcmp de l'import
émulé à la main), pour une saisie donnée :

```text
'EasyPassword'  -> OK (Congrats)
'easypassword'  -> KO (Wrong)
'EasyPasswor'   -> KO (Wrong)
'petik'         -> KO (Wrong)
```

## Vérification

```bash
python3 -I tools/kanax01-easy-solve.py --check     # check OK + Password: EasyPassword
python3 tools/kanax01-easy-emu.py                   # unicorn, cas OK et KO (voir ci-dessus)
# à refaire si Wine dispo :
echo EasyPassword | xvfb-run -a wine analysis/extracted/CrackMeEasy.exe
```

## Notes

- Mot de passe 100 % statique, aucune dérivation ; l'exe est identique pour tous.
- Ne pas confondre `download.bin` (ZIP) et l'exe ; ne pas dézipper dans `original/`.
