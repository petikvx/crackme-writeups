# CrackmesForBeginners (CFB) #9 — The Impostor

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/6a5374be6f511264ea482525) · id `6a5374be6f511264ea482525`

Crackme **PE32+ console** (x86-64), C++ MSVC (VS 2026 / toolset 19.50).  
Auteur site : **CrackNotMe** · tagline `pwn.by` / `pwned.space`.

Dossier : `authors/cracknotme/6a5374be6f511264ea482525/` — [série auteur](../README.md) · [repo](../../../README.md).

| Fichier | Rôle |
|---|---|
| [`original/CFB9.exe`](original/CFB9.exe) | binaire d’origine (**sans** `validator.dll`) |
| [`README.md`](README.md) | ce write-up |
| [`tools/validator.c`](tools/validator.c) | source de la DLL imposteur |
| [`tools/validator.dll`](tools/validator.dll) | PE64 prêt à side-loader |
| [`tools/cfb9-solve.py`](tools/cfb9-solve.py) | `--check` / `--run` / `--build` |

## Réponse

Ce n’est **pas** un serial à cracker dans l’EXE. L’EXE **délègue** toute la vérif à un module externe absent du ZIP :

| Attendu | Valeur |
|---|---|
| DLL (même dossier que `CFB9.exe`) | **`validator.dll`** |
| Export | **`VerifyLicense`** |
| Signature effective | `unsigned VerifyLicense(const char *challenge, const char *key)` |
| Succès | retour **`0x1337C0DE`** |
| Clé démo | **`impostor`** (n’importe quelle chaîne marche une fois la DLL chargée) |

```bash
python3 tools/cfb9-solve.py -q
# impostor

python3 tools/cfb9-solve.py --check
python3 tools/cfb9-solve.py --run
# optionnel : rebuild la DLL
python3 tools/cfb9-solve.py --build
```

Sans la DLL :

```text
[-] ERROR: Security module 'validator.dll' is missing!
```

---

## 1. Premier regard

```text
file original/CFB9.exe
# PE32+ executable (console) x86-64, for MS Windows
```

```text
===================================================
            Crackme #9
           [+] by pwn.by [+]
         --> pwned.space <--
===================================================

[*] Welcome to CFB9 - The Impostor.
[*] Connecting to external security module (validator.dll)...
…
[?] Enter License Key:
[*] Handing over verification to validator.dll...
   [+] ACCESS GRANTED! …   ou   [-] ACCESS DENIED! …
   You are the Ultimate Impostor!
```

Hashes :  
MD5 `2dc01938ed3443a7d9a8ba769da38fd9` · SHA-256 `abb88c6b84c21e46afc51d3bda0afa7e0402c94fc942362310a435c8979c9123`.

Description site : *« entirely devoid of validation logic »* — DLL side-loading classique, écrire sa propre `validator.dll`.

Imports utiles (IAT) : `GetModuleFileNameA`, `LoadLibraryExA`, `GetProcAddress`, `GetTickCount`, `FreeLibrary`.

---

## 2. Flow

```text
main ~0x1400034b0
  banner (« The Impostor »)
  GetModuleFileNameA(NULL, buf, 0x104)
  strip basename (dernier '\' ou '/')
  append "validator.dll"          # 13 octets @ 0x1400287c0
  LoadLibraryExA(path, NULL, 0x8) # LOAD_WITH_ALTERED_SEARCH_PATH
  si NULL → ERROR missing + exit
  GetProcAddress(h, "VerifyLicense")
  si NULL → ERROR export + FreeLibrary + exit
  GetTickCount → sprintf buffer "CHAL-%u"
  print "[*] Generated dynamic challenge: CHAL-…"
  prompt "[?] Enter License Key: "
  getline → std::string (SSO / heap)
  "[*] Handing over verification to validator.dll..."
  eax = VerifyLicense(challenge_buf, key_cstr)   # call r15 @ 0x140003ac8
  si eax == 0x1337C0DE → ACCESS GRANTED + Ultimate Impostor
  sinon ACCESS DENIED
  FreeLibrary(h)
```

Construction du chemin (extrait) :

1. chemin absolu de l’EXE via `GetModuleFileNameA` ;
2. recherche du dernier séparateur dans `"\/"` @ `0x1400287b8` ;
3. remplacement du nom de fichier par `validator.dll` (pas de `SetDllDirectory` : le side-load est **explicite** sur ce path).

---

## 3. Prédicat (ABI de l’imposteur)

Il n’y a **aucun** check de contenu de clé dans `CFB9.exe`. Le seul prédicat est :

```text
cmp eax, 0x1337c0de          ; @ 0x140003ad2
jne denied
```

Convention d’appel (x64 Windows) observée :

| Registre | Contenu |
|---|---|
| `RCX` | `char *` challenge (`"CHAL-<GetTickCount>"`, buffer stack ~32 octets) |
| `RDX` | `char *` license key (C-string après `getline`) |
| `EAX` | doit valoir `0x1337C0DE` |

Implémentation minimale ([`tools/validator.c`](tools/validator.c)) :

```c
__declspec(dllexport) unsigned int VerifyLicense(const char *challenge,
                                                 const char *license_key) {
  (void)challenge;
  (void)license_key;
  return 0x1337c0deu;
}
```

Build (mingw-w64) — aussi via `python3 tools/cfb9-solve.py --build` :

```bash
x86_64-w64-mingw32-gcc -shared -Os -s -nostdlib -e DllMain \
  -o tools/validator.dll tools/validator.c -lkernel32
```

Placer `validator.dll` **à côté** de `CFB9.exe`, lancer, taper n’importe quelle clé (démo `impostor`).

---

## 4. Vérification

```bash
# marqueurs PE + export DLL
python3 tools/cfb9-solve.py --check
# check: OK  magic=0x1337c0de  export=VerifyLicense  demo_key=impostor

# preuve live (Wine copie EXE+DLL dans un tmp)
python3 tools/cfb9-solve.py --run
```

Sortie attendue (extrait) :

```text
[+] SUCCESS: 'validator.dll' loaded successfully.
[*] Generated dynamic challenge: CHAL-…
[?] Enter License Key:
[*] Handing over verification to validator.dll...
   [+] ACCESS GRANTED! Congratulations!
   You have successfully solved CFB9!
   You are the Ultimate Impostor!
```

Contrôle négatif (sans DLL) : message `Security module 'validator.dll' is missing!`.

---

## 5. Notes

- Ce n’est **pas** un keygen sur un hash/serial local : remplacer le garde (DLL) suffit.
- `LOAD_WITH_ALTERED_SEARCH_PATH (0x8)` + path absolu = side-load **intentionnel** pour le challenge, pas un hijack subtil via `cwd` seul.
- Le challenge `CHAL-%u` est affiché mais **ignoré** par notre imposteur ; un vrai module vendor pourrait le signer.
- Ne pas committer une `validator.dll` dans `original/` : garder `original/` = EXE d’origine uniquement ; la DLL vit dans `tools/`.
- Wine : `wine64` OK pour PE32+ console.
