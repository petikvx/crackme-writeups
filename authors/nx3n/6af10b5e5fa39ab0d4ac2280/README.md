# nx3n's Find a password

| | |
|---|---|
| **ID** | [`6af10b5e5fa39ab0d4ac2280`](https://crackmes.one/crackme/6af10b5e5fa39ab0d4ac2280) ([`ORIGIN.yml`](ORIGIN.yml)) |
| **Auteur** | nx3n |
| **Plateforme** | Windows PE64 console, MinGW GCC 13.1, non packé |
| **SHA-256** | `691c78409b69a11dbcc17a7dfe37e334de32e80a5b33551bc928998c959871a3` |

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/my_first_crackme.exe` | binaire d'origine (intact) |
| `tools/nx3n-solve.py` | extrait le mot de passe depuis le PE ; `--check` le teste sous Wine |

## Réponse

**Mot de passe : `ASOINdiu129021j90e12`** (pas de user/login dans ce crackme ; `petik` est refusé).

```bash
python3 -I tools/nx3n-solve.py          # password = ASOINdiu129021j90e12
python3 -I tools/nx3n-solve.py --check  # lance le .exe sous xvfb-run wine
```

## Premier regard

- `file` : PE32+ console x86-64 ; `diec` : MinGW, pas de packer.
- `strings` : `Enter password: `, `%99s`, `Wrong!`, `Right!`, `Enter to continue...`, puis un énorme blob de texte (poèmes, *Guerre et Paix*). Ce sont les données de la fonction leurre `codebase`.
- Le mot de passe n'apparaît pas en clair dans `strings` : les octets sont des immédiats d'instructions `cmp`.

## Flow

`main` (0x140001efe) :

1. appelle `codebase()` (0x1400015e0) : ~2 Ko d'arithmétique (xor/add/imul/rol/shld/bswap…) sur les blobs de données ; **le résultat n'est jamais utilisé** (leurre).
2. `printf("Enter password: ")`, `scanf("%99s", gsm)` (gsm = 0x140009030). `rcx` reste = `gsm`.
3. Une longue suite de `cmp BYTE PTR [data+i], al ; je true` (octets de `.data`), puis `call cmpr` au milieu de la suite, puis encore des `cmp [..], al`.
4. `Right!` si un `je true` est pris, sinon `Wrong!`.

## Comment on trouve

Ancrage : `objdump -d -M intel original/my_first_crackme.exe` autour de `main`, puis `cmpr` en 0x140002110.

`cmpr` (rcx = `gsm`, la saisie) compare octet par octet :

```asm
140002119: cmp BYTE PTR [r12],     0x41   ; 'A'
140002124: cmp BYTE PTR [r12+1],   0x53   ; 'S'
140002130: cmp BYTE PTR [r12+2],   0x4f   ; 'O'
...        (jne wrong à chaque octet)
1400021cc: cmp BYTE PTR [r12+0x14],0x00   ; fin de chaîne -> longueur 20
1400021d4: mov al,1  (sinon wrong: mov al,0)
```

Décodage des immédiats (0x41..0x32) :
`41 53 4f 49 4e 64 69 75 31 32 39 30 32 31 6a 39 30 65 31 32` → **`ASOINdiu129021j90e12`**.

Piège : le « vrai » test n'est pas dans le `if` de `main`. Les `cmp [data+i], al` comparent l'octet de retour `al` (pas la saisie) à des octets de `.data`. Avant `cmpr`, `al` = retour de `scanf` = 1. Après `cmpr`, `al` = 1 si mot de passe OK, 0 sinon. Le premier octet de `.data` (`140004000`) vaut `0x01` : c'est le seul test (`cmp [140004000], al` à 0x140001ff0) qui peut réussir, et seulement quand `cmpr` renvoie 1. Aucun autre octet testé ne vaut 1 ni 0, donc rien d'autre ne mène à `Right!`.

Le solveur parse les `cmp BYTE PTR [r12+i], imm8` de `cmpr` directement dans le PE (gère les `jne` rel8/rel32) plutôt que de coder la chaîne en dur.

## Vérification

```text
$ python3 -I tools/nx3n-solve.py --check
password = ASOINdiu129021j90e12
'ASOINdiu129021j90e12'       -> Right!
'petik'                      -> Wrong!
```

(Wine via `xvfb-run -a wine original/my_first_crackme.exe`, saisie envoyée sur stdin.)

## Notes

- Pas de GDB ni de debugger utilisé : reverse 100 % statique (objdump) + preuve sous Wine.
- `codebase` et les blobs de texte sont du bruit anti-analyse ; ne pas perdre de temps dessus.
