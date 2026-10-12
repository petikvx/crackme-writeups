# drpepur_6 by drpepur (crackmes.de)

- **Page** : <https://crackmes.one/crackme/5ab77f5533c5d40ad448c1fa>
- **Plateforme** : Windows **PE32** GUI, **MASM32** — difficulté 1.0
- **Archive** : `original/DrPepUr_6.zip` → `DrPepUr_6.exe` + `txt Rules.txt`
- **Statut** : résolu (keygen), vérifié par **émulation Unicorn** de `0x4012c2` (MessageBoxA « Success »)

## Solution

```
python3 tools/drpepur-6-solve.py --check
AA7NE3JT7Q
```

| X | A | Serial (10 chars) |
|---|---|---|
| 1 | 1 | **`AA7NE3JT7Q`** |
| 2 | 1 | `BA5CT6CQ6C` |
| 0 | 0 | `@@5MM5MM5M` |

Serial **seul** (pas de champ nom) : longueur ≥ 3, formule sur 10 octets.

Avec `X = s[0]-0x40`, `A = s[1]-0x40`, pour `k = 1..8` :

```
expect = round(sin(A*(k*X+1)) * mul) + add
```

| k | mul | add | alphabet |
|---|---|---|---|
| 1,4,7 | 2 | +4 | chiffre (`'1'+v`) |
| 2,3,5,6,8 | 10 | +12 | lettre (`'A'+v`) |

`round` ≈ `fistp` FPU (nearest). Fin de check : compteur interne `== 8` ⇒ `9c²+144c-0x18c0 == 0`.

## Comment on trouve

1. Dialog `0x65` : bouton `0x3eb` lit l’edit `0x3e9` (`GetDlgItemTextA`) dans `0x403588`.
2. Routine `0x4012c2` : décode `X`/`A`, puis 8 prédicats `fild` → **`fsin`** (`0x401799`) → `fmul` 2.0 / 10.0 → `fistp` (`0x4017a7`) + constante, comparés aux chars suivants.
3. Boucles internes (compteurs `ebp-8`…`esi`) rejouent les mises à jour d’état ; si tout passe, `MessageBoxA` « Success » / « Nice work… ».
4. `edi` sert de scratch pour `X` (dans l’émulation : `0x4035ec`).

## Vérification

```
python3 tools/drpepur-6-solve.py --check AA7NE3JT7Q
# static True / unicorn True
```

Unicorn charge `.text`/`.data`, place le serial à `0x403588`, hook le thunk MessageBoxA `0x4017dc` et confirme la caption `Success`.
