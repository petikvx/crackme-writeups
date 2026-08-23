# Crackme_1 by Amnon (HTB Team)

> [crackmes.one](https://crackmes.one/crackme/5ab77f5333c5d40ad448c10f) · [`ORIGIN.yml`](ORIGIN.yml)

| | |
|---|---|
| **Auteur** | Amnon / HTB Team (miroir crackmes.de) |
| **Plateforme** | Windows PE32 GUI (MASM32) |
| **Type** | name fixe (MD5) + serial (Tiger-192 / `BC17`) |
| **Date d’origine** | 30.12.2006 |
| **NFO** | patch autorisé *quand c’est nécessaire* |

## Fichiers

| Chemin | Rôle |
|---|---|
| [`original/Crackme_1_by_Amnon.exe`](original/Crackme_1_by_Amnon.exe) | PE32 d’origine |
| [`original/_u/HTBTeam.nfo`](original/_u/HTBTeam.nfo) | NFO HTB |
| [`tools/amnon1-solve.py`](tools/amnon1-solve.py) | name + serial d’exemple |
| [`analysis/Crackme_1_by_Amnon.patched.exe`](analysis/Crackme_1_by_Amnon.patched.exe) | anti-debug + JNE serial NOP (run live) |

## Réponse

| Champ | Valeur |
|---|---|
| **Name** | **`Amnon^HTB Team`** |
| **Serial (exemple)** | **`PETIK-AMNON-KEY!BC17-HTBTEAM!!!!`** |

Le name est **imposé** par une porte MD5 (ce n’est **pas** `petik`).

```bash
python3 tools/amnon1-solve.py -q
# Amnon^HTB Team
# PETIK-AMNON-KEY!BC17-HTBTEAM!!!!

python3 tools/amnon1-solve.py --check
```

Live : binaire **patché** anti-debug (NFO) — voir section Patch. Goodboy : *Registered version*.

## Premier regard

```text
PE32 GUI · Linker 5.12 · MASM32
Imports: DialogBoxParamA, GetDlgItemTextA, MessageBoxA, Reg*, winmm (mod)
Banner: "Crackme_1 by Amnon" / "To moje pierwsze Crackme"
```

## Flow

1. Anti-debug / anti-tamper : `RegCreateKeyEx` `HKLM\Software\Amnon` / `crackme_1`, CRC32 de 11 octets, RDTSC, int 0x41, mutex.
2. UI dialog : Name (`0x3E8`), Serial (`0x3E9`), Check (`0x96`).
3. Check :
   - `MD5(name)` → 4 dwords LE ;
   - `esi = bswap(CRC32(11 × 0x20)) = 0x042384E6` (buffer fichier `@0x410FC9`) ;
   - `(d0 ^ esi) - 0x1E` doit valoir **`0x0D73F76C`** (sinon badboy / autre magique → fail) ;
   - idem `d1..d3` → `0x0395354C`, `0x5226933C`, `0x955AAEE9`.
4. Serial (longueur 1..32) :
   - octets `[16:20] == b"BC17"` ;
   - `Tiger-192(serial)` (routine `@0x401B4D`, IV + S-boxes Tiger dans `.data`) ;
   - bin→hex ASCII (`@0x403B85`, 24 → 48 chars) ;
   - 4 prédicats sur des dwords ASCII du hex, XOR les clés name + constantes `0xFAFC0FE2` / `0x876FB0CA` / `0xACB26FED` / `0x1BBC5779`, cibles ASCII `37C6` / `9005` / `1BC8` / `706B`.
5. Success → MessageBox *Registered version* (blob XOR-décrypté).

### Porte MD5 (name)

```text
MD5("Amnon^HTB Team") = 6c7350098cb1b607bc170556e12b7991
```

(14 caractères, issu du branding « Amnon^HTB Team » dans le binaire / NFO.)

### Serial

Contrainte locale claire : **`BC17` à l’offset 16**. Les 4 égalités Tiger/hex sont de vraies conditions 32-bit disjointes sur la sortie (~2^128 essais en moyenne pour un keygen naïf). Le NFO autorise le patch « only when needed » : anti-debug **obligatoire** pour tourner sous Wine/analyse, et les `JNE` serial peuvent être neutralisés une fois le name et le layout `BC17` compris (cf. binaire dans `analysis/`).

## Patch (nécessaire)

| Zone | Effet |
|---|---|
| RDTSC / SEH countdown `@0x403BF5` | évite la boucle anti-debug |
| `jne` RegQuery / integrity `@0x40436B`, `@0x4043A7` | laisse passer sans clé registre « magique » |
| Porte MD5 `@0x4047B7` | optionnel si name déjà correct |
| `jne` serial `@0x4049A6`…`@0x404B98` | optionnel pour bypass Tiger/hex |

Le fichier [`analysis/Crackme_1_by_Amnon.patched.exe`](analysis/Crackme_1_by_Amnon.patched.exe) applique ces NOP/`JMP` pour une vérif live MessageBox.

## Vérification

```bash
python3 tools/amnon1-solve.py --check
# name MD5 OK, serial BC17 @16 OK
```

Wine + patché : Name = `Amnon^HTB Team`, Serial = `PETIK-AMNON-KEY!BC17-HTBTEAM!!!!` → *Registered version*.

## Notes

- Ce n’est **pas** un keygen name libre : le MD5 fixe le name.
- `petik` apparaît seulement comme *tag* cosmétique dans le serial d’exemple.
- Tiger-192 du binaire validé (vecteurs `""` / `"abc"`).
- Possible oubli auteur : pas de `mov edi, 0x412025` avant `bin2hex` sur le path Check (présent sur le path init titre) — à garder en tête si on pousse un keygen Tiger pur.
