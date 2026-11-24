# karity's karity (A)

| | |
|---|---|
| **ORIGIN** | [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/6a103d3fd7ff92e1214c0190) |
| **Auteur** | karity |
| **Plateforme** | Windows PE64 console, C++ (MSVC) |
| **SHA-256** | `cbff2112fa8bb6b7f9d554fbf29f9c65e2164e439db7b6df6f8cc28364325af0` |

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/karity-crackme-A.exe` | binaire d'origine (non modifié) |
| `tools/karity-solve.py` | solveur z3 (`-q`, `--check` = preuve sous Wine) |

## Réponse

Pas d'utilisateur : un seul mot de passe de 29 caractères. **Plusieurs solutions existent** (système sous-déterminé) ; celle du solveur :

```
d*4iWz,FkO%wTst-hN|Af\Ob'1d`u
```

```bash
python3 tools/karity-solve.py -q          # affiche le serial
python3 tools/karity-solve.py --check     # + lance le .exe sous xvfb-run wine
```

## Premier regard

- `file` : PE32+ console x86-64, 19 968 octets.
- `strings` : `input: `, `good!` (et `bad!`), rien d'autre d'utile.
- Le programme affiche d'abord **deux mots hex** (ex. `a121b886`) issus de `cpuid` : leurre / bruit, ils ne participent pas au test.

## Flow

1. Affichage des deux valeurs dérivées de `cpuid` (non utilisées).
2. `input: ` puis lecture d'une ligne (`getline`, `0x140001b60`).
3. Longueur == `0x1d` (29), puis 4 comparaisons de CRC.
4. `good!` si tout passe, sinon `bad!`.

## Comment on trouve

**Ancrage** : `objdump -d -M intel original/karity-crackme-A.exe`. Offset fichier de `input: ` = `0x2a08`, soit VA `0x140004408` (`.rdata` : VA `0x140004000` ↔ offset `0x2600`). Les xrefs `lea rdx,[…]` à `0x140001637` (prompt) et `0x140001721` (`good!`) situent `main` (`0x140001380`–`0x140001796`).

**Vérification de longueur et CRC** (`0x140001697`…`0x140001721`) :

```asm
cmp  QWORD PTR [rsp+0x48],0x1d     ; len == 29
lea  rcx,[buf]      ; mov edx,0x10 ; call crc ; cmp eax,0xaa2406ea   ; [0:16]
add  rcx,0x6        ; mov edx,0x10 ; call crc ; cmp eax,0xab8140de   ; [6:22]
add  rcx,0xd        ; mov edx,0x10 ; call crc ; cmp eax,0xe347258e   ; [13:29]
                      mov edx,0x1d ; call crc ; cmp eax,0x1093cfeb   ; [0:29]
```

**La fonction `crc`** (`0x1400012b0`) : boucle déroulée 8×, `shr 1` + `xor 0xedb88320` si le bit 0 est à 1 → CRC-32 réflexe classique, **mais** init `0` (`xor eax,eax`, pas `0xFFFFFFFF`) et **pas de xor final**. Piège : une lib `zlib.crc32` donnerait des valeurs différentes.

| Fenêtre | Offset | Taille | CRC attendu |
|---|---|---|---|
| A | 0 | 16 | `0xAA2406EA` |
| B | 6 | 16 | `0xAB8140DE` |
| C | 13 | 16 | `0xE347258E` |
| D | 0 | 29 | `0x1093CFEB` |

**Résolution** : inconnues = 29 octets (232 bits) ; contraintes = 4×32 = 128 bits, donc pas de solution unique. On modélise le CRC en bitvecteurs z3, on borne chaque octet à `0x21..0x7e` (imprimable) et on demande `sat` → `karity-solve.py`. Toute entrée vérifiant les 4 CRC est acceptée.

## Vérification

```text
$ python3 tools/karity-solve.py --check
serial: d*4iWz,FkO%wTst-hN|Af\Ob'1d`u
a121b886
a121b886
input:
good!

$ echo AAAA | xvfb-run -a wine original/karity-crackme-A.exe
input:
bad!
```

(OK et KO testés sur le binaire d'origine sous Wine ; pas de GDB / x64dbg utilisé, analyse 100 % statique + preuve Wine.)

## Notes

- Le z3 peut sortir un autre serial valide selon la version : tout est correct tant que `ok()` du solveur passe.
- CRC sans init/xorout = linéaire sur GF(2), d'où la facilité pour z3.
