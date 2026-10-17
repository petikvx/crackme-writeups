# 0xtamsee1 — revv

| | |
|---|---|
| **ID** | [`60fc687b33c5d42814fb34e0`](https://crackmes.one/crackme/60fc687b33c5d42814fb34e0) |
| **Auteur** | 0xtamsee1 |
| **Plateforme** | Linux ELF64 PIE, C, **strippé** |
| **SHA-256** | `bf26eea99ab57eb148ba76ff3ff6afb47cc440c31feab8d4c62a186cd1e98fbb` |

Voir [`ORIGIN.yml`](ORIGIN.yml).

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/revv` | binaire d'origine |
| `tools/revv-solve.py` | relit les 21 comparaisons `cmp al,imm8` dans le code (`-q`, `--check`) |

## Réponse

**Mot de passe : `ACTF{N01ce_R3v3r51^g}`** (21 caractères)

```bash
printf 'ACTF{N01ce_R3v3r51^g}\n' | ./original/revv     # Nice job! :)
python3 tools/revv-solve.py --check
```

## Premier regard

Binaire strippé (`nm` : no symbols). `strings` ne montre que des fragments d'opcodes (`<_uwH`, `<3uhH`…) : ce sont des octets `cmp al, imm8` collés à l'octet suivant, pas des chaînes. Messages lisibles : `Enter the Password: `, `%30s`, `Length mismatch! :(`, `Nice job! :)`, `Come on, Try Again!! :(`.

## Flow

Binaire strippé : `main` retrouvé via le `lea rdi,[rip+…]` de l'entry point (`0x13ba`). `main` : `scanf("%30s")`, appelle `check` (@ `0x11c9`) : `strlen == 0x15` (21) sinon « Length mismatch! » ; puis 21 comparaisons `cmp al, imm8` sur `pw[0..20]`, **dans un ordre non linéaire** (pw[0x11] est testé avant pw[0], etc.) ; toutes vraies → « Nice job! :) ».

## Comment on trouve

**Ancrage** : adresse de `check` retrouvée via le `call` dans `main` ; `objdump -d -M intel --no-show-raw-insn original/revv --start-address=0x11c9 --stop-address=0x13ba`.

```asm
1223: add  rax,0x11 ; movzx eax,[rax] ; cmp al,0x31   ; pw[0x11] == '1'
1236: movzx eax,[rax]                 ; cmp al,0x41   ; pw[0]    == 'A'   (pas d'add : offset 0)
1245: add  rax,0x1  ; ...             ; cmp al,0x43   ; pw[1]    == 'C'
...                                                     ; (21 blocs similaires, un par position)
```

Chaque bloc copie `[rbp-8]` (pointeur vers la saisie), ajoute un décalage fixe, puis compare un octet. Le solveur extrait automatiquement toutes les paires `(décalage, octet attendu)` par expression régulière sur le code machine et reconstruit la chaîne : **`ACTF{N01ce_R3v3r51^g}`**.

Piège rencontré en écrivant le solveur : le décalage `0x0a` (10) correspond à l'octet `\n`, que `.` en regex Python ne capture **pas** par défaut (sans `re.DOTALL`) — un bloc entier (celui du `_`, position 10) était silencieusement ignoré jusqu'à l'ajout du drapeau.

## Vérification

```text
$ printf 'ACTF{N01ce_R3v3r51^g}\n' | ./revv   -> Nice job! :)
$ printf 'ACTF{N01ce_R3v3r51^g\n'  | ./revv   -> Length mismatch! :(   (20 car.)
$ printf '%s\n' "$(python3 -c 'print(\"A\"*21)')" | ./revv -> Come on, Try Again!! :(
```

## Notes

- Reverse statique (adresses calculées, pas de symboles) + essais live ; pas de GDB.
- L'ordre des comparaisons dans le binaire est volontairement mélangé (pas un piège de contenu, juste de lecture).
