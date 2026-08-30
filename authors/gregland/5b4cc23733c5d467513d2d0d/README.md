# gregland's CrackMe

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/5b4cc23733c5d467513d2d0d) · id `5b4cc23733c5d467513d2d0d`

Crackme **PE32 GUI** — runtime **Visual DialogScript (VDS)** 6.x (Delphi), packé **UPX 3.91**.  
Auteur site : **[gregland](https://crackmes.one/user/gregland)** (version info : Gregory HARGOUS / TechInfo).

Dossier : `authors/gregland/5b4cc23733c5d467513d2d0d/` — [série auteur](../README.md) · [repo](../../../README.md).

| Fichier | Rôle |
|---|---|
| [`original/crackme.exe`](original/crackme.exe) | binaire d’origine (UPX) |
| [`analysis/crackme.unpacked.exe`](analysis/crackme.unpacked.exe) | UPX `-d` |
| [`analysis/resources/TEXT_SCRIPT_420.bin`](analysis/resources/TEXT_SCRIPT_420.bin) | ressource script VDS (chiffrée) |
| [`analysis/script-decrypted.txt`](analysis/script-decrypted.txt) | script reconstruit (clair) |
| [`analysis/live-check-ok.txt`](analysis/live-check-ok.txt) | preuve Wine → *Password Ok* |
| [`tools/gregland-solve.py`](tools/gregland-solve.py) | password |
| [`tools/live-try.au3`](tools/live-try.au3) | automation Wine (TVDSEdit / TVDSButton) |

## Réponse

Password **statique** (pas de username) :

| | |
|---|---|
| **Password** | **`9456145`** |

```bash
python3 tools/gregland-solve.py
# password : 9456145

python3 tools/gregland-solve.py --check 9456145
# OK
```

Live (Wine) : MsgBox titre `OK`, texte **`Password Ok`**.

---

## 1. Premier regard

```text
file original/crackme.exe
# PE32 GUI Intel i386, UPX compressed

diec original/crackme.exe
# Borland Delphi + UPX(3.91)  (DIE peut aussi coller « AutoIt » — faux positif)
```

Unpack :

```bash
./tools/upx-3.96 -d -o analysis/crackme.unpacked.exe original/crackme.exe
```

- ~353 KiB packé → ~932 KiB unpacké.
- Ressources typiques VDS : `TEXT/SCRIPT`, `TVDSDIALOG`, boutons `BBOK`…
- DIE « AutoIt » : **pas** de signature `AU3!` — c’est du **DialogScript**.

Hashes (original) :  
MD5 `ccdb0c73db07097ad4b33f92de48c730` · SHA-256 `d3a9f89604a12f5f4895d0c31f45a27281ee90af354e6a4e926ac41da2b007f0`.

**x32dbg utile** (PE32) pour dumper le script après decrypt — pas obligatoire une fois le prédicat extrait.

---

## 2. Flow

```text
UPX stub → OEP Delphi/VDS
  FindResourceA("SCRIPT","TEXT") → blob ~420 octets
  magic 0xFFFFFE0B (-501) + tailles
  sub_495034 : decompress custom → ~320 octets
  header digits "0600" + 3×8 digits → RandSeed
  sub_4AC338 : tables nibble (Delphi Random)
  sub_4AC3C0 : decrypt chaque ligne du script
  interpréteur VDS → GUI « CrackMe by Gregland »
    TVDSEdit (PASSWORD) + TVDSButton « ok »
    Check → Password Ok / Password NOK
```

---

## 3. Prédicat

### Header script (après decompress + transform `chr(47 - b)`)

```text
06008743708320508453152148700000
     |-------| |-------| |-------|
     87437083  20508453  15214870
RandSeed = 87437083 + 20508453 + 15214870 = 123160406
```

### Script VDS (après nibble-decrypt)

Voir [`analysis/script-decrypted.txt`](analysis/script-decrypted.txt). Extrait métier :

```text
_6 CREATE,CrackMe by Gregland,-1,0,329,50
_6 ADD,EDIT,EDIT1,16,12,236,20,,,PASSWORD
_6 ADD,BUTTON,ok,16,252,64,20,ok
_6 SHOW
…
:okbutton
%X = @_I(EDIT1)          ; @dlgtext(EDIT1)
_G @_L(%X,9456145)       ; IF égal
_c Password Ok
_8                         ; ELSE
_c Password NOK
```

(`_6` ≈ commande DIALOG, `_c` ≈ message, `@_I` ≈ dlgtext, `_G`/`@_L` ≈ IF / compare.)

Donc le password attendu est littéralement **`9456145`**.

---

## 4. Vérification

```bash
python3 tools/gregland-solve.py --check 9456145   # OK

# Wine + AutoIt (classes TVDS*)
DISPLAY=:0 wine original/crackme.exe &
wine AutoIt3.exe tools/live-try.au3 9456145
# → Password Ok
```

Preuve : [`analysis/live-check-ok.txt`](analysis/live-check-ok.txt).

---

## 5. Notes

- Pas un keygen name→serial : constante dans le bytecode VDS.
- Couches : UPX → compress VDS → digits/seed → nibble S-box (Random Delphi).
- Contrôles Win32 : `TVDSEdit` / `TVDSButton` (pas `Edit`/`Button` classiques).
- Faux positif DIE AutoIt ; `autoit-ripper` échoue (normal).
