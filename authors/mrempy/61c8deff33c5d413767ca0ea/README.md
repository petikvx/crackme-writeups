# MrEmpy — TryCrackMe

| | |
|---|---|
| **ID** | [`61c8deff33c5d413767ca0ea`](https://crackmes.one/crackme/61c8deff33c5d413767ca0ea) |
| **Auteur** | MrEmpy |
| **Plateforme** | Linux ELF64 PIE, C, non strippé |
| **SHA-256** | `7cc03dd6271b07a379f7e7f88560f18d77fb2087edeb7408a3039453c0fc79e0` |

Voir [`ORIGIN.yml`](ORIGIN.yml).

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/trycrackme` | binaire d'origine |
| `tools/trycrackme-solve.py` | calcule la clé (`-q`, `--check`) |

## Réponse

**Clé : `34407373373234353336`** (= l'encodage hexadécimal de `4@ss724536`)

```bash
echo 34407373373234353336 | ./original/trycrackme     # [+] Correct key!
python3 tools/trycrackme-solve.py --check
```

## Premier regard

`strings` : `Put the key: `, `%02x`, `[-] Incorrect key!`, `[+] Correct key!`, imports `sprintf`, `strncmp`. Le format `%02x` est l'indice : le secret est encodé en hexadécimal avant comparaison.

## Flow

`main` @ `0x11af` : secret interne de 10 octets, converti caractère par caractère en 2 chiffres hexadécimaux (`sprintf(dst, "%02x", c)`), concaténés ; `scanf("%s")` lit la saisie ; `strncmp` avec la chaîne hex construite.

## Comment on trouve

**Ancrage** : `objdump -d -M intel --no-show-raw-insn original/trycrackme | awk '/<main>:/,/ret/'`.

```asm
11d6: movabs rax,0x3534323773734034   ; octets 34 40 73 73 37 32 34 35 = "4@ss7245"
11e7: mov WORD PTR [rbp-0xb3],0x3633  ; octets 33 36 = "36"               -> secret = "4@ss724536"
1298: call sprintf    ; "%02x" appliqué à chaque octet du secret, boucle de strlen(secret) itérations
12d9: call strncmp    ; comparaison avec la saisie
```

Conversion : chaque caractère de `4@ss724536` → son code ASCII en hex sur 2 chiffres → **`34407373373234353336`** (20 caractères).

## Vérification

```text
$ echo 34407373373234353336 | ./trycrackme   -> [+] Correct key!
$ echo deadbeef              | ./trycrackme   -> [-] Incorrect key!
```

## Notes

- Reverse statique + essais live ; pas de GDB.
