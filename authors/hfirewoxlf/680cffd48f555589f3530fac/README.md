# hFireWoxlf — My First Rust Crackme

| | |
|---|---|
| **ID** | [`680cffd48f555589f3530fac`](https://crackmes.one/crackme/680cffd48f555589f3530fac) |
| **Auteur** | hFireWoxlf |
| **Plateforme** | Linux ELF64 PIE, **Rust** (crate `hex 0.4.3`), non strippé |
| **SHA-256 (zip)** | `1ed967a273a0167c54d453ada7e6724a8cee54fa94b14bfb7f19a9edeea9992c` |

Voir [`ORIGIN.yml`](ORIGIN.yml).

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/rust_crackme.zip` | archive d'origine, **chiffrée AES** (méthode 99, mot de passe `crackmes.one`) |
| `analysis/x/crackme_rusty` | binaire extrait (`7z x -pcrackmes.one`) |
| `tools/rusty-solve.py` | extrait le zip, recalcule la licence (`-q`, `--check`) |

## Réponse

**Licence : `X7J4P-9D5K2-RQ8M0-3VZ1L-6F0C4`**

```bash
7z x -pcrackmes.one -oanalysis/x original/rust_crackme.zip     # unzip classique refuse (méthode 99)
echo 'X7J4P-9D5K2-RQ8M0-3VZ1L-6F0C4' | ./analysis/x/crackme_rusty    # Correct License Key! Congrats! :D
python3 tools/rusty-solve.py --check
```

## Premier regard

- `unzip` répond « unsupported compression method 99 » : AES. `7z` avec le mot de passe du site (`crackmes.one`) fonctionne.
- `file` : ELF64 PIE ; `strings` : `Enter License:`, `Correct License Key! Congrats! :D`, `Incorrect License Key!`, `Failed to Decode`,
  `Failed to read message!`, la crate `hex-0.4.3` (symboles `InvalidHexCharacter`, `OddLength`) et le chemin `src/main.rs`.
- Dans `.rodata`, juste à côté de `src/main.rs` (offset `0x4a23d`), deux chaînes hex **collées** :

```text
2e523840394a563c432e40593b3657354648412233562355402342375d   (58 hex = 29 octets)   @ 0x4a23d
src/main.rs                                                                          @ 0x4a277
7665727469676f78                                                                     @ 0x4a282   -> "vertigox"
Failed to Decode                                                                     @ 0x4a292
```

## Flow

Binaire Rust : lecture d'une ligne sur stdin, `hex::decode` d'une constante (d'où « Failed to Decode » en cas d'erreur), dérivation d'une valeur attendue,
comparaison avec la saisie, puis « Correct License Key! Congrats! :D » ou « Incorrect License Key! ».

## Comment on trouve

**Ancrage** : `strings -n 4 analysis/x/crackme_rusty | grep -E 'main.rs|Decode'` ; offsets avec Python (`d.find(...)`) :
les deux chaînes hex entourent `src/main.rs`, ce sont les littéraux passés à `hex::decode`.

1. `7665727469676f78` décode en ASCII `vertigox` : un mot, donc une **clé**.
2. L'autre constante fait 29 octets une fois décodée ; un XOR avec la clé répétée (`k[i % 8]`) donne :

```python
c = bytes.fromhex('2e523840394a563c432e40593b3657354648412233562355402342375d')
k = b'vertigox'
bytes(b ^ k[i % 8] for i, b in enumerate(c))   # b'X7J4P-9D5K2-RQ8M0-3VZ1L-6F0C4'
```

Le résultat a la forme exacte d'une clé de licence (5 groupes de 5, séparés par `-`).

**Honnêteté sur la méthode** : le XOR répété avec `vertigox` est une **hypothèse issue des deux littéraux**, confirmée par l'exécution du binaire (licence acceptée,
variantes refusées) ; je n'ai pas relu pas à pas le désassemblage Rust de `main`.

## Vérification

```text
$ echo 'X7J4P-9D5K2-RQ8M0-3VZ1L-6F0C4' | ./crackme_rusty
Enter License:
Correct License Key! Congrats! :D
$ echo 'AAAAA-BBBBB' | ./crackme_rusty
Enter License:
Incorrect License Key!
```

## Notes

- Pas de GDB. Le zip chiffré est une particularité de l'upload (AES), pas du challenge.
