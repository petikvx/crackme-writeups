# Mazzotti's Getting started patch-me

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/6a6ef28bdf981859694943d5) · id `6a6ef28bdf981859694943d5`

Crackme **Linux** ELF64 PIE — intro au **patch**.  
Auteur site : **Mazzotti**. Difficulty **1.4** · quality **4.7**.

Dossier : `authors/mazzotti/6a6ef28bdf981859694943d5/` — [série auteur](../README.md) · [repo](../../../README.md).

| Fichier | Rôle |
|---|---|
| [`original/getting_started_patchme`](original/getting_started_patchme) | ELF64 d’origine |
| [`analysis/getting_started_patched`](analysis/getting_started_patched) | `eb`→`je` |
| [`tools/patchme-solve.py`](tools/patchme-solve.py) | serial + patcher |

## Réponse

| | |
|---|---|
| Patch | `eb 32` → `74 32` @ offset `0x1154` |
| Serial | **`251949`** (`n%123==45` et `n%2137==1920`) |
| Message | **`Good job patcher! :3`** |

```bash
python3 tools/patchme-solve.py --check
# patched=…/getting_started_patched
# Good job patcher! :3
# OK
```

Sans patch, même le bon serial affiche `You suck bro. What is this?`.

---

## 1. Premier regard

```text
ELF 64-bit LSB pie, stripped
sha256 75474ed0a59dd35b6e2ce5f974097c29cb464c5937c6a9702bf96439049e09f7
```

---

## 2. Flow

1. `cin >> int`  
2. Appel check @ `0x1320` → `al`  
3. `test al, al` puis **`jmp` inconditionnel** vers le fail  
4. Le chemin « Good job » est du code mort  

---

## 3. Prédicat + patch

Check (si on n’est pas `0x43`) :

```text
n % 123 == 45  &&  n % 2137 == 1920
→ n = 251949
```

Bug / exercice :

```asm
1152: test al, al
1154: eb 32                 ; jmp always → You suck
1156: … Good job …         ; never reached
1188: … You suck …
```

Patch minimal : **`eb` → `74`** (`je` fail si `al==0`).

---

## 4. Vérification

```bash
python3 tools/patchme-solve.py -q   # 251949
printf '251949\n' | ./analysis/getting_started_patched
```

---

## 5. Notes

- Variante possible : NOP le `jmp` → toujours success (moins pédagogique).  
- Suite Mazzotti dans la liste : Multi-layer password check.
