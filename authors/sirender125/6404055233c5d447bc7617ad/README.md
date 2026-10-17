# SirEnder125 — RegistrationCrackme

| | |
|---|---|
| **ID** | [`6404055233c5d447bc7617ad`](https://crackmes.one/crackme/6404055233c5d447bc7617ad) |
| **Auteur** | SirEnder125 |
| **Plateforme** | Linux ELF64 PIE, C, non strippé (`validate`) |
| **SHA-256** | `d5de6f3b9647a80eec1c0ccf126fac911f70e321dc232c40df8fde469f14b262` |

Voir [`ORIGIN.yml`](ORIGIN.yml).

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/crackme1` | binaire d'origine |
| `tools/registration-solve.py` | fournit une clé valide (`-q`, `--check`) |

## Réponse

Pas de clé unique : toute chaîne (même vide) composée **uniquement** des caractères de `cdelmnpstvwz0912` (insensible à la casse) est acceptée.

**Exception à la convention `petik` du dépôt** : les lettres `i` et `k` de `petik` ne font pas partie du jeu accepté. Clé d'exemple la plus proche : **`pet0912`**.

```bash
echo pet0912 | ./original/crackme1               # Registration successful!
echo cdelmnpstvwz0912 | ./original/crackme1      # Registration successful! (tout l'alphabet accepté)
python3 tools/registration-solve.py --check
```

## Premier regard

`strings` : la chaîne `cdelmnpstvwz0912` saute aux yeux juste avant `Enter a valid registration key: `. Un essai rapide (`echo test`) **réussit** déjà : ce n'est pas un mot de passe précis.

## Flow

`main` : `scanf("%s")`, `validate(buf)`, non nul → « Registration successful! », sinon « Invalid registration key provided! ».

## Comment on trouve

**Ancrage** : `objdump -d -M intel --no-show-raw-insn original/crackme1 | awk '/<validate>:/,/ret/'`.

```asm
12d8: movsx eax,al ; mov edi,eax ; call tolower      ; c = tolower(s[i])
12e4: mov rax,[rip+0x2d25]   # 0x4010 <accepted>      ; "cdelmnpstvwz0912"
12f0: call strchr                                      ; strchr(accepted, c)
12f5: test rax,rax ; jne 1301                          ; trouvé -> continue, sinon -> return 0
131c: mov eax,1                                        ; tous les caractères acceptés -> return 1
```

Donc `validate` ne vérifie **rien d'autre** qu'un jeu de caractères. Piège : perdre du temps à chercher une clé « correcte » précise alors que l'alphabet lui-même (`cdelmnpstvwz0912`) est déjà une clé valide.

## Vérification

```text
$ echo pet0912            | ./crackme1   -> Registration successful!
$ echo cdelmnpstvwz0912   | ./crackme1   -> Registration successful!
$ echo a                  | ./crackme1   -> Invalid registration key provided!
```

## Notes

- Reverse statique + essais live ; pas de GDB.
