# Sallos's Key License

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/68aac9df8fac2855fe6fb849) · id `68aac9df8fac2855fe6fb849`

Crackme **PE32 GUI** (MASM32 / Microsoft Linker 5.12), dialogue « DialogApp ».  
Auteur site : **[Sallos](https://crackmes.one/user/Sallos)**.

Dossier : `authors/sallos/68aac9df8fac2855fe6fb849/` — [série auteur](../README.md) · [repo](../../../README.md).

| Fichier | Rôle |
|---|---|
| [`original/keylicense.exe`](original/keylicense.exe) | binaire d’origine |
| [`original/key.license`](original/key.license) | fichier licence (écrit par le solveur) |
| [`analysis/keylicense.exe.i64.c`](analysis/keylicense.exe.i64.c) | Hex-Rays (`decc`) |
| [`analysis/keylicense_live.exe`](analysis/keylicense_live.exe) | helper Wine : SetWindowText + Activate |
| [`tools/key-license-solve.py`](tools/key-license-solve.py) | solveur / `--check` |
| [`README.md`](README.md) | ce write-up |

## Réponse

Deux conditions **indépendantes** :

| Entrée | Valeur (exemple Wine) |
|---|---|
| Champ dialogue « Enter the user's profile name » | **`petik`** (= username SAM après `DOMAIN\`) |
| Fichier `key.license` (même dossier que l’exe) | **`0020-0000-0000-0000`** (19 octets) |

→ MessageBox **Success!** — *Congratulations, the license has been successfully activated!*

```bash
python3 tools/key-license-solve.py --write          # écrit original/key.license
python3 tools/key-license-solve.py -q               # 0020-0000-0000-0000
python3 tools/key-license-solve.py --check          # Wine live → OK
# xvfb-run -a wine original/keylicense.exe          # puis saisir petik + Activate
```

Sous Wine lab : `GetUserNameExA(NameSamCompatible)` → `PTK-LAB\petik` → strip → **`petik`**.

---

## 1. Premier regard

```text
file original/keylicense.exe
# PE32 executable for MS Windows 4.00 (GUI), Intel i386, 4 sections

diec original/keylicense.exe
# Linker: Microsoft Linker(5.12.8078)
# Compiler: MASM(6.14.8444) … Tool: MASM32(8-11)
```

- 5632 octets, GUI dialog (`DialogBoxParamA` template `0x65`).
- Imports notables : `GetUserNameExA` (secur32), `CheckRemoteDebuggerPresent`, `CreateFileA` / `ReadFile`, `MessageBoxA`.
- Chaînes XOR `0x25` : `Success!`, `Congratulations, the license has been successfully activated!`, `Invalid user login!`, `Invalid license key!`, plus anti-debug `Oh, No` / `Please try again!`.
- Fichier attendu : **`key.license`**.

Hashes : MD5 `3e8098f694e0e69f9e87852f8d61f3d3` · SHA-256 `379d360896d7130b957676ba84971249001bcfc1169a0e7819c33df6faf401d5`.

```bash
bash -ic 'decc original/keylicense.exe'   # → analysis/keylicense.exe.i64.c
```

---

## 2. Flow

```text
start
  DialogBoxParamA(…, DialogFunc)

WM_INITDIALOG (0x110)
  CheckRemoteDebuggerPresent → si debugger : MessageBox "Oh, No" + close
  GetModuleFileNameA → répertoire de l’exe
  concat(dir, "key.license") dans buffer GlobalAlloc

WM_COMMAND / bouton Activate (ID 1001)
  GetUserNameExA(NameSamCompatible) → NameBuffer
  strip DOMAIN\  (sub_4012D8)
  GetDlgItemTextA(ID 1003) → String
  si String != NameBuffer        → "Invalid user login!"
  sinon si !check(key.license) → "Invalid license key!"
  sinon                        → "Success!" / Congratulations…
```

UI : label *Enter the user's profile name*, bouton **Activate**. Les chaînes MessageBox sont déchiffrées / rechiffrées in-place (`xor 0x25`) autour de l’appel.

---

## 3. Prédicat

### 3.1 Username (champ dialogue)

Pas de keygen name→serial : le champ doit **égaliser** le login Windows (partie après `\`).

Exemple lab : `petik`.

### 3.2 Fichier `key.license`

`sub_40139D` : `CreateFileA` + lecture de **exactement 19** octets, puis `sub_401409`.

Algorithme **effectif** (tel qu’exécuté) :

```text
ebx, edx = 2, 3
pour i in 0..3 :
    si buf[i] % (ebx & 0xff) != 0 → FAIL
    ebx, edx = edx, edx + ebx     # 2,3 → 3,5 → 5,8 → 8,13
→ SUCCESS
```

Donc seuls les **4 premiers octets** comptent (divisibles par **2, 3, 5, 8**), le reste des 19 octets est libre.

Exemple ASCII digits : `0020` (`'0'%2`, `'0'%3`, `'2'%5`, `'0'%8` tous nuls) → fichier  
`0020-0000-0000-0000`.

### 3.3 Bug / code mort

Après la boucle des 4 octets, le binaire fait `lodsb` puis **`jmp` inconditionnel** vers le succès (`401440: eb 19`).  
Juste après se trouve du code mort qui aurait validé des tirets `-` et **4 groupes** (format `XXXX-XXXX-XXXX-XXXX`) en mettant à jour les graines (`ebx=2*ebx+1`, `edx=2*edx+1`). Un `je` (`74`) à la place du `jmp` (`eb`) collerait à ce schéma — **ce n’est pas** ce que le PE publié exécute.

---

## 4. Vérification

```bash
python3 tools/key-license-solve.py --write --user petik
python3 tools/key-license-solve.py --check
# … RESULT_TITLE=Congratulations, the license has been successfully activated!
# LIVE OK
# OK
```

Preuve live : helper [`analysis/keylicense_live.exe`](analysis/keylicense_live.exe) (sources `.c` à côté) lance l’exe sous Wine, `SetWindowTextA` sur l’edit 1003, `PostMessage` Activate, lit le titre / texte du MessageBox.

Contre-preuve : `--user wronguser` → *Invalid user login!* (`LIVE FAIL`).

```bash
# manuel
cp tools/… # ou :
python3 tools/key-license-solve.py --write
xvfb-run -a wine original/keylicense.exe   # saisir petik, Activate
```

---

## 5. Notes

- Anti-debug soft : `CheckRemoteDebuggerPresent` au init ; sous x64dbg le dialogue se ferme avec « Oh, No ».
- Ce n’est **pas** un keygen classique : le « serial » UI est le **username**, la vraie licence est le fichier à côté de l’exe.
- Ne pas patcher `original/keylicense.exe` ; le solveur n’écrit que `key.license`.
