# nts_crackme9 — cyclops (crackmes.de)

- Page : https://crackmes.one/crackme/5ab77f5433c5d40ad448c158
- Plateforme : Windows PE32 GUI (MSVC 6 / MFC 4.2), non packé
- Difficulté : 2.0 — type **keygen** (le nom n'entre pas dans le calcul)

## Solution

Le nom doit juste être non vide. Le serial fait 24 caractères : un préfixe libre de 8 caractères `P`, suivi du hash. Pour l'exemple `petik` avec `P = petik000` :

```
petik00083A0BD58A9631228
```

Keygen : `python3 tools/crackmes-de-nts_crackme9-solve.py petik000`

Formule : `serial = P + MD5_even(P + "Cyclops / REAL")`, où `MD5_even` formate en `%02X` les octets d'indice pair (0,2,…,14) du digest MD5.

## Comment on trouve

1. **Repérage.** Chaîne `Serial is Correct!!!`, format `%02X`, constante `Cyclops / REAL`, et `sscanf` avec `%8s`. Init MD5 visible (`0x67452301`, `0xefcdab89`, …).
2. **Handler (`0x402050`).** `GetDlgItemText` nom (id `0x3e8`) et serial (id `0x3e9`, max 0x19). Les deux doivent être non vides.
3. **Construction de l'entrée du hash.** `sscanf(serial, "%8s", buf)` lit le préfixe `P` (8 caractères). Juste après, un `strcpy` de la constante `"Cyclops / REAL"` atterrit **par-dessus la fin de ce buffer** (les arguments de `sscanf` ne sont pas encore dépilés, ce qui décale les `lea`). L'entrée effective du MD5 devient donc la concaténation `P + "Cyclops / REAL"`.
4. **`0x401dd0`.** MD5 classique (init / update / final), puis boucle `ebx = 0,2,…,14` : `sprintf("%02X")` de chaque octet pair du digest, concaténé → 16 hex.
5. **Comparaison.** `strcmp` entre ce hash 16 caractères et `serial + 8` (la queue du serial). D'où `serial = P ‖ MD5_even(P + "Cyclops / REAL")` (24 caractères, pile dans la limite de 25).

## Vérification

Dialogue MFC non piloté en headless. `tools/crackmes-de-nts_crackme9-emu.py` exécute **le vrai handler `0x402050`** sous Unicorn (MD5 du binaire compris), en simulant `GetDlgItemText`, `sscanf`, `sprintf` et `MessageBox`. Résultat (`analysis/emu-petik.txt`) : `Serial is Correct!!!` pour `petik` / `petik00083A0BD58A9631228`, et `KO` avec un serial faux.
