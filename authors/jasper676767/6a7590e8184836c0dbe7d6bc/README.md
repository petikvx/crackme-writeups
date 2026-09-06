# Jasper676767's I forgot my password!!!!

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/6a7590e8184836c0dbe7d6bc) · id `6a7590e8184836c0dbe7d6bc`

Crackme **Linux** ELF64 PIE, C++, **non stripé** (beaucoup de leurres).  
Auteur site : **Jasper676767**. Difficulty **2.8** · quality **4.2**.

Dossier : `authors/jasper676767/6a7590e8184836c0dbe7d6bc/` — [série auteur](../README.md) · [repo](../../../README.md).

| Fichier | Rôle |
|---|---|
| [`original/myFirstCrackme`](original/myFirstCrackme) | ELF64 PIE |
| [`tools/forgot-password-solve.py`](tools/forgot-password-solve.py) | numéro + flag |

## Réponse

| | |
|---|---|
| Activation | **`6968271`** |
| Flag | **`FLAG{Yeah_You_Should_Start_Forgetting_Your_Password_But_St1ll_3nj0y_t0uching_t1ings_that_@re_nice_to_touch}`** |

```bash
python3 tools/forgot-password-solve.py -q
# 6968271

printf '6968271\n' | ./original/myFirstCrackme
# Yes correct number...
# … FLAG{Yeah_You_Should_Start_Forgetting_Your_Password_…}
```

---

## 1. Premier regard

```text
ELF 64-bit LSB pie, not stripped
sha256 ef99339f02df965ae5eabbf14011d2c4acc09abea16e7a817c617c9a88cc608a
```

Symbole clé : `verify_number`, `generate_reference`, `process_target`, plein de `fake_*`.

---

## 2. Flow

1. Banner + `cin >> long` (activation)  
2. `dispatch_validation` → `fake_security_check` (toujours vrai) → `verify_number`  
3. Si OK → `process_target` déchiffre / affiche le FLAG caractère par caractère  

---

## 3. Prédicat

```text
verify_number(x):
  ref  = generate_reference()   # depuis "Awp2AmL3" + transforms + stoll
  return mix(ref) == mix(x)
```

`mix_number` / `indirect_mix` : même fonction des deux côtés → il suffit que **`x == ref`**.

`useless_math` est l’identité (double XOR + add/sub qui s’annulent).

Valeur (gdb `finish` sur `generate_reference`) : **`6968271`** (`0x6a53cf`).

Littéral de départ dans `.rodata` : `Awp2AmL3`.

---


## Debug GDB (pas à pas)

ELF64 **PIE** C++, non strippé. Entry file `0x34c0`, `main` `0x33f0`, `generate_reference` `0x39e0`, `verify_number` `0x3e90`.

```bash
export DEBUGINFOD_URLS=
gdb -nx -q ./original/myFirstCrackme
(gdb) set debuginfod enabled off
(gdb) break generate_reference
(gdb) run
(gdb) finish
(gdb) print $rax
# → 6968271 (0x6a53cf)
(gdb) break verify_number
```

Offsets PIE : ajouter la base (`info proc mappings`, zone r-xp du binaire).

`solution_summary` : activation `6968271` (=generate_reference) ; FLAG forgetting/password….

## 4. Vérification

```bash
python3 tools/forgot-password-solve.py --check
# … FLAG{Yeah_You_Should_…}
# OK
```

---

## 5. Notes

- Bruit volontaire (`fake_hash`, `suspicious_function_…`, messages « self touch »).  
- Même auteur que Red light (déjà solved).
