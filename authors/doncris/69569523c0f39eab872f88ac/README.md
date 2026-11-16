# DonCris's Time Rift 2026

| | |
|---|---|
| **ID** | [`69569523c0f39eab872f88ac`](https://crackmes.one/crackme/69569523c0f39eab872f88ac) · [`ORIGIN.yml`](ORIGIN.yml) |
| **Auteur** | DonCris |
| **Plateforme** | Windows PE64, C++ MinGW GCC 13.2 (console) |
| **SHA-256** | `a0bd8e19b41c2f862ff99db493d21b67126343622e752c3126134a8a818e0df8` |

| Fichier | Rôle |
|---|---|
| `original/download.bin` | ZIP (mot de passe `crackmes.one`) contenant `TimeRift2026.exe` |
| `tools/timerift-solve.py` | keygen + `--check` (Wine) |

## Réponse

Quatre saisies successives, pour l'identité `petik` :

| Étape | Saisie |
|---|---|
| Identité | `petik` |
| Flux | `132` |
| Mot de passe | `tomorrow` |
| Clé | **`35738094480`** |

```bash
python3 tools/timerift-solve.py petik            # affiche tout
python3 tools/timerift-solve.py -q petik         # clé seule
python3 tools/timerift-solve.py --check /chemin/TimeRift2026.exe   # preuve sous Wine
```

## Premier regard

`download.bin` est un ZIP : `unzip -P crackmes.one` (dans un dossier vide, hors dépôt). `diec` : PE64, MinGW GCC 13.2.
`strings` montre les messages et un indice : `KEY = (SOUL_SIGNATURE XOR 0x2026) * FLUX_VALUE`.
Le binaire n'est pas strippé : symboles C++ lisibles (`main`, `calculate_soul_signature`).

## Flow

1. `>> ENTER CHRONOLOGIST IDENTITY` : nom ≥ 3 caractères, affiche la « soul signature ».
2. `CURRENT YEAR: 1894 / TARGET: 2026` : on saisit un entier (flux).
3. Mot de passe texte.
4. `ENTER ACCESS CODE` : clé numérique 64 bits → `TIMELINE STABILIZED`.

## Comment on trouve

Ancrage : `objdump -d -M intel TimeRift2026.exe`, fonction `main` (0x1400014f4) et `calculate_soul_signature` (0x140001360).

- **Soul signature** (0x140001360) : `h=0x1505` puis pour chaque octet `h = (h<<5) + h + (signed char)c` — c'est djb2 (`h*33+c`) sur 32 bits. `petik` → `0x10231642`, ce que le binaire affiche aussi sous Wine.
- **Flux** (0x140001953) : `0x766` (1894, stocké en `[rbp+0x434]`) `+ saisie == 0x7ea` (2026) → saisie = **132**.
- **Mot de passe** (0x140001bff) : la saisie est passée en minuscules (`std::transform` + `tolower`) puis comparée à la chaîne `.rdata+0x539` = `tomorrow` → donc la casse est libre.
- **Clé** (0x140001d3b) :
  ```asm
  mov eax,[rbp+0x438]   ; soul
  xor eax,0x2026
  mov edx,eax           ; zero-extend 32 bits
  mov eax,[rbp-0x24]    ; flux saisi (132)
  cdqe
  imul rax,rdx          ; 64 bits
  mov [rbp+0x428],rax   ; comparé à la saisie (cin >> unsigned long long)
  ```
  petik : `(0x10231642 ^ 0x2026) = 0x10233664 = 270743140` ; `× 132 = 35738094480`.
  (Le produit dépasse 32 bits, d'où la saisie lue en `unsigned long long`.)

Pièges : la clé dépend du flux saisi (pas d'une constante), donc elle suppose d'avoir saisi 132 ; les sorties sont ralenties (`slow_print`, `Sleep`) et l'écran est effacé par `system("cls")`.

## Vérification

Preuve réelle contre l'exe d'origine (Wine, stdin) :

```text
$ python3 tools/timerift-solve.py --check TimeRift2026.exe -q
35738094480
CHECK: OK                      # « TIMELINE STABILIZED »
$ printf 'petik\n132\nwrong\n1\n\n'    | wine TimeRift2026.exe  → [FAILURE] PARADOX CONSUMED YOU. INCORRECT ANSWER.
$ printf 'petik\n132\ntomorrow\n1\n\n' | wine TimeRift2026.exe  → [FATAL] ACCESS DENIED. TIMELINE COLLAPSE IMMINENT.
```

## Notes

- Aucun GDB / debugger : reverse statique (`objdump`) + exécution sous Wine.
- L'exe n'est extrait que dans un dossier temporaire ; `original/` est intact.
