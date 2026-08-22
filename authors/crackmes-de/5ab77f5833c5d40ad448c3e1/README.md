# crackmes.de's de_kryptzo_2 (starzboy / iCU)

> [crackmes.one](https://crackmes.one/crackme/5ab77f5833c5d40ad448c3e1) · [`ORIGIN.yml`](ORIGIN.yml)

| | |
|---|---|
| **Auteur** | starzboy / iCU (miroir crackmes.de) |
| **Plateforme** | Windows PE32 GUI (MASM32) |
| **Type** | name + key → hash → SMC decrypt |

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/De-KryptZo2.zip` | archive |
| `original/De-KryptZo2.exe` | PE |
| `original/iCU.txt` | rules (no patch / no brute) |
| `tools/dekryptzo2-solve.py` | keygen |

## Réponse

| Champ | Exemple |
|---|---|
| Name | **`petik`** |
| Key | **`2ZUGRLbN`** |
| Hash (affiché, `%x`) | **`4c2ed685`** |

Puis bouton **Decrypt** → MessageBox *Decryption Successfull ... Good Work !*

```bash
python3 tools/dekryptzo2-solve.py -q --name petik
# petik:2ZUGRLbN:4c2ed685
python3 tools/dekryptzo2-solve.py --name petik --search   # autre key si besoin
```

## Flow

1. **Hash It!** (`BN=0x3EB`) : lit Name (`0x3EA`) et Key (`0x3F2`), chacun `len > 3`.
2. Deux hashes obfusqués (arithmétique + adresse buffer `0x40308C`) → combine → `wsprintf("%x")` dans le champ Hash.
3. **Decrypt** (`BN=0x3F1`) : `VirtualProtect` sur le stub `0x4013AC`, dérive **1 octet** depuis la string Hash, SMC sur 0x14 octets, `jmp` vers le code déchiffré → `MessageBoxA`.

## Prédicat SMC

Le blob clair attendu commence par :

```text
6A 00 68 81 30 40 00 68 5A 30 40 00 FF 75 08 E8 ...
; push 0 ; push "[iCU]" ; push "Decryption Successfull..." ; push hwnd ; call
```

Il se déchiffre ssi l’octet dérivé du Hash ∈ **`{93, 221}`** (équivalents mod 128 via `2*key`).

Dérivation Hash → octet : pour chaque caractère, transforms + `shl bl,5` (bl part de `strlen`), accumulateur `+= … + 0x91`.

## Notes

- Les hashes **dépendent de l’adresse** du buffer (`0x40308C`) : rehost / rebase casseraient le keygen.
- Format d’affichage : **`%x`** (hex minuscule).
- Anti-patch demandé par l’auteur ; la soluce est un vrai keygen.
