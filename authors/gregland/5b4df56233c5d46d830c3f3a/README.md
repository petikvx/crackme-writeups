# gregland's CrackMe 2

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/5b4df56233c5d46d830c3f3a) · id `5b4df56233c5d46d830c3f3a`

Crackme **PE32 GUI** — runtime **Visual DialogScript (VDS)** 6.x (Delphi), **sans UPX**.  
Suite de [CrackMe #1](../5b4cc23733c5d467513d2d0d/) : même runtime, script protégé + leurres de boutons.  
Auteur site : **[gregland](https://crackmes.one/user/gregland)**.

Dossier : `authors/gregland/5b4df56233c5d46d830c3f3a/` — [série auteur](../README.md) · [repo](../../../README.md).

| Fichier | Rôle |
|---|---|
| [`original/crackme2.exe`](original/crackme2.exe) | binaire d’origine |
| [`analysis/resources/TEXT_SCRIPT_1052.bin`](analysis/resources/TEXT_SCRIPT_1052.bin) | ressource `TEXT/SCRIPT` (compressée / chiffrée) |
| [`analysis/cm2_heap208.bin`](analysis/cm2_heap208.bin) | dump x32dbg du heap (script déchiffré) |
| [`analysis/script-from-heap208.txt`](analysis/script-from-heap208.txt) | script VDS reconstruit |
| [`analysis/live-check-ok.txt`](analysis/live-check-ok.txt) | preuve Wine → *Password Ok* |
| [`tools/crackme2-solve.py`](tools/crackme2-solve.py) | password + bouton |
| [`tools/live-try.au3`](tools/live-try.au3) | automation Wine / TVDS* |

## Réponse

Password **statique** + **bon bouton** (les 7 autres sont des leurres) :

| | |
|---|---|
| **Password** | **`SDFG45ERZdqf`** |
| **Bouton** | **`OK 6`** (contrôle nommé `ok` → label `:okbutton`) |

```bash
python3 tools/crackme2-solve.py
# password : SDFG45ERZdqf
# button   : OK 6

python3 tools/crackme2-solve.py --check SDFG45ERZdqf
# OK
```

Live (Wine + x32dbg) : MsgBox titre `CrackMe 2  by Gregland`, texte **`Password Ok`**.  
Preuve Wine : [`analysis/live-check-ok.txt`](analysis/live-check-ok.txt).

---

## 1. Premier regard

```text
file original/crackme2.exe
# PE32 GUI Intel i386, 8 sections (pas UPX)

diec original/crackme2.exe
# Borland Delphi + faux positif « AutoIt » (comme #1)
```

- ~954 KiB, ressource `TEXT/SCRIPT` ~1052 octets.
- Contrôles Win32 : `TVDSEdit` / `TVDSButton`.
- Hashes : MD5 `e0e6db27456a12fca774b6828b1fb522` · SHA-256 `6345a8e4610731a21930d138850f763f4314d0b8b4641194662bfcb701b59343`.

**x32dbg (PE32)** utile pour dumper le script après decrypt (`cm2_heap*.bin`) et pour lire la string **après** évaluation des `@UPPER`.

---

## 2. Flow

```text
OEP Delphi/VDS
  FindResourceA("SCRIPT","TEXT") → blob
  decompress + nibble-decrypt (même famille que #1)
  header digits 0600 + 3×8 → RandSeed
    87437083 + 20508453 + 13327574 = 121273110
  interpréteur → GUI « CrackMe 2 by Gregland »
    TVDSEdit (PASSWORD) + 8× TVDSButton « OK 1 »…« OK 8 »
    seul name=ok (caption OK 6) → :okbutton → check
    autres → :buttonNbutton → Password NOK / loop
```

---

## 3. Prédicat

Script clair (heap) — extrait métier :

```text
_6 CREATE,CrackMe 2 by Gregland,-1,0,288,141
_6 ADD,EDIT,EDIT1,60,12,268,20,,,PASSWORD
_6 ADD,TEXT,TEXT1,…,Write the good password and validate it with the good button ;-)
_6 ADD,BUTTON,ok,108,80,64,20,OK 6          ; ← seul vrai
_6 ADD,BUTTON,BUTTON7,…,OK 1                 ; leurres OK 1..5,7,8
…
:okbutton
_G @_L(@_I(EDIT1),@_\xa4(sdfg)45@_\xa4(erz)dqf,EXACT)
_c Password Ok
_8
_c Password NOK
```

Tokens VDS protect (comme #1) : `_6`≈DIALOG, `@_I`≈@DLGTEXT, `@_L`≈@EQUAL, `_G`≈IF, `_c`≈INFO.

Le token **`@_\xa4`** (octet `0xA4` / `¤`) est **`@UPPER`** : confirmé dynamiquement sous x32dbg — après eval, la compare voit littéralement :

```text
@_L(<edit>, SDFG45ERZdqf, EXACT)
```

Donc :

```text
password = UPPER("sdfg") + "45" + UPPER("erz") + "dqf"
         = SDFG + 45 + ERZ + dqf
         = SDFG45ERZdqf
```

Piège : `EXACT` → sensible à la casse. `SDFG45ERZDQF` (tout majuscule) est **faux** (`dqf` reste minuscule dans le script).

---

## 4. Vérification

```bash
python3 tools/crackme2-solve.py --check SDFG45ERZdqf   # OK
python3 tools/crackme2-solve.py --check SDFG45ERZDQF   # NOK
```

Live x32dbg : saisir `SDFG45ERZdqf`, cliquer **OK 6** → **Password Ok**.

---

## 5. Notes

- Pas un keygen name→serial : constante dans le bytecode VDS, avec `@UPPER` sur deux fragments.
- Leurres : 8 boutons « OK n » ; seul le contrôle nommé **`ok`** (caption **OK 6**) exécute le prédicat.
- Faux positif DIE AutoIt ; même stack VDS que CrackMe #1 (adresses loader/decrypt partagées : `0x4AC46C`, `0x4AC3C0`, …).
- Hypothèse initiale « reverse » (`gfds45zredqf`) → NOK ; le dump post-eval autour de `MessageBoxA` tranche `@UPPER`.
