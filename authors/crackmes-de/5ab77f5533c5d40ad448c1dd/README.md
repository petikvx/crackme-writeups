# keygenning4newbies_crackme_5 by analyst (crackmes.de)

- **Page** : <https://crackmes.one/crackme/5ab77f5533c5d40ad448c1dd>
- **Plateforme** : Windows PE32 GUI, **MSVC 6** — difficulté 1.0
- **Archive** : `original/k4n5.zip` → `crackme.exe` + `readme.txt`
- **Statut** : résolu (keyfile / keymaker), vérifié (prédicat Python + produit shellcode)

## Solution

```
python3 tools/k4n5-solve.py petik
# → key.dat hex=167000624d2236542c (9 octets)
# plain = b'K4N petik'  → UI « Registered to: petik »

python3 tools/k4n5-solve.py --check petik          # OK
python3 tools/k4n5-solve.py --write analysis/key.dat.petik petik
```

Protection **keyfile** : placer `key.dat` à côté de `crackme.exe`.

1. Lecture ≤ `0x100` octets ; chaque octet `^= taille` ; les 3 premiers `^= "TMG"` ; puis, par triplets dès l’offset 3, `buf[i..i+2] ^= buf[0..2]`.
2. Les 3 premiers octets **déchiffrés** (`K4N`) XOR-déchiffrent le blob @ `0x405030` (jusqu’au sentinelle `0xFF`) ; gate `byte0*byte1*byte2 == 0x2A8BF4` (prologue `55 8B EC`).
3. `VirtualProtect` + `call 0x405030(part2, name)` : le shellcode écrit **`Registered to: `** + la partie après l’espace du keyfile ; `SetDlgItemText` affiche ce buffer.

## Comment on trouve

1. `readme.txt` : keyfile, viser un keymaker. `diec` : MSVC 6, GUI.
2. Check `0x4010be` : `CreateFileA("key.dat")` / `ReadFile` / XOR taille+`TMG`+triplets ; XOR cyclique 3 octets sur `.data` @ `0x405030` ; produit des 3 premiers octets déchiffrés.
3. Échec → MessageBox *Are u sure it's a good keyfile ??* ; succès → shellcode + libellé « Registered to: … ».

## Vérification

- `tools/k4n5-solve.py --check` : round-trip encrypt/decrypt, produit `0x2A8BF4`, message `Registered to: petik`.
- Exemple `analysis/key.dat.petik` généré pour Wine (GUI `xvfb-run wine`).
