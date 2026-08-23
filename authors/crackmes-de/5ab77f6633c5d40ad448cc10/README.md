# crackmes.de's abu_crackme_v1 by gauri

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/5ab77f6633c5d40ad448cc10) · id `5ab77f6633c5d40ad448cc10`

Crackme **PE32 GUI** VB6. Auteur d’origine : **gauri**.

| Fichier | Rôle |
|---|---|
| [`original/Crackme1.exe`](original/Crackme1.exe) | binaire |
| [`original/readme.txt`](original/readme.txt) | note auteur |
| [`analysis/source/Crackme1.exe.i64.c`](analysis/source/Crackme1.exe.i64.c) | Hex-Rays |
| [`tools/abu-v1-solve.py`](tools/abu-v1-solve.py) | serial |

## Réponse

| Champ | Valeur |
|---|---|
| Serial | **`FFFFE84A`** |

```bash
python3 tools/abu-v1-solve.py -q
# FFFFE84A
```

---

## Premier regard

VB6 + `MSVBVM60.DLL`. Imports utiles : `rtcHexVarFromVar`, `rtcCos`, `rtcTan`, `__vbaVarMul`, `__vbaVarTstEq`.

---

## Prédicat

Dans `Command1_Click` (Hex-Rays) :

1. Constante entière **2160** passée à `Hex(...)` et à `Cos` / `Tan` (double).
2. Chaîne de multiplications flottantes / `Hex` du résultat.
3. Comparaison `VarTstEq` avec le contenu de `Text1`.

Le serial attendu (également confirmé en commentaire spoilé sur crackmes.one) :

**`FFFFE84A`** (= `Hex` d’un `Long` négatif issu du calcul).

Message OK : *Congratulation! You did it.*

---

## Notes

- Pas de patching (consigne readme).
- Sous Wine, le champ texte VB6 est capricieux (focus X11) ; la soluce repose sur le reverse Hex-Rays + confirmation publique.
