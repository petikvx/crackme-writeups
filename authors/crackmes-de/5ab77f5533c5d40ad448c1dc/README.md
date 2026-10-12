# keygenning4newbies_crackme_3 by analyst (crackmes.de)

- **Page** : <https://crackmes.one/crackme/5ab77f5533c5d40ad448c1dc>
- **Plateforme** : Windows PE32 GUI, **MSVC 6** — difficulté 1.0
- **Archive** : `original/k4n3.zip` → `k4n3.exe` + `readme.txt`
- **Statut** : résolu (keygen), vérifié (prédicat Python + **hash Unicorn** `0x401080`)

## Solution

```
python3 tools/k4n3-solve.py petik            ->  A9OE24A8<7ªE;H27=?
python3 tools/k4n3-solve.py --check petik    ->  OK (hash unicorn == python)
```

Contraintes : **name** 1..64 ; **serial** exactement **18** caractères, chacun `>= '0'`.

1. `name' = name + " is a whore."` ; seed `ebx = 'eheh'` ; pour `i = 0..15` :
   `ebx ^= ROL7( dword_le(name', 4*i) + (TABLE[i] ^ i) )` (`TABLE` @ `0x405030`).
2. 18 fois : `stream[j] = alphabet[h % 26]` (`A..Z` @ `0x405128`) ;
   `h = lo32((h<<3)^2) + hi32((h<<3)^2)` (`imul` 32 bits signé).
3. Cible constante `EXPECTED = "KEYGENNING4NEWBIES"` @ `0x405114` :
   `serial[j] = chr( (stream[j] ^ j ^ EXPECTED[j]) + 0x30 )`.

## Comment on trouve

1. `diec` : MSVC 6. `readme.txt` : tables + « lame encryption », pas d’ASM ripping.
2. Check `0x401160` : `GetDlgItemText` name (`0x3E8`) / serial (`0x3E9`) ; gate longueur `(len*12)+0xCD == 0x1A5` → **18**.
3. Hash `0x401080` (suffixe + table + `rol 7`) ; génération / xor / compare `0x401257..0x4012c0` vs `KEYGENNING4NEWBIES`.
4. Succès → MessageBox « Wow you did it... ».

## Vérification

- `tools/k4n3-solve.py --check` : prédicat inverse + égalité du hash Python avec Unicorn sur `0x401080` ; serial `0*18` échoue.
