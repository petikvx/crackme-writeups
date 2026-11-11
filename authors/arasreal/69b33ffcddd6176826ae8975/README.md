# arasreal's SimpleCrackMe

| | |
|---|---|
| **ID** | [`69b33ffcddd6176826ae8975`](https://crackmes.one/crackme/69b33ffcddd6176826ae8975) · [`ORIGIN.yml`](ORIGIN.yml) |
| **Auteur** | arasreal ([crackmes.one](https://crackmes.one/crackme/69b33ffcddd6176826ae8975)) |
| **Plateforme** | Windows PE32 (x86), C++ MSVC, console |
| **SHA-256** (`original/download.bin`) | `cc6ca4337a3d585f1ee39581ade773ee0542c796238f10bc2e150ef730492b37` |

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/download.bin` | ZIP du site (mot de passe `crackmes.one`) contenant `SimpleCrackme.exe` — non modifié |
| `analysis/extract/SimpleCrackme.exe` | exe extrait du ZIP (reverse fait dessus) |
| `analysis/full.asm` | `objdump -d -M intel` de `.text` |
| `tools/simplecrackme-solve.py` | solveur + `--check` (émulation unicorn de `main`) |

## Réponse

**Mot de passe : `successgoodtrybutyouarefoundatrypass01`**

```bash
python3 tools/simplecrackme-solve.py -q
python3 tools/simplecrackme-solve.py --check   # OK pour le bon mot de passe, KO attendu pour "petik"
```

Pas de username dans ce challenge (un seul prompt `Enter password:`).

## Premier regard

- `download.bin` est un **ZIP** (`PK` en fin de fichier, `SimpleCrackme.exe` dans le listing) :
  `python3 -I -c "import zipfile; zipfile.ZipFile('original/download.bin').extractall('analysis/extract', pwd=b'crackmes.one')"`.
- `objdump -f` : `pei-i386`, entry `0x402c20`, PDB `C:\Users\Aras\source\repos\SimpleCrackme\Release\SimpleCrackme.pdb` → MSVC Release, `std::string` / `std::cout`.
- Strings `.rdata` utiles : `DEBUGGER DETECTED!`, `[-] Debugger Detected!`, `SimpleCrackme by arasreal`,
  `Enter password: `, `[+] Access Granted!`, `[-] Wrong password!`, et une série de **petits mots isolés** :
  `succ`, `ess`, `good`, `try`, `but`, `you`, `are`, `found`, `at`, `ry`, `pass`, `01`.
- Imports : `IsDebuggerPresent`, `Sleep`, `SetConsoleTitleA` (KERNEL32), `std::cout/cin` (MSVCP140).

## Flow

`main` = `0x401220` :

1. `setlocale(0, "Turkish")`, puis `IsDebuggerPresent()` (`call [0x404008]`) → si ≠ 0 : titre « DEBUGGER DETECTED! », message, `Sleep(3000)`, `return 1`.
2. `Sleep`, `SetConsoleTitleA("SimpleCrackme by arasreal")`, affiche `Enter password: `.
3. Lit l'entrée dans un `std::string` local (`ebp-0x28`) via `0x401f90`.
4. Construit 12 `std::string` à partir des littéraux, les **concatène** avec `operator+`, compare à l'entrée → `Access Granted` / `Wrong password`.

## Comment on trouve

**Ancrage** : les xrefs sur `Enter password: ` (`0x404264`, push en `0x4012dc`) donnent directement `main`
(`grep -n 0x404264 analysis/full.asm`).

**Construction du secret** (`0x401304` → `0x4013d5`) : douze appels au constructeur `std::string(const char*)` (`0x4023d0`), un par littéral :

```asm
401278..4012f9  push 0x404278 ; lea ecx,[ebp-0x160] ; call 0x4023d0   ; "succ"
401304          push 0x404280 ; lea ecx,[ebp-0x148] ; call 0x4023d0   ; "ess"
401318          push 0x404284 ; ...[ebp-0x130]                         ; "good"
...             0x40428c "try", 0x404290 "but", 0x404294 "you", 0x404298 "are",
                0x40429c "found", 0x4042a4 "at", 0x4042a8 "ry", 0x4042ac "pass", 0x4042b4 "01"
```

Le dump brut de `.rdata` à `0x404278` confirme les littéraux (avec leur padding de 4 octets) :
`succ\0\0\0\0ess\0good\0\0\0\0try\0but\0you\0are\0found\0\0\0at\0\0ry\0\0pass\0\0\0\0` + `01`.
(Piège : `strings` ne montre pas certains mots de ≤ 3 caractères → il faut dumper `.rdata` à la main.)

**Concaténation** (`0x4013de` → `0x4014d8`) : `0x402240` = `operator+(a, b)` pour le premier, puis `0x402190` = `operator+(prev, next)` enchaîné dix fois
(`mov edx,eax` reprend le résultat précédent, `push ecx` = chaîne suivante). Le résultat final est dans `ebp-0x40`. Ordre = ordre des constructions :

```
"succ"+"ess"+"good"+"try"+"but"+"you"+"are"+"found"+"at"+"ry"+"pass"+"01"
 = successgoodtrybutyouarefoundatrypass01   (38 caractères)
```

**Comparaison** (`0x40184b`–`0x4018e1`) : `std::string::operator==` inliné :
`cmp esi,[ebp-0x30]` (tailles égales ?) puis comparaison dword par dword (`cmp eax,[ecx]`), reliquat octet par octet ;
`sete al` → `0x4042b8` (`[+] Access Granted!`) sinon `0x4042d0` (`[-] Wrong password!`).

Aucune transformation de l'entrée : égalité stricte avec le secret reconstitué.

## Vérification

Ni Wine ni GDB ne sont disponibles dans cet environnement ; la preuve est un **rejeu de `main()` sous unicorn** : l'exe est mappé, les imports sont
stubés (`IsDebuggerPresent`→0, `memcpy`, `malloc`, `Sleep`…), `0x401d70` (cout) et `0x401f90` (cin) sont interceptés ; le code réel construit,
concatène et compare. Le debugger-check passe, la logique est celle du binaire d'origine.

```text
$ python3 tools/simplecrackme-solve.py --check
'successgoodtrybutyouarefoundatrypass01' -> ['[+] Access Granted!']  OK
'petik'                                   -> ['[-] Wrong password!']  OK
```

(Avec `DBG=1`, le script affiche aussi la chaîne attendue lue en mémoire à `0x40184b` : `successgoodtrybutyouarefoundatrypass01`.)

Limites honnêtes : ce n'est **pas** une exécution Windows native ; pas de screenshot ni de section « Debug GDB » (GDB non utilisé, reverse statique + émulation).

## Notes

- Anti-debug minimal : seulement `IsDebuggerPresent` ; sous un debugger il faut forcer son retour à 0 pour atteindre le prompt.
- Le mot de passe est reconstruit à l'exécution à partir de fragments, d'où l'absence de la chaîne complète dans `strings`.
- Piège d'extraction : `original/download.bin` n'est pas un PE mais un ZIP.
