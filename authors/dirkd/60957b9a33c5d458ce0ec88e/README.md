# DirkD — EZwan

| | |
|---|---|
| **ID** | [`60957b9a33c5d458ce0ec88e`](https://crackmes.one/crackme/60957b9a33c5d458ce0ec88e) |
| **Auteur** | DirkD |
| **Plateforme** | Linux ELF64 PIE, C, non strippé |
| **SHA-256** | `c3adc81cf502c3082499a6b9f62c414c3775fb4155eead592aeb886746e0be8d` |

Voir [`ORIGIN.yml`](ORIGIN.yml).

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/EZwan` | binaire d'origine |
| `tools/ezwan-solve.py` | calcule la clé (`-q`, `--check`) |

## Réponse

**Clé (argv[1]) : `NiceDude`**

```bash
./original/EZwan NiceDude    # Checking Password: NiceDude / Success , congratulations.
python3 tools/ezwan-solve.py --check
```

## Premier regard

`strings` : `Checking Password: %s`, `Wrong Password , please try again! `, `Success , congratulations.`, `Usage: <key> (Try to find the password , not just patching.)` — l'énoncé prévient explicitement contre le patch du binaire.

## Flow

`main` @ `0x11a9` : exige `argv[1]`, affiche la saisie, puis pour chaque octet `i` de 0 à 7 : `argv[1][i] ^ 0x55` comparé à une table interne, décalée d'un octet.

## Comment on trouve

**Ancrage** : `objdump -d -M intel --no-show-raw-insn original/EZwan | awk '/<main>:/,/ret/'`.

```asm
11cb: movabs rax,0x31201130363c1b55   ; 8 octets de la table (LE)
11d9: mov WORD PTR [rbp-0xa],0x1730   ; 2 octets suivants -> table complète de 10 octets
1219: movzx eax,BYTE PTR [rbp+rax*1-0x12]   ; table[i+1]  (indice DÉCALÉ de 1, i de 0 à 7)
121e: xor eax,0x55
1236: movzx eax,BYTE PTR [argv1+i]
1239: cmp cl,al ; je ok                       ; argv[1][i] == table[i+1] ^ 0x55
```

Table (little-endian) : `55 1b 3c 36 30 11 20 31 30 17`. En utilisant les octets d'indice 1 à 8 (`1b 3c 36 30 11 20 31 30`) XORés avec `0x55` : `N i c e D u d e` → **`NiceDude`**.

Piège : l'indexation commence à **1**, pas à 0 — le premier octet de la table (`0x55`, qui est justement la clé XOR) n'est jamais comparé lui-même.

## Vérification

```text
$ ./EZwan NiceDude    -> Checking Password: NiceDude / Success , congratulations.
$ ./EZwan wrong123    -> Checking Password: wrong123 / Wrong Password , please try again!
```

## Notes

- Reverse statique + essais live ; pas de GDB.
