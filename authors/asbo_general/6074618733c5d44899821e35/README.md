# ASBO_GENERAL — My_first_ever_crackme

| | |
|---|---|
| **ID** | [`6074618733c5d44899821e35`](https://crackmes.one/crackme/6074618733c5d44899821e35) |
| **Auteur** | ASBO_GENERAL |
| **Plateforme** | Linux ELF64 PIE, C++, non strippé (`boringFunc`) |
| **SHA-256** | `a9f4d7c320f26e479cfb69cac5caab0d707fc41aafd84240a3dfb1f5ef77c456` |

Voir [`ORIGIN.yml`](ORIGIN.yml).

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/first-evercrackme` | binaire d'origine |
| `tools/first-evercrackme-solve.py` | inverse la transformation (`-q`, `--check`) |

## Réponse

**Clé : `iusearchbtw`** (« I use Arch btw »)

```bash
echo iusearchbtw | ./original/first-evercrackme
# Weldone !!, as a reward I'll let you ddos me at this ip:127.0.0.1 :)
python3 tools/first-evercrackme-solve.py --check
```

## Premier regard

`strings` : `Enter key: `, `Weldone !!, as a reward I'll let you ddos me at this ip:127.0.0.1 :) `, `Wrong!!!, fucking mouth breather`, et deux fragments illisibles `1,)=8(` et `;18,w` : la cible XORée, pas une clé en clair. Symbole `boringFunc(std::string&)`.

## Flow

`main` : construit la constante cible (`"1,)=8("` + `";18,w"`), lit la saisie (`cin >> key`), appelle `boringFunc(key)`, compare le résultat à la constante.

## Comment on trouve

**Ancrage** : `nm -C` donne `boringFunc(std::__cxx11::basic_string<char>&)`. `objdump -d -M intel --no-show-raw-insn original/first-evercrackme | awk '/<_Z10boringFunc/,/ret/'`.

```asm
126b: mov WORD PTR [rbp-0x1b],0x5958   ; 'X','Y'
1271: mov BYTE PTR [rbp-0x19],0x5a     ; 'Z'          -> clé cyclique "XYZ"
1292: cmp rbx,size-1 ; setb ; je fin                   ; boucle i = 0 .. size-2 (PAS le dernier caractère)
12e0: movzx ebx,[rbp+rax*1-0x1b]       ; "XYZ"[i % 3]  (réduction de force du modulo 3)
12fd: xor edx,ebx                      ; input[i] ^= "XYZ"[i%3]   -- modifie l'ARGUMENT en place !
1318: construit une COPIE du buffer modifié dans la valeur de retour
```

Point clé : la boucle va de `0` à `taille-2` (condition stricte `< taille-1`) : **le dernier caractère n'est jamais XORé**.
Le résultat est comparé à `"1,)=8(;18,w"` (11 caractères). Inversion : pour `i < 10`, `clé[i] = cible[i] ^ "XYZ"[i%3]` ; `clé[10] = cible[10]` (inchangé).

| i | cible | clé XOR | clé[i] |
|---|---|---|---|
| 0 | `1` | `X` | `i` |
| 1 | `,` | `Y` | `u` |
| 2 | `)` | `Z` | `s` |
| 3 | `=` | `X` | `e` |
| … | … | … | … |
| 10 | `w` | — | `w` |

→ **`iusearchbtw`**.

## Vérification

```text
$ echo iusearchbtw | ./first-evercrackme   -> Weldone !!, as a reward I'll let you ddos me at this ip:127.0.0.1 :)
$ echo wrong       | ./first-evercrackme   -> Wrong!!!, fucking mouth breather
```

## Notes

- Reverse statique + essais live ; pas de GDB.
