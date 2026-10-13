# crackmes.de's fjlj_crackme_2 by fjlj

> [crackmes.one](https://crackmes.one/crackme/5ab77f5533c5d40ad448c252) · [`ORIGIN.yml`](ORIGIN.yml)

| | |
|---|---|
| **Auteur** | fjlj (miroir crackmes.de) |
| **Plateforme** | Windows PE32 console (MinGW, code écrit à la main dans un sled de NOP) |
| **Type** | keygen name→serial + self-modifying code |
| **Diff** | 2.0 |

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/FJLJ_CrackMe#2.zip` | archive site (sha256 catalogue) |
| `original/FJLJ_crackme#2.exe` | PE32 console |
| `original/readme.txt` | énoncé (keygen voulu, pas de patch) |
| `tools/fjlj-crackme2-solve.py` | keygen + `--check` / `--run` (Wine) |

## Réponse

| Champ | Valeur |
|---|---|
| **name** | `petik` (≤ 8 caractères) |
| **serial** | **`UM`** |

```bash
python3 tools/fjlj-crackme2-solve.py -q
# UM
python3 tools/fjlj-crackme2-solve.py --check petik UM
# check: OK
python3 tools/fjlj-crackme2-solve.py --run
# wine: YAY!
```

Sous Wine : `name?` → `petik` → `serial?` → `UM` → **`YAY!`**.

## Premier regard

```text
PE32 executable for MS Windows 4.00 (console), Intel i386
Compiler: MinGW (diec)
Strings: name? / serial? / YAY! / NO! / Press Enter To Exit
```

Le readme explique le procédé : programme C++ vide rempli de NOP, puis logique écrite dans OllyDbg. `_main` @ `0x401390` saute immédiatement dans le sled (`jmp 0x4015AE`).

## Flow

1. `puts("name?")` + `gets` → buffer `0x43F1C0`.
2. Longueur (compteur incluant le NUL) : si `> 9` (donc name > 8) → `NO!`.
3. `sum8 = Σ name[i]` sur 8 bits ; adresse SMC = `0x43F200 + sum8`.
4. Écrit un `jmp rel32` (`E9 …`) à cette adresse, cible = `YAY!` (`0x4015DE`).
5. `puts("serial?")` + `gets` dans un buffer dérivé de l’adresse SMC.
6. Checksum du serial → `ebx` ; `ebx + 0x4D6` doit égaler l’adresse SMC.
7. Succès : `jmp ebx` → trampoline SMC → **`YAY!`**.

## Comment on trouve

Ancrage : `objdump -d -M intel` sur `_main` (la zone utile est `0x4014CB`–`0x4015EE`, le reste est du NOP).

Somme du name (`0x401570`) :

```asm
; dl accumule sum8(name) ; puis
mov eax, 0x43F200
add eax, edx          ; SMC = 0x43F200 + sum8
; écrit E9 + rel32 vers 0x4015DE (YAY!) à [SMC]
```

Le serial est lu à `SMC + (SMC XOR 0x43F200) + 0x10`. Le checksum (boucles `0x40151F` / `0x401538` / `0x4014CB`) part de l’adresse du buffer et mélange additions / soustractions / `shl 4` ; la contrainte finale est :

```text
checksum(serial) + 0x4D6 == 0x43F200 + sum8(name)
```

Le solveur brute des serials courts alphanumériques (souvent 2 caractères) — pour `petik`, `sum8=0x1D`, SMC=`0x43F21D` → **`UM`**.

## Vérification

| Cas | Résultat |
|---|---|
| `petik` / `UM` | `YAY!` (Wine) |
| `petik` / `test` | `NO!` |
| `a` / `X9`, `test` / `aj` | `YAY!` (keygen) |

## Notes

- Self-modifying code dans `.data`/BSS writable (`0x43F200+`) — classique des crackmes « écrits sous Olly ».
- Pas de patch : le trampoline est reconstruit à chaque run à partir du name.
- Exemple username toujours **`petik`**.
