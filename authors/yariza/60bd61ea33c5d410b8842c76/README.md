# Yariza — Yariza Crackme #2

| | |
|---|---|
| **ID** | [`60bd61ea33c5d410b8842c76`](https://crackmes.one/crackme/60bd61ea33c5d410b8842c76) |
| **Auteur** | yariza |
| **Plateforme** | Linux ELF64 PIE, C, non strippé (`check_password`, `stringCompare`) |
| **SHA-256** | `4f4585f7d692335e9c78c2df9d21a4c10a54a6d5ca1659a354b8e7064a43ac3b` |

Voir [`ORIGIN.yml`](ORIGIN.yml).

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/crackme` | binaire d'origine |
| `tools/yariza2-solve.py` | lit le mot de passe (`-q`, `--check`) |

## Réponse

**Mot de passe : `super_secret_pass_56178`**

```bash
./original/crackme super_secret_pass_56178    # Good job! Checking password..
python3 tools/yariza2-solve.py --check
```

## Premier regard

`strings` : `Usage: %s <password>`, `Checking password..`, `Wrong password, try again!`, et un script shell `for value in Good job!; do printf $value; printf ' '; sleep 1 ; done;` passé à `system()`. Symboles `check_password`, `stringCompare`.

## Flow

`main` @ `0x1205` : exige `argv[1]` ; `check_password(argv[1])` @ `0x1155` : construit la constante sur la pile, `stringCompare` ; égal → `system(script d'affichage)`, sinon → « Wrong password, try again! ».

## Comment on trouve

**Ancrage** : `objdump -d -M intel --no-show-raw-insn original/crackme | awk '/<check_password>:/,/ret/'`.

```asm
1161: mov BYTE PTR [rbp-0x20],0x73   ; 's'
1165: mov BYTE PTR [rbp-0x1f],0x75   ; 'u'
...                                  ; (23 octets au total, un mov par caractère)
11b9: mov BYTE PTR [rbp-0xa],0x38    ; '8'
11d0: call stringCompare             ; stringCompare(argv[1], constante)
11ea: call system                    ; si égal : script d'affichage
```

Décodage des 23 octets : `73 75 70 65 72 5f 73 65 63 72 65 74 5f 70 61 73 73 5f 35 36 31 37 38` → **`super_secret_pass_56178`**.

## Vérification

```text
$ ./crackme super_secret_pass_56178   -> Good job! Checking password..
$ ./crackme wrong                      -> Wrong password, try again!
```

## Notes

- Reverse statique + essais live ; pas de GDB.
