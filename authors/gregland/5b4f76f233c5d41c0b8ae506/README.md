# gregland's CrackMe 3

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/5b4f76f233c5d41c0b8ae506) · id `5b4f76f233c5d41c0b8ae506`

Crackme **PE32 GUI** — runtime **Visual DialogScript (VDS)** 6.x (Delphi), packé **UPX 3.91**.  
Suite de [CrackMe #1](../5b4cc23733c5d467513d2d0d/) / [#2](../5b4df56233c5d46d830c3f3a/) : même pipeline SCRIPT + tokens protect, plus **anti-debug**.  
Auteur site : **[gregland](https://crackmes.one/user/gregland)**.

Dossier : `authors/gregland/5b4f76f233c5d41c0b8ae506/` — [série auteur](../README.md) · [repo](../../../README.md).

| Fichier | Rôle |
|---|---|
| [`original/crackme3.exe`](original/crackme3.exe) | binaire d’origine (UPX) |
| [`analysis/crackme3.unpacked.exe`](analysis/crackme3.unpacked.exe) | UPX `-d` |
| [`analysis/resources/TEXT_SCRIPT_1570.bin`](analysis/resources/TEXT_SCRIPT_1570.bin) | ressource `TEXT/SCRIPT` |
| [`analysis/script-decrypted.txt`](analysis/script-decrypted.txt) | script VDS après decompress + nibble-decrypt |
| [`analysis/password.bin`](analysis/password.bin) | 9 octets du password |
| [`analysis/live-check-ok.txt`](analysis/live-check-ok.txt) | preuve Wine → *Password Ok* |
| [`tools/crackme3-solve.py`](tools/crackme3-solve.py) | password (hex / raw) |
| [`tools/live-try-bin.au3`](tools/live-try-bin.au3) | automation Wine (Chr high-bit) |

## Réponse

Password = résultat de **`@_J(cerqsqQSD,1456)`** (token VDS protect) — **9 octets**, pas la chaîne ASCII `cerqsqQSD` :

| | |
|---|---|
| **Hex** | **`bbe6e2be9991a19bd2`** |
| **CP1251** (affichage type Notepad) | **`»жвѕ™‘Ў›Т`** |
| **Bouton** | **`OK`** (name=`ok` → `:okbutton`) |

```bash
python3 tools/crackme3-solve.py
# password : bbe6e2be9991a19bd2

python3 tools/crackme3-solve.py --check bbe6e2be9991a19bd2
# OK

python3 tools/crackme3-solve.py --raw > /tmp/pw.bin   # 9 bytes
```

Live (Wine) : MsgBox **`Password Ok`**.  
Sous x32dbg, le TIMER anti-debug peut écraser l’edit avec `debugger found ;-(` — tester hors debugger ou patcher `IsDebuggerPresent`.

---

## 1. Premier regard

```text
file original/crackme3.exe
# PE32 GUI Intel i386, UPX compressed

diec original/crackme3.exe
# Borland Delphi + UPX(3.91)  (DIE « AutoIt » = FP)
```

```bash
./tools/upx-3.96 -d -o analysis/crackme3.unpacked.exe original/crackme3.exe
# ~354 KiB → ~954 KiB
```

Hashes (original) : MD5 `15f3b15123e4cdaf21bc4d2ba45f87df` · SHA-256 `8050ccce74045b0ca99eeaff58d901885c16e6ae22cf04c3ce5057596674164b`.

---

## 2. Flow

```text
UPX stub → OEP Delphi/VDS
  FindResourceA(SCRIPT/TEXT) → blob 1570 octets (magic -501)
  decompress custom (sub_495034) + transform ligne0 chr(47-b)
  header 0600 + 3×8 digits → RandSeed
    87437083 + 20508453 + 16609230 = 124554766
  nibble-decrypt (sub_4AC3C0 + tables Random) → script clair
  GUI « CrackMe 3 by Gregland »
    TIMER → @FUME(DEBUGGER|DISASSEMBLER|…) anti-debug
    OK → @_L(@dlgtext(EDIT1), @_J(cerqsqQSD,1456), EXACT)
```

---

## 3. Prédicat

Extrait ([`analysis/script-decrypted.txt`](analysis/script-decrypted.txt)) :

```text
:okbutton
_G @_L(@_I(EDIT1),@_J(cerqsqQSD,1456),EXACT)
_c Password Ok
_8
_c Password NOK
```

- `@_I` ≈ `@DLGTEXT`, `@_L` ≈ `@EQUAL` + flag `EXACT` (casse).
- **`@_J`** = token protect (pas un nom ASCII VDS classique) : avec la clé **`1456`**, transforme `cerqsqQSD` en les **9 octets** ci-dessus (vu en mémoire au moment du check / confirmé Wine).

Anti-debug (labels `:FUME_*`) : `IsDebuggerPresent`, fenêtres IDA/SoftICE, etc. → peut écrire `debugger found ;-(` dans `EDIT1`.

---

## 4. Vérification

```bash
python3 tools/crackme3-solve.py --check bbe6e2be9991a19bd2   # OK

# Wine + AutoIt (Chr high-bit)
DISPLAY=:0 wine original/crackme3.exe &
wine AutoIt3.exe tools/live-try-bin.au3
# → Password Ok
```

Preuve : [`analysis/live-check-ok.txt`](analysis/live-check-ok.txt).

---

## 5. Notes

- Même famille que #1/#2 (UPX optionnel, SCRIPT compressé, seed + nibble).
- Le piège n’est pas seulement anti-debug : le password **n’est pas** le littéral `cerqsqQSD`.
- Commentaire site (HN1, 2019) : même chaîne en CP1251 `»жвѕ™‘Ў›Т`.
