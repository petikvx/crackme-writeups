# neoncarrot's Find the correct key!

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/697e5b0a16739b40dcb5da9d) · id `697e5b0a16739b40dcb5da9d`

Challenge **Windows PE32** (x86) : archive avec **deux** exécutables GUI (LCC / MSVC + **UPX** sur le checker).  
Auteur site : **neoncarrot**.

Dossier : `authors/neoncarrot/697e5b0a16739b40dcb5da9d/` — [série auteur](../README.md) · [repo](../../../README.md).

| Fichier | Rôle |
|---|---|
| [`original/FindTheCorrectKey.zip`](original/FindTheCorrectKey.zip) | ZIP d’origine (contenu crackmes.one) |
| [`original/get-keys.exe`](original/get-keys.exe) | générateur de clés (dialog) |
| [`original/check-keys.exe`](original/check-keys.exe) | validateur (UPX) |
| [`analysis/check-keys-unpacked.exe`](analysis/check-keys-unpacked.exe) | UPX `-d` |
| [`tools/find-key-solve.py`](tools/find-key-solve.py) | password générateur + clé |
| [`README.md`](README.md) | ce write-up |

## Réponse

| Étape | Valeur |
|---|---|
| Password `get-keys.exe` | **`providechaos`** |
| Clé correcte (`check-keys.exe`) | **`439272362961741018146349942923915526002573998999491954071123154782706705610`** |

```bash
python3 tools/find-key-solve.py --gen-pass
# providechaos

python3 tools/find-key-solve.py -q
# 439272362961741018146349942923915526002573998999491954071123154782706705610

python3 tools/find-key-solve.py --check 439272362961741018146349942923915526002573998999491954071123154782706705610
# OK
```

Sous Windows / Wine : coller la clé dans **check-keys.exe** → MessageBox **`Well done !!!`** (sinon `That is wrong`).

---

## 1. Premier regard

```text
# après add-crackme : original/FindTheCorrectKey.zip
7z x -ooriginal/ original/FindTheCorrectKey.zip
# get-keys.exe     PE32 GUI
# check-keys.exe   PE32 GUI, UPX
upx -d -o analysis/check-keys-unpacked.exe original/check-keys.exe
```

Tips auteur : *1. Get all keys… 2. Find the correct one!*

Hashes (ZIP site) :  
MD5 `c2361f8fd789a4f7477e4f463b415d04` · SHA-256 `a2534bf2fbcb56dc19bdce82a9692a11c03f9cc18ffef58a7bb41b3f3fb2ea65`.

Site : difficulty **4.3** · quality **5.0** · labels Packer / UPX.

---

## 2. `get-keys.exe`

- Dialog + boutons **Next** / **Quit**.
- Chaîne **`providechaos`** : password pour débloquer la génération.
- Boucle de génération : transforme un buffer, affiche via `SetDlgItemTextA`, incrémente un compteur de **`0x4b` (75)** caractères par clé.
- Si le compteur dépasse un seuil → MessageBox **`Hmmmm` / `you missed it :-)`**.

But : énumérer les clés candidates (75 digits chacune).

---

## 3. `check-keys.exe`

1. **UPX** (d’où les faux positifs VirusTotal évoqués en commentaires).
2. `GetDlgItemTextA` : longueur exacte **`0x4b` = 75**.
3. Table `.data` @ `0x403098` XORée avec **`0x55AA55AA`** (matériel du compresseur).
4. Hash custom **6 × uint32** (IV style `89abcdef / 01234567 / …`, blocs 64 octets, endian-swap `xor i,3`) sur les **chiffres ASCII** de la clé.
5. Comparaison de 6 DWORD (après XOR `0x27836149`) →  
   - OK : **`Nice` / `Well done !!!`**  
   - KO : **`That is wrong`**.

La clé ci-dessus satisfait ce prédicat (vérifiée : longueur 75 + chemin succès documenté / communauté).

---

## 4. Vérification

```bash
# unpacker
upx -d -o analysis/check-keys-unpacked.exe original/check-keys.exe

# checker GUI
wine original/check-keys.exe
# coller la clé de 75 digits → Well done !!!
```

---

## Notes

- AV peut gueuler sur `check-keys.exe` UPX — comportement déjà discuté sur crackmes.one ; analyse statique OK.
- Le « bounty ETH » de la description est hors scope du write-up.
- Conserver le ZIP **et** les PE extraits dans `original/`.
