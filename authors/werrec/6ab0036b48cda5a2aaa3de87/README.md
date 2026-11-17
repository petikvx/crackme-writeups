# werrec's LATTICE4

| | |
|---|---|
| **ID** | [`6ab0036b48cda5a2aaa3de87`](https://crackmes.one/crackme/6ab0036b48cda5a2aaa3de87) ([`ORIGIN.yml`](ORIGIN.yml)) |
| **Auteur** | werrec |
| **Plateforme** | Windows PE64, console, MinGW-w64 (GCC 16.1, ucrt) |
| **SHA-256** `original/download.bin` | `8f8280f65f6b26e5ee0556a5d6f90c62153a8b7a80cde998fe08dc999963a915` |

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/download.bin` | ZIP du site (mot de passe `crackmes.one`), **non modifié** — contient `lattice4.exe` |
| `analysis/extracted/lattice4.exe` | exe extrait (SHA-256 `19c214c9…5071`) |
| `analysis/lattice4.asm` | `objdump -d -M intel` complet |
| `analysis/stage2-shellcode.dec.bin` / `.asm` | stage 2 déchiffré (RC4) + désassemblage |
| `tools/lattice4-solve.py` | solveur (`-q`, `--check`, `--search-first`) |
| `tools/lattice4-first-half-mitm.c` | meet-in-the-middle de la 1re moitié (appelé par `--search-first`) |

## Réponse

Pas de username : le programme lit **un serial de 16 caractères alphanumériques** (donc pas de `petik` ici).

> **`L4tT1cE4Gf256Z3x`** → `[ OK ]` + `flag{GF256_lattice_beats_hand_math}`

```bash
python3 -I tools/lattice4-solve.py            # serial + message
python3 -I tools/lattice4-solve.py -q         # serial seul
python3 -I tools/lattice4-solve.py --check L4tT1cE4Gf256Z3x
```

La solution est **unique** (le solveur énumère tout l'espace alnum compatible).

## Premier regard

- `diec` : PE64, rien de packé ; `strings` : MinGW, bannière `LATTICE-4`, `[ OK ]` / `[ NO ]`, import `ntdll`/`NtQueryInformation…`.
- Exe zippé dans `download.bin` : `python3 -I -c "zipfile.ZipFile(...).extractall(dir, pwd=b'crackmes.one')"` (pas d'`unzip`/`file` sur la machine).
- Lancé sous Wine avec une entrée quelconque : bannière puis `[ NO ]`.

## Flow

`main` = `0x1400039c0` (appelé depuis le CRT, code user en fin de `.text`).

1. Installe un **vectored exception handler** (`0x140001bb0`) puis exécute un `int3` (`0x1400039f5`). Le handler fait `byte[0x140004010] ^= 0x3c` et saute l'`int3` : la valeur `f` passe de `0x5a` à **`0x66`**. Sous debugger qui avale l'`int3`, `f` reste faux → mauvaise clé plus loin (anti-debug).
2. Affiche la bannière, `fgets` 32 octets, retire `\r\n`, exige **16 caractères `[0-9A-Za-z]`**.
3. **Stage 1** (8 premiers caractères, 4 prédicats). Si l'un échoue → `f ^= 0x11` (`0x140003bdf`) et on continue quand même avec une clé fausse.
4. **Stage 2** : `VirtualAlloc(0x3a0, RWX)`, copie des `0x3a0` octets de `.rdata:0x140005160`, **RC4** (`0x140001780`, clé 8 octets) puis appel du shellcode `rsi(serial, f)`. Retour 1 → `[ OK ]`.
5. Succès : RC4 de `.rdata:0x140005110` (0x23 octets) avec la clé `serial16 + f` → flag affiché.

## Comment on trouve

### Ancrage
```bash
objdump -d -M intel --no-show-raw-insn analysis/extracted/lattice4.exe > analysis/lattice4.asm
```
Le CRT MinGW est lisible (`__tmainCRTStartup`) ; `main` est l'appel `call 0x1400039c0` en `0x1400013b5`. Le code `-O2` y est dense mais court. (IDA/`decc` non disponibles sur cette machine → lecture asm directe.)

### Stage 1 — 8 premiers caractères (`0x140003bb0`–`0x140003e2b`)
Quatre contraintes sur `b[0..7]` :

1. **FNV-1a 32** (`0x811c9dc5`, `0x1000193`) : le `cmp eax,0x53fdd974` (`0x140003bd4`) porte sur la valeur **avant** le dernier `imul` (`h ^ b7`) — piège.
2. Hash `0x140003d40` : `eax = (c*0xa7 + SBOX[c]) ^ ecx ; ecx = rol(eax,7)*0x85ebca77`, init `0xa5a5c3c3`, final `eax == 0x73ac9527`. `SBOX` (`.rdata:0x140005500`) = **S-box AES**.
3. `(b3·b0 + b2·b1 + b6·b5 + b7·b4) mod 251 == 0xd1` ; `((31b0+17b1)^w(b2b3))·0x10001 + ((13b4+11b5)^w(b6b7)) == 0x58dc8bd7`.
4. `acc = acc*0x83 + SBOX[b_i]` (16 bits) `== 0x7583`.

Le FNV seul laisse ≈ 62⁸/2³² ≈ 5·10⁴ candidats ; les trois autres ne laissent qu'**une** solution. Recherche par **meet-in-the-middle** : 4 premiers caractères en avant (14,8 M), 4 derniers en arrière (FNV inversible : `h·0x1000193⁻¹`), jointure sur `h4`, filtre par les autres prédicats : `tools/lattice4-first-half-mitm.c` (~3 s) → **`L4tT1cE4`**.

### Stage 2 — shellcode chiffré
Clé RC4 (`0x140003c40`) : `key[i] = f ^ ((0xa7 + 13·i) & 0xff) ^ b[i]` pour `i<8` (la boucle s'arrête quand `al == 0x0f`, donc 8 tours), avec `f = 0x66`. Déchiffré avec la bonne clé, le blob donne du code x64 propre (`analysis/stage2-shellcode.asm`), signe que le stage 1 et `f` sont bons.

Le shellcode (`rcx` = serial, `dl` = `f`) :

1. `s[i] = b[i] ^ f ^ ((i+1)·0xa5 & 0xff)` puis **AES MixColumns** (GF(2⁸), poly `0x1b`, `sar 7 / and 0x1b`) sur 4 colonnes de 4 octets → `m[0..15]`.
2. Prédicats sur `m` et `b` :
   - `31·m[k] + 17·m[k+4] + 13·m[k+8] + m[k+12] ≡ {0xaa,0xe7,3,0x6d}[k] (mod 251)`, k=0..3 ;
   - `(m0·m5 + m10·m15 + m3·m12) mod 251 == 6` ; `m1^m6^m11^m14 == 0x80` ;
   - `acc = acc*0x83 + SBOX[m_i]` (16 bits) `== 0x5521` ;
   - FNV-like sur `(m_i + b_i) & 0xff`, `== 0x0256ae47` (pré-`imul` encore) ;
   - `(17·b13 + 31·b12) ^ w(b14b15) == 0x74b7` ;
   - `Σ (· 0xa7) (b_i ^ m_{i-8})` pour i=8..15 `== 0x7b41e7a6` ;
   - `h = rol(h,5) ^ ((b[15-i]|1)·m[i])` sur 16 tours `== 0x82945478`.

### Assemblage de la 2ᵉ moitié
Les colonnes 0–1 de `m` ne dépendent que de `b[0..7]` (connus). Pour la fin :

1. `b12,b13` alnum (3844 couples) → l'équation `0x74b7` **détermine** `b14,b15` ; on garde si alnum.
2. Colonne 3 connue → `m12..m15` ; l'équation mod 251 sur `k` donne `13·m[k+8] ≡ q_k − 31m_k − 17m_{k+4} − m_{k+12}` → `m[k+8]` (1–2 candidats chacun : `v` ou `v+251`).
3. **InvMixColumns** de `m8..m11` → `s` → `b8..b11 = s ^ f ^ ((i+1)·0xa5)` ; on garde si alnum.
4. Les 7 prédicats restants valident (un seul serial passe) : `L4tT1cE4` + `Gf256Z3x` (« GF256 »-ish, clin d'œil au MixColumns).

### Pièges
- Les `cmp` FNV portent sur la valeur pré-multiplication.
- `f` dépend de l'`int3`/VEH : `0x5a` → `0x66` ; en cas d'échec stage 1 un `xor 0x11` supplémentaire pollue la clé (aucun message d'erreur distinct).
- `.rdata:0x140005500` et la table du shellcode sont la même S-box AES (ne pas la chercher « custom »).
- L'import `ntdll` (`NtQueryInformation…`) n'a pas été exploré : sous Wine la solution passe telle quelle ; seul l'`int3`+VEH influe sur `f`.

## Vérification (Wine, binaire d'origine)

```bash
echo L4tT1cE4Gf256Z3x | xvfb-run -a wine analysis/extracted/lattice4.exe
```

| Entrée | Résultat |
|---|---|
| `L4tT1cE4Gf256Z3x` | `[ OK ]` + `flag{GF256_lattice_beats_hand_math}` |
| `L4tT1cE4Gf256Z3y` (dernier char changé) | `[ NO ]` |
| `AAAAAAAAAAAAAAAA` | `[ NO ]` |

`python3 -I tools/lattice4-solve.py --check …` donne le même verdict (OK / KO / KO). GDB et x64dbg n'ont pas été utilisés (reverse statique + émulation Python + Wine).

## Notes

- Le ZIP du site est conservé tel quel dans `original/` ; l'exe est extrait sous `analysis/extracted/`.
- Le serial est un **mot de passe fixe** (pas de keygen par utilisateur).
