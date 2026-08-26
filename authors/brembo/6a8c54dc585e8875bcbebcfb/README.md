# brembo — license-cli *(PARKED)*

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/6a8c54dc585e8875bcbebcfb) · id `6a8c54dc585e8875bcbebcfb`

PE64 **Go 1.27**, UPX. License CLI + payload secret XOR.  
**Status : parked** (2026-08-26) — reverse + preuve dynamique x64dbg OK ; manque la **préimage SHA-256** de la clé.

Dossier : `authors/brembo/6a8c54dc585e8875bcbebcfb/` — [famille](../README.md) · [repo](../../../README.md).

| Fichier | Rôle |
|---|---|
| [`license-cli.exe`](original/license-cli.exe) | binaire d’origine (UPX) |
| [`license-cli.unpacked.exe`](analysis/license-cli.unpacked.exe) | après `upx -d` |
| [`license-cli-solve.py`](tools/license-cli-solve.py) | déchiffre le payload **si** clé connue |
| [`NOTES.md`](analysis/NOTES.md) | reverse + session x64dbg |

## Bloquant

```text
validKey(key) ⇔  hex(SHA256(key)) == "112c2addd0d1ce1638bf9fb4b9377af3577066ee19e2f508b3fdffd5655a0465"
```

Préimage **introuvable** pour l’instant :

- rockyou (~14M) brut + rockyou × mutations (leet / suffixe / reverse…) ~364M essais  
- L=1..4 printable (contrainte XOR payload) ; digits L=6..8  
- dict système, nick `Brembo001` / thématique license  
- crackmes.one : **0 write-up** ; spoilers inutiles (`Mayka…`, `i got it`)

Wine : anti-debug (`checkToolWindows` voit x64dbg/IDA/…, timing, …) → pas de prompt utile sans patch.

## Ce qui est clair

1. **UPX** → unpack dans `analysis/` (`go1.27.0`, module `license-cli`).
2. **Anti-*** via `runAllChecks` : self-hash, PE checksum, `IsDebuggerPresent` / remote, HW BP (DR0–DR3), process + window blacklists, timing, CRC `.text` → `main.fail` si `tamperFound`.
3. **`expectedExeHash`** = 64×`'A'` ; `Trim(..., "A")` → vide → **self-hash skip** (placeholder). La constante `112c2add…` sert **seulement** à `validKey`.
4. **`main.validKey`** (`0x1400bed40`) : `sha256.Sum256(key)` → hex minuscule 64 → `memequal`.
5. **Payload** (inlined dans `main`, 29 o @ `0x1400d673a`) :

```text
ct = 2f263520213749223c282933242a455b452521252621242247232f263d
# ASCII : /&5 !7I"<()3$*E[E%!%&!$"G#/&=
pt[i] = ct[i] XOR key[i % len(key)]   # i = 0..28
```

6. UI : `License key:` / `[OK] License is valid.` / `Payload:` / `[X] Invalid key.`

## x64dbg (2026-08-26)

ImageBase ASLR ex. `0x7FF7A7E70000` (copie Desktop UPX).

- BP soft sur OEP **écrasé** par unpack → breaker le `jmp` final du stub UPX (`…59A7` → `IB+0x80a20`).
- Patches live : `runAllChecks` → epilogue ; `fail` / `hideFromDebugger` / `erasePEHeader` / `initTextRegion` → `ret` ; forcer branche OK + inject clé.
- **Preuve XOR** avec clé injectée `petik` → dump `@rsp+0x2B` :

```text
_CAIJG,VUCYVPC.+ QHNVDPK,SJRT
```

(identique au solveur offline — confirme le cipher, **pas** une clé SHA valide).

Détail adresses / octets de patch : [`analysis/NOTES.md`](analysis/NOTES.md).

## Reprendre

1. Préimage SHA-256 (alnum L=5 ~10–12 min CPU, hashcat GPU, autre wordlist…).
2. Preuve live avec la vraie clé (x64dbg patché ou hide debugger).
3. `python3 tools/license-cli-solve.py --key '…'` puis write-up + `status: solved`.
