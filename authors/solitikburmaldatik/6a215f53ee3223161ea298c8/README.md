# SolitikBurmaldatik's FirstCrackMe

| | |
|---|---|
| **ID** | [`6a215f53ee3223161ea298c8`](https://crackmes.one/crackme/6a215f53ee3223161ea298c8) ([`ORIGIN.yml`](ORIGIN.yml)) |
| **Auteur** | SolitikBurmaldatik |
| **Plateforme** | Windows PE32+ (x86-64), console, MinGW-w64 GCC 15.2 |
| **SHA-256** `original/download.bin` | `24424af9ed45afce73a57ab3281a84dec607b6cd5830f2e1df5b45c1cf85bd91` (c'est un ZIP) |

| Fichier | Rôle |
|---|---|
| `original/download.bin` | ZIP chiffré d'origine (mdp `crackmes.one`), contient `crackme.exe` |
| `analysis/crackme.exe` | PE extrait (SHA-256 `dead29f6…ca1a`) |
| `analysis/main.objdump.txt` | désassemblage de `main` |
| `tools/solitikburmaldatik-firstcrackme-solve.py` | solveur + `--check` (émulation Unicorn) |

## Réponse

**Mot de passe : `simba123`**

```bash
python3 tools/solitikburmaldatik-firstcrackme-solve.py        # affiche le mot de passe
python3 tools/solitikburmaldatik-firstcrackme-solve.py -q     # juste la chaîne
python3 tools/solitikburmaldatik-firstcrackme-solve.py --check
```

Pas de user/login dans ce challenge (l'exemple `petik` sert seulement de mauvais mot de passe pour le cas KO).

## Premier regard

`download.bin` n'est pas un exécutable : les octets commencent par `PK\x03\x04` (ZIP chiffré, flag bit 0).
On l'extrait dans `analysis/` sans toucher à l'original :

```bash
unzip -P crackmes.one -o original/download.bin -d analysis/
strings -n 6 analysis/crackme.exe | head -20
```

`strings` donne directement `Enter password: `, `simba123`, `CORRECT!`, `WRONG!` au milieu des chaînes du runtime MinGW
(`Mingw-w64 runtime failure`, `GCC: (Rev13, Built by MSYS2 project) 15.2.0`). Ici la chaîne n'est donc pas un leurre à
vérifier : il faut juste confirmer qu'elle est bien celle comparée.

## Flow

`main` est à `0x140001490` (symbole conservé, le binaire n'est pas strippé). Les chaînes sont dans `.data` :

```
140003000 "Enter password: "   140003011 "simba123"   14000301a "CORRECT!"
140003023 "WRONG!"             14000302d "%99s"
```

## Comment on trouve

Ancrage : `objdump -d -M intel --no-show-raw-insn crackme.exe`, puis lecture de `<main>` (`analysis/main.objdump.txt`) :

```asm
140001494: movabs rcx,0x140003000      ; "Enter password: "
14000149e: call   printf
1400014a3: movabs rcx,0x14000302d      ; "%99s"
1400014ad: movabs rdx,0x140007030      ; buffer global (.bss)
1400014b7: call   scanf
1400014bc: movabs rcx,0x140007030      ; saisie
1400014c6: movabs rdx,0x140003011      ; "simba123"
1400014d0: call   strcmp
1400014d5: test   eax,eax
1400014d7: jne    main.wrong           ; != 0 -> "WRONG!" (0x140003023)
1400014d9: movabs rcx,0x14000301a      ; "CORRECT!"
```

Le prédicat est donc simplement `strcmp(saisie, "simba123") == 0`. Le mot de passe se lit à `0x140003011` dans `.data`
(`objdump -s --start-address=0x140003000 --stop-address=0x140003030`). Aucun encodage, aucune transformation.

Pièges : (1) l'archive est un ZIP déguisé en `.bin` ; (2) le `%99s` fait que le scanf s'arrête au premier espace ;
(3) `crackme.exe` est le même mot de passe que l'autre crackme `simba123` de SimbaHDD (CRACKME `6a160c2a…`), ce qui est
cohérent mais n'a rien d'une preuve : on a vérifié sur ce binaire.

## Vérification

Wine n'est pas installé sur la machine de travail (`xvfb-run -a wine` échoue : `wine: not found`). La preuve live est donc faite par
**émulation Unicorn** de `main` (PE chargé à `0x140000000`, `printf`/`scanf`/`strcmp`/`getchar` interceptés aux thunks
`0x140002920/28/40/08`), ce qui exécute le vrai code de `main` du binaire d'origine :

```
$ python3 tools/solitikburmaldatik-firstcrackme-solve.py --check
Mot de passe : simba123
  'simba123'   -> 'Enter password: CORRECT!' OK
  'petik'      -> 'Enter password: WRONG!' OK
```

Sous Wine, l'équivalent serait `printf 'simba123\n' | xvfb-run -a wine analysis/crackme.exe` (non exécuté ici).

## Notes

- Pas de GDB ni x64dbg utilisés : reverse 100 % statique + émulation.
- Rien n'est patché ; `original/` est intact.
