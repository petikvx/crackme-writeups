# keygenning4newbies_crackme_7 by analyst (crackmes.de)

- **Page** : <https://crackmes.one/crackme/5ab77f5533c5d40ad448c1d9>
- **Plateforme** : Windows PE32 GUI, **MSVC 6** + **UPX 1.02** (fiche site : Unspecified/other) — difficulté 1.0
- **Archive** : `original/k4n7.zip` (mot de passe `crackmes.one`) → `KeygenMe.exe` (UPX) ; décompressé dans `analysis/KeygenMe.unpacked.exe`
- **Statut** : résolu (keygen), vérifié par **émulation Unicorn** du vrai `0x401c70` (MessageBox « Congrats… ») — GUI non pilotée sous wine/xvfb

## Solution

Deux champs : **name** (texte libre) et **Serial** (**exactement 16** caractères hex **majuscules**).

```
python3 tools/k4n7-solve.py petik            ->  8038CA6D3774F53D
python3 tools/k4n7-solve.py --check petik    ->  Congrats you did it !
```

Formule (`d` = MD5(name) en 4 dwords little-endian `k0..k3`, `sum = k0 ^ k2`) :

```
y0, z0 = "keyg", "enme"          # 0x6779656B, 0x656D6E65
y  = y0 + (((z0<<4)+k0) ^ (z0+sum) ^ ((z0>>5)+k1))
z  = z0 + (((y <<4)+k2) ^ (y +sum) ^ ((y >>5)+k3))
serial = "%08X%08X" % (z, y)     # 8 hex (z) + 8 hex (y)
```

## Comment on trouve

1. `diec` : MSVC 6 + UPX 1.02 ; `upx -d` → `analysis/KeygenMe.unpacked.exe`.
2. Chaînes : « Congrats you did it ! », « Invalid serial :x », auteur SyntaxError // ECLiPSE ; constantes MD5 `0x67452301…` en `0x401000`.
3. Dialog proc `0x401b10` : bouton Check (ID 1) → `GetDlgItemTextA` contrôle `0x3E9` (serial, len **== 16**) dans `0x406d00`, contrôle `0x3E8` (name) dans `0x40603c` ; puis `0x401d90` (parse hex) et `0x401c70` (vérif).
4. `0x401d90` : décode hex (nibble via `-'0'` / `-'A'+10`) : chars `[0..7]` → dword `0x4060a4` (= `z`), chars `[8..15]` → `0x4060a0` (= `y`). Minuscules non supportées.
5. `0x401c70` : MD5(name) → digest ; `sum = d0 ^ d2` ; **une** ronde TEA-like de **déchiffrement** sur `(y,z)` avec clés `d0..d3` ; succès si `(y,z) == ("keyg","enme")` → MessageBox Congrats.

## Vérification

- `tools/k4n7-solve.py --check petik` charge le PE dépacké sous **Unicorn**, écrit name/serial aux adresses du binaire, exécute `0x401c70` et intercepte `MessageBoxA` : « Congrats you did it ! » ; serial `0000000000000000` → « Invalid serial :x ».
- Vérification par émulation du vrai code de vérif, pas par la GUI sous wine.
