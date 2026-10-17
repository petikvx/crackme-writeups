# b4te — guess_the_password

| | |
|---|---|
| **ID** | [`6640d1d26b8bd8ddfe33c80a`](https://crackmes.one/crackme/6640d1d26b8bd8ddfe33c80a) |
| **Auteur** | b4te |
| **Plateforme** | Linux ELF64 PIE, C, non strippé (fonction `check`) |
| **SHA-256** | `8275d84cc74870e4e500546e9544887056c96ff5de1d25383b96e813d0d6a036` |

Voir [`ORIGIN.yml`](ORIGIN.yml).

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/guess_the_password` | binaire d'origine |
| `tools/guess-solve.py` | génère un mot de passe valide (`FILL`, `-q`, `--check`) |

## Réponse

Il n'y a **pas** de mot de passe unique : toute chaîne de **10 caractères** dont le **1ᵉʳ est `1`** et le **5ᵉ est `9`** est acceptée.

```text
1pet9ikpet      <- exemple (motif petik)
1000900000      <- autre exemple valide
```

```bash
python3 tools/guess-solve.py --check
echo 1pet9ikpet | ./original/guess_the_password     # Correct
```

## Premier regard

`strings` : `What is the password:`, `Correct`, `Incorrect`. Aucune chaîne secrète : le prédicat porte sur la **forme** de la saisie, pas sur un mot précis.

## Flow

`main` @ `0x11f1` : `printf`, `fgets(buf, …)`, retrait du `\n` (`strcspn`), `check(buf)` @ `0x12a6` ; retour 1 → « Correct », sinon « Incorrect ».

## Comment on trouve

**Ancrage** : `objdump -d -M intel --no-show-raw-insn original/guess_the_password | awk '/<check>:/,/ret/'` (symbole `check` présent).

```asm
12bd: call strlen ; mov [rbp-0x4],eax
12c5: cmp DWORD PTR [rbp-0x4],0xa     ; len == 10
12cf: movzx eax,BYTE PTR [rax]        ; s[0]
12d2: cmp al,0x31                     ; == '1'
12da: add rax,0x4 ; movzx eax,[rax]   ; s[4]
12e1: cmp al,0x39                     ; == '9'
12e5: mov eax,1                       ; sinon xor -> 0
```

Le programme ne vérifie que ces trois conditions ; les positions 1–3 et 5–9 sont libres (8 caractères).

## Vérification

```text
$ echo 1pet9ikpet  | ./original/guess_the_password -> Correct
$ echo 1000900000  | ./original/guess_the_password -> Correct
$ echo 2pet9ikpet  | ./original/guess_the_password -> Incorrect   (s[0] != '1')
$ echo 1pet8ikpet  | ./original/guess_the_password -> Incorrect   (s[4] != '9')
$ echo 1pet9ikpe   | ./original/guess_the_password -> Incorrect   (9 caractères)
$ echo 1pet9ikpetx | ./original/guess_the_password -> Incorrect   (11 caractères)
```

## Notes

- Reverse statique + essais live ; pas de GDB.
- Le champ « mot de passe » est donc un *gabarit* ; le solveur produit un exemple (par défaut `1pet9ikpet`).
