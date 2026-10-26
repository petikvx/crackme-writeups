# CrackMe #4 / crackme_4_combo — KLiZMA

| | |
|---|---|
| **ID** | [`5ab77f5733c5d40ad448c37b`](https://crackmes.one/crackme/5ab77f5733c5d40ad448c37b) — voir [`ORIGIN.yml`](ORIGIN.yml) |
| **Auteur (site)** | crackmes.de (KLiZMA) |
| **Plateforme** | Windows PE32 console (i386), MinGW, packé FSG |
| **SHA-256 zip** | `e3051d57c3fbb2b9abb41629f5aa7ae83f04577fa3fdbe8d548638f35337b502` (mot de passe `crackmes.one`) |
| **Type** | keygen / 3 stages (`scanf("%ld")` ×8), pas de nom → pas de `petik` |

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/CrackMe_#4_by_KLiZMA.zip` | archive d'origine (`crackme.exe` + `readme.txt`), non modifiée |
| `tools/crackme4-combo-solve.py` | keygen des 3 stages ; `--check` lance l'exe d'origine sous Wine (cas OK + KO) |
| `tools/crackme4-unpack.py` | dépack FSG par émulation unicorn → `analysis/crackme4-fsg-image.bin` |
| `analysis/crackme4-orig.exe` | `crackme.exe` extrait du zip |
| `analysis/crackme4-fsg-image.bin` | image mémoire `0x400000..0x408000` après décompression FSG |
| `analysis/crackme4-unpacked-0x401000.asm` | `objdump -D` du code dépacké (VMA `0x401000`) |

## Réponse

Les 8 entrées, dans l'ordre (un `Enter` après chacune) :

| Prompt | Valeur |
|---|---|
| Stage 1 `Enter serial` | `99999999` |
| Stage 2 `1st serial` | `999999` |
| Stage 2 `2nd serial` | `100998974` |
| Stage 2 `3rd serial` | `196288` |
| Stage 2 `4th serial` | `199802686` |
| Stage 2 `5th serial` | `1976544` |
| Stage 3 `Enter ID` | `196288` |
| Stage 3 `Enter Code` | `1976544` |

```bash
python3 tools/crackme4-combo-solve.py --check      # affiche la table, exécute sous Wine (OK + KO)
python3 tools/crackme4-combo-solve.py -q           # une ligne : les 8 valeurs
python3 tools/crackme4-combo-solve.py --serial 19999999 --first 500000   # autre jeu (si valide)
```

## Premier regard

```text
$ file crackme.exe
PE32 executable for MS Windows 4.00 (console), Intel i386, 2 sections
$ diec crackme.exe
Protector: AHTeam EP Protector(0.3)      # faux positif : c'est FSG (signature "FSG!" @0x14)
$ xvfb-run -a wine crackme.exe
.:: STAGE 1 [LUCK] ::.
Enter serial:
```

`readme.txt` : « 1. unpack it 2. complete 3 stages 3. write tutorial and make keygen 4. no self-keygenning and 'all accept' patching ». Les `strings` du packé ne montrent presque rien. Même packer et même layout que les autres KLiZMA du dépôt (#5, #2) : EP `0x4079fd` = `nop…; mov eax,0x400154 ; jmp eax` → stub FSG dans l'en-tête PE.

## Flow

`main` @`0x401290` (MinGW). Chaque stage lit des `%ld` (`scanf`, format @`0x403029`), et **tout échec appelle `exit(0)`** (`0x401b90`) sans message : pas de « Wrong ». Stage 1 → 2 → 3 puis `Best! STAGE 3 completed!`.

## Comment on trouve

### Ancrage : dépack FSG

```bash
unzip -P crackmes.one original/CrackMe_#4_by_KLiZMA.zip -d /tmp/cm4
objdump -d -M intel --start-address=0x4079fd /tmp/cm4/crackme.exe | head   # nop.. ; mov eax,0x400154
python3 tools/crackme4-unpack.py     # unicorn : emu_start(0x4079fd) jusqu'à 0x4001c6 (fin de décompression)
```

Le stub FSG décompresse les sections vers `0x401000..0x405000`. À l'arrêt, `ebx=0x4079c4` pointe la table FSG, `[ebx+0xc] = 0x401220` = **OEP**. Les chaînes deviennent lisibles (`.:: STAGE 1 [LUCK] ::.`, `Enter ID:`, `%ld`@`0x403029`…). Désassemblage : `objdump -D -b binary -m i386 -M intel --adjust-vma=0x401000` du code (cf. `analysis/crackme4-unpacked-0x401000.asm`).

### Stage 1 — [LUCK] : `check1` @`0x40156e`

L'entrée `n` doit être dans `0..99999999` (sinon affiche `May be cup of tea...` mais **continue**). Une boucle (×8) extrait les chiffres décimaux (division par 10 via `imul 0x66666667`) dans un buffer `b[0..7]`, `b[0]` = unités :

```asm
4015eb movsx edx,[ebp-0x20]   ; b0
4015ef movsx eax,[ebp-0x1f]   ; b1
4015f5 imul  ecx,eax          ; b0*b1
...                           ; + b2*b3     -> [ebp-0x10]
401609 b4*b6 + b5*b7          -> [ebp-0x14]
40162a cmp [ebp-0x10],[ebp-0x14] ; égalité => retourne 1
```

Prédicat : `b0·b1 + b2·b3 == b4·b6 + b5·b7`. Piège : l'appariement est `(4,6)` et `(5,7)` (offsets `-0x1c/-0x1a` et `-0x1b/-0x19`), pas `(4,5)/(6,7)`. `99999999` convient (81+81 = 81+81).

### Stage 2 — [MATH] (`0x40130f`…`0x4014ce`)

Notons `S` le serial du stage 1 et `A` le 1er serial du stage 2 (contrôle `99999 < A <= 999999`, sinon `exit`). Les suivants sont comparés à des valeurs calculées (les divisions par 2^k sont signées : `add 2^k-1` si négatif puis `sar`) :

| Entrée | Condition | asm |
|---|---|---|
| 2nd `v2` | `v2 = A + S − 0x400` | `0x401379..0x40138a` |
| 3rd `v3` | `v3 = (S + v2) >> 10` | `0x4013bc..0x4013de` |
| 4th `v4` | `v4 = S − A + v2 − v3` | `0x401410..0x401424` |
| 5th `v5` | `v5 = S>>8 + A>>7 + v2>>6` | `0x401456..0x4014af` |

Avec `S=99999999`, `A=999999` : `v2=100998974`, `v3=196288`, `v4=199802686`, `v5=1976544`.

### Stage 3 — [INTERVAL] (`0x4014ce`…`0x401556`)

Deux intervalles, bornés par les valeurs du stage 2 :

- `ID` : `99999 < ID <= v3` (`[ebp-0x2c]` vs `[ebp-0x10]`, `jle`/`jg` → `exit`)
- `Code` : `999999 < Code <= v5` (`[ebp-0x30]` vs `[ebp-0x18]`)

Donc `v3 ≥ 100000` et `v5 ≥ 1000000` imposent des `S` et `A` grands (ordre de `S ≳ 5·10⁷` pour `v5`, car `v5 ≈ 0,0195·S + 0,0234·A`). On prend `ID = v3`, `Code = v5` (bornes hautes incluses). Le solveur `assert` ces bornes.

### Pièges

- `diec` annonce « AHTeam EP Protector » : leurre, c'est FSG ; inutile de chercher un unpacker dédié, l'émulation unicorn suffit.
- Sortie silencieuse sur échec (`exit(0)`) : seul l'absence du prompt suivant indique l'erreur.
- Les messages de prompts ont des fautes (`Enetr 3rd serial`) : normal.
- Stage 1 : valeurs ≥ `10^8` donnent `cup of tea` mais seuls 8 chiffres sont lus (`100000000` → chiffres tous nuls → passe).

## Vérification

```text
$ python3 tools/crackme4-combo-solve.py --check
--- OK ---
.:: STAGE 1 [LUCK] ::.   Good! STAGE 1 completed!
.:: STAGE 2 [MATH] ::.   Good! STAGE 2 completed!
.:: STAGE 3 [INTERVAL] ::.
Best! STAGE 3 completed! Now write tutorial and make keygen!
```

Cas KO : `printf '11111112\n' | xvfb-run -a wine crackme.exe` (2·1+1·1 = 3 ≠ 1·1+1·1 = 2) → le programme quitte aussitôt après le prompt, sans `Good!`. (`--check` teste aussi `S+1`, qui ne passe plus le stage 2.)

Pas de session GDB ni de debugger live : reverse 100 % statique + émulation unicorn pour le dépack, preuve par Wine.

## Notes

- Pas de user/login : `petik` non applicable.
- Pas de patch : la règle 4 du readme interdit l'« all accept » ; ici on fournit le keygen.
- Les serials ne dépendent que d'`S` et `A` (libres sous contraintes) : plusieurs jeux valides.
