# whekkees's new crack me by whekkees

| | |
|---|---|
| **ID** | [`69b906c7ddd6176826ae8a28`](https://crackmes.one/crackme/69b906c7ddd6176826ae8a28) ([ORIGIN.yml](ORIGIN.yml)) |
| **Auteur** | whekkees |
| **Plateforme** | Windows PE64 console, MSVC 2022 (C++, `std::string` / `cin`) |
| **SHA-256** (`original/download.bin`) | `56a733da6096c7c13fa48a0d2cb8d45570711b9b8406a619cc26f6ea01632d95` |

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/download.bin` | en fait un **ZIP** (pass `crackmes.one`) contenant `crackme6.exe` — non modifié |
| `analysis/extracted/crackme6.exe` | exe extrait du ZIP |
| `analysis/crackme6.asm` | `objdump -d -M intel` complet |
| `analysis/crackme6.patched.exe` | **copie** patchée (1 octet) |
| `tools/whekkees-solve.py` | génère le patch, `--check` = preuve Wine, `--reach <pw>` = valeur calculée |
| `tools/whekkees-bruteforce.c` | brute-force exhaustif 2^32 qui prouve qu'aucun mot de passe n'existe |

## Réponse

**Il n'existe aucun mot de passe** qui affiche `Correct` : la valeur finale comparée (`0x6f3a9b21`) n'est jamais atteinte, quelle que soit l'entrée. Seule issue : **patcher** (`je` → `jmp` en VA `0x1400013d1`, octet de fichier `0x7d1` : `74 07` → `eb 07`), sur une copie.

```bash
python3 -I tools/whekkees-solve.py --check
# original petik -> Enter password: Wrong
# patché   petik -> Enter password: Correct
```

(Utilisateur d'exemple : le crackme n'a pas de login, `petik` sert de mot de passe test : `eax = 0x388e028f` ≠ `0x6f3a9b21` → `Wrong` sur l'original.)

## Premier regard

```bash
diec original/download.bin          # ZIP, pas un PE !
python3 -I -c "import zipfile; zipfile.ZipFile('original/download.bin').extractall('analysis/extracted', pwd=b'crackmes.one')"
diec analysis/extracted/crackme6.exe   # PE64, MSVC 14.44, LTCG
strings -n 5 analysis/extracted/crackme6.exe | grep -i -E "password|Correct|Wrong"
objdump -d -M intel analysis/extracted/crackme6.exe > analysis/crackme6.asm
```

Strings : `Enter password: `, `Correct`, `Wrong`, PDB `C:\sancikovich\crackme6\...`. Piège : le `.bin` du site est lui-même un ZIP (le script de scaffold a gardé l'archive intérieure).

## Flow

`main` ≈ VA `0x1400011c0` : affiche le prompt, `std::getline(cin, s)`, puis une **mini-VM à 14 opcodes** sur un accumulateur `eax` initialisé à `0x1337`, et enfin `cmp eax, 0x6f3a9b21` → `Correct` / `Wrong`.

## Comment on trouve le prédicat

1. **Ancrage** : les xrefs des strings `Correct`/`Wrong` (`0x1400033e8` / `0x1400033f4`) mènent à `0x1400013c5 : cmp eax,0x6f3a9b21 ; je`.
2. **Le bytecode** est posé sur la pile en immediates LE (`0x1400012_8e…`) :
   `0x04030201`, `0x01020301`, `0x02010304`, `0xff04` →
   `01 02 03 04 01 03 02 01 04 03 01 02 04 ff`.
3. **Dispatch** (`0x140001300`) : chaîne de `sub edx,1 / je` :

| op | handler | effet sur `eax` |
|---|---|---|
| 1 | `0x140001372` | si `i < len(s)` : `eax += ((int8)s[i] ^ 0x55) * 7 ; i++` |
| 2 | `0x14000136d` | `ror eax, 0x1d` |
| 3 | `0x140001366` | `eax ^= 0xa5a5a5a5` |
| 4 | `0x140001357` | `eax += (eax ^ 0x12345678) >> 2` |
| 0xff | `0x1400013c5` | sortie de boucle → comparaison |

4. **Leurres** : après chaque op, un bloc `xor 0xdeadbeef / add 0x1234 / shr 3` travaille sur `[rbp-0x39]` (stockage mort, jamais relu dans `eax`) ; de même le buffer de 5 octets `ef 86 10 b0 40` et la boucle `0x539` / `0xdead` après l'affichage (qui ne calcule que le code retour = parité).
5. **Le prédicat** utilise donc seulement 4 caractères (4 × opcode 1) ; les suivants sont ignorés.

### Pourquoi c'est impossible

- Modèle Python (`run()` dans le solveur) validé contre une **émulation unicorn** du code réel (`0x1400012f8→0x1400013c5`) : mêmes valeurs sur `abcd`, `petik`, `xyz!`.
- `tools/whekkees-bruteforce.c` énumère **tous** les mots de 0 à 4 octets (octets 0–255, signés comme `movsx`), soit 2^32 cas : **aucun** n'aboutit à `0x6f3a9b21` (`gcc -O2`, ~1 min). Les valeurs calculées tournent autour de `0x388…` ; l'opcode 4 non injectif + cette longueur fixe rendent la cible inatteignable.
- Conclusion : crackme à cible inatteignable → réponse par **patch**.

## Debug

Pas de GDB ni de debugger live utilisés (reverse statique + émulation unicorn + Wine) : pas de section GDB.

## Vérification

```bash
python3 -I tools/whekkees-solve.py --check
xvfb-run -a wine analysis/extracted/crackme6.exe   # n'importe quelle entrée -> Wrong
xvfb-run -a wine analysis/crackme6.patched.exe     # n'importe quelle entrée -> Correct
python3 tools/whekkees-solve.py --reach petik       # 0x388e028f (cible 0x6f3a9b21)
```

- KO : original + `petik` / `abcd` → `Wrong`.
- OK : copie patchée + `petik` / `abcd` → `Correct`.

## Notes

- `original/` jamais modifié ; le patch vit sous `analysis/`.
- Si l'auteur a prévu un mot de passe, la constante `0x6f3a9b21` (ou la VM) est incohérente avec ce que le binaire calcule : rien de plus à trouver par entrée clavier.
