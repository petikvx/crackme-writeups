# Leotrungkien's Fugs

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/6aaebbc1585e8875bcbec053) · id `6aaebbc1585e8875bcbec053`

Crackme **Python multiplateforme** (console), packer maison **Fugs** (HARD).  
Auteur : [Leotrungkien](https://crackmes.one/user/Leotrungkien).

Dossier : `authors/leotrungkien/6aaebbc1585e8875bcbec053/` — [famille](../README.md) · [repo](../../../README.md).

| Fichier | Rôle |
|---|---|
| [`original/does_not_exist.py`](original/does_not_exist.py) | script d’origine (packer XOR+b85/zlib/marshal) |
| [`analysis/real.marshal`](analysis/real.marshal) | code objet final (prédicat + UI) |
| [`analysis/payload312.marshal`](analysis/payload312.marshal) | payload intermédiaire (Py 3.12) |
| [`analysis/expected.bin`](analysis/expected.bin) | 95 B attendus après transform |
| [`analysis/pad.bin`](analysis/pad.bin) | `transform(0…0)` (terme affine) |
| [`analysis/key.txt`](analysis/key.txt) | KEY UTF-8 |
| [`analysis/讈时露此旑褭.dis`](analysis/讈时露此旑褭.dis) | disasm du prédicat |
| [`tools/fugs-solve.py`](tools/fugs-solve.py) | KEY / `--check` / `--derive` GF(2) |

## Réponse

```text
KEY = My friend is really crazy haha_000XXX1101010999999998888999999__FUCKYOU____LOVEYOU_😁😁😁
```

| | |
|---|---|
| **KEY** (UTF-8) | `My friend is really crazy haha_000XXX1101010999999998888999999__FUCKYOU____LOVEYOU_😁😁😁` |
| **Longueur** | **95** octets (les 3 😁 = 12 octets UTF-8) |
| Banner OK | `[+] KEY ACCEPTED` / `[+] Challenge solved.` |

```bash
python3 tools/fugs-solve.py -q
# My friend is really crazy haha_000XXX1101010999999998888999999__FUCKYOU____LOVEYOU_😁😁😁

# Preuve live — Python **3.12** (3.14 segfault sur le payload)
printf '%s\n' "$(python3 tools/fugs-solve.py -q)" | python3.12 original/does_not_exist.py
# ou :
python3.12 tools/fugs-solve.py --check
```

---

## 1. Premier regard

```text
does_not_exist.py : Unicode text, UTF-8, very long lines
sha256  f98eb04ba26edf4d01ae1fd0fff2bd5aa98ad95d7a1160c8d4b5d2cb715a41d3
size    127656
```

- Couche externe : XOR `93` + base85 + zlib + `marshal.loads` / `exec`.
- Bannière runtime : `PYTHON REVERSE CRACKME` / `Difficulty : HARD` / `Target : FLAG / KEY`.
- **Python 3.12 requis** : sous 3.14 le payload plante (segfault) ; le bytecode cible 3.12.
- Anti-hook : `__ck__` / contrôles d’intégrité sur builtins — stubber en noop si on instrumente.
- Leurre ZIP `soucre.py` : decoy vietnamien « ĐÉO CÓ SOUCRE ĐÂU » (pas le vrai prédicat).

Unpack utile (déjà sous `analysis/`) :

```bash
# couches capturées via hook d’exec → analysis/exec_*.marshal, real.marshal
python3.12 -c 'import marshal; marshal.loads(open("analysis/real.marshal","rb").read())'
```

---

## 2. Flow

1. Bootstrap `does_not_exist.py` → décode le blob → exécute une chaîne de marshal (pages / HMAC / LCD unwrap / `jt_run`).
2. Runtime **Fugs** : `FugsAttributeProxy` + `FugsResolve` (`_FUGS_ROUTES`, salt `663312491`) pour résoudre noms / strings obfuscés.
3. Boucle principale : prompt `KEY > `, puis prédicat `讈时露此旑褭(key)`.
4. Si OK → `[+] KEY ACCEPTED` / `[+] Challenge solved.`

---

## 3. Prédicat

D’après le disasm [`analysis/讈时露此旑褭.dis`](analysis/讈时露此旑褭.dis) et les globals de `real.marshal` :

1. **Longueur** : `恼鯶風禯雭蠓炼實(key)` — en pratique `len(key) == 95` (octets).
2. **Transform** : `峗穜嬔鏠鈰姇厥厝(key) == 漛蚟鞌桷軖謫蛹甒`  
   - `expected` = 95 octets (`analysis/expected.bin`)  
   - `t` est **affine bit-linéaire** sur GF(2) : `t(x) = L(x) ⊕ pad` avec `pad = t(0…0)` et `L` linéaire.
3. **Checksum** : `_R1HmUul7IT(key) == 2114394975`.

Modèle XOR octet-à-octet seul : **faux**. Linéarité bit à bit de `L` : **vraie** (vérifiée sur des vecteurs aléatoires).

Inversion : matrice `760×760` sur GF(2) (colonnes = `L(e_i)`), élimination de Gauss pure Python → KEY unique (rang plein). Recalcul :

```bash
python3.12 tools/fugs-solve.py --derive
python3.12 tools/fugs-solve.py --selfcheck
```

---

## 4. Vérification

```text
$ printf '%s\n' 'My friend is really crazy haha_000XXX1101010999999998888999999__FUCKYOU____LOVEYOU_😁😁😁' \
    | python3.12 original/does_not_exist.py
========================================================
              PYTHON REVERSE CRACKME
========================================================
Difficulty : HARD
Target     : FLAG / KEY
========================================================

KEY >
[+] KEY ACCEPTED
[+] Challenge solved.
```

```bash
python3.12 tools/fugs-solve.py --check
# … KEY ACCEPTED … / OK
```

---

## 5. Notes

- Pas de username : KEY fixe (pas de keygen name→serial). Exemple user `petik` N/A.
- Le packer multi-couches + proxy Fugs est le gros du challenge ; le prédicat final se réduit à une affine GF(2) inversible.
- Ne pas patcher `original/` ; travailler sur `analysis/real.marshal` pour le reverse offline.
- GDB non utilisé (challenge Python pur) → pas de section Debug GDB.
