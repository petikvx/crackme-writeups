# P@ssvv0Rol's B64crk

| | |
|---|---|
| **ID** | [`6b0173312c7537120cbe8c73`](https://crackmes.one/crackme/6b0173312c7537120cbe8c73) ([`ORIGIN.yml`](ORIGIN.yml)) |
| **Auteur** | P@ssvv0Rol (local : `p-ssvv0rol`) |
| **Plateforme** | Windows PE64 console, MinGW C++ (libstdc++) |
| **SHA-256** | `f319eed72cb8f6ca22dca7e5fe10db129d54052442ff68feaa545a0fa23c0552` |

## Contenu

| Chemin | Rôle |
|---|---|
| `original/B64crk.exe` | binaire d'origine (non modifié) |
| `tools/b64crk-solve.py` | solveur : lit la table dans le PE, `-q`, `--check` (Wine) |
| `analysis/run/` | dossier d'exécution Wine (copie de l'exe + DLL mingw, voir Notes) |

## Réponse

**Mot de passe : `CMO{AAy_1ir5t_@1g0rithm}`**

```bash
python3 -I tools/b64crk-solve.py          # affiche le mot de passe
python3 -I tools/b64crk-solve.py --check  # preuve live Wine : OK + KO
```

Pas de user/login : une seule ligne lue sur stdin (donc pas de variante `petik`).

## Premier regard

- `file` : PE32+ console x86-64, MinGW, importe `libstdc++-6.dll`, `libgcc_s_seh-1.dll`, `KERNEL32`, `msvcrt`.
- `strings` : `Easy base64 !!!` (bannière), `Good job !!!`, `Please try again`. Pas de mot de passe en clair.
- La chaîne `ABCD…+/` (alphabet base64 standard) est en `.rdata` à `0x14001b1f8`.

## Flow

1. Affiche `Easy base64 !!!`.
2. Lit une ligne (`std::getline`).
3. Construit une chaîne de référence de 24 caractères depuis une table.
4. Encode en base64 **l'entrée** et **la référence** avec la même fonction, puis compare les deux résultats.
5. Égaux → `Good job !!!`, sinon `Please try again`.

## Comment on trouve

Ancrage : `objdump -d -M intel --no-show-raw-insn original/B64crk.exe`, puis recherche des xrefs sur les strings.
Offset fichier `0x19c09` (`Easy base64`) → VMA `0x14001ba09` (`.rdata` : file `0x19200` ↔ VA `0x14001b000`). Une seule fonction la référence : `main` à `0x140019620`.

Dans `main` :

```asm
140019633  lea rdi,[rip+0x23cf]      ; "Easy base64 !!!"
...
140019732  lea r14,[rip+0x8c7]       ; r14 = 0x14001a000 (.data)
140019781  mov r15d,[r14+rbp*4]      ; dword i de la table
140019750  mov [rsi+rdi],r15b        ; on ne garde que l'octet bas -> string
14001976c  cmp rbp,0x18 / je ...     ; 24 itérations
1400196f8  call 0x140001930          ; b64(entrée)   -> [rsp+0x80]
14001990f  call 0x140001930          ; b64(référence)-> [rsp+0xa0]
140019a18  call 0x140003680          ; compare (memcmp) -> jne = échec
```

`0x140001930` est un base64 standard (`>>18`, `>>12 &0x3f`, `>>6 &0x3f`, `&0x3f`, padding `=`, indexation sur l'alphabet à `0x14001b1f8`). Comme il est appliqué des deux côtés et qu'il est injectif, comparer les encodages revient à comparer les chaînes : **inutile de décoder quoi que ce soit, l'entrée doit être égale à la référence**.

Décodage de la table `.data` (VA `0x14001a000`, file `0x19000`, 24 dwords dont seul l'octet bas compte, ce sont des `char` stockés en `int`) :

```
43 4d 4f 7b 41 41 79 5f 31 69 72 35 74 5f 40 31 67 30 72 69 74 68 6d 7d
C  M  O  {  A  A  y  _  1  i  r  5  t  _  @  1  g  0  r  i  t  h  m  }
```

→ `CMO{AAy_1ir5t_@1g0rithm}` (leet de « AAy first algorithm »).

Piège : le base64 en deux passes et les nombreux chemins de réallocation `std::string` (SSO 15 octets) noient le flow ; l'intérêt est de repérer que la référence est **statique** (table en `.data`), pas calculée.

## Vérification

```text
$ echo 'CMO{AAy_1ir5t_@1g0rithm}' | wine B64crk.exe
Easy base64 !!!
Good job !!!
$ echo 'CMO{AAy_1ir5t_@1g0rithn}' | wine B64crk.exe
Easy base64 !!!
Please try again
```

Reproductible via `python3 -I tools/b64crk-solve.py --check` (Wine + `xvfb-run`). Aucun GDB/x64dbg/IDA utilisé : reverse 100 % statique à l'`objdump`, preuve par Wine.

## Notes

- Sous Wine, l'exe sort avec le code 53 sans aucun message si `libstdc++-6.dll`, `libgcc_s_seh-1.dll` et `libwinpthread-1.dll` sont absents du dossier : les copier à côté d'une **copie** de l'exe (le solveur le fait dans un dossier temporaire ; `original/` n'est jamais touché).
- Le nom « B64 » est un leurre : le base64 n'est qu'un détour de comparaison, aucun décodage n'est nécessaire.
