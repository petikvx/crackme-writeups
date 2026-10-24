# crackmes.de's creepys_crackme by creepy

| | |
|---|---|
| **ID** | [`5ab77f5733c5d40ad448c327`](https://crackmes.one/crackme/5ab77f5733c5d40ad448c327) · [`ORIGIN.yml`](ORIGIN.yml) |
| **Auteur (site)** | crackmes.de (creepy) |
| **Plateforme** | Windows PE32 console, MinGW (g++ 3.x, libstdc++ statique) |
| **SHA-256 (zip)** | `63dd0be138b6aa69f897d7d3e91150b8b33278ec56ecd352b13aa8913fd97233` |

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/Creepy`sfirstcrackme.zip` | archive d'origine (mot de passe zip `crackmes.one`), contient `Creepy`sfirstcrackme.exe` |
| `tools/creepys-crackme1-solve.py` | solveur (lit la constante dans le PE, `--check` sous Wine) |
| `analysis/creepys_crackme1.main.asm` | `objdump -d -M intel` de `_main` |

## Réponse

**Serial (pas de user)** : `15346`

```bash
python3 -I tools/creepys-crackme1-solve.py --check
```

## Premier regard

- `file` : PE32 console i386 ; `diec` : MinGW. 585 Ko car libstdc++ statique.
- Strings : `Type in the serial now:`, `# Great Work Cracker:) #`, `OHHH good luck next time bye bye ;-)`, `pause`.
- Aucun serial en clair dans `strings` : le serial est numérique, stocké en binaire.

## Flow

`_main` (`0x401390`) : bannière, `cout << "Type in the serial now:"`, puis `cin >> long double` (`operator>>(long double&)`, `0x427ec0`) dans `[ebp-0x18]`, comparaison FPU avec une constante 80 bits, puis succès/échec et `system("pause")`.

## Comment on trouve

1. **Ancrage** : `objdump -d -M intel Creepy\`sfirstcrackme.exe --start-address=0x401390` → `_main`. Le symbole n'est pas strippé.
2. **Le check** (`0x401418`–`0x401455`) :
   ```asm
   401418 call 427ec0 <_ZNSirsERe>      ; cin >> long double  → [ebp-0x18]
   401441 fld  TBYTE PTR [ebp-0x18]     ; saisie
   401444 fld  TBYTE PTR ds:0x4400f0    ; constante attendue (80 bits)
   40144a fxch st(1)
   40144c fucompp                       ; comparaison flottante
   40144e fnstsw ax / 401450 sahf
   401451 jp  401455                    ; NaN → échec
   401453 je  401457                    ; égal → "Great Work Cracker"
   401455 jmp 4014d5                    ; sinon "OHHH good luck next time"
   ```
3. **Décodage de la constante** : `.rdata` VA `0x440000` ↔ offset fichier `0x3e200` (donc VA `0x4400f0` = offset `0x3e2f0`). Octets : `00 00 00 00 00 00 c8 ef | 0c 40` (format x87 : mantisse 64 bits LE, puis signe+exposant 16 bits LE).
   - mantisse = `0xefc8000000000000`, signe/exposant = `0x400c` → signe 0, exposant = `0x400c − 0x3fff = 13`
   - valeur = `mant / 2^63 × 2^13` = `1,873…× 8192` = **15346** (calcul exact avec `Fraction` dans le solveur).
4. **Pièges** :
   - la constante est un `long double` x87 (10 octets), pas un `double` : un décodage en `double` donne n'importe quoi ;
   - `mov eax, 0x466fc800 → [ebp-0x1c]` (`0x4013ba`) est le float IEEE `15346.0f` (`0x466fc800`), stocké puis jamais relu : reste du code source, qui confirme au passage la valeur 15346 ;
   - `15346` et `15346.0` sont tous deux acceptés (parse flottant), pas de chaîne comparée.
5. Pas d'utilisateur : le serial est constant (exemple `petik` non applicable).

## Vérification

```text
$ echo 15346 | xvfb-run -a wine "Creepy`sfirstcrackme.exe"
Type in the serial now:
         ######################
        # Great Work Cracker:) #
         ######################

$ echo 12345 | xvfb-run -a wine "Creepy`sfirstcrackme.exe"      # KO
OHHH good luck next time bye bye ;-)
```

`15346.0` est aussi accepté. `--check` rejoue OK et KO automatiquement. Reverse 100 % statique + Wine (pas de session GDB).

## Notes

Le binaire d'origine n'est pas modifié (le solveur extrait le zip dans un répertoire temporaire).
