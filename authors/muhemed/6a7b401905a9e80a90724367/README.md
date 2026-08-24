# muhemed's muhemed crackme

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/6a7b401905a9e80a90724367) · id `6a7b401905a9e80a90724367`

Crackme **Linux** ELF64 PIE, **C**, avec debug info (non stripped).  
Auteur site : **muhemed**. Difficulty **1.0** · quality **3.0**.

Dossier : `authors/muhemed/6a7b401905a9e80a90724367/` — [série auteur](../README.md) · [repo](../../../README.md).

| Fichier | Rôle |
|---|---|
| [`original/crackme`](original/crackme) | ELF64 PIE |
| [`tools/muhemed-solve.py`](tools/muhemed-solve.py) | extrait / vérifie le password |

## Réponse

| | |
|---|---|
| Password | **`wvohXN8X7C14jrq1F*!j`** |

```bash
python3 tools/muhemed-solve.py -q
# wvohXN8X7C14jrq1F*!j

printf '%s\n' 'wvohXN8X7C14jrq1F*!j' | ./original/crackme
# … you are cracked program good boy
```

---

## 1. Premier regard

```text
ELF 64-bit LSB pie executable, x86-64, with debug_info, not stripped
sha256 8ade4ef11ff499fc504854ebcc18940774a461da9024b542248c83a74c96c8c1
```

Banner `CRACKME 0.1v by muhemmed`, prompts `enter the password:`,  
succès `you are cracked program good boy`, échec `nope you are bad boy` (boucle).

---

## 2. Flow

1. Affiche le banner
2. `scanf("%s")` dans un buffer local
3. `strcmp(input, expected)` — `expected` construit sur la stack
4. OK → message + exit ; KO → message + re-prompt

---

## 3. Prédicat

Dans `main`, le password est poussé via immediates little-endian :

```asm
movabs rax, 0x58384e58686f7677   ; "wvohXN8X"
movabs rdx, 0x3171726a34314337   ; "7C14jrq1"
mov    QWORD [rbp-0xd0], 0x6a212a46 ; "F*!j"
```

→ **`wvohXN8X7C14jrq1F*!j`** (20 caractères), puis `strcmp`.

---

## 4. Vérification

```bash
python3 tools/muhemed-solve.py --check 'wvohXN8X7C14jrq1F*!j'
# check=OK …
```

---

## 5. Notes

- Difficulty 1.0 : strcmp en clair, binaire non stripé — ideal warm-up.
- Boucle infinie sur mauvais password (pas de limite d’essais).
