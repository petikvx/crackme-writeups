# BadEngineer's First Crackme

| | |
|---|---|
| **ID** | [`694f817e0c16072f40f5a4a0`](https://crackmes.one/crackme/694f817e0c16072f40f5a4a0) · [`ORIGIN.yml`](ORIGIN.yml) |
| **Auteur** | BadEngineer ([crackmes.one](https://crackmes.one/crackme/694f817e0c16072f40f5a4a0)) |
| **Plateforme** | Windows PE32 x86, console, MinGW GCC 6.3.0 (non strippé, symboles présents) |
| **SHA-256** (`original/download.bin`) | `3966389c8776f88e0bfca184d5614e1aecde669e9449b5e2cdf4afc122aee5de` |

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/download.bin` | en réalité un **ZIP** (mdp `crackmes.one`) contenant `easycrackme.exe` — non modifié |
| `analysis/extracted/easycrackme.exe` | exe extrait (SHA identique au contenu du ZIP) |
| `analysis/easycrackme.asm` | `objdump -d -M intel` complet |
| `tools/easycrackme-solve.py` | solveur / keygen + `--check` (émulation unicorn) |

## Réponse

Mot de passe de 9 caractères, par exemple :

```
0136:?ELT
```

```bash
python3 tools/easycrackme-solve.py            # 0136:?ELT
python3 tools/easycrackme-solve.py -c A       # autre premier caractère
python3 tools/easycrackme-solve.py --list     # les 58 mots de passe saisissables
python3 tools/easycrackme-solve.py --check    # preuve par émulation du code réel
```

Pas de champ user/login : `petik` n'est pas applicable ici. Le premier caractère du mot de passe est libre
(le mot de passe est dérivé de lui) ; `petik` ne passerait pas, `p` (0x70) étant > `'5'` (voir plus bas).

## Premier regard

- `download.bin` : `diec`/`file` absents sur la machine ; l'en-tête `PK` + `strings` (`easycrackme.exe`) montrent un ZIP. Extraction :
  `python3 -c "zipfile.ZipFile('original/download.bin').extractall('analysis/extracted', pwd=b'crackmes.one')"`.
- `objdump -f` : `pei-i386`, point d'entrée `0x4012e0`, MinGW (`GCC: (MinGW.org GCC-6.3.0-1)`), symboles conservés.
- `strings` utiles : `Please Enter Your Password :`, `False Len,Try again!`, `True len but wrong password!`,
  `YOU FOUND ITTTT!!!!`, `Debugger code : %d`, `Little bit help,try using something smaller (only first char)`.
- Noms de fonctions parlants : `_CreatePassword`, `_idontknowwhatimdoing`, `_napiyorsunmeselaquestionmark`,
  `_dhuasihd` (mauvaise longueur), `_dsauhdas` (mauvais mdp), `_main`.

## Flow

1. `main` (`0x4015fd`) appelle `idontknowwhatimdoing` : `printf("Debugger code : %d")` puis `IsDebuggerPresent()`.
   Si retour == 1 → `"what you doin?"` et `exit(0)`.
2. `printf("Please Enter Your Password : ")`, `scanf("%63s", buf)`.
3. `c = buf[0]` (signé) ; si `c > 0x35` (`'5'`) → message *« Little bit help… (only first char) »* et `return 1`.
   Sinon appel de `napiyorsunmeselaquestionmark(buf, c)`.
4. Cette fonction (`0x4014d4`) : incrémente le compteur d'essais `[0x40702c]`, génère le bon mot de passe
   avec `CreatePassword(c)`, vérifie `strlen(buf) == 9`, puis `strcmp(attendu, buf) == 0` → `"YOU FOUND ITTTT!!!!"`.
   Sinon `dhuasihd` / `dsauhdas` redemandent un mot de passe (`scanf`) et rappellent la même fonction
   (là, **plus de limite** `<= '5'`).

## Comment on trouve le prédicat

**Ancrage** : `objdump -d -M intel --no-show-raw-insn easycrackme.exe` — binaire non strippé, on lit directement `_CreatePassword` à `0x401460`.

```asm
401469: mov  BYTE PTR [ebp-0x14],al      ; al = c (1er char, argument)
40146c: movsx eax,BYTE PTR [ebp-0x14]
401470: mov  [ebp-0x4],eax               ; acc = (signed) c
401473: movzx eax,BYTE PTR [ebp-0x14]
401477: mov  ds:0x407020,al              ; out[0] = c
40147c: mov  DWORD PTR [ebp-0x8],1       ; i = 1
401485: mov  eax,[ebp-0x8]
401488: add  [ebp-0x4],eax               ; acc += i
40148b: mov  eax,[ebp-0x4]
40148e: mov  edx,eax
401490: mov  eax,[ebp-0x8]
401493: add  eax,0x407020
401498: mov  BYTE PTR [eax],dl           ; out[i] = (u8)acc
40149a: add  [ebp-0x8],1
40149e: cmp  [ebp-0x8],8
4014a2: jle  401485                      ; i = 1..8
4014a4: mov  BYTE PTR ds:0x407029,0      ; out[9] = 0
```

Soit `out[0] = c`, `out[i] = (c + 1 + 2 + … + i) mod 256`, i = 1..8, c'est-à-dire c + triangulaires
`0,1,3,6,10,15,21,28,36`. Longueur 9.

Le test de longueur dans `napiyorsunmeselaquestionmark` est obscurci par du code mort :
`[ebp-0x10]=8`, `[ebp-0x14]=8+2=10`, comparé à `strlen(buf)` avec `-1` → `strlen == 9` (`0x40153b`).

Le premier caractère étant à la fois la graine **et** `buf[0]`, un mot de passe valide est entièrement
déterminé par son 1er caractère (`strcmp(CreatePassword(buf[0]), buf)`). Les octets doivent être saisissables via
`scanf("%s")` (ASCII imprimable, sans espace) : 58 valeurs de `c` conviennent (`--list`).

**Exemple** `c='0'` (0x30) : `30 +0 → '0'`, `+1 → 31 '1'`, `+2 → 33 '3'`, `+3 → 36 '6'`, `+4 → 3a ':'`,
`+5 → 3f '?'`, `+6 → 45 'E'`, `+7 → 4c 'L'`, `+8 → 54 'T'` ⇒ **`0136:?ELT`**.

**Pièges** :
- `download.bin` n'est pas un exe mais un ZIP.
- Le filtre `c <= '5'` n'existe que sur la première saisie (dans `main`) ; il suffit de choisir `c` entre `!` et `5`
  (ou de se tromper une fois puis saisir un autre mot de passe via `dsauhdas`, sans filtre).
- Certains `c` donnent des octets non imprimables/espaces dans les 9 caractères (ex. `c='~'` → octets > 0x7e),
  d'où le filtre dans `--list`.
- `IsDebuggerPresent` : si un debugger est attaché, `exit(0)` immédiat (à contourner / ne pas attacher en debug live).
- Le buffer de sortie est global (`0x407020`) et recalculé à chaque appel : pas d'état résiduel.

## Vérification

Environnement sans **wine**, sans **gdb** et sans **diec** (`which wine gdb` vide) : la preuve live par Wine n'a donc
**pas** pu être faite. La preuve est faite par **émulation unicorn du code x86 réel** du `.exe`
(sections PE mappées, appel direct de `napiyorsunmeselaquestionmark` à `0x4014d4` ; seuls
`strlen`/`strcmp`/`printf`/`puts`/`Sleep` sont substitués, `CreatePassword` tourne tel quel) :

```text
$ python3 tools/easycrackme-solve.py --check
password: 0136:?ELT
check emulation: OK                                  # "YOU FOUND ITTTT!!!!" atteint
check emulation (KO attendu): KO (scanf appelé : mauvais mdp)   # 0136:?ELS -> branche retry
```

Pas de section « Debug GDB » : GDB n'a pas servi (reverse statique + émulation).
Commande de preuve native conseillée sous Windows/Wine : `xvfb-run -a wine original/…/easycrackme.exe` puis saisir `0136:?ELT`
(attendu : `Ohhh so you choose '0136:?ELT' in 1 try huhh???` puis `YOU FOUND ITTTT!!!!`).

## Notes

- Ce n'est pas un hash ni un chiffrement : simple suite additive (nombres triangulaires) autour du 1er caractère.
- Les `printf("%d")` du `Debugger code` sont un simple affichage de `IsDebuggerPresent`, ce n'est pas un check de licence.
