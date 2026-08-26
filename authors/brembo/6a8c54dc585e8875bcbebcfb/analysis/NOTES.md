# Notes reverse — license-cli

## Unpack

```bash
upx -d -o analysis/license-cli.unpacked.exe original/license-cli.exe
# Go build ID / module : license-cli ; go1.27.0
# Source path résiduel : C:/Users/user/Documents/Default Project/license-cli/main.go
```

## Symboles `main.*` (pclntab, fo = ftab+funcOff)

| Fonction | VA (image 0x140001000 + entryOff) |
|---|---|
| `main.fail` | `0x1400bd1e0` |
| `main.checkSelfHash` | `0x1400bd300` |
| `main.runAllChecks` | `0x1400bece0` |
| `main.validKey` | `0x1400bed40` |
| `main.main` | `0x1400bee80` |
| `crypto/sha256.Sum256` | `0x1400a99c0` |

`main.decryptPayload` apparaît dans les chaînes pclntab mais **pas** comme fonction séparée (inlined dans `main`).

## Flow `main`

```text
runAllChecks()
hideFromDebugger() ; erasePEHeader() ; initTextRegion()
print banner / "License key: "
ReadString
runAllChecks() again
validKey(input) ?
  false → "[X] Invalid key. Try again." ; loop
  true  → "[OK] License is valid."
          XOR decrypt 0x1d bytes @ 0x1400d673a with key
          print "  Payload: " + plaintext
          "  Exiting."
```

## Constante partagée

```text
112c2addd0d1ce1638bf9fb4b9377af3577066ee19e2f508b3fdffd5655a0465
```

Utilisée comme cible de `validKey` (et liée à `expectedExeHash` / self-hash — le SHA-256 du PE UPX local **ne** match **pas** cette valeur).

## Ciphertext payload

```text
2f263520213749223c282933242a455b452521252621242247232f263d
```

(29 octets, juste avant la string `  [X] Invalid key. Try again.` en rodata)

## Tentatives préimage

- rockyou (~14.3M) : miss  
- L=1..3 (clé brute + PT printable) : miss  
- L=4 (espace ~23M, filtre printable) : miss  
- mangling brembo/license/* : miss  

## Wine

`xvfb-run wine` : timeout sans sortie utile (checks anti-debug / tool windows / timing).
