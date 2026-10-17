# nutcake — PrettyDamnEasy

| | |
|---|---|
| **ID** | [`5c11dcaf33c5d41e58e00578`](https://crackmes.one/crackme/5c11dcaf33c5d41e58e00578) |
| **Auteur** | nutcake |
| **Plateforme** | Linux ELF64 PIE, C, non strippé |
| **SHA-256** | `6f853d08eecce5040951ffdcdf3f82827e8f78b890b7a7f50f12b8afa6413b67` |

Voir [`ORIGIN.yml`](ORIGIN.yml).

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/crack` | binaire d'origine |
| `tools/prettydamneasy-solve.py` | mot de passe (`-q`, `--check`) |

## Réponse

| | |
|---|---|
| **Mot de passe** | `easycrack` |

```bash
echo easycrack | ./original/crack
python3 tools/prettydamneasy-solve.py --check
```

## Premier regard

```bash
file original/crack     # ELF64 PIE, not stripped
strings -n 5 original/crack
```

Chaîne visible : `easycracH` — **piège** : un seul caractère diffère (majuscule finale) de la vraie réponse. `strings` ne voit que cette version déjà quasi-complète en `.rodata`, mais ce n'est pas elle que `strcmp` utilise réellement.

## Flow

`main` construit le mot de passe attendu directement sur la pile via des immediates (`movabs`), pas depuis la chaîne `.rodata` visible par `strings`, puis `strcmp` avec la saisie.

## Comment on trouve

**Ancrage** : `objdump -d -M intel --no-show-raw-insn original/crack | awk '/<main>:/,/^$/'`.

```asm
116d: movabs rax,0x6361726379736165   ; 8 octets LE : "easycrac"
1177: mov [buf],rax
117b: mov WORD PTR [buf+8],0x6b       ; +2 octets : 'k' '\0'
...
11b8: call strcmp
```

Décodage LE de l'immediate 64-bit : `0x6361726379736165` → octets `65 61 73 79 63 72 61 63` → `"easycrac"`, puis `0x6b, 0x00` → `"k\0"` → **`"easycrack"`**.

## Vérification

```bash
$ echo easycrack | ./original/crack
Input the password: Correct password

$ echo easycracH | ./original/crack
Input the password: Wrong password, try another
```

## Notes

- Pas de GDB nécessaire : constantes lisibles directement en immediates.
- Piège principal : la chaîne `easycracH` trouvée par `strings` est un leurre à un caractère près — toujours vérifier ce que `strcmp` compare réellement (ici des immediates construites sur la pile, pas une chaîne `.rodata`).
