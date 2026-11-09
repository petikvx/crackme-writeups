# kretrod's my first password crackme

| | |
|---|---|
| **ID** | [`6ae119d5c0ad374eab0813b6`](https://crackmes.one/crackme/6ae119d5c0ad374eab0813b6) ([`ORIGIN.yml`](ORIGIN.yml)) |
| **Auteur** | kretrod |
| **Plateforme** | Windows PE32+ x86-64, console, 6656 octets, 2 sections (`.text`, `.bss`) |
| **SHA-256** | `6c398bd350d9c69f59483b0af423a595f9369fcf17355d9eb2d157bced5b6de5` |

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/my-first-crackme.exe` | binaire d'origine (non modifié) |
| `tools/kretrod-solve.py` | extrait le mot de passe du PE ; `--check` le vérifie sous Wine |

## Réponse

Pas de username : un seul mot de passe (pas besoin de `petik` ici).

> **`SECRET-PASSWORD_2026`**

```bash
python3 -I tools/kretrod-solve.py [-q] [--check]
```

## Premier regard

```bash
file original/my-first-crackme.exe     # PE32+ console x86-64, 2 sections
strings -n 4 original/my-first-crackme.exe
objdump -d -M intel original/my-first-crackme.exe
```

Binaire minuscule, sans table d'imports lisible par `strings`, `.text` seule (+ `.bss`) : les données sont mêlées au code. Les chaînes visibles dans `.text` (VA `0x140002360`…) sont `SECRET-PASSWORD_2026`, `What's the password? `, `CORRECT!!`, `WRONGGGG!`, `Press enter to exit..`.

Piège : `strings` sort aussi `true` / `false` (runtime du langage) — sans rapport avec le check.

## Flow

1. Affiche `What's the password? ` (fonction d'écriture `0x14000130b`/`0x1400010cd` sur fd 1).
2. Lit la ligne sur stdin.
3. Compare avec la chaîne embarquée ; affiche `CORRECT!!` ou `WRONGGGG!`.
4. Affiche `Press enter to exit..` et attend une entrée.

## Comment on trouve

Ancrage : `main` à `0x140001000`. Après la lecture, le code charge l'entrée (`rdi`/`rsi` = pointeur/longueur de la ligne lue, nettoyée de son `\n`) puis :

```asm
140001051: lea rdx,[rip+0x1308]   ; rdx = 0x140002360 -> "SECRET-PASSWORD_2026"
140001058: mov ecx,0x14           ; longueur attendue = 20
14000105d: call 0x1400012e8       ; streq(input, len, ref, 20)
140001065: test rsi,rsi / je wrong
```

La fonction `0x1400012e8` est une égalité d'octets triviale :

```asm
1400012e8: cmp rsi,rcx            ; longueur saisie == 20 ?
1400012eb: jne fail
1400012f1: mov rcx,rsi ; mov rsi,rdi ; mov rdi,rdx
1400012fa: repz cmps BYTE PTR [rsi],[rdi]   ; compare octet par octet
1400012fc: jne fail
140001302: mov eax,1 ; ret
```

Aucune transformation : le mot de passe est la chaîne stockée en clair à `0x140002360` (offset fichier `0x1160`, car `.text` VA `0x140001000` ↔ offset `0x200`), de 0x14 = 20 octets :

```
53 45 43 52 45 54 2d 50 41 53 53 57 4f 52 44 5f 32 30 32 36
S  E  C  R  E  T  -  P  A  S  S  W  O  R  D  _  2  0  2  6
```

Les branches `je` mènent aux messages `WRONGGGG!` (`0x1400023b3`) / `CORRECT!!` (`0x1400023a1`), chacun de 10 octets.

## Vérification

```bash
echo SECRET-PASSWORD_2026 | xvfb-run -a wine original/my-first-crackme.exe
# What's the password? CORRECT!!
echo SECRET-PASSWORD_2025 | xvfb-run -a wine original/my-first-crackme.exe
# What's the password? WRONGGGG!
python3 -I tools/kretrod-solve.py --check   # OK (CORRECT) / OK (WRONG)
```

## Notes

- Reverse 100 % statique + Wine ; pas de session GDB ni de debugger live.
- La longueur est testée avant le contenu : toute chaîne ≠ 20 caractères est rejetée d'office.
- Challenge « premier crackme » : pas de protection, pas d'anti-debug.
