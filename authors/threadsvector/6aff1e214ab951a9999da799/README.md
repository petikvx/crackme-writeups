# threadsvector's Multi

| | |
|---|---|
| **ID** | [`6aff1e214ab951a9999da799`](https://crackmes.one/crackme/6aff1e214ab951a9999da799) ([`ORIGIN.yml`](ORIGIN.yml)) |
| **Auteur** | threadsvector |
| **Plateforme** | Windows PE64, console, MinGW (g++/libstdc++), strippé |
| **SHA-256** | `a5342d6b33fe055cdceaf878e35efaaeb98cc0934c56a96fb84a66dbe779fad9` |

| Dossier | Contenu |
|---|---|
| `original/` | `crackmebythreadvector.exe` (non modifié) |
| `tools/threadsvector-solve.py` | solveur + `--check` (Wine) |

## Réponse

**Mot de passe : `123threadvector321`** (pas de user/login dans ce crackme).

```bash
python3 -I tools/threadsvector-solve.py [-q] [--check]
```

## Premier regard

- `file` : PE32+ console x86-64, MinGW ; `strings` : `Password: `, `Invalid Password.`, `Correct Password!`, `Press Enter To Continue...`. Aucune chaîne du mot de passe en clair (il est découpé en morceaux).
- Le nom « Multi » / les symboles pthread (winpthreads) sont du bruit : le runtime MinGW les embarque, la vérification n'utilise pas de threads.

## Flow

Boucle : affiche `Password: `, lit une ligne (`std::getline`), la compare à une chaîne attendue ; sinon `Invalid Password.` + pause et on recommence ; sinon `Correct Password!`.

## Comment on trouve

1. **Ancrage** : `objdump -d -M intel original/*.exe`, puis recherche des `lea rdx,[rip+…]` vers `.rdata` : les chaînes `Password: ` (`0x1400cb0b2`), `Invalid Password.` (`0x1400cb063`) et `Correct Password!` (`0x1400cb02d`/`0x1400cb07d`) sont référencées uniquement par la fonction `main` à `0x1400c4770`.
2. **Construction de la chaîne attendue** (début de `main`, avant la boucle) : quatre `std::string` globales dans `.data` (`0x1400c7000`, `+0x20`, `+0x40`, `+0x60`, chacune `{char* ptr; size_t len; buf SSO[16]}`), concaténées à coups de `memcpy` (`0x1400198f8`) :

```asm
1400c4788  mov rdi,[0x1400c7068]   ; len(D)=3  -> r15 = ptr D (0x1400c7060)
1400c478f  mov r12,[0x1400c7048]   ; len(C)=6  -> r14 = ptr C (0x1400c7040)
; ... tmp = D ; tmp += C                       (appel 0x1400198f8)
1400c483e  mov rdi,[0x1400c7028]   ; len(B)=6  -> r14 = ptr B (0x1400c7020)
; ... tmp += B
1400c48e8  mov rsi,[0x1400c7008]   ; len(A)=3  -> r15 = ptr A (0x1400c7000)
; ... tmp += A   -> attendu
```
3. **Valeurs** (`objdump -s -j .data`) : A=`321` (`0x1400c7010`), B=`vector` (`…7030`), C=`thread` (`…7050`), D=`123` (`…7070`).
4. **Assemblage** : D + C + B + A = `123` + `thread` + `vector` + `321` = `123threadvector321` (17 caractères ; piège : l'ordre des déclarations en mémoire est A,B,C,D, mais la concaténation se fait dans l'ordre inverse D,C,B,A).
5. **Comparaison** (`0x1400c4c17`–`0x1400c4c3b`) : `len(saisie) == len(attendu)` puis `memcmp` (`0x1400198f0`) → `sete r15b` ; `r15b` non nul ⇒ branche `Correct Password!` (`0x1400c4c68`).

Le solveur relit ces 4 chaînes directement dans le PE (offset fichier = VA − `0x1400c7000` + `0xc5a00`) et les concatène.

## Vérification (Wine)

```bash
$ python3 -I tools/threadsvector-solve.py --check
Password: 123threadvector321
check: OK
```

- OK : `printf '123threadvector321\n\n' | xvfb-run -a wine original/crackmebythreadvector.exe` → `Correct Password!` / `Press Enter To Continue...`.
- KO : saisie `wrong` → `Invalid Password. Press Any Key To Try Again...` en boucle.

## Notes

- Après succès, le programme reboucle si stdin atteint EOF : `--check` coupe donc au timeout et lit la sortie partielle.
- Reverse 100 % statique (objdump) + preuve Wine ; GDB / x64dbg non utilisés.
