# palisade updated (coleywoley) — notes de recon (non résolu)

## Identité
- `original/palisade.exe` — PE32+ console, x86-64, 10 sections, 325 KB
- sha256 `f885677aecce9cd8de7232936218b2ab53ab29697ebec67020a64ad6b7b57209`

## Banner (Wine)
```
PALISADE 2.0 - REVERSE-ENGINEERING EDUCATIONAL CHALLENGE
Enter CMO{ followed by exactly 40 characters, then }.
Alphabet: ABCDEFGHJKLMNPQRSTUVWXYZ23456789
...
Enter the recovered CMO flag: Incorrect flag. Recover the CMO flag and try again.
```

## Forme du flag
`CMO{` + 40 caractères + `}` (longueur totale 45, testée en dur :
`*((_QWORD*)a2+1) == 45 && *(_DWORD*)v6 == *(_DWORD*)"CMO{" && v6[44] == '}'`).
Alphabet base32 sans `I`, `O`, `0`, `1` → 40 × 5 bits = **200 bits = 25 octets**.

## Layout
| section | taille | rôle |
|---|---|---|
| `.seal` | 0x540 | valeurs/paramètres du « seal » |
| `.vma` | 0xf0c0 | bytecode VM A (~60 KB) |
| `.vmb` | 0xd9c | bytecode VM B (~3.5 KB) |
| `.fptable` | 0x100 | table de pointeurs de fonctions |

`strings` montre `EDASILAPD` / `EDASILAPA` = `"PALISADE"` + `D`/`A` en
little-endian → magic des deux blobs VM.

## Chaîne de validation (Hex-Rays, `analysis/palisade-hexrays.c` ~ L10832)
7 étapes, chacune publiée via `sub_14000AC40(seal, i, value)` :

| i | valeur |
|---|---|
| 0 | `hash(flag[0..20])` |
| 1 | `hash(stage1_output, salt)` |
| 2 | sortie **VM A** (`sub_14000AF60`, bytecode `.vma`, exige `status != 0`, `err == 0`, `steps >= 0x3E8`) |
| 3 | sortie **VM B** (`sub_14000B570`, bytecode `.vmb`, exige `steps >= 0x64`) |
| 4 | `0x9E3779BD * ROL32(vmA ^ vmB, 7)`, croisé par `sub_14000AD00` |
| 5 | vérif type Reed-Solomon / signature : `sub_140005FB0("RSA1", 283, data, unk_140053D80)` — 283 = 0x11B, polynôme GF(2^8) |
| 6 | `hash` final |

`sub_1400042B0` est le hash : état `(a2 ^ 0x243F6A8885A308D3, len + 0x13198A2E03707344)`,
boucle `v4 = 0x9E3779B185EBCA87 * ROL64((v5+c) ^ v4, 17)` puis finalisation
façon murmur (`* 0xFF51AFD7ED558CCD`, xor-shift 33).

**Point important** : `sub_14000AC40` ne compare rien — il n'exige que l'ordre
des étapes (`*(a1+16) == (1<<i)-1`) et replie la valeur dans un accumulateur.
De même `sub_14000AD50` recalcule le fold à partir des *mêmes* valeurs → il est
tautologique. Les vraies contraintes sont donc :
les gardes `status/steps` des deux VMs, `sub_14000AD00` (étape 4) et la vérif
RS/signature de l'étape 5.

## Reste à faire
1. Désassembler le VM dispatcher (`sub_14000AF60` / `sub_14000B570`) et écrire un
   désassembleur pour `.vma` / `.vmb`.
2. Extraire les contraintes sur les 25 octets, puis résoudre (RS + Z3 ou algébrique).
