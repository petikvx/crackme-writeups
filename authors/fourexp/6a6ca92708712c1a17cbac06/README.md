# fourexp's fourexps hard crackme

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/6a6ca92708712c1a17cbac06) · id `6a6ca92708712c1a17cbac06`

Crackme **Windows** PE64 console, **C++** (MSVC **Debug** / VS 2026).  
Auteur site : **fourexp**.

Dossier : `authors/fourexp/6a6ca92708712c1a17cbac06/` — [série auteur](../README.md) · [repo](../../../README.md).

| Fichier | Rôle |
|---|---|
| [`original/hard_crackme.zip`](original/hard_crackme.zip) | ZIP site (mdp `crackmes.one`) |
| [`analysis/extracted/hard crackme/fourexps hard crackme.exe`](analysis/extracted/hard%20crackme/fourexps%20hard%20crackme.exe) | PE32+ console x86-64 (Debug CRT) |
| [`analysis/extracted/hard crackme/info.txt`](analysis/extracted/hard%20crackme/info.txt) | hint auteur : XOR obfuscation |
| [`tools/fourexps-hard-solve.py`](tools/fourexps-hard-solve.py) | decode XOR → password |

## Réponse

Password unique (pas de username) :

| | |
|---|---|
| **Password** | **`welldoneyoucrackedit`** |

```bash
python3 tools/fourexps-hard-solve.py -q
# welldoneyoucrackedit

python3 tools/fourexps-hard-solve.py --check welldoneyoucrackedit
# check='welldoneyoucrackedit' expected='welldoneyoucrackedit' → OK

python3 tools/fourexps-hard-solve.py --from-pe --decode
# enc = b'-?66>54?#5/9(;91?>3.'
# key = 0x5a
# pwd = 'welldoneyoucrackedit'
```

Preuve live Wine : **bloquée** (build Debug — DLLs `*D.dll` absentes sous Wine). Voir § Vérification.

---

## 1. Premier regard

```text
PE32+ executable (console) x86-64, for MS Windows, 10 sections
sha256 81a39dd8edbc663ae03dc5457b697bc3d0e8f10a49ebd6d3046738efb60faeee
DIE: Microsoft Visual C/C++ 19.51 (VS 2026) + Debug data (codeview)
Imports: MSVCP140D / VCRUNTIME140D / VCRUNTIME140_1D / ucrtbased / KERNEL32
```

ZIP d’origine (`original/hard_crackme.zip`, sha256 `acf8cf0d…`) → dossier `hard crackme/` avec l’exe + `info.txt` :

```text
The password is XOR Obfuscated, goodluck!
```

Strings utiles : `Enter password (`, ` attempts left): `, `Access granted`, `Access denied`, `Maximum attempts exceeded. Locking out.`, symboles STL `encrypted` / `correct_password`.

Le password en clair **n’apparaît pas** dans les strings (construit sur la stack puis XOR).

---

## 2. Flow

Fonction principale ~`0x14001b2d0` :

1. Construit un blob chiffré octet par octet sur la stack (`mov BYTE PTR [rbp+…]`) :

   ```text
   -?66>54?#5/9(;91?>3.\0
   ```

2. Stocke la clé `0x5A` en `[rbp+0x34]`.
3. Boucle : pour chaque octet non nul du blob → `xor eax, 0x5A` → append dans un `std::string` (password attendu).
4. Jusqu’à **5** tentatives :
   - Affiche `Enter password (N attempts left): `
   - Lit une ligne (`std::string`)
   - Compare au password déchiffré → `Access granted` (flag succès) ou `Access denied` + compteur++
5. Si 5 échecs : `Maximum attempts exceeded. Locking out.`

---

## 3. Prédicat

À `0x14001b30e` … `0x14001b3b6` (extrait) :

```asm
mov  BYTE PTR [rbp+0x8],  0x2d   ; '-'
mov  BYTE PTR [rbp+0x9],  0x3f   ; '?'
…                                ; 20 octets
mov  BYTE PTR [rbp+0x1b], 0x2e   ; '.'
mov  BYTE PTR [rbp+0x1c], 0x0
mov  BYTE PTR [rbp+0x34], 0x5a   ; clé
…
movzx eax, BYTE PTR [rbp+rax*1+0x8]
xor   eax, 0x5a
; → push_back dans std::string
```

Donc :

```python
enc = b"-?66>54?#5/9(;91?>3."
password = bytes(b ^ 0x5A for b in enc)   # b'welldoneyoucrackedit'
```

Le solveur peut aussi **reparser** la chaîne de `mov BYTE` dans le PE (`--from-pe`) au lieu d’utiliser la table en dur.

---

## 4. Vérification

```bash
python3 tools/fourexps-hard-solve.py -q
# welldoneyoucrackedit

python3 tools/fourexps-hard-solve.py --from-pe -q
# welldoneyoucrackedit
```

**Wine (Linux)** — le binaire est un build **Debug** :

```text
err:module:import_dll Library MSVCP140D.dll … not found
err:module:import_dll Library VCRUNTIME140D.dll … not found
err:module:import_dll Library VCRUNTIME140_1D.dll … not found
err:module:import_dll Library ucrtbased.dll … not found
status c0000135
```

Pas de preuve interactive sous Wine sans les CRT Debug Microsoft. La soluce repose sur le décodage statique (stack + XOR) + relecture `--from-pe`, cohérente avec le hint `info.txt`.

---

## 5. Notes

- Titre « hard » : surtout parce que le password n’est pas en clair dans `.rdata` (construction stack + XOR) — le crypto reste un XOR constant `0x5A`.
- Build Debug MSVC : imports `*D.dll` → incompatible Wine out-of-the-box ; ne pas confondre avec un packer.
- `analysis/hard_crackme-relink.exe` : tentative expérimentale de retarget Release CRT (non utilisée pour la soluce ; `_free_dbg` etc. restent un problème).
- Pas de username / keygen : un seul password fixe.
