# brembo — license-cli *(PARKED)*

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/6a8c54dc585e8875bcbebcfb) · id `6a8c54dc585e8875bcbebcfb`

PE64 **Go 1.27**, UPX 5.20. License CLI + payload secret.  
**Status : parked** — reverse ~complet, manque la **préimage SHA-256** de la clé.

Dossier : `authors/brembo/6a8c54dc585e8875bcbebcfb/` — [famille](../README.md) · [repo](../../../README.md).

| Fichier | Rôle |
|---|---|
| [`license-cli.exe`](original/license-cli.exe) | binaire d’origine (UPX) |
| [`license-cli.unpacked.exe`](analysis/license-cli.unpacked.exe) | après `upx -d` |
| [`license-cli-solve.py`](tools/license-cli-solve.py) | déchiffre le payload **si** clé connue |
| [`NOTES.md`](analysis/NOTES.md) | détails reverse |

## Bloquant

```text
validKey(key) ⇔  hex(SHA256(key)) == "112c2addd0d1ce1638bf9fb4b9377af3577066ee19e2f508b3fdffd5655a0465"
```

Préimage **absente** de rockyou (~14M) ; espaces L≤4 (filtre ASCII) négatifs.  
Wine : hang / anti-debug (`runAllChecks`) avant prompt utile.

## Ce qui est clair

1. **UPX** → unpack dans `analysis/`.
2. **Anti-*** : `IsDebuggerPresent`, process/window blacklists (x64dbg, IDA, …), timing, self-hash PE, erase PE header, etc. → `main.fail` si `tamperFound`.
3. **`main.validKey`** (`0x1400bed40`) : `sha256.Sum256(key)` → hex minuscule 64 → compare à la constante ci-dessus.
4. **Payload** (inlined dans `main`, 29 octets @ `0x1400d673a`) :

```text
ct = 2f263520213749223c282933242a455b452521252621242247232f263d
pt[i] = ct[i] XOR key[i % len(key)]   # i = 0..28
```

5. UI : `License key:` / `[OK] License is valid.` / `Payload:` / `[X] Invalid key.`

## Reprendre

- Trouver la préimage (wordlist plus large, rules, indice auteur).
- Ou patch `validKey` + run live sous Windows / Wine patché pour dumper dynamiquement.
- Puis : `python3 tools/license-cli-solve.py --key '…'`
