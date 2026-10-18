# crackmes.de's anonimoser_crackme_i by anonimoser

| | |
|---|---|
| **ID** | [`5ab77f5633c5d40ad448c2e8`](https://crackmes.one/crackme/5ab77f5633c5d40ad448c2e8) |
| **Auteur (site)** | crackmes.de (auteur d'origine : AnonimoSer) |
| **Auteur (local)** | crackmes-de |
| **Plateforme** | Windows PE32 GUI, Borland Delphi 5, packé UPX |
| **Difficulté** | 1.0 |
| **SHA-256 (zip)** | `868cd7a9c5b7c2c8d50ef3aee495e835542a432e13aca550b75d64ee901d918c` |

## Solution

Keygen nom → code. Exemple : **nom `petik` → code `6060288GGGCKQ`** (vérifié sous wine : MessageBox « Ok, lo lograste! » ; un code faux donne « Error / Mal, mal, muy mal. »).

```bash
python3 tools/crackmes-de-anonimoser_crackme_i-solve.py petik
# petik -> 6060288GGGCKQ
```

## Origine

- Page : https://crackmes.one/crackme/5ab77f5633c5d40ad448c2e8
- Download : https://crackmes.one/download/crackme/5ab77f5633c5d40ad448c2e8
- ZIP password : `crackmes.one`

Le zip contient `crackme1.zip` qui contient `AnonimoSer CrackME I.exe` (le crackme, SHA-256 `a02539ec6a4588665db29360b0c14e34a2f9654298e2abd7b2f79c1b247283d5`) et `web.exe` (petit lanceur de la page web de l'auteur, sans intérêt, non exécuté). C'est le grand frère de [anonimoser_crackme_ii](../5ab77f5633c5d40ad448c2e7/) : même famille d'algorithme, en plus simple.

## 1. Premier regard

```text
file  → PE32 executable (GUI) Intel 80386, UPX compressed
upx -d → OK ; diec → Borland Delphi 5, Turbo Linker 2.25
```

Le formulaire `TForm1` (ressource DFM `TPF0`, sans bordure, fond noir) contient :

- `Edit1` (« Nombre ») et `Edit2` (« Codigo ») ;
- `BitBtn1` (OK) → `OnClick = aver` ;
- `BitBtn2` (« Salir ») → `BitBtn2Click` ;
- `Timer1` → `OnTimer = verifica`.

La table des méthodes publiées de `TForm1` donne les adresses : `aver` = `0x45b0a4`, `verifica` = `0x45b490`, `BitBtn2Click` = `0x45b094`.

## 2. Le timer `verifica` (anti-SoftICE)

`verifica` appelle `0x45b064`, qui teste l'existence de `\\.\SICE` (pilote SoftICE). S'il est présent, le crackme affiche un faux message « Advertencia : Poca memoria… » puis `Halt`. Sans effet sous wine ou sous un débogueur moderne. Listing : [`analysis/timer-sice-0x45b490.asm`](analysis/timer-sice-0x45b490.asm).

## 3. La vérification `aver` (0x45b0a4)

Listing complet : [`analysis/check-0x45b0a4.asm`](analysis/check-0x45b0a4.asm).

1. `nom = Trim(Edit1.Text)`, `code = Trim(Edit2.Text)` ; si l'un est vide → « Informacion incompleta » ; si `len(nom) < 5` → « El nombre debe tener mas de 5 caracteres » (malgré le message, 5 caractères suffisent : `cmp eax,5 / jae`).
2. `v = nom[0] * Σ(octets du nom) + 2·n` (`imul` 32 bits), puis `S1 = IntToStr(v)`.
3. Pour chaque caractère `c` du nom : `v += c`, puis on ajoute à `acc` la somme des chiffres de `IntToStr(v)` ; enfin `S1 += IntToStr(acc)`.
4. Pour chaque paire de chiffres consécutifs `(a, b)` de `S1` : `T += chr(0x41 + a + b)`.
5. Le bon code est `S1 + T`, comparé par `LStrCmp` (`0x403ca4`) à `Edit2` : égalité → « Ok, lo lograste! », sinon « Error / Mal, mal, muy mal. ».

## 4. Exemple à la main : `petik`

- octets : p=112, e=101, t=116, i=105, k=107 → Σ = 541, n = 5
- `v = 112·541 + 10 = 60602` → `S1 = "60602"`
- `v` successifs : 60714 (18), 60815 (20), 60931 (19), 61036 (16), 61143 (15) → `acc = 88` → `S1 = "6060288"`
- paires : 6+0, 0+6, 6+0, 0+2, 2+8, 8+8 → `G G G C K Q`
- **code = `6060288GGGCKQ`**

## 5. Vérification

```bash
xvfb-run -a tools/wine-xdotool-check.sh petik 6060288GGGCKQ
# visible: Ok, lo lograste!
xvfb-run -a tools/wine-xdotool-check.sh petik 6060288GGGCKX
# visible: Error
```

## Fichiers

- [`tools/crackmes-de-anonimoser_crackme_i-solve.py`](tools/crackmes-de-anonimoser_crackme_i-solve.py) : keygen
- [`tools/wine-xdotool-check.sh`](tools/wine-xdotool-check.sh) : harnais wine + xdotool
- [`analysis/`](analysis/) : listings objdump des deux handlers
