# noname_User's Unbreakable Python? My Custom Obfuscation Engine

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/699c06a46ca1599050950670) · id `699c06a46ca1599050950670`

Crackme **Python** (script console, plateforme annoncée Windows).  
Auteur site : **[noname_User](https://crackmes.one/user/noname_User)**.

| Fichier | Rôle |
|---|---|
| [`original/test.py`](original/test.py) | stub zlib+b64 |
| [`analysis/deobfuscated_layer1.py`](analysis/deobfuscated_layer1.py) | couche CFF + thread Chaos VM |
| [`analysis/chaos_vm_saadjqymaqfc.py`](analysis/chaos_vm_saadjqymaqfc.py) | thread anti-VM / HWID décodé |
| [`analysis/deobfuscated_final.py`](analysis/deobfuscated_final.py) | logique RGB claire |
| [`tools/unbreakable-solve.py`](tools/unbreakable-solve.py) | decrypt + extrait le texte |

## Réponse

Pas d’input : le « secret » est le texte RGB affiché.

| Champ | Valeur |
|---|---|
| Texte | **`noname`** |
| Master key (succès HWID) | `64322080736143896125652295414509504119508758357723799657495947910577489034260` |

```bash
python3 tools/unbreakable-solve.py -q --check
# noname
python3 analysis/deobfuscated_final.py   # animation RGB (Ctrl+C pour quitter)
```

---

## Premier regard

```text
$ file original/test.py
ASCII text, with very long lines (5286), with CRLF line terminators

$ sha256sum original/test.py
0617e6374673cb3cceba2406791d690141adcb71f695f40c9f163a634a3b6cda
```

Banner : `# PROTECTED BY NONAME`. Une seule ligne utile : `exec(zlib.decompress(b64decode(...)))` via des noms `l0I0Il…`.

Description site : effet console RGB **`noname`** après « 7 layers » (shell obfusqué, RSA-like + XOR, Chaos VM HWID, anti-debug/VM, SHA-256, MBA/junk, CFF).

---

## Flow

```text
test.py
  → zlib+b64 → layer1 (CFF + thread daemon)
       → saadjqymaqfc : Chaos VM → master_key = int(sha256(str(acc)), 16)
       → blob base85 (intégrité SHA-256)
       → key = pow(BASE, BIG ^ master_key, MOD).to_bytes(32)
       → XOR → zlib → marshal → exec
            → smooth_rgb_normal_text()  # text = "noname"
```

Sur une machine **sans** le fingerprint auteur, `acc += 0.555555` (Win) ou `0.777` (Linux) → `to_bytes(32)` overflow → `except: sys.exit()`. La branche succès (`acc += 0.222222`, Termux ou HWID match) est la seule qui produit une clé 32 octets valide.

Fingerprint cible (WMI disk::bios::cpu::`uuid.getnode`) :

`90178d2d1e81e3cc1373ae36327277909ea0a904108c26fb80fec88755553bbd`

Anti-VM MAC prefixes : `080027`, `000569`, `000c29`, `001c14`, `005056`.

---

## Prédicat / crypto

1. **Chaos** (carte logistique, 50 itérations) : `val = 3.99 * val * (1.0 - val)` après un burn MD5 `b"burn"` × 500000.
2. **MBA XOR** : `(x + k) - 2*(x & k)` ≡ `x ^ k`.
3. **Intégrité blob** : `sha256(base85_string) == 9de1a7e0…0eaf0c`.
4. Payload final : `smooth_rgb_normal_text` avec `text="noname"`, `spacing=1`, `speed=0.1`, `wave_width=0.5`.

Bypass solveur : forcer la branche succès (`+0.222222`) sans rejouer le HWID réel.

---

## Vérification

```bash
python3 tools/unbreakable-solve.py --check
# text='noname' master_key=6432…34260
# check: OK (decrypt + smooth_rgb_normal_text)
```

Le script d’origine **ne tourne pas** tel quel sous Linux (mauvaise branche → exit silencieux). Preuve = decrypt reproductible + dump [`analysis/deobfuscated_final.py`](analysis/deobfuscated_final.py).

---

## Notes

- Pas de password / serial : goal = retrouver la logique cœur.
- Binding machine volontairement cassant hors poste de l’auteur (ou Termux).
- Bytecode marshal issu d’un CPython récent ; `dis` / `marshal.loads` suffisent, pas besoin de Wine ici.
