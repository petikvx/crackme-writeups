# babylon_keygenme by haiklr (crackmes.de)

- **Page** : <https://crackmes.one/crackme/5ab77f5533c5d40ad448c260>
- **Plateforme** : Windows **PE32** console, C (MinGW) — difficulté 1.0
- **Archive** : `original/babylon-kgme.zip` → `Babylon Keygenme.exe` + `readme.txt`
- **Statut** : résolu (keygen), vérifié **live sous wine**

## Solution

Le nom doit faire **4 à 14** caractères.

```
python3 tools/babylon-solve.py petik --check
petik -> '1^66/'
wine : Yeah, c'est bon :]
```

| Nom | Serial |
|---|---|
| `petik` | **`1^66/`** |
| `petikvx` | (voir solveur) |
| `test` | (voir solveur) |

Formule :

1. `spaced` = caractères du nom séparés par des espaces (`p e t i k `…) ;
2. `key` = 34 octets en `0x401230`, chaque octet `+1` ;
3. `key[i] ^= spaced[i]` pour `i < len(spaced)` ;
4. `rev = key[:strlen][::-1]` ; `out[2i]=rev[i]`, `out[2i+1]=key[i]` ;
5. si `out[j] ≤ 0x1f` ou `> 0x7a` → `out[j] = '6'` ;
6. serial = `out[:len(name)]`.

## Comment on trouve

1. `objdump` : `main` réel via CRT → `0x401310` (scanf nom/serial, `strlen`, boucles locales).
2. Contrainte longueur : `cmp L,3 ; jle` / `cmp L,0xe ; jg` → message « Attention ! 3 < Nom < 15 ».
3. Construction d’un buffer espacé (`mov [dst+1], 0x20`), copie d’une clé fixe `0x401230`, `inc` octet par octet, puis XOR avec le buffer espacé.
4. Renversement, ré-entrelacement clé/renversé, clamp hors `0x20..0x7a` vers `'6'`, comparaison des `L` premiers octets au serial saisi → « Yeah, c'est bon :] ».

## Vérification

- Live sous wine : `petik` / `1^66/` → `Yeah, c'est bon :]`.
- Contre-test : serial altéré → `Mauvais mot de passe !`.
