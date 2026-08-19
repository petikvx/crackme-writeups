# CrackmesForBeginners (CFB) #10 — The Keymaster's Sigil

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/6a5375046f511264ea482529) · id `6a5375046f511264ea482529`

Crackme **PE32+ console** (x86-64), C++ MSVC (VS 2026 / toolset 19.50).  
Auteur site : **CrackNotMe** · tagline `pwn.by` / `pwned.space`.

Dossier : `authors/cracknotme/6a5375046f511264ea482529/` — [série auteur](../README.md) · [repo](../../../README.md).

| Fichier | Rôle |
|---|---|
| [`original/CFB10.exe`](original/CFB10.exe) | binaire d’origine (**non** patché) |
| [`README.md`](README.md) | ce write-up |
| [`tools/cfb10-solve.py`](tools/cfb10-solve.py) | keygen + patch PE (`--check` / `--run`) |

## Réponse

Ce n’est **pas** un crack de l’RSA auteur (n 1024 bits sain). Solution attendue : **Key Replacement Attack** — remplacer la clé publique embarquée, signer le username avec *ta* privée.

| Champ | Valeur démo |
|---|---|
| Username | **`keymaster`** |
| Signature (hex, 256 chars) | `467e7d2bb4c51330b3f6a670892f6a3d825632a683929928fe8d7a4d1bc840a847c8c14ac4462cac138cb6b90c4a0966fa887cdebffbe295a3514300182bc69c495b37fc20b6b857ea005432ba937b27be1d8036f42d1d5442f8d51ddeccb1708a78ea43650e50899850a7193b92aaeb90cee343184dacce9b1187ec15cf3196` |

Algo : **RSA-1024 / PKCS#1 v1.5 / SHA-256**(username UTF-8) → 128 octets → hex.

```bash
python3 tools/cfb10-solve.py -q
# keymaster 467e7d2b…cf3196

python3 tools/cfb10-solve.py --check
python3 tools/cfb10-solve.py --run          # patch temp + Wine
python3 tools/cfb10-solve.py --user alice --run
```

Le solveur embarque une clé RSA-1024 *à nous* (pas celle de l’auteur).  
`--run` (défaut `--mode wine`) convertit le blob en `RSAPUBLICBLOB` pour Wine ; `--mode capi` fait le remplacement in-place du `PUBLICKEYBLOB` d’origine (OK Windows natif).

---

## 1. Premier regard

```text
file original/CFB10.exe
# PE32+ executable (console) x86-64, for MS Windows
```

```text
===================================================
            Crackme #10
           [+] by pwn.by [+]
         --> pwned.space <--
===================================================

[*] Welcome to CFB10 - The Keymaster's Sigil.
[*] System protected by RSA-1024 Asymmetric Cryptography.
[?] Enter Username:
[?] Enter Digital Signature (Hex):
[*] Verifying cryptographic signature against author's Public Key...
   [+] ACCESS GRANTED! …   ou   [-] ACCESS DENIED! …
   RSA math is unbreakable. Can you cheat it?
```

Hashes :  
MD5 `4f8bd2b7ef0c84b83c4a1d43da49a8d4` · SHA-256 `0c1e2ca24e3a8773a507517f9907c004efcdcd5953fdfd8b5721befbcd512625`.

Imports `bcrypt.dll` : `BCryptOpenAlgorithmProvider`, `BCryptImportKeyPair`, `BCryptCreateHash` / `HashData` / `FinishHash`, `BCryptVerifySignature`, …

Contraintes UI : username non vide ; signature hex longueur **paire** + caractères hex valides (les espaces sont filtrés).

---

## 2. Flow

```text
main ~0x1400036d0
  banner
  getline username → std::string  (reject si vide)
  getline signature hex → strip isspace → decode nibble pairs → vector<uint8_t>
  "[*] Verifying cryptographic signature…"
  ok = VerifyRsaSignature(username, sig_vector)   # 0x1400028a0
  test al / jz denied                             # 0x140003e5a / 0x140003e5c
  ACCESS GRANTED  ou  ACCESS DENIED + taunt
```

### `VerifyRsaSignature` (~0x1400028a0)

1. `BCryptOpenAlgorithmProvider(L"RSA")`
2. `BCryptImportKeyPair(…, L"CAPIPUBLICBLOB", blob@0x140022420, cb=0x94)`
3. `BCryptOpenAlgorithmProvider(L"SHA256")` + hash du username (bytes de la `std::string`)
4. `BCryptVerifySignature(hKey, PKCS1_PADDING_INFO{L"SHA256"}, hash32, sig, flags=BCRYPT_PAD_PKCS1=2)`
5. succès ⇒ `AL=1`

---

## 3. Prédicat (clé publique embarquée)

Blob **PUBLICKEYBLOB** CAPI (148 = `0x94` octets) @ `0x140022420` / file `0x20a20` :

| Offset | Contenu |
|---|---|
| `+0` | `06 02 00 00` — `PUBLICKEYBLOB`, version 2 |
| `+4` | `00 24 00 00` — `CALG_RSA_SIGN` |
| `+8` | `RSA1` + `bitlen=1024` + `pubexp=65537` |
| `+20` | modulus **little-endian** 128 octets |

`e = 65537` standard ; `n` 1024 bits sans petite factorisation évidente → pas de forge « math only ».

Le taunt *« RSA math is unbreakable. Can you cheat it? »* pointe le **cheat** : patcher la clé, pas casser RSA.

### Attaque (deux variantes)

**A — In-place CAPI (textbook, Windows)**  
Écrire un nouveau `PUBLICKEYBLOB` (même layout, ton `n`) sur les 0x94 octets @ `0x140022420`.

**B — `RSAPUBLICBLOB` (nécessaire sous Wine 6)**  
Wine : `fixme:bcrypt:key_import_pair unsupported key type L"CAPIPUBLICBLOB"`.

1. Planter un `BCRYPT_RSAKEY_BLOB` public (`RSA1`, exp BE 3 octets, mod BE 128) — **0x9b** octets — dans le padding `.rdata` @ `0x14002723d`
2. Retarget `lea rax, [rip+…]` @ `0x14000290a` vers ce plant
3. `mov dword [rsp+0x28], 0x94` @ `0x14000291a` → `0x9b`
4. Renommer la wide string `CAPIPUBLICBLOB` → `RSAPUBLICBLOB` (+ NUL) @ `0x140022718`  
   (attention : 13 vs 14 lettres — il faut bien écrire le `\0`, sinon `RSAPUBLICBLOBB`)

Le solveur fait **B** par défaut (`--mode wine`) ; **A** via `--mode capi`.

Signature (Python `cryptography`) :

```python
key.sign(username.encode(), padding.PKCS1v15(), hashes.SHA256())
```

---

## 4. Vérification

```bash
python3 tools/cfb10-solve.py --check
# check: OK  blob@ 0x140022420  …

python3 tools/cfb10-solve.py --run
# … ACCESS GRANTED! … You are a true Keymaster!
```

`original/CFB10.exe` reste intact (SHA-256 ci-dessus) : le patch vit dans un temporaire.

---

## 5. Notes

- NOP du `jz` @ `0x140003e5c` (`74 1f` → `90 90`) « gagne » aussi, mais ce n’est **pas** l’exercice crypto demandé.
- Ne pas republier / committer un PE patché à la place de `original/`.
- Dépendance solveur : package Python `cryptography`.
- Wine : utiliser `--mode wine` (défaut) ; `--mode capi` échoue sur bcrypt Wine faute de `CAPIPUBLICBLOB`.
