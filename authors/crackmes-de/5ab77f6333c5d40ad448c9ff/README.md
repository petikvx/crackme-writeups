# vazonezs_keygenme_1 (vazonez)

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/5ab77f6333c5d40ad448c9ff) · id `5ab77f6333c5d40ad448c9ff`  
> Import crackmes.de — auteur **vazonez**.

| Fichier | Rôle |
|---|---|
| [`original/_u/crackme1.exe`](original/_u/crackme1.exe) | PE32 GUI MASM32 |
| [`tools/vazonez-solve.py`](tools/vazonez-solve.py) | keygen + `--check` |

## Réponse

| Champ | Valeur |
|---|---|
| User (GetUserNameA) | **`petik`** |
| Code | **`I[WcE[[Pb^jLbb`** |

```bash
python3 tools/vazonez-solve.py -q --user petik
python3 tools/vazonez-solve.py --check
```

## Prédicat

Seed `VaZoNeZ`×2 (14 octets). Pour i∈[0,14) à `0x4031A4` :
`out[i]=(((seed[i]+user[0])^5)+((0x4031A4+i)&0xFF)-0x1E)&0xFF`.
