# vilxd's CRACK ME DLL

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/6a6e0d3d91dca16886160b86) · id `6a6e0d3d91dca16886160b86`

Crackme **Windows** PE64 : `Loader.exe` + `MyDLL.dll` (patch `hp`).  
Auteur site : **vilxd**. Difficulty **2.5** · quality **2.5**.

Dossier : `authors/vilxd/6a6e0d3d91dca16886160b86/` — [série auteur](../README.md) · [repo](../../../README.md).

| Fichier | Rôle |
|---|---|
| [`original/crack_me_dll.zip`](original/crack_me_dll.zip) | archive |
| [`analysis/extracted/Loader.exe`](analysis/extracted/Loader.exe) | charge `MyDLL.dll` |
| [`analysis/extracted/MyDLL.dll`](analysis/extracted/MyDLL.dll) | affiche `Your hp is:N` |
| [`analysis/MyDLL-patched.dll`](analysis/MyDLL-patched.dll) | hp=101 |
| [`tools/hp-patch.py`](tools/hp-patch.py) | patcher |

## Réponse

Énoncé : *change the hp variable*. Affichage d’origine : **`Your hp is:100`**.

| | |
|---|---|
| Patch | tous les `mov …, 0x64` qui écrivent hp → `0x65` |
| Résultat | **`Your hp is:101`** |

```bash
7z x -oanalysis/extracted original/crack_me_dll.zip
python3 tools/hp-patch.py --check
# Your hp is:101
# OK
```

---

## 1. Premier regard

```text
crack_me_dll.zip → Loader.exe + MyDLL.dll
sha256 9ec89c1f204d3674678fe1a5d5a95560abe5522882f41f01de9fdd9e1d51978d
```

---

## 2. Flow

1. Loader : `LoadLibraryA("MyDLL.dll")`  
2. `DllMain` (ATTACH) calcule / force **hp = 100** puis affiche `Your hp is:` + valeur  

---

## 3. Patch

Dans `MyDLL.dll`, plusieurs stores immédiats `0x64` :

```asm
c7 02 64 00 00 00       mov dword ptr [rdx], 100
c7 05 .. 64 00 00 00    mov dword ptr [rip+…], 100
```

Les remplacer par `65` (101).

---

## 4. Vérification

Wine : `Loader.exe` + `MyDLL.dll` patchée côte à côte.

---

## 5. Notes

- Cousin de « Crack my points » (même auteur, même idée patch).  
- Obfuscation légère autour de globals ; le store `100` reste visible.
