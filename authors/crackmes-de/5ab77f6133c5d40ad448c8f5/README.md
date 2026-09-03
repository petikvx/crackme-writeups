# stigger (stigger’s crackme #1)

> [crackmes.one](https://crackmes.one/crackme/5ab77f6133c5d40ad448c8f5) · Keygenme MASM32 — self-load + patch runtime.

| Fichier | Rôle |
|---|---|
| [`original/_u/crackme.exe`](original/_u/crackme.exe) | challenge |
| [`original/_u/info.txt`](original/_u/info.txt) | consignes |
| [`tools/stigger-solve.py`](tools/stigger-solve.py) | keygen |

## Réponse

| Name | Serial |
|---|---|
| **`petik`** | **`AAAAAYKKUN`** |

```bash
python3 tools/stigger-solve.py -q
# preuve : lancer depuis original/_u (CreateFile "crackme.exe")
cd original/_u && WINEDEBUG=-all wine crackme.exe
```

## Flow

1. `CreateFile("crackme.exe")` → buffer heap ; **`call buffer+0x557`** applique des patches (nags + **constants de l’algo**).
2. `DialogBox` avec DialogProc = copie patchée.
3. Nags `trial!` / `kill me!` (à patcher aussi selon l’auteur).

## Prédicat (après patch)

```text
buf[i]  = (name[i] ^ 0xFA) + i - 0x52
buf[n+j]= (buf[j] ^ 0x133) - 0x22
normalise chaque octet dans 'A'..'Z' (±16)
sum = Σ name + Σ buf[n:]
expected = sum * 0x666          # imul (plus add/xor 0x666)
serial[n:] doit matcher buf[n:]  # préfixe n chars ignoré (souvent 'A'*n)
```

Sur disque (avant patch) : xor `0xCC` / `0x256` et `(sum+0x666)^0x666` — **ce n’est pas** l’algo live.

## Vérification

Wine (`cwd=original/_u`) : `petik` / `AAAAAYKKUN` → **`good w0rk!`** (puis nag `kill me!`).

## Notes

- Lancer hors du dossier du PE → `CreateFile` échoue → crash `@call buffer+0x557`.
- Objectif auteur : patcher les nags + keygen.
