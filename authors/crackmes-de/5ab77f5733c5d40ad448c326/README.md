# crackmes.de's creepys_crackme3 by creepy

| | |
|---|---|
| **ID** | [`5ab77f5733c5d40ad448c326`](https://crackmes.one/crackme/5ab77f5733c5d40ad448c326) · [`ORIGIN.yml`](ORIGIN.yml) |
| **Auteur (site)** | crackmes.de (creepy) |
| **Plateforme** | Windows PE32 console, MinGW (g++ 3.x, libstdc++ statique) |
| **SHA-256 (zip)** | `905626c83808dda5cfb09335e6405c77c32e2e6477340662695cdd3953094683` |

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/creepys_crackme#3.zip` | archive d'origine (mot de passe zip `crackmes.one`), contient `creepys crackme#3.exe` |
| `tools/creepys-crackme3-solve.py` | solveur (lit le PE, reconstruit le mot de passe, `--check` sous Wine) |
| `analysis/creepys_crackme3.objdump.asm` | `objdump -d -M intel` complet |

## Réponse

**Mot de passe (statique, pas de user)** : `4444afg56afg56bxdbxd`

```bash
python3 -I tools/creepys-crackme3-solve.py --check
```

## Premier regard

- `file` : PE32 console i386 ; `diec` : MinGW. 600 Ko car libstdc++ liée statiquement (`std::string`, `iostream`).
- Strings utiles en `.rdata` (VA `0x443000`) : `Please enter the password:`, `Great you have done`, `oh sorry please try again:-)`, `pause`.
- Et, juste après, quatre petits fragments suspects : `afg`, `44`, `bxd`, `56` (VA `0x443085`, `0x443089`, `0x44308c`, `0x443090`).

## Flow

`main` (`0x401390`) : affiche l'invite (`cout <<`), lit un `std::string` avec `cin >>` dans la globale `0x446024`, la compare (`operator==`) à une autre globale `std::string` en `0x446020`, puis affiche « Great you have done » ou « oh sorry… », et fait `system("pause")`.

## Comment on trouve

1. **Ancrage** : `objdump -d -M intel` puis recherche des références à la chaîne d'invite (`0x443000`) → `_main` @ `0x401390`.
2. **Le check** :
   ```asm
   4013dd call operator>>(cin, 0x446024)       ; saisie
   4013e2 mov [esp+4], 0x446020                ; chaîne attendue (globale)
   4013ea mov [esp],   0x446024                ; chaîne saisie
   4013f1 call operator==(string,string)
   4013f6 test al,al / 4013f8 je -> "oh sorry"
   ```
   La chaîne attendue n'est donc pas dans `.rdata` : elle est construite **avant `main`**.
3. **Constructeur statique** `__static_initialization_and_destruction_0` (`0x401484`) :
   quatre `std::string(const char*)` globales :

   | Global | char* source | Valeur |
   |---|---|---|
   | `0x446010` | `0x443085` | `afg` |
   | `0x446014` | `0x443089` | `44` |
   | `0x446018` | `0x44308c` | `bxd` |
   | `0x44601c` | `0x443090` | `56` |

4. **Assemblage** : une cascade de `operator+` (`0x401777`…`0x401873`, `call 43f2e8`), dont le 2ᵉ opérande est à chaque fois `[esp+8]` :
   `446014, 446014, 446010, 44601c, 446010, 44601c, 446018, 446018`
   soit `44`+`44`+`afg`+`56`+`afg`+`56`+`bxd`+`bxd` = **`4444afg56afg56bxdbxd`**, copié dans `0x446020`.
5. **Pièges** : le texte du mot de passe n'apparaît nulle part en entier dans `strings` ; l'offset fichier de `.rdata` (`0x40a00`) ≠ VA (`0x443000`) — `strings -t x` donne des offsets fichier.

## Vérification

```text
$ echo 4444afg56afg56bxdbxd | xvfb-run -a wine "creepys crackme#3.exe"
Please enter the password:        ##################
Great you have done
##################

$ echo 4444afg56afg56bxd | xvfb-run -a wine "creepys crackme#3.exe"     # KO
Please enter the password:        oh sorry please try again:-)
```

`tools/creepys-crackme3-solve.py --check` rejoue OK et KO (`petik`) automatiquement. Reverse 100 % statique + Wine (pas de session GDB).

## Notes

Pas de nom d'utilisateur : le mot de passe est constant. Le binaire d'origine n'est pas modifié (le zip est extrait dans un répertoire temporaire par le solveur).
