# Demian — entry level crackme

| | |
|---|---|
| **ID** | [`6a54d56b055757d3df60fce8`](https://crackmes.one/crackme/6a54d56b055757d3df60fce8) ([`ORIGIN.yml`](ORIGIN.yml)) |
| **Auteur** | Demian |
| **Plateforme** | Windows PE64 GUI (MinGW-w64 GCC 16.1, UCRT) |
| **SHA-256** (`original/download.bin`) | `38d5c14b1cd1091a2bb1ca89284519fd3c643dabfdbce536d20925400eb78e7c` |

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/download.bin` | archive d'origine : en réalité un **ZIP** (mdp `crackmes.one`) contenant `crackme_gui.exe` |
| `tools/demian-solve.py` | extrait le mot de passe du PE + preuve `--check` sous unicorn |

## Réponse

**Mot de passe : `sw0rdf1sh`** (pas de username, donc pas d'exemple `petik` ; `petik` comme mot de passe est refusé, cf. vérification).

```bash
python3 tools/demian-solve.py        # -q pour la valeur seule ; --check pour la preuve
```

## Premier regard

- `download.bin` commence par `PK` : c'est un ZIP, pas un PE. `unzip -P crackmes.one` (ou `zipfile` Python) donne `crackme_gui.exe` (65 621 octets, MZ, PE32+, entry `0x140001030`).
- `strings -n 6` : `sw0rdf1sh`, `CrackMe`, `Access granted. Well done!`, `Access denied.`, et dans `.rdata` en UTF-16 `Enter the password:`, `STATIC`, `EDIT`, `Check`, `BUTTON`. Imports `GetWindowTextA`, `MessageBoxA` (USER32), `strcmp`.
- Ici la chaîne n'est pas un leurre : `strings` la trouve, et c'est bien celle comparée.

## Flow

GUI Win32 : `WndProc` (`0x14000179d`) crée un STATIC, un EDIT (`hEdit`) et un BUTTON (ID `0x66`). Au clic (`WM_COMMAND` = `0x111`, `cmp ax,0x66`) :

1. `GetWindowTextA(hEdit, buf, 0x80)` ;
2. `check_password(buf)` ;
3. `MessageBoxA` « Access granted. Well done! » si 1, sinon « Access denied. ».

## Comment on trouve

Ancrage : `objdump -d -M intel crackme_gui.exe`, symbole `check_password` (`0x140001760`, binaire non strippé) :

```asm
14000176c: lea rax,[rip+0x38dd]   # 0x140005050 -> .rdata "sw0rdf1sh"
140001773: mov [rbp-8],rax
14000177b: mov rax,[rbp+0x10]      # arg1 = texte saisi
14000177f: mov rcx,rax
140001782: call strcmp             # strcmp(saisie, "sw0rdf1sh")
140001787: test eax,eax
140001789: jne  ...                # != 0 -> return 0
14000178b: mov eax,1               # == 0 -> return 1
```

`objdump -s -j .rdata` : `140005050: 73 77 30 72 64 66 31 73 68 00` = `sw0rdf1sh\0`. Le prédicat est donc juste `strcmp(input, "sw0rdf1sh") == 0` : comparaison exacte, sensible à la casse, aucune transformation (ni XOR, ni hash). `sw0rdf1sh` = « swordfish » en leet (`o`→`0`, `i`→`1`).

Piège : le fichier « binaire » est un ZIP (le script de scaffold ne l'a pas extrait) ; le solveur lit directement dans le ZIP, sans toucher à `original/`.

## Vérification

Wine et gdb ne sont pas installés sur la machine d'analyse : pas de session GDB ni de test GUI Wine (non vérifié en GUI réelle). Preuve faite en **émulant le vrai code** de `check_password` du PE avec unicorn (PE mappé, thunk `strcmp` remplacé par une implémentation équivalente) :

```text
$ python3 tools/demian-solve.py --check
check_password('sw0rdf1sh') = 1     # OK
check_password('petik') = 0         # KO
check_password('sw0rdf1shx') = 0    # KO (préfixe)
check_password('') = 0              # KO
```

## Notes

- Aucun anti-debug, aucun calcul : crackme d'entrée de gamme.
- Pas de MCP x64dbg/IDA utilisé ; analyse 100 % statique + émulation.
