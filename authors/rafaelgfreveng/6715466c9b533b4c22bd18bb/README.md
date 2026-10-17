# RafaelGFreveng — Sexy 1337

| | |
|---|---|
| **ID** | [`6715466c9b533b4c22bd18bb`](https://crackmes.one/crackme/6715466c9b533b4c22bd18bb) |
| **Auteur** | RafaelGFreveng |
| **Plateforme** | Linux ELF64 PIE, C, non strippé |
| **SHA-256** | `29eb50c08d17a4c4a4e561e4325732af90a1f462119b7e36b2bd70ea46a86f8b` |

Voir [`ORIGIN.yml`](ORIGIN.yml).

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/sexy1337.out` | binaire d'origine |
| `tools/sexy1337-solve.py` | calcule le mot de passe (`-q`, `--check`) |

## Réponse

**Mot de passe : `vh{|466:`**

```bash
python3 tools/sexy1337-solve.py --check
echo 'vh{|466:' | ./original/sexy1337.out     # Access Granted!
```

## Premier regard

`strings` : `sexy1337`, `Enter the password: `, `Access Granted!`, `Access Denied!`, fonctions `generate_password` et `encrypt_decrypt`.
Piège évident : saisir `sexy1337` (la chaîne en clair) est refusé.

## Flow

`main` @ `0x120e` :

1. `generate_password(buf, "sexy1337")` → `buf[i] = seed[i] + 3` ;
2. `encrypt_decrypt(buf, 0xaa)` : XOR de chaque octet avec `0xaa` ;
3. `fgets(input, 0x32)`, retrait du `\n` (`strcspn`) ;
4. `encrypt_decrypt(input, 0xaa)` : même XOR sur la saisie ;
5. `strcmp(input, buf)` : 0 → « Access Granted! ».

## Comment on trouve

**Ancrage** : `objdump -d -M intel --no-show-raw-insn original/sexy1337.out | awk '/<(main|generate_password|encrypt_decrypt)>:/,/ret/'`.

```asm
; generate_password @0x134d
1389: lea ecx,[rax+0x3]        ; seed[i] + 3
1399: mov [rax],dl             ; out[i] = seed[i] + 3 ; puis out[len] = 0

; encrypt_decrypt @0x12f5
132c: xor al,BYTE PTR [rbp-0x1c]   ; octet ^= clé   (clé = 2e argument, 0xaa appelé depuis main)
1347: jne 130f                      ; boucle jusqu'au NUL

; main : 123e: mov esi,0xffffffaa  (clé 0xaa)  /  1296: mov esi,0xffffffaa
12b1: call strcmp               ; strcmp(input ^ 0xaa, (seed+3) ^ 0xaa)
```

Les deux côtés sont XORés avec la **même** clé : `(a ^ k) == (b ^ k)` ⇔ `a == b`. Le XOR `0xaa` est donc sans effet sur le résultat, et il suffit de saisir `seed + 3` :

| seed | s | e | x | y | 1 | 3 | 3 | 7 |
|---|---|---|---|---|---|---|---|---|
| +3 | `v` | `h` | `{` | `|` | `4` | `6` | `6` | `:` |

→ **`vh{|466:`**.

Pièges : (1) le seed lui-même est refusé ; (2) la boucle `encrypt_decrypt` s'arrête au premier octet nul : un octet égal à `0xaa` après XOR créerait un NUL (ce n'est pas le cas ici, tous les octets du mot de passe sont ASCII ≠ 0xaa).

## Vérification

```text
$ echo 'vh{|466:' | ./original/sexy1337.out   -> Access Granted!
$ echo sexy1337   | ./original/sexy1337.out   -> Access Denied!
$ echo wrong      | ./original/sexy1337.out   -> Access Denied!
```

## Notes

- Reverse statique + essais live, pas de GDB.
