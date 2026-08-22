# ABOLHB's MasonCrackmeV2

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/68ff92e62d267f28f69b78f1) · id `68ff92e62d267f28f69b78f1`

Crackme **PE32+ console** x86-64 (**MinGW** + **UPX**).  
Auteur site : **ABOLHB**.

| Fichier | Rôle |
|---|---|
| [`original/masoncrackmev2.exe`](original/masoncrackmev2.exe) | UPX |
| [`analysis/masoncrackmev2-unpacked.exe`](analysis/masoncrackmev2-unpacked.exe) | `upx -d` |
| [`analysis/mason-recon.exe`](analysis/mason-recon.exe) | clone MinGW pour Wine |
| [`analysis/wine-ok.txt`](analysis/wine-ok.txt) | `Cracked!` |
| [`tools/mason-solve.py`](tools/mason-solve.py) | password |

## Réponse

| Input | Valeur |
|---|---|
| Password | **`MEMSENALF`** |

```bash
upx -d -o analysis/masoncrackmev2-unpacked.exe original/masoncrackmev2.exe
python3 tools/mason-solve.py -q
# MEMSENALF
```

---

## Analyse

`MasonH777` concatène des fragments `.data` : `ME` + `MS` + `EN` + `AL` + `F` → **`MEMSENALF`**, puis `strcmp` avec `gets`.

Succès : **`Cracked!`** · Échec : **`incorrect X`** (boucle).

Wine sur l’original MinGW peut SEH (comme d’autres MinGW) ; preuve via [`analysis/mason-recon.exe`](analysis/mason-recon.exe).

Hashes : MD5 `87d92b11581177056ccb3f19151c2727` · SHA-256 `8e356198c31ce2d85814016398c52875dbdb67f88d61dfe2eb35042e9bedfb61`.

Site : difficulty **3.0** (communauté : very easy) · UPX.
