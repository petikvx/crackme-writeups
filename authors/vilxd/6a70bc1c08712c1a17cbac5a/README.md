# vilxd's Crack my points (DLL + Loader)

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/6a70bc1c08712c1a17cbac5a) · id `6a70bc1c08712c1a17cbac5a`

Crackme **Windows** PE64 : `Loader.exe` + `Crackme.dll` (patching).  
Auteur site : **vilxd**. Difficulty **2.5** · quality **4.0**.

Dossier : `authors/vilxd/6a70bc1c08712c1a17cbac5a/` — [série auteur](../README.md) · [repo](../../../README.md).

| Fichier | Rôle |
|---|---|
| [`original/Crackme.zip`](original/Crackme.zip) | archive site |
| [`analysis/extracted/Loader.exe`](analysis/extracted/Loader.exe) | charge la DLL |
| [`analysis/extracted/Crackme.dll`](analysis/extracted/Crackme.dll) | logique / points |
| [`analysis/Crackme-patched.dll`](analysis/Crackme-patched.dll) | DLL patchée (101) |
| [`tools/points-patch.py`](tools/points-patch.py) | patcher `cmp eax, N` |

## Réponse

Objectif : **points > 100** (affichage `You have N`).

| | |
|---|---|
| Patch | `cmp eax, 0x64` → `cmp eax, 0x65` @ VA `0x180001487` |
| Résultat | **`You have 101`** |

```bash
7z x -oanalysis/extracted original/Crackme.zip
python3 tools/points-patch.py --check
# patched=…/Crackme-patched.dll points=101
#  You have 101
# OK
```

Preuve live : `Loader.exe` + `Crackme.dll` patchée dans le même dossier (Wine).

---

## 1. Premier regard

```text
Crackme.zip → Loader.exe + Crackme.dll (PE32+)
sha256 zip 07ae9709141687e122f94427a38d9a12848fe6278d96bad5bafd93e65ce85f51
```

Énoncé : *Change value points from 100 to more than 100*.

---

## 2. Flow

1. `Loader.exe` fait `LoadLibraryA("Crackme.dll")`  
2. `DllMain` (reason=1) appelle la routine d’affichage  
3. Construit la string `You` + ` have` + ` ` + `points`… puis le nombre **N**  
4. N vient d’une boucle `for (eax=0; eax<0x64; ++eax)` qui laisse `edx==0x64` (100)  

Un check d’intégrité obfusqué (`ror` / XOR, constante `0x18680`) protège d’autres globals — ne pas les toucher niaisement (sinon `exit`).

---

## 3. Patch

Site du patch (`.text`) :

```asm
; 0x180001487
83 f8 64                 cmp    eax, 0x64
7c e4                    jl     …          ; 100 itérations → points=100
```

Remplacer `64` par `65` (ou toute valeur `1..255`) → **points = imm**.

---

## 4. Vérification

```bash
python3 tools/points-patch.py --points 101 --check
```

---

## 5. Notes

- Pas d’exports utiles : tout passe par `DllMain`.  
- Les globals obfuscés sont surtout du bruit pour ce challenge « best way to learn patching ».
