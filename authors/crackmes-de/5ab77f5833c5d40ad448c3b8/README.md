# keygenme_2 (`KeyGenMe #2.exe`) by ank83 — crackmes.de

| | |
|---|---|
| **ID** | [`5ab77f5833c5d40ad448c3b8`](https://crackmes.one/crackme/5ab77f5833c5d40ad448c3b8) ([`ORIGIN.yml`](ORIGIN.yml)) |
| **Auteur (site)** | crackmes.de (ank83) |
| **Plateforme** | Windows PE32 console, MSVC 6, packé UPX 1.93 |
| **SHA-256 (zip)** | `7f83b3e37c67382a4495a3b2bedeb2d1ba4da61654d907d97fd18bc8df30e58b` |

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/keygenme2byank83.zip` | archive d'origine (mot de passe `crackmes.one`) : `KeyGenMe #2.exe` + `ReadMeButYouDontHaveTo.txt` |
| `analysis/kg2.exe` | copie extraite de l'exe (packé) |
| `analysis/kg2.unpacked.exe` | exe dépacké (`tools/upx-3.96 -d`) |
| `tools/keygenme2-solve.py` | keygen + `--check` (Wine/xvfb contre l'exe d'origine) |

## Réponse

Le crackme demande un **ID (0…999)** puis un **serial** (pas de nom : l'utilisateur `petik` ne s'applique pas).

**serial = (2·ID + 1)² − 190**

| ID | serial |
|---|---|
| 5 | `-69` |
| 0 | `-189` |
| 7 | `35` |

```bash
python3 tools/keygenme2-solve.py 5        # ID=5 serial=-69
python3 tools/keygenme2-solve.py --check 7
```

## Premier regard

- `file` : PE32 console i386, UPX ; `diec` : MSVC 6.0, UPX 1.93.
- Le README de l'auteur : « just simple math », règles : pas de patch, keygen + solution.
- Lancé sous Wine : « So let's begin by entering ID (0...999): » puis « Now enter the serial: » ; échec = « Please try again ! », succès = « Wow ! You did it. Congratulation… ».

## Comment on trouve

1. **Dépack** : `./tools/upx-3.96 -d -o analysis/kg2.unpacked.exe analysis/kg2.exe`.
2. **Ancrage** : `strings` donne les messages ; la chaîne `Now enter the serial` est référencée en VA `0x4280c8`. `objdump -d -M intel` : le `push 0x4280c8` est à `0x4011aa`, dans `main` (`0x401000…0x401213`). Les lectures se font via `cin >> int` (`call 0x401240`, `ecx=0x42ca18`), les écritures via `cout << str` (`call 0x4016f0`).
3. **Calcul** (variable locale `[ebp-4]` = ID saisi) :

```asm
401162  mov ecx,[ebp-4] ; add ecx,1 ; mov [ebp-4],ecx   ; x = id+1
40116b  mov edx,[ebp-4] ; add edx,[ebp-4] ; ...          ; x = x+x   (2id+2)
401177  sub eax,1                                         ; x = x-1   (2id+1)
401180  imul ecx,[ebp-4]                                  ; x = x*x
401187  mov [ebp-8],1            ; for (i=1; i<20; i++)
40119f  mov eax,[ebp-4] ; sub eax,[ebp-8]                 ;   x -= i   (total 190)
```

4. **Comparaison** : le serial lu va dans `[ebp-0xc]` ; `cmp edx,[ebp-0xc]` en `0x4011ca` → égal : message de succès (`0x42806c`), sinon `0x4011e6` affiche l'échec (`0x42801c`). Comparaison signée sur 32 bits, donc le serial peut être négatif (ID 0 → `-189`).
5. **Formule** : `((id+1)*2-1)² - Σ(1..19) = (2id+1)² - 190`.

Pièges : les opérations « inutiles » `+1, ×2, −1` (compilé en `-O0`) cachent simplement `2id+1` ; la boucle s'arrête à `i<20` (`cmp 0x14 / jge`), donc 19 itérations → 190, pas 210.

## Vérification

```text
$ python3 tools/keygenme2-solve.py --check 7
id=7 serial=35 -> OK (attendu OK)
id=7 serial=36 -> KO (attendu KO)
```

Aussi testé à la main : `5` / `-69` et `0` / `-189` → « Wow ! You did it. Congratulation » ; `5` / `1` → « Please try again ! » (`xvfb-run -a wine "KeyGenMe #2.exe"`, stdin redirigé).

## Notes

- Pas de GDB ni de debugger utilisé : reverse statique (`objdump`) + preuve Wine.
- Le binaire d'origine (`original/`) n'est pas modifié.
