# ss1ned — My first crackme

| | |
|---|---|
| **ID** | [`644af68433c5d43938912c6b`](https://crackmes.one/crackme/644af68433c5d43938912c6b) |
| **Auteur** | ss1ned |
| **Plateforme** | Linux ELF64 PIE, C, non strippé |
| **SHA-256** | `fef8835c45b964039ce526d54d3f88a8022e48f891414e8e546001bd02936c1c` |

Voir [`ORIGIN.yml`](ORIGIN.yml).

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/crackme` | binaire d'origine |
| `tools/myfirst-solve.py` | recalcule le vrai mot de passe (`-q`, `--check`) |

## Réponse

**Mot de passe : `Password`** — **pas** `P@ssword` (la chaîne visible dans `strings`, qui est un leurre).

```bash
echo Password | ./original/crackme      # Welcome!
python3 tools/myfirst-solve.py --check
```

## Premier regard

`strings` : `P@ssword`, `Enter password:`, `Go away!`, `Welcome!`. Saisir `P@ssword` tel quel échoue (« Go away! ») : le binaire modifie sa propre copie avant de comparer.

## Flow

`main` @ `0x11c9` : `strncpy(buf1, pass, 9)` (copie la variable globale `pass`, qui pointe vers `"P@ssword"`) ; **puis écrase `buf1[1]`** avec l'octet `0x61` (`'a'`) ; `fgets(buf2, 9, stdin)` ; `strcmp(buf1, buf2)` → « Welcome! » si égal, sinon « Go away! ».

## Comment on trouve

**Ancrage** : `objdump -d -M intel --no-show-raw-insn original/crackme | awk '/<main>:/,/ret/'`.

```asm
1343: mov rcx,[rip+0x2cc6]   # 4010 <pass>       ; pass = pointeur vers "P@ssword"
1354: call strncpy           ; buf1 = strncpy(buf1, pass, 9)  -> "P@ssword\0"
135d: mov BYTE PTR [rax+0x1],0x61    ; buf1[1] = 'a'   <-- le piège
1380: call fgets             ; buf2 = saisie
1393: call strcmp            ; strcmp(buf2, buf1)
```

`buf1` vaut `"P@ssword"` juste après le `strncpy`, mais l'instruction suivante remplace le caractère d'indice 1 (`'@'`, `0x40`) par `'a'` (`0x61`) **avant** toute lecture au clavier. La comparaison se fait donc contre `"Password"`, jamais contre `"P@ssword"`.

## Vérification

```text
$ echo Password  | ./crackme   -> Welcome!
$ echo P@ssword  | ./crackme   -> Go away!
$ echo password  | ./crackme   -> Go away!
```

## Notes

- Reverse statique + essais live ; pas de GDB.
