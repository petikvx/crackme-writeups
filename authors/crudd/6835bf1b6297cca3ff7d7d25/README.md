# crudd's PatchPad

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/6835bf1b6297cca3ff7d7d25) · id `6835bf1b6297cca3ff7d7d25`

Crackme **Windows** PE64 (FASM) — défi de **patch**, pas de keygen.  
Auteur site : **crudd**.

Dossier : `authors/crudd/6835bf1b6297cca3ff7d7d25/` — [série auteur](../README.md) · [repo](../../../README.md).

| Fichier | Rôle |
|---|---|
| [`original/patchpad.zip`](original/patchpad.zip) | archive site |
| [`original/PATCHPAD.EXE`](original/PATCHPAD.EXE) | PE64 GUI d’origine |
| [`original/patchpad.nfo`](original/patchpad.nfo) | énoncé (patch any serial) |
| [`analysis/PATCHPAD-patched.exe`](analysis/PATCHPAD-patched.exe) | binaire patché |
| [`analysis/PATCHPAD.EXE.i64.c`](analysis/PATCHPAD.EXE.i64.c) | Hex-Rays (`decc`) |
| [`tools/patchpad-solve.py`](tools/patchpad-solve.py) | patcher + `--check` |
| [`tools/patchpad-check.c`](tools/patchpad-check.c) / [`.exe`](tools/patchpad-check.exe) | harness GUI Wine |

## Réponse

Objectif : **accepter n’importe quel** name + serial (longueur ≥ 5).

| | |
|---|---|
| Patch 1 | VA `0x401ac3` : `74 58` (`je` Good job) → `eb 58` (`jmp`) |
| Patch 2 | VA `0x401710` : imm SMC → écrit `eb 58` (plus `74 2c`) |
| Patch 3 | VA `0x4013d0` : checksum `0x572b40e81f83c1ca` |
| Exemple | user **`petik`**, serial **`any!!`** → *Good job getting a serial!…* |

```bash
python3 tools/patchpad-solve.py --check
# patched=…/analysis/PATCHPAD-patched.exe
# msg=Good job getting a serial! Now patch me to accept any serial.
# OK
```

Sans patch, le même couple affiche `Booooooooo!!!!!` (algo cassé + SMC).

---

## 1. Premier regard

```text
PATCHPAD.EXE  PE32+ GUI x86-64, FASM 1.73
sha256 exe  07773d7b1e8e5a6e99f6bd5dfad5419c67cbd429e6e7d5461b8362e20e2aa0f1
sha256 zip  3c86688973d25af5f349043a806c25b454de0c5b907ebcd384deefe185329d46
```

NFO : *patch the binary to accept any serial… Bonus: fix the serial algo*.

Chaînes utiles : `Good job getting a serial!`, `Booooooooo!!!!!`, `Program appears to be corrupt!`.

Décompile : `bash -ic 'decc original/PATCHPAD.EXE'` → `analysis/PATCHPAD.EXE.i64.c`.

---

## 2. Flow

1. Notepad-like GUI (menu File / Help / **Register**).  
2. Au `WM_CREATE` : checksum qword de `.text` `[0x4013d8, 0x401c78)` comparé à une constante ; sinon MessageBox *corrupt*.  
3. Menu **Register** (`0x6f`) :  
   - `sub_401696` : résout `VirtualProtect` (string XOR), rend `.text` RWX, **réécrit** le `jcc` après le check + le corps de `sub_401C13` ;  
   - puis `DialogBoxParam` (Name id `0x78`, Serial `0x79`, OK `0x7a`).  
4. OK : longueurs ≥ 5 → `sub_401C13(name, serial)` → MessageBox succès / échec.

---

## 3. Prédicat (cassé)

Hash cumulatif sur le name :

```c
uint64_t h = 0x1057b175, acc = 0;
for (each unsigned char c in name) {
  h *= c;      // mul r8, rax non rechargé
  acc += h;
}
return acc == (uint64_t)serial;  // compare au *pointeur* du buffer serial !
```

Donc aucun couple name/serial « normal » ne passe. En plus, le SMC écrit `je +0x2c` (atterrit sur le message *too short*) au lieu de `je +0x58` (Good job) — l’algo « ne marche pas », comme annoncé.

---

## 4. Patch

| Site | Avant | Après |
|---|---|---|
| `0x401ac3` | `74 58` | `eb 58` — toujours *Good job* après les checks de longueur |
| imm `@0x401710` | `…74 2c…` | `…eb 58…` — le SMC ne casse plus le patch disque |
| imm `@0x4013d0` | `0x572b1470a883c1ca` | `0x572b40e81f83c1ca` — nouvelle somme |

Le binaire d’origine reste intact ; sortie : `analysis/PATCHPAD-patched.exe`.

---

## 5. Vérification

```bash
python3 tools/patchpad-solve.py -q
python3 tools/patchpad-solve.py --check --user petik --serial any!!
# OK

# harness seul (Wine64 + DISPLAY) :
wine64 tools/patchpad-check.exe analysis/PATCHPAD-patched.exe petik any!!
# msg=Good job getting a serial! Now patch me to accept any serial.
```

Sur original : `msg=Booooooooo!!!!!` (exit 11).

---

## 6. Notes

- Ce n’est **pas** un keygen : l’énoncé interdit de chercher un serial valide comme but principal.  
- Bonus « fix the algo » : remplacer la compare pointeur par p.ex. `strtoull(serial) == acc` (ou hasher le serial de la même façon) — hors scope du patcher fourni.  
- Easter egg : après le checksum, `cmp rax, 0x8675309` (Jenny) ; la somme réelle est autre.  
- `patchpad-check.exe` : petit client Win64 (mingw) qui envoie `WM_COMMAND` Register, remplit les edits, lit le texte du MessageBox.
