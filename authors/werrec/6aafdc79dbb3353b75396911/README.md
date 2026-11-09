# werrec's Retro OEM License Check

| | |
|---|---|
| **ID** | [`6aafdc79dbb3353b75396911`](https://crackmes.one/crackme/6aafdc79dbb3353b75396911) ([`ORIGIN.yml`](ORIGIN.yml)) |
| **Auteur** | werrec |
| **Plateforme** | Windows PE64 console (MinGW-w64 GCC 16.1, stripped) |
| **SHA-256** | `010619f204753bffc0734cfee115cde94b795ec8bee8c04d3b128ddfef7e21c9` |

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/crackme_02.exe` | binaire d'origine (non modifié) |
| `tools/werrec-oem-solve.py` | keygen / `--check` du prédicat |

## Réponse

Format `AAAAA-OEM-DDDDDDD-BBBBB` (pas de username : le serial ne dépend de rien d'autre que de lui-même).

| Serial | Résultat live |
|---|---|
| `0000Z-OEM-1234560-77776` | `Correct! FLAG{OEM_KEYS_NEVER_DIE}` |
| `FY8N3-OEM-1234560-M5FUA` (`--seed 3`) | idem |
| `0000Z-OEM-1234560-7777Z` (dernier bloc faux) | `Invalid serial. Access denied.` |
| `FLAG0-OEM-1337133-HAHA1` | `Nice try. That string is bait.` |

```bash
python3 tools/werrec-oem-solve.py            # serial = 0000Z-OEM-1234560-77776
python3 tools/werrec-oem-solve.py -q --seed 3
python3 tools/werrec-oem-solve.py --check FY8N3-OEM-1234560-M5FUA
echo 0000Z-OEM-1234560-77776 | xvfb-run -a wine original/crackme_02.exe
```

## Premier regard

- `file` : PE32+ console x86-64 ; `diec` ne reconnaît rien (MinGW, pas de packer).
- `strings` : `FLAG{easy_win_haha}` et `FLAG0-OEM-1337133-HAHA1` (leurres, le second est même testé à part), bannière ASCII `XXXXX-OEM-XXXXXXX-XXXXX`.
  Les messages (succès / échec / bait) ne sont pas en clair : ils sont masqués en `.rdata` (octets ~0xA7 xorés) et décodés à l'exécution.
- Lancé sous Wine, le programme affiche une bannière en dégradé ANSI, `serial >`, lit une ligne sur stdin.

## Flow

`main` (0x14000247c) : lit la ligne (fgets via 0x1400040f8, 0x40 octets) → `0x140002365` retire `\r\n` finaux → `0x1400023d4` (compare à la chaîne leurre `FLAG0-OEM-1337133-HAHA1` → « bait ») → `0x1400022f2` (validation) → message succès / échec.

## Comment on trouve le prédicat

Ancrage : `objdump -d -M intel original/crackme_02.exe` ; la validation `0x1400022f2` enchaîne quatre sous-fonctions, toutes obligatoires.

1. **`0x140002072` — format.** `strlen == 0x17` (23) ; `s[5]=s[9]=s[17]='-'` ; `s[6..8]=="OEM"` ; `s[0..4]` et `s[18..22]` passent `0x140001fb3` (`0-9` ou `A-Z` : **majuscules uniquement**) ; `s[10..16]` sont des chiffres (`cmp al,0x2f / 0x39`).
2. **`0x1400021b4` — XOR.** XOR des 5 premiers octets `== 0x5a` (`xor BYTE PTR [rbp-1],al` ... `cmp ...,0x5a`).
3. **`0x1400021fa` — somme.** Somme de `s[i]-'0'` pour i=10..16, puis `% 7 == 0` (le `imul 0x92492493` est la division magique par 7).
4. **`0x14000226f` — checksum final.** Pour i=0..4 : `v = val(s[i])` (`0x140001fe7` : `0-9→0-9`, `A-Z→10-35`, sinon -1) ; on compare `s[18+i]` à `enc(v+7)` (`0x14000201f`) :
   `x % 36` (division magique `0x38e38e39`), puis `+0x30` si <10 sinon `+0x37` (→ `A-Z`).

Assemblage : on choisit 4 caractères libres, le 5ᵉ = `0x5a ^ XOR(4 premiers)` (doit rester alnum). Exemple `0000Z` : `0x30^0x30^0x30^0x30 = 0`, `0x5a = 'Z'` ✓. Les 7 chiffres : n'importe quels dont la somme est multiple de 7 (`1234560` → 21). Dernier bloc : `0→7`, `Z(35)→(35+7)%36=6`, d'où `77776`.

Pièges : le serial « évident » `FLAG0-OEM-1337133-HAHA1` est un leurre explicite ; les chaînes de réponse sont masquées donc `strings` n'aide pas ; sortie console pleine de séquences ANSI (filtrer avec `sed 's/\x1b\[[0-9;]*m//g'`).

## Debug GDB

Non utilisé : reverse statique (`objdump`) + preuve live sous Wine.

## Vérification

```text
$ echo 0000Z-OEM-1234560-77776 | xvfb-run -a wine original/crackme_02.exe   → Correct! FLAG{OEM_KEYS_NEVER_DIE}
$ echo FY8N3-OEM-1234560-M5FUA | ...                                         → Correct! FLAG{OEM_KEYS_NEVER_DIE}
$ echo 0000Z-OEM-1234560-7777Z | ...                                         → Invalid serial. Access denied.
$ echo FLAG0-OEM-1337133-HAHA1 | ...                                         → Nice try. That string is bait.
```

## Notes

- Pas de lien avec un nom d'utilisateur ; `petik` n'est donc pas applicable.
- Le binaire d'origine n'a pas été modifié.
