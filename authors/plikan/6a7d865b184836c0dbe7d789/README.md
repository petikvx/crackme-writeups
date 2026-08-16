# plikan's Easy Keygen Crackme

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/6a7d865b184836c0dbe7d789) · id `6a7d865b184836c0dbe7d789`

Crackme **PE32 GUI** (.NET / WinForms), namespace `WindowsFormsApp8`.  
Auteur site : **[plikan](https://crackmes.one/user/plikan)**.

Dossier : `authors/plikan/6a7d865b184836c0dbe7d789/` — [série auteur](../README.md) · [repo](../../../README.md).

| Fichier | Rôle |
|---|---|
| [`original/Easy_Keygen_Crackme.exe`](original/Easy_Keygen_Crackme.exe) | binaire d’origine |
| [`original/source/`](original/source/) | décompilé **ilspycmd** (`-p` projet C#) |
| [`analysis/screenshot01.png`](analysis/screenshot01.png) | live Windows : `--local` → **Access granted** |
| [`README.md`](README.md) | ce write-up |
| [`tools/easy-keygen-solve.py`](tools/easy-keygen-solve.py) | keygen HWID (Python) |

## Réponse

La licence est **liée à la machine** (pas de username) :

| Entrée | Source |
|---|---|
| MachineGuid | `HKLM\SOFTWARE\Microsoft\Cryptography\MachineGuid` (vue 64-bit) |
| Volume serial `C:` | `GetVolumeInformation("C:\\")` → `uint.ToString("X")` (hex **sans** padding fixe) |

```text
pcHash  = SHA256_hex_lower( MachineGuid + VolumeSerial )
pass1   = SHA256_hex_lower( pcHash + "plikan" )
strong  = SHA512_hex_lower( pass1 ).ToUpper()
license = strong[0:25] formaté "{0}-{1}-{2}-{3}-{4}"  (5×5 hex majuscules)
```

**Live (Windows)** — voir [screenshot01.png](analysis/screenshot01.png) :

| HWID | Valeur (machine de test) |
|---|---|
| MachineGuid | `7beeda5e-a934-4742-b990-7cd873d0b79e` |
| VolumeSerial C: | `12C52EF1` |
| **License Key** | **`EBD19-CAF83-9A28D-42ED6-3AFD7`** → *Key valid! Access granted.* |

```bash
# Windows (lit le HWID local) — OK
python easy-keygen-solve.py --local

# Linux / hors Windows : pas de registre HKLM ni de volume C: natif
# → RuntimeError attendu ; passer le HWID capturé sur la cible :
python3 tools/easy-keygen-solve.py \
  --guid 7beeda5e-a934-4742-b990-7cd873d0b79e \
  --vol 12C52EF1
# License Key : EBD19-CAF83-9A28D-42ED6-3AFD7

# smoke-test hors machine (valeurs factices)
python3 tools/easy-keygen-solve.py \
  --guid a1b2c3d4-e5f6-7890-abcd-ef1234567890 --vol A1B2C3D4
# → 8C911-13294-8348D-CE894-47517
```

---

## 1. Premier regard

```text
file original/Easy_Keygen_Crackme.exe
# PE32 executable (GUI) Intel 80386 Mono/.Net assembly, for MS Windows
```

- ~1.0 MiB, assembly **.NET** (pas de crypto native manuelle : `System.Security.Cryptography`).
- UI WinForms : boîte « License Key: », bouton de validation, messages  
  `Key valid! Access granted.` / `Invalid key!`.
- Chaînes utiles : `plikan`, `MachineGuid`, `SOFTWARE\Microsoft\Cryptography`, `C:\`, format `{0}-{1}-{2}-{3}-{4}`, `INVALID-HASH-LENGTH`.

Hashes :  
MD5 `c19df1556e4cec935ff96d9903c66a4e` · SHA-256 `b6ec4f8991db7a5d909e703b3fdf5d8950b8f0128e826a8eda3f1f910b5ff9e1`.

---

## 2. Flow

```text
Form1.button1_Click
  key = textBox.Text.Replace(" ", "")
  expected = GenerateKey()          # HWID local
  si String.Equals(key, expected)   # 5 groupes de 5, sensible à la casse (expected déjà UPPER)
    → MessageBox "Key valid! Access granted."
  sinon
    → MessageBox "Invalid key!"
```

### Décompilé ilspycmd

```bash
dotnet ilspycmd original/Easy_Keygen_Crackme.exe -p -o original/source
```

Sources dans [`original/source/WindowsFormsApp8/`](original/source/WindowsFormsApp8/) (namespace d’origine, classes scramble) :

| Fichier | Classe | Rôle |
|---|---|---|
| [`gwaog4a8gpjsr89r5.cs`](original/source/WindowsFormsApp8/gwaog4a8gpjsr89r5.cs) | HWID | `GetMachineGuid` + `GetVolumeSerial` + `GetPcHash` |
| [`_8e7vgeu5jhuir8.cs`](original/source/WindowsFormsApp8/_8e7vgeu5jhuir8.cs) | password | `GeneratePassword` → SHA256(pcHash + `"plikan"`) |
| [`ae4u9gae89g489.cs`](original/source/WindowsFormsApp8/ae4u9gae89g489.cs) | strong hash | `GetFinalStrongHash` → SHA512 |
| [`a4gy7awe4g7hauruj.cs`](original/source/WindowsFormsApp8/a4gy7awe4g7hauruj.cs) | licence | `GenerateKey` → ToUpper + 5×5 |
| [`Form1.cs`](original/source/WindowsFormsApp8/Form1.cs) | UI | `XYI = GenerateKey()` au load ; `button1_Click` compare |

Il existe aussi des variantes `*FromCustomHash` / `GetFinalStrongHashCustom` (même formatage, hash fourni en entrée) — non utilisées par le chemin GUI principal.

---

## 3. Le prédicat (keygen)

### HWID

```csharp
// GetMachineGuid — résumé
OpenBaseKey(LocalMachine, Registry64)
  .OpenSubKey(@"SOFTWARE\Microsoft\Cryptography")
  .GetValue("MachineGuid")   // string, souvent lowercase avec tirets
// échec → ""

// GetVolumeSerial — résumé
GetVolumeInformation("C:\\", …, out volumeSerialNumber, …)
return volumeSerialNumber.ToString("X");   // majuscules, PAS forcément 8 chiffres
// échec → ""
```

**Piège** : `ToString("X")` ne pad **pas** à 8 caractères. Un outil qui force `08X` ou le serial WMI toujours sur 8 hex peut produire une **autre** clé. Il faut la même chaîne exacte que le crackme.

### Chaîne de hash

```text
pcHash = hex_lower( SHA256( UTF8( MachineGuid + VolumeSerial ) ) )
pass1  = hex_lower( SHA256( UTF8( pcHash + "plikan" ) ) )
strong = hex_lower( SHA512( UTF8( pass1 ) ) ).ToUpper()
// Byte.ToString("x2") dans ComputeSha256 / ComputeSha512 → hex minuscule
```

Salt fixe : **`plikan`** (concaténée **après** le premier SHA-256, en clair ASCII).

### Format licence

```text
strong.Substring(0,5) + "-" + [5,5] + "-" + [10,5] + "-" + [15,5] + "-" + [20,5]
// 25 hex majuscules → XXXXX-XXXXX-XXXXX-XXXXX-XXXXX
```

Comparaison : égalité de chaînes après suppression des espaces côté saisie (pas de strip des tirets).

### Trace live (machine du screenshot)

| Étape | Valeur |
|---|---|
| MachineGuid | `7beeda5e-a934-4742-b990-7cd873d0b79e` |
| VolumeSerial | `12C52EF1` |
| SHA256(guid+vol) | `3e1e638744ca9615dfe33e6685754e2b2fe0080ce4ffd4306510be726e002ee3` |
| SHA256(…+`plikan`) | `66cecb1b700d5f46741362a950eb2d7dccac7db49548902d53bde1078f399bec` |
| SHA512 prefix 25 | `EBD19CAF839A28D42ED63AFD7` |
| **License** | **`EBD19-CAF83-9A28D-42ED6-3AFD7`** |

### Trace factice (smoke-test)

| Étape | Valeur |
|---|---|
| MachineGuid | `a1b2c3d4-e5f6-7890-abcd-ef1234567890` |
| VolumeSerial | `A1B2C3D4` |
| **License** | **`8C911-13294-8348D-CE894-47517`** |

### Pseudo-Python

```python
import hashlib

def key(machine_guid: str, volume_serial_x: str) -> str:
    def sha256_hex(s: str) -> str:
        return hashlib.sha256(s.encode()).hexdigest()  # lower
    def sha512_hex(s: str) -> str:
        return hashlib.sha512(s.encode()).hexdigest()
    pc = sha256_hex(machine_guid + volume_serial_x)
    p1 = sha256_hex(pc + "plikan")
    strong = sha512_hex(p1).upper()
    return "-".join(strong[i : i + 5] for i in range(0, 25, 5))
```

---

## 4. Vérification

### Live Windows (screenshot01)

![console `--local` + MessageBox Key valid + UI](analysis/screenshot01.png)

Sur la VM de test : `python easy-keygen-solve.py --local` lit le HWID, affiche la licence, et le crackme répond **Key valid! Access granted.**

### Sous Linux

`--local` **échoue volontairement** : pas de `HKLM\…\MachineGuid` ni de `GetVolumeInformation("C:\\")` natifs. C’est le comportement attendu :

```text
RuntimeError: impossible de lire MachineGuid / volume C: en local
(passe --guid et --vol manuellement)
```

Rejouer la même machine depuis Linux :

```bash
python3 tools/easy-keygen-solve.py \
  --guid 7beeda5e-a934-4742-b990-7cd873d0b79e --vol 12C52EF1
# License Key : EBD19-CAF83-9A28D-42ED6-3AFD7

python3 tools/easy-keygen-solve.py --check EBD19-CAF83-9A28D-42ED6-3AFD7 \
  --guid 7beeda5e-a934-4742-b990-7cd873d0b79e --vol 12C52EF1
# OK
```

Reverse statique : décompilé C# dans [`original/source/`](original/source/) (ilspycmd).

---

## 5. Solveur Python

[`tools/easy-keygen-solve.py`](tools/easy-keygen-solve.py)

| Option | Effet |
|---|---|
| `--guid` + `--vol` | HWID manuels (recommandé hors Windows) |
| `--local` | lit registre + WMI `Win32_LogicalDisk` (attention au padding vs `ToString("X")`) |
| `--check KEY` | compare à la clé attendue |
| `-q` | n’imprime que la licence |

---

## 6. Notes

- Challenge « Easy Keygen » : pas d’anti-debug, crypto standard .NET, salt en clair dans le binaire.
- Point délicat = **fidélité du HWID** (casse du GUID, format exact du serial volume), pas la crypto.
- Hex des hash intermédiaires en **minuscules** (`"x2"`) ; seule la licence finale est en **majuscules**.
- Namespace / types scramble (`_8e7vgeu5jhuir8`, …) ; les noms de méthodes crypto restent lisibles.
- Sous Linux pur : utiliser `--guid` / `--vol` capturés sur la cible Windows (ou une VM) plutôt que de forcer un serial « 8 hex ».
