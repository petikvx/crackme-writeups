# kamil123's crackme_l6_hard

| | |
|---|---|
| **ID** | [`6a9866c2cab6678aefe9dc75`](https://crackmes.one/crackme/6a9866c2cab6678aefe9dc75) ([`ORIGIN.yml`](ORIGIN.yml)) |
| **Auteur** | kamil123 |
| **Plateforme** | Windows PE64, console, MinGW-w64 (GCC 13), C++ |
| **SHA-256** | `c65389363b3cbe19d2595a4142a5f0eea5087bf803bb26ffde47fc0ee71eda67` |

| Fichier | Rôle |
|---|---|
| `original/crackme_l6_hard.exe` | binaire d'origine (non modifié) |
| `tools/l6-solve.py` | keygen (nom + serial) et `--check` sous Wine |
| `tools/l6-emu.py` | émulation Unicorn du `main` (nom + serial → r12 / sortie VM) |

## Réponse

Le nom est contraint par un hash (pas de nom libre) ; le serial est **constant**.

| Nom | Serial |
|---|---|
| `petik2CmaMj` (préfixe `petik`) | `2774-8852-F1D9-648A` |

```bash
python3 tools/l6-solve.py                       # name + serial
python3 tools/l6-solve.py -q                    # 2 lignes
python3 tools/l6-solve.py --check original/crackme_l6_hard.exe   # preuve Wine (OK + KO)
```

`petik` seul est refusé : le hash du nom doit valoir `0x2b7f4dcc`, d'où le suffixe de 6 caractères trouvé par meet-in-the-middle.

## Premier regard

- `file` : PE32+ console x86-64, MinGW. Imports msvcrt (`fgets`, `strcspn`, `strlen`, `strtoul`, `memcpy`) + `IsDebuggerPresent`, `CheckRemoteDebuggerPresent`, `NtQueryInformationProcess`, PEB.
- Table AES S-box en `.rdata` (0x14000b3c0, `63 7c 77 7b…`) : sert de table de substitution, pas d'AES complet.
- Chaînes : `Enter name:`, `Enter serial (XXXX-XXXX-XXXX-XXXX):`, `*** SUCCESS ***` / `*** FAILED *** Wrong serial or debugger detected.`

## Flow

`main` = 0x1400088f0 (stripped, trouvé via xref sur la chaîne `Invalid name` 0x14000b272 avec `objdump -d -M intel`).

1. `fgets` du nom (1..32 car.), puis du serial (`XXXX-XXXX-XXXX-XXXX`, 19 car., tirets aux offsets 4/9/14, 4 groupes hex → 4 u32).
2. Un accumulateur `r12d` additionne des « points » ; le succès exige `r12d == 0x60b` **et** la globale anti-debug `0x14000a000 == 0xa5a5a5a5`.
3. Anti-debug (`0x1400014f0`) : calcule la globale à partir de `IsDebuggerPresent`, `CheckRemoteDebuggerPresent`, `NtQueryInformationProcess`, `PEB->BeingDebugged`. Sans débogueur elle reste `0xa5a5a5a5`.

## Comment on trouve

### 1. Les points (`r12d`)

Chaque test réussi ajoute `0x11·k` : `0x11` (global ok) + `0x22` + `0x33` (hash du nom) + `0x44` (format serial) + `0x55` + `0x66` (VM terminée, état 4) + `0x77` (serial == sortie VM) + `0x88`/`0x99` (mix 64 bits) + `0xaa`/`0xbb` (FNV de 4 dwords) + `0xcc`/`0xdd` (sommes == 0x20629). Somme de `0x11·(1..13)` = `0x11·91` = **0x60b** : **tous** les tests doivent passer, aucun n'est optionnel.

### 2. Hash du nom (0x140008b68..0x140008beb)

```asm
mov eax,0x811c9dc5 ; FNV-1a sur le nom (xor puis imul 0x1000193)
...                ; puis FNV-1a sur 8 octets lus en 0x14000b530 : 4b1ec390 2a77d15f
rol eax,0xd ; xor eax,0xa5a5a5a5
lea ebx,[rax-0x61c88647]
; finalizer murmur3 : x^=x>>16; *=0x85ebca77; x^=x>>13; *=0xc2b2ae3d; x^=x>>16
cmp ebx,0x2b7f4dcc
```

Tout est bijectif : on inverse le finalizer, le `-0x61c88647`/`rol`/`xor`, puis les 8 octets FNV (`h_prev = (h·P⁻¹) ^ octet`, `P⁻¹ = pow(P,-1,2³²)`) → l'état FNV-1a requis après le nom : `0x9ae167d4`. Meet-in-the-middle : états depuis `petik` + 3 car. (alphanum, 238k) contre états inversés depuis la cible + 3 car. → `petik2CmaMj`. Un suffixe de 4 car. ne suffit pas (≈0,3 % de chance), 6 oui.

Piège : le hash du nom (`ebx`) dérive aussi la clé de déchiffrement du bytecode de la VM ; un mauvais nom donne donc une VM qui produit autre chose, pas seulement un « flag » faux.

### 3. Serial = sortie de la mini-VM

- 0x1400016d0 : hash maison (rotations, S-box) d'une chaîne de 23 octets reconstruite (`0x14000b3a0 ^ flux`), 16 octets de résultat.
- Le bytecode (en `.bss` 0x14000f060, rempli par 0x1400018c0 depuis `0x14000b4e0`) est déchiffré par xor avec un flux dépendant de `ebx & 0x7f`, puis exécuté par la boucle `0x1400081a0` (10 000 pas max, stop quand l'état vaut 4).
- La sortie (4 dwords en `[rsp+0x150]`) est comparée au serial (`cmp r14d,r15d` … en 0x1400091f3) et aux contrôles FNV/sommes ci-dessus : **serial = sortie VM**, dword par dword, 4 chiffres hex.

Plutôt que de réécrire la VM, `tools/l6-emu.py` émule le `main` sous Unicorn (thunks msvcrt et anti-debug hookés, globale gardée à `0xa5a5a5a5`) :

```text
$ python3 tools/l6-emu.py original/crackme_l6_hard.exe petik2CmaMj 0000-0000-0000-0000
{'out': (10100, 34898, 61913, 25738), 'r12': 918, ...}
$ python3 tools/l6-emu.py original/crackme_l6_hard.exe petik2CmaMj 2774-8852-F1D9-648A
{'out': (10100, 34898, 61913, 25738), 'r12': 1547, ...}      # 1547 = 0x60b
```

`10100, 34898, 61913, 25738` = `0x2774, 0x8852, 0xF1D9, 0x648A` → **`2774-8852-F1D9-648A`**. Avec le bon serial `r12 = 0x60b` ; avec un serial nul, 918 seulement.

## Vérification

Sous Wine (binaire d'origine, `xvfb-run -a wine`), via `l6-solve.py --check` :

```text
2774-8852-F1D9-648A -> OK SUCCESS      # "*** SUCCESS *** Level 6+ cracked!"
2774-8852-F1D9-648B -> OK FAILED       # dernier chiffre modifié
```

Cas KO supplémentaire : nom `petik` + serial correct → `*** FAILED ***` (hash du nom ≠ `0x2b7f4dcc`).

## Notes

- Reverse **statique** (objdump) + émulation Unicorn ; pas de GDB, pas de debug live (anti-debug actif : sous débogueur la globale change et le test échoue).
- Pas de `decc`/IDA utilisé : seul `objdump -d -M intel` + lecture du `main`.
- Le serial ne dépend pas du nom tant que le hash vaut `0x2b7f4dcc` ; tout autre nom de même hash convient (`--prefix` pour changer le préfixe).
- Les checks 0xcc/0xdd (sommes 0x20629) et 0x88/0x99 (mix 64 bits) sont des redondances vérifiées par l'émulation (r12 final = 0x60b), non rejouées à la main.
