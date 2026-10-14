# qhfs_crackme1 by qhf (crackmes.de)

- Origine : [ORIGIN.yml](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/5ab77f5633c5d40ad448c2bd)
- Auteur : **qhf** (archive crackmes.de, publié sur crackmes.one par `crackmes.de`)
- Plateforme : Windows x86, PE32 **console** MinGW C++ (iostream / `std::string`), non strippé (`.stab` / `main.cpp`)
- Difficulté site : 2.0
- Consigne (`original/readme.txt`) : *No Patching — Keygen is a must!*

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/qHFCrackme1.zip` | archive d’origine (password `crackmes.one`) |
| `original/crackme1.exe` | PE extrait (non modifié) |
| `original/readme.txt` | règles de l’auteur |
| `analysis/check_serial.objdump.txt` | désassemblage de `check_serial` |
| `analysis/check.txt` | sortie Wine OK / KO |
| `tools/qhfs_crackme1-solve.py` | keygen `-q` / `--check` |

## Réponse

Name / serial (12 caractères). Exemple avec le username de démo **`petik`** :

```text
Name   : petik
Serial : PPPEEETTTIII
```

```bash
./tools/qhfs_crackme1-solve.py -q petik    # → PPPEEETTTIII
./tools/qhfs_crackme1-solve.py --check     # prédicat + Wine
```

Sous Wine : *Good job. Now write a keygen and tutorial if you have the time.*

## Premier regard

```console
$ file original/crackme1.exe
PE32 executable for MS Windows 4.00 (console), Intel i386, 7 sections
$ diec original/crackme1.exe
PE32 / Compiler: MinGW
$ strings -n 6 original/crackme1.exe | head
AJXGRFV6BKOW3Y9TM4S2ZU I70H5Q81PDECLN...   # alphabet ×3
Enter Your Name:
Enter Your Serial:
Wrond serial. Keep trying.                 # typo dans une branche
Good job. Now write a keygen...
Wrong serial. Keep trying.
```

Symboles utiles (`nm`) :

- `_main` @ `0x401c8e`
- `__Z12check_serialSsSs` @ `0x40144c` — `bool check_serial(string, string)`
- `__Z13StringToUpperSs` — met name et serial en majuscules
- `__Z16stringFindSecondSsSs` — 2ᵉ occurrence de `needle` dans `haystack`

## Flow

1. Affiche `Enter Your Name:`, `getline` → name ; refuse si longueur ≤ 3 (non vide) ou vide.
2. Affiche `Enter Your Serial:`, `getline` → serial ; refuse si vide.
3. `check_serial(name, serial)` :
   - construit l’alphabet (constante `.rdata` `0x443000`) ;
   - `StringToUpper` sur name **et** serial ;
   - boucle `i = 0..3` puis sous-boucle de 3 caractères serial ;
   - retourne le booléen `lookingood`.
4. Message *Good job…* ou *Wrong serial…* (parfois *Wrond*).

## Comment on trouve le prédicat

1. **Ancrage** : `nm` / `objdump -d -M intel` → `check_serial` à `0x40144c`. Beaucoup de bruit C++ (exceptions SjLj) ; le cœur utile est vers `0x4017a9`–`0x401b79`.
2. **Alphabet** : construction `std::string` depuis `0x443000` :

   ```text
   AJXGRFV6BKOW3Y9TM4S2ZU I70H5Q81PDECLN   (37 chars = A–Z + 0–9 + espace, permutés)
   ```

   Répété 3 fois dans le binaire pour que `stringFindSecond` tombe toujours sur une 2ᵉ occurrence (= index + 37).

3. **Caractère de nom** (pour chaque `i ∈ {0,1,2,3}`) :

   ```text
   q = name.length() / 4          # division entière
   idx = floor(q * (i + 1)) - 1   # = q*(i+1) - 1
   name_char = name[idx]
   ```

   Pour `petik` (len 5 → q=1) : indices `0,1,2,3` → `P E T I` (le `K` final n’est pas utilisé).

4. **Triplet serial** : pour `j` de `i*3` à `i*3+2` (serial de longueur **12**) :
   - `serial_char = serial[j]`
   - `pos_n = stringFindSecond(alphabet, name_char)`
   - `pos_s = stringFindSecond(alphabet, serial_char)`
   - `if abs(pos_s - pos_n) > 5: lookingood = false`

   Comme les deux positions sont des « 2ᵉ occurrences », la différence est égale à la distance dans le bloc de 37 caractères. Pas de wrap circulaire : `|0 - 36| = 36 > 5`.

5. **Keygen minimal** : pour chaque `name_char`, écrire trois fois ce même caractère (distance 0) :

   | name | q | chars | serial |
   |---|---|---|---|
   | `petik` | 1 | P,E,T,I | `PPPEEETTTIII` |
   | `quinton` | 1 | Q,U,I,N | `QQQUUUIIINNN` |

   Toute autre combinaison dont chaque caractère du triplet reste à ≤ 5 positions de `name_char` dans l’alphabet est aussi valide.

## Prédicat (pseudo-code)

```python
ALPH = "AJXGRFV6BKOW3Y9TM4S2ZU I70H5Q81PDECLN"  # len 37

def ok(name, serial):
    name, serial = name.upper(), serial.upper()
    q = len(name) // 4
    for i in range(4):
        np = ALPH.index(name[q * (i + 1) - 1])
        for j in range(i * 3, i * 3 + 3):
            if abs(ALPH.index(serial[j]) - np) > 5:
                return False
    return len(serial) == 12
```

## Vérification

```console
$ printf 'petik\nPPPEEETTTIII\n' | xvfb-run -a wine original/crackme1.exe
Enter Your Name:   Enter Your Serial: Good job. Now write a keygen and tutorial if you have the time.

$ printf 'petik\nAAAAAAAAAAAA\n' | xvfb-run -a wine original/crackme1.exe
Enter Your Name:   Enter Your Serial: Wrong serial. Keep trying.

$ ./tools/qhfs_crackme1-solve.py --check
pred 'petik'    'PPPEEETTTIII' → True OK
...
wine 'petik'/'PPPEEETTTIII': Good OK
wine 'petik'/'AAAAAAAAAAAA': Wrong OK
```

Voir aussi `analysis/check.txt`.

## Notes

- Pas de patch : le keygen suffit (consigne auteur).
- Name > 3 caractères ; caractères hors alphabet → `std::string::find` / `npos` → échec.
- Deux messages d’échec (*Wrond* / *Wrong*) selon la branche.
- Pas de session GDB (reverse 100 % statique + preuve Wine).
