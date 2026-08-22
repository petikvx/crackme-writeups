# crackmes.de's b0rken_elgamal_keygenme by smilingwolf

> [crackmes.one](https://crackmes.one/crackme/5ab77f5a33c5d40ad448c4ec) · [`ORIGIN.yml`](ORIGIN.yml)

| | |
|---|---|
| **Auteur** | SmilingWolf (miroir crackmes.de) |
| **Plateforme** | Windows PE32 GUI (MASM32, UPX modifié) |
| **Type** | ElGamal signature keygenme (k réutilisé) |

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/B0rken.ElGamal.KeygenMe-SW.zip` | archive |
| `original/B0rken.ElGamal.KeygenMe-SW.exe` | PE UPX patché (`SW0`/`SW1`) |
| `original/B0rken.ElGamal.KeygenMe-SW.unpacked.exe` | unpack (renommer sections → `upx -d`) |
| `original/ReadMe.txt` | règles (keygen only, anti-patch) |
| `tools/b0rken-elgamal-solve.py` | keygen |

## Réponse

| Champ | Exemple |
|---|---|
| Name | **`petik`** |
| Serial | **`65796CB35FEDAEAE9599BD0290711A20ED651B1034D2096D046A2D56416B1155627869AD39AE18244367348ADBF1F3660509AEC269ADCF7B6B630808D95F266C`** |

(`k` éphémère fixe `1337` — n’importe quel `k` invertible mod `p-1` convient.)

```bash
python3 tools/b0rken-elgamal-solve.py -q --name petik
python3 tools/b0rken-elgamal-solve.py --name petik --check
# verify: OK
```

Sous Wine : lancer l’unpacked, saisir `petik` + serial → *Signature is correct!* / *License accepted!*.

## Premier regard

- UPX 3.91 **modifié** (`upx -d` refuse) : sections `SW0`/`SW1` au lieu de `UPX0`/`UPX1`.
- Unpack : renommer les sections puis `upx -d` → `B0rken.ElGamal.KeygenMe-SW.unpacked.exe`.
- Publique 256-bit hardcodée : `P`, `G`, `Y`. Message = `SHA1(name)`.
- Noms blacklistés avec serials : `LordCarder`, `ProThief` (même `R` !).

## Flow

1. SHA1(name) → entier `M`.
2. Serial = `hex(R)||hex(S)` (128 hex).
3. Vérif ElGamal : `G^M ≡ Y^R · R^S (mod P)`.
4. Compteur blacklist : si name **ou** serial matchent LordCarder/ProThief → refus.

## Prédicat / faille

Signature classique :

```text
R = G^k mod P
S = (M - X·R) · k⁻¹  mod (P-1)
```

Les deux clés blacklistées partagent le **même `R`** ⇒ même `k`. Attaque standard « reused k » :

```text
k·(S0−S1) ≡ (M0−M1)  (mod P−1)
puis X depuis  X·R ≡ M0 − k·S0  (mod P−1)
```

Clé privée récupérée :

```text
X = 7F4BEFC372EED0BA1D4A3543243EE574734C8347459FA21E5BCC5BCF0351812D
```

(`pow(G,X,P)==Y` OK.) Alternative (plus lente) : seed PRNG = `HWND xor 0x37333331` → bruteforce de `P`.

## Vérification

- `--check` : `V1==V2` pour `petik` et pour les serials blacklistés (math).
- Wine GUI sur l’unpacked (smoke OK).

## Notes

- ReadMe propose des patchs (`004069A4`, `00401257`) : **hors soluce** (l’auteur exige un keygen).
- `k` constant dans le keygen = même faiblesse que le crackme ; pour une vraie app il faudrait un `k` frais à chaque signature.
- Réf. : [lifeinhex part 1](https://lifeinhex.com/breaking-b0rken-elgamal-keygenme-by-smilingwolf/) / [part 2](https://lifeinhex.com/breaking-b0rken-elgamal-keygenme-part-2/).
