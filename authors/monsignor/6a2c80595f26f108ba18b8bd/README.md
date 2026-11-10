# Monsignor's Monsignors Crackme

| | |
|---|---|
| **ID** | [`6a2c80595f26f108ba18b8bd`](https://crackmes.one/crackme/6a2c80595f26f108ba18b8bd) ([`ORIGIN.yml`](ORIGIN.yml)) |
| **Auteur** | Monsignor (`monsignor`) |
| **Plateforme** | Windows x86-64, console, MinGW-w64 (GCC), non strippé (symboles COFF + DWARF) |
| **SHA-256 `original/download.bin`** | `65f4ac8c9c1408c099d47845451e83cc2b22eba54b7f5b92f00a4f1baf141741` |
| **SHA-256 `hello.exe` (extrait)** | `afd242f5fe7f0d8bb6323d812e411763d402fb25c0cbdb5dcaccf4e188950d7f` |

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/download.bin` | Fichier d'origine : en réalité un **ZIP** (ZipCrypto, mot de passe `crackmes.one`) contenant `hello.exe` |
| `analysis/x/hello.exe` | Le PE extrait (`unzip -P crackmes.one original/download.bin -d analysis/x`) |
| `tools/monsignor-solve.py` | Solveur : lit le mot de passe dans le binaire ; `--check` émule `main` |

## Réponse

**Mot de passe : `secret`**

```bash
python3 tools/monsignor-solve.py          # password = secret
python3 tools/monsignor-solve.py -q       # secret
python3 tools/monsignor-solve.py --check  # preuve par émulation (OK/KO)
```

Pas de user/login : le programme ne demande qu'un mot de passe (l'exemple `petik` ne sert ici que de cas KO).

## Premier regard

- `download.bin` commence par `PK\x03\x04` : ce n'est pas un exe mais un ZIP. `add-crackme.sh` ne l'a pas dézippé ; on le fait à la main (mdp `crackmes.one`).
- `hello.exe` : PE32+ (`0x8664`), entry `0x1410`, sections `.text/.data/.rdata/.pdata/.xdata/.bss/.idata/.CRT/.tls` + sections DWARF (`/4`, `/19`…) → MinGW-w64, non strippé. Imports : KERNEL32 + `msvcrt.dll` (`printf`, `scanf`, `strcmp`…).
- `strings` : `Enter password: `, `Access granted!`, `Access denied!` — et pas de mot de passe évident au milieu de la ferraille CRT (il ne ressort pas de `grep` sur « pass » car il s'appelle `secret`).

## Flow

`main` : `printf("Enter password: ")` → `scanf("%s", buf)` → `strcmp(buf, "secret")` → `Access granted!` si 0, sinon `Access denied!`.

## Comment on trouve

**Ancrage** : la table des symboles COFF est présente, `main` est directement nommé :

```bash
objdump -t hello.exe | grep -w main      # main = .text+0x528 → VMA 0x140001528 (.text = 0x140001000)
objdump -d -M intel --start-address=0x140001528 --stop-address=0x1400015a0 hello.exe
```

**Lecture** (extrait commenté) :

```asm
140001535: lea rax,[rip+0xeac4]   ; 0x140010000  "Enter password: "
14000153f: call printf
140001544: lea rax,[rbp-0x40]     ; buffer de saisie (64 octets sur la pile)
14000154b: lea rax,[rip+0xeabf]   ; 0x140010011  "%s"
140001555: call scanf             ; scanf("%s", buf)
14000155a: lea rax,[rbp-0x40]
14000155e: lea rdx,[rip+0xeaaf]   ; 0x140010014  ← chaîne de référence
140001568: call strcmp            ; strcmp(buf, ref)
14000156d: test eax,eax
14000156f: jne 140001582          ; ≠0 → "Access denied!" (0x14001002c)
140001571: lea rax,[rip+0xeaa3]   ; 0x14001001b "Access granted!"
```

**Décodage** : `0x140010014` est en `.rdata` (RVA `0x10014`, section à RVA `0x10000` ↔ offset fichier `0xe200`) soit offset `0xe214`. Dump de la zone :

```text
0xe200: "Enter password: \0" "%s\0" "secret\0" "Access granted!\n\0" "Access denied!\n\0"
```

→ la chaîne comparée est `secret`. Aucun chiffrement, aucun calcul : comparaison en clair.

**Pièges** : (1) le fichier « binaire » est un ZIP ; (2) les offsets de `objdump -t` sont relatifs à `.text`, pas des VMA (ajouter `0x140001000`) ; (3) `scanf("%s")` sans limite sur un buffer de 0x40 : débordement possible, hors sujet pour le crackme.

Ce reverse est 100 % statique (objdump + Python) : pas de session GDB, ni MCP x64dbg/ida utilisé — **pas de section Debug GDB**.

## Vérification

`wine` et `gdb` ne sont pas installés sur la machine : la preuve live Wine n'a pas pu être faite. À la place, `--check` émule avec **Unicorn** le vrai code de `main` (extrait de `hello.exe`) en n'hookant que les appels CRT (`__main`, `printf`, `scanf` qui injecte la saisie, `strcmp` qui compare les deux vrais arguments passés à la fonction par `main`) :

```text
$ python3 tools/monsignor-solve.py --check
password = secret
[check] 'secret'   -> Enter password: Access granted!
[check] 'petik'    -> Enter password: Access denied!
OK
```

Cas OK (`secret`) et KO (`petik`) confirmés ; la chaîne de référence utilisée par `strcmp` est bien celle lue par `main` dans `.rdata`.

## Notes

- Ce n'est pas un keygen : un seul mot de passe fixe.
- Le titre du crackme sur le site ne correspond pas au nom du binaire (`hello.exe`).
