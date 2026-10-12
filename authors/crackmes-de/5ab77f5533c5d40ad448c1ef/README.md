# crackmehardestshell20110404 by xiayuanzhong (crackmes.de)

- **Page** : <https://crackmes.one/crackme/5ab77f5533c5d40ad448c1ef>
- **Plateforme** : Windows **PE32** console, C++ Dev-C++ (MinGW, `diec` : *Compiler: MinGW*), libstdc++ statique, **symboles présents** — difficulté 1.0
- **Archive** : `original/CrackMe20110403.zip` → `CrackMe20110403.exe` + `readme.txt`
- **Statut** : résolu (keygen), vérifié **live sous wine**

## Solution

```
python3 tools/xyz-hardestshell-solve.py petik --check
petik -> kitep_xyz
wine : Good (WEEL-DONE!)
wine (faux kitep_xyy ) : Bad (re-demande Name/Password)
```

Mot de passe = **nom à l'envers + `_xyz`**. Pour `petik` : **`kitep_xyz`**.

```
Please enter the Name: petik
Please enter the Password: kitep_xyz
You're so COOL!~ WEEL-DONE!
My email address is xiayuanzhong@126.com
My name is xiayuanzhong
```

## Le « shell » (packer)

Le `readme.txt` parle d'une coquille difficile à réparer après avoir trouvé l'OEP… puis précise : *« The shell was thought to be a virus, so I just unpack it »*. Le binaire publié est donc **déjà dépaqueté** : sections MinGW classiques (`.text .data .rdata .bss .idata`), imports `KERNEL32` + `msvcrt` normaux, table de symboles COFF intacte (`nm` donne `_main`, `Announcement()`, `Error()`, `Congratulations()`, `getMyChars(short)`, `turnToMyChar(char)`). Aucun unpacking à faire.

## Comment on trouve

1. `strings` : `Please enter the Name: `, `Please enter the Password: `, `Error! Try Again Please!~`, `My email address is…` → c'est un name/password en console.
2. `nm CrackMe20110403.exe | grep " T "` → `_main` à `0x401390`. `objdump -d -M intel --start-address=0x401390 --stop-address=0x4017f2` :
   - deux `std::string` lus par `operator>>(cin, …)` (`0x43deb8`), chacun limité à `0x3e6` caractères ;
   - `L = name.length()` (stocké en `short`), puis `if (L + 4 != password.length()) Error()` ;
   - boucle `i = 0..L-1` : `name[i]` comparé à `password[L - i - 1]` (`sub edx,eax ; dec eax` puis `operator[]`) → la première moitié du mot de passe est le **nom renversé** ;
   - quatre tests directs : `password[L+3] == 0x7a 'z'`, `password[L] == 0x5f '_'`, `password[L+1] == 0x78 'x'`, `password[L+2] == 0x79 'y'` → suffixe **`_xyz`**.
3. Le drapeau `[ebp-0x3c]` vaut 1 au départ ; chaque échec le remplace par `turnToMyChar(getMyChars(-1))`. Ces deux fonctions font `+10` puis `-10` : c'est un simple brouillage, le résultat est la valeur d'entrée (`-1`). À la fin : `flag > turnToMyChar(getMyChars(0)) = 0` → `Congratulations()`, sinon retour au début (`jle 0x401427`) et nouvelle saisie.

## Vérification

- Live sous wine (stdin redirigé) : `petik` / `kitep_xyz` et `crackmes` / `semkcarc_xyz` → `You're so COOL!~ WEEL-DONE!` + e-mail/nom de l'auteur.
- Contre-test : `kitep_xyy` → le programme redemande `Name`/`Password` en boucle (le solveur coupe au bout de 10 s).
