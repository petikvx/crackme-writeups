# harry_potter_crackme — Harry Potter Crackme (shalamandra)

| | |
|---|---|
| **ID** | [`5ab77f5833c5d40ad448c3f8`](https://crackmes.one/crackme/5ab77f5833c5d40ad448c3f8) · [`ORIGIN.yml`](ORIGIN.yml) |
| **Auteur (site)** | crackmes.de (shalamandra) |
| **Plateforme** | Windows PE32 console, MinGW C++ (`diec`) |
| **ZIP SHA-256** | `7e5814f1a47b4985fa4a6548b61f785fe1970caa84e7e77ffb2fe2299a063dcb` |

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/Harry_Potter_Crackme.zip` | archive d'origine (non modifiée) : `Harry Potter Crackme.exe` + `Readme.nfo` |
| `analysis/x/` | extraction du ZIP (exe SHA-256 `795c7929…0f9c`) |
| `tools/harry-potter-solve.py` | solveur (inversion de la permutation) + `--check` Wine |

## Réponse

Le « serial » est en fait un **nom** à saisir à l'invite `tell me your name:` :

```text
tom marVoLo rIddle␠        ← 19 caractères, ESPACE FINAL compris
```

```bash
python3 -I tools/harry-potter-solve.py            # affiche le nom
python3 -I tools/harry-potter-solve.py -q --check "analysis/x/Harry Potter Crackme.exe"
```

Pas d'utilisateur libre ici : le test est une égalité stricte avec une chaîne constante, donc l'exemple `petik` est **rejeté** (voir Vérification).

## Premier regard

- `diec` : PE32, MinGW. Le `Readme.nfo` : difficulté 1, « find the correct serial », C++.
- `strings` n'aide pas (bruit libstdc++) : les chaînes du crackme sont dans `.rdata` (0x440000+) et ne ressortent pas proprement. Elles se lisent en dumpant `.rdata` à partir du VA `0x4408d4` (voir plus bas).
- Lancé sous Wine, il affiche l'art ASCII, puis `Dear student, tell me your name:` et conclut `Your spell is too weak…`.

## Flow

`_main` @ `0x401390` : une longue suite d'appels `operator<<(cout, str)` (bannière), puis lecture du nom, une permutation d'octets, un `strcmp`, un message OK/KO et `system("pause")`.

## Comment on trouve

1. **Ancrage** : `objdump -d -M intel "Harry Potter Crackme.exe" --start-address=0x401390 --stop-address=0x401784` (le binaire est strippé de son PDB mais MinGW a laissé `_main`).
2. **Constante attendue** (`0x401651`) : cinq `mov eax,[0x4408d4..0x4408e4]` copient 20 octets vers `[ebp-0x28]`. Dump de la section à ce VA (script Python qui mappe VA→offset via les en-têtes de section) :
   ```text
   0x4408d4 : "I am Lord Voldemort\0"   ← référence
   0x4408e8 : "You are He-Who-Must-Not-Be-Named … Nice job boy!!!"   (succès)
   0x440940 : "Your spell is too weak. Sorry, you're not a real wizard!!!"   (échec)
   ```
   (Clin d'œil : anagramme de « Tom Marvolo Riddle ».)
3. **Lecture du nom** (`0x401679`) : `getline(cin, buf=[ebp-0x48], 0x14)` → 19 caractères utiles maximum.
4. **Permutation** (`0x401694`–`0x401719`) : 19 paires `movzx eax,[ebp-X]` / `mov [ebp-0x68+k],al`, puis `[ebp-0x55]=0`. On convertit `X` en index dans le buffer (`idx = 0x48 - |X|`) :

   ```text
   out[k] = in[PERM[k]]   avec PERM = [13,3,5,4,18,9,1,6,15,11,7,8,16,14,17,2,10,12,0]
   ```
   Ex. `out[0] = [ebp-0x3b]` → `idx = 0x48-0x3b = 13`.
5. **Test** (`0x40172a`) : `strcmp(out, "I am Lord Voldemort")`, `jne` → message d'échec.
6. **Inversion** : `in[PERM[k]] = TARGET[k]`. Exemple : `PERM[0]=13` donc `in[13]='I'`, `PERM[1]=3` donc `in[3]=' '`, … Le résultat est `tom marVoLo rIddle ` — `in[18]` reçoit `TARGET[4]=' '`, d'où l'**espace final obligatoire** : sans lui, `in[18]` serait un octet de pile non initialisé (`getline` n'écrit que le `\0` à l'index 18) et la comparaison échouerait.

### Pièges

- Le nom n'est pas comparé tel quel : il faut l'**anagrammer** (permutation fixe), pas saisir `I am Lord Voldemort`.
- L'espace final fait partie de la solution (19 caractères, longueur de la cible).
- Pas de GDB utilisé : reverse 100 % statique + preuve Wine.

## Vérification

```text
$ printf 'tom marVoLo rIddle \n' | xvfb-run -a wine "analysis/x/Harry Potter Crackme.exe"
You are He-Who-Must-Not-Be-Named. You know all secrets of black magic. Nice job boy!!!

$ printf 'petik\n' | xvfb-run -a wine "analysis/x/Harry Potter Crackme.exe"
Your spell is too weak. Sorry, you're not a real wizard!!!

$ python3 -I tools/harry-potter-solve.py -q --check "analysis/x/Harry Potter Crackme.exe"
tom marVoLo rIddle
OK
```

## Notes

- Aucun patch ; `original/` intact (le ZIP est extrait sous `analysis/x/`).
- Ce n'est *pas* un keygen : la solution est unique (entrée de 19 caractères figée).
