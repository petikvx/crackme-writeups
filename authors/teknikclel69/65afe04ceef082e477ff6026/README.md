# Teknikclel69's silly

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/65afe04ceef082e477ff6026) · id `65afe04ceef082e477ff6026`

Crackme **ELF32** Linux, NASM, **statique**, non strippé.  
Auteur site : **Teknikclel69**.

| Fichier | Rôle |
|---|---|
| [`original/main`](original/main) | binaire |
| [`tools/silly-solve.py`](tools/silly-solve.py) | password |
| [`analysis/ok.txt`](analysis/ok.txt) | preuve strace |

## Réponse

| Input | Valeur |
|---|---|
| Password | **`chicken baguette`** (+ `\n`) |

```bash
python3 tools/silly-solve.py -q
# chicken baguette

printf 'chicken baguette\n' | strace -e write ./original/main
# write(0, "you did the thing\n", 18)
```

---

## Analyse

1. `trole` patch le buffer `lmao` initialement **`chinese baguette\n`** : indices 3–6 → **`cken`** ⇒ **`chicken baguette\n`**.
2. `sys_read` (eax=3) lit **0x11** octets dans `string`.
3. `repe cmpsb` vs `lmao` ; égal → `congratulation`.

Piège « silly » : les `sys_write` utilisent **`ebx=0`** (stdin) au lieu de 1 → pas de sortie visible sur un pipe ; `strace` confirme le message.

Hashes : voir `ORIGIN.yml`. Site : difficulty **1.5** · quality **4.8**.
