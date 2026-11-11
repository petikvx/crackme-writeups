# esofl's easycrack

| | |
|---|---|
| **ID** | [`699b27efc1756e2381cffa4d`](https://crackmes.one/crackme/699b27efc1756e2381cffa4d) ([`ORIGIN.yml`](ORIGIN.yml)) |
| **Auteur** | esofl |
| **Plateforme** | Windows PE64 GUI (MinGW GCC 13.2, FLTK, OpenSSL `libcrypto-3`) |
| **SHA-256** (`original/download.bin`) | `9a57c41326d4edab97b2910b563bbdb57abea372287797c5d15877301183468c` |

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/download.bin` | ZIP du site (mot de passe `crackmes.one`) contenant lui-même `easycrack.zip` |
| `analysis/x/easycrack/` | extraction (`main.exe` + DLL MinGW/FLTK/OpenSSL), non modifiée |
| `tools/easycrack-solve.py` | solveur / vérificateur (`-q`, `--check`) |

## Réponse

**Mot de passe : `password`**

```bash
python3 tools/easycrack-solve.py        # password = password
python3 tools/easycrack-solve.py -q     # password
python3 tools/easycrack-solve.py --check password   # OK (exit 0)
```

Pas de notion d'utilisateur ici (un seul champ « Password »), donc pas d'exemple `petik` : `--check petik` → `KO`.

## Premier regard

`original/download.bin` n'est pas un exécutable mais un ZIP chiffré (`crackmes.one`), qui contient un second ZIP non chiffré :

```bash
mkdir -p analysis/x && cd analysis/x
unzip -P crackmes.one ../../original/download.bin     # → easycrack.zip
unzip easycrack.zip                                    # → easycrack/main.exe + 6 DLL
strings -n 5 easycrack/main.exe
```

`strings` donne directement les textes de l'IHM (`Password Check`, `Password:`, `Check`, `Password is correct` / `incorrect`), les imports `SHA256_Init/Update/Final` (libcrypto) et FLTK (`Fl_Input`, `Fl_Button`), et surtout une chaîne de 64 hex :
`5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8`.

## Flow

L'appli FLTK affiche un champ `input` et un bouton « Check » dont le callback est `checkPassword(Fl_Widget*, void*)`.

## Comment on trouve

Ancrage : `objdump -d -M intel --no-show-raw-insn main.exe`, symboles C++ non strippés.

1. `checkPassword` (`0x1400015a1`) lit la saisie :
   ```asm
   mov  rax,[rip+...]      ; 140008040 <input>
   call Fl_Input_::value   ; const char* de la saisie
   ...                     ; construit un std::string
   call sha256(const std::string&)   ; 0x140001450 → std::string résultat
   lea  rdx,[140008060]    ; STORED_PASSWORD_HASH (std::string global)
   call operator==(string,string)    ; 0x1400034c0
   test bl,bl / je ...     ; ok → label « Password is correct », sinon « incorrect »
   ```
2. `sha256()` (`0x140001450`) : `SHA256_Init` / `SHA256_Update(buf, size)` / `SHA256_Final`, puis boucle `i = 0..0x1f` formatant chaque octet avec `std::hex << setw(2) << setfill('0')` → hex minuscule sur 64 caractères. Aucune transformation (pas de sel, pas de rounds).
3. `STORED_PASSWORD_HASH` est initialisé par `__static_initialization_and_destruction_0` (`0x14000189b`) depuis la littérale de `.rdata` (`lea rax,[1400051a0]`) = le hash vu dans `strings`.
4. Le prédicat est donc `hex(SHA256(saisie)) == "5e8848…42d8"`. Ce hash est un classique :

   ```bash
   echo -n password | sha256sum
   5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8
   ```

Pièges : le vrai binaire est deux ZIP imbriqués ; `strings` sur `download.bin` ne montre que `easycrack.zip`.

## Vérification

- `hashlib.sha256(b"password").hexdigest()` == hash lu dans `.rdata` → `--check password` : `OK` ; `--check petik` : `KO`.
- **Limite honnête** : ni `wine` ni `gdb` n'étaient installés sur la machine de résolution, donc la preuve live (saisie dans la fenêtre FLTK) n'a **pas** été faite ; la preuve est statique (désassemblage complet du chemin de comparaison + recalcul du hash). Pour la refaire : `xvfb-run -a wine analysis/x/easycrack/main.exe`, saisir `password`, cliquer « Check » → « Password is correct ».
- Pas de section GDB : aucune session GDB n'a été menée.

## Notes

- Ce n'est pas une vérification en clair : il n'y a pas de mot de passe littéral, seulement son hash ; ici le hash est celui d'un mot de passe de dictionnaire, donc trivialement inversible par recherche.
