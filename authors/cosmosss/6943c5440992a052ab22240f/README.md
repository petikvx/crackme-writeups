# CosmoSSS's Password (Very Easy)

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/6943c5440992a052ab22240f) · id `6943c5440992a052ab22240f`

Crackme **PE32 GUI** x86 (**MASM**), débutant.  
Auteur site : **CosmoSSS**.

| Fichier | Rôle |
|---|---|
| [`original/parol.exe`](original/parol.exe) | binaire |
| [`tools/parol-solve.py`](tools/parol-solve.py) | password |
| [`README.md`](README.md) | write-up |

## Réponse

| Input | Valeur |
|---|---|
| Password | **`SuperPass`** |

```bash
python3 tools/parol-solve.py -q
# SuperPass
```

MessageBox : **Password Good:** (sinon **Password Trash:**).

---

## Analyse

`DialogFunc` : `GetDlgItemTextA(hDlg, 1001, …)` puis `lstrcmpA` contre `.data:00403000` = **`SuperPass`**.

Hashes : MD5 `42240ff67368a63d56d9035bb4397bec` · SHA-256 `b1192d4c487c5b47583612cc56286003ba65f5f33189d454150a9b88215e0344`.

Site : difficulty **1.0** · quality **4.0**.
