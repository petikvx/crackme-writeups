# just_a_little_crackme by bratalarm (crackmes.de)

- **Page** : <https://crackmes.one/crackme/5ab77f5533c5d40ad448c251>
- **Plateforme** : Windows **PE32** GUI, **MASM32** — difficulté 2.0
- **Archive** : `original/crackme.zip` → `Crackme.exe` + `readme.txt`
- **Statut** : résolu (keygen), vérifié par **émulation Unicorn** des prédicats `cmul`/`cadd` (`0x40128a`, `0x4011f1`, `0x401231`)

## Solution

```
python3 tools/bratalarm-solve.py petik --check
petik -> 0000496D-00000CB6-006E4FE8-01D0C35A
```

| Nom | Serial (35 chars) |
|---|---|
| `petik` | **`0000496D-00000CB6-006E4FE8-01D0C35A`** |
| `box` | `00001EB6-00000FF0-FFF754D5-0080A5D0` |

Formule (complexes entiers 32 bits, `(a,b)*(c,d)=(ac-bd, ad+bc)` — hint dans le binaire) :

1. Sur `name+"\0"` : `S = Σ bytes`, `T = (S-1)*3` ; `h = 0x12345678` puis pour chaque octet `h ^= b ; rol32(h,5)` ; `R = h % 0x7a69`, `Q = (h // 0x7a69) & 0xfff` ;
2. `(A,B) = (S,T)+(R,Q)` ; `(C,D) = (S,T)*(R,Q)` ;
3. serial = `AAAAAAAA-BBBBBBBB-CCCCCCCC-DDDDDDDD` (`%08X`).

## Comment on trouve

1. Dialog : nom `0x3ea`, serial `0x3eb` longueur **0x23** ; parsing hex 4×8 via nulls aux offsets 8,17,26.
2. Hash nom + `div 0x7a69` → `(R,Q)` ; `(S,T)` avec `T=(S-1)*3`.
3. Boucle `ecx+=3`, `edx-=2` jusqu’à `ecx==0x4e21` : compare `z² + z·(A,B) + (C,D)` à `(z+(S,T))·(z+(R,Q))` (`0x4011f1` / `0x401231`).
4. Identité polynomiale ⇒ keygen unique `(A,B)=(S,T)+(R,Q)`, `(C,D)=(S,T)*(R,Q)`.

## Vérification

- Unicorn : `cmul(3,4)·(5,6)` → `(-9,38)` ; pour `petik`, `0x4011f1(z)` == `0x401231(z)` sur `z=(3,0x4e1f)`.
- Échantillon Python de la boucle (200 itérations) + contre-test serial altéré.
