# mesit21's the stary console

| | |
|---|---|
| **ID** | [`69598dbe533f5f8e93cde755`](https://crackmes.one/crackme/69598dbe533f5f8e93cde755) ([`ORIGIN.yml`](ORIGIN.yml)) |
| **Auteur** | mesit21 |
| **Plateforme** | Windows x86-64, console, MinGW-w64 GCC 15.1 |
| **SHA-256 (`original/download.bin`)** | `af1839623feefd961a828db7b4d34661c095b15fdd057fc46b3c8b39d3922001` |

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/download.bin` | en réalité un **ZIP** (mot de passe `crackmes.one`) contenant `crackme2.exe` |
| `analysis/crackme2.exe` | exe extrait (copie de travail), `analysis/crackme2.dis` : `objdump -d -M intel` |
| `tools/mesit21-solve.py` | solveur / vérificateur (`-q`, `--check` via `xvfb-run wine`) |

## Réponse

**Il n'y a pas de code valide : toute saisie non numérique convient — exemple `petik`.**
À l'inverse, **n'importe quel nombre fait crasher** le programme (y compris la « valeur secrète » 45563 = `0xb1fb`).

```bash
python3 -I tools/mesit21-solve.py --check
```

## Premier regard

```bash
unzip -P crackmes.one original/download.bin -d /tmp/x     # le .bin est un ZIP
diec crackme2.exe        # PE64, MinGW GCC 15.1
strings -n 5 crackme2.exe
```

Strings utiles : `enter the code good luck: `, `%d`, `correct :) `, `sorry but no try again `, et un gros ASCII-art (lignes `.=:`, `+++`…) dans `.rdata` — décor de la « console » (le dessin affiché au lancement).

## Flow

`main` (`0x140001450`) : affiche l'ASCII-art (13 `puts`), `printf("enter the code good luck: ")`, `scanf`, compare, affiche `correct :)` ou `sorry but no try again`.

## Comment on trouve

Ancrage : `objdump -d -M intel crackme2.exe`, fonction `main`, symbole conservé (non strippé).

```asm
140001458: call __main
14000145d: mov DWORD PTR [rbp-0x14],0xb1fb    ; secret = 45563
140001464: mov DWORD PTR [rbp-0x4],0x0        ; input  = 0
14000146b: lea rax,[rbp-0x14]
14000146f: mov QWORD PTR [rbp-0x10],rax       ; p = &secret
...
140001554: mov eax,DWORD PTR [rbp-0x4]        ; eax = VALEUR de input (0), pas son adresse !
140001557: lea rcx,[rip+0x2f84]               ; "%d"
14000155e: mov edx,eax                        ; rdx = 0  (mov 32 bits => zero-extend)
140001560: call scanf                         ; scanf("%d", NULL)
140001565: mov rax,QWORD PTR [rbp-0x10]       ; rax = p = &secret
140001569: mov edx,DWORD PTR [rax]            ; edx = *p = secret
14000156b: mov eax,DWORD PTR [rbp-0x14]       ; eax = secret
14000156e: cmp edx,eax                        ; secret == secret -> toujours vrai
140001570: jne  sorry
```

Deux défauts du code C d'origine (probablement `scanf("%d", input)` au lieu de `&input`, et comparaison de `*p` avec la variable pointée) :

1. Le test compare `secret` **avec lui-même** (via le pointeur `p = &secret`) : `jne` n'est jamais pris, le chemin « correct » est inconditionnel. L'entrée utilisateur n'est jamais comparée à rien. La constante `0xb1fb` est un leurre.
2. `scanf` reçoit `NULL` (valeur de `input` = 0) comme destination. Si l'entrée **n'est pas** un entier (`petik`, chaîne vide/EOF), `%d` échoue **avant toute écriture** : pas de crash, on tombe sur `correct :)`. Si l'entrée est un entier, `scanf` écrit à l'adresse 0 → *access violation*.

Piège : le réflexe « le code est `0xb1fb` = 45563 » est faux, c'est justement ce qui plante.

## Vérification

Preuve live (Wine, `xvfb-run -a wine analysis/crackme2.exe`) :

| Entrée | Résultat |
|---|---|
| `petik` | `enter the code good luck: correct :)`, code retour 0 |
| *(vide / EOF)* | `correct :)` |
| `45563` | `wine: Unhandled page fault on write access to 0000000000000000` (crash, le débogueur wine reste bloqué) |

`python3 -I tools/mesit21-solve.py --check` automatise ces cas (OK pour `petik`, crash pour `45563`).

Pas de session GDB / x64dbg : reverse 100 % statique + preuve Wine.

## Notes

- Aucune patch du binaire ; `original/` intact (le ZIP n'a pas été modifié).
- Sous Windows natif, le comportement est identique (écriture sur NULL → violation d'accès) ; seule la saisie non numérique donne `correct :)`.
