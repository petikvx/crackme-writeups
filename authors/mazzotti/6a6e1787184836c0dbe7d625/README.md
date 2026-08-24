# Mazzotti's Multi-layer password check

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/6a6e1787184836c0dbe7d625) · id `6a6e1787184836c0dbe7d625`

Crackme **Linux** ELF64 PIE — 6 mots de passe empilés.  
Auteur site : **Mazzotti**. Difficulty **1.8** · quality **5.0**.

Dossier : `authors/mazzotti/6a6e1787184836c0dbe7d625/` — [série auteur](../README.md) · [repo](../../../README.md).

| Fichier | Rôle |
|---|---|
| [`original/crackme`](original/crackme) | ELF64 |
| [`tools/multilayer-solve.py`](tools/multilayer-solve.py) | génère les 6 strings |

## Réponse

6 lignes = **`MAZZ`** répété **3, 7, 12, 1, 15, 7** fois :

| # | Répétitions | Longueur | Début |
|---|---|---|---|
| 0 | 3 | 12 | `MAZZMAZZMAZZ` |
| 1 | 7 | 28 | `MAZZMAZZMAZZMAZZ…` |
| 2 | 12 | 48 | … |
| 3 | 1 | 4 | `MAZZ` |
| 4 | 15 | 60 | … |
| 5 | 7 | 28 | … |

```bash
python3 tools/multilayer-solve.py --check
# … Good job. Hmmmm. :3
# OK
```

---

## 1. Premier regard

```text
ELF 64-bit LSB pie, stripped ; ptrace import
sha256 33d5625c4fc89888e5813540a3b5fef7a8daaf77701114f4b261618fcd9d1bda
```

Banner : *enter 6 correct strings (without any spaces)*.

---

## 2. Flow

1. `ptrace(PTRACE_TRACEME)` → message GDB si déjà tracé  
2. Boucle `i = 0..5` : prompt + `cin >> string`  
3. Vérifie chaque string par blocs de 4 = `M A Z Z` (`0x4d 0x41 0x5a 0x5a`) et longueur = `4 * reps[i]`  
4. Les 6 OK → `Good job. Hmmmm. :3`

---

## 3. Prédicat

```python
reps = [3, 7, 12, 1, 15, 7]
passwords = ["MAZZ" * n for n in reps]
```

---

## 4. Vérification

```bash
python3 tools/multilayer-solve.py -q | ./original/crackme
```

---

## 5. Notes

- Anti-debug soft : lancer hors gdb.  
- Suite de Getting started patch-me (même auteur).
