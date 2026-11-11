# zsombii's Easy crackme

| | |
|---|---|
| **ID** | [`693d89b50992a052ab2222d7`](https://crackmes.one/crackme/693d89b50992a052ab2222d7) ([ORIGIN.yml](ORIGIN.yml)) |
| **Auteur** | zsombii |
| **Plateforme** | Java (`easycrack.jar`, `Main.class`), emballé dans un ZIP protégé |
| **SHA-256** | `958a259b55a586c6c5143c13248152a516e42d76522236e0f30de449cbc4f819` |

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/download.bin` | ZIP chiffré (mot de passe `crackmes.one`) contenant `easycrack.jar` |
| `analysis/zip/easycrack.jar`, `analysis/jar/` | extraction (jar + `Main.class`) |
| `tools/easy-crackme-solve.py` | keygen + `--check` contre le jar réel |

## Réponse

Une clé de **10 caractères** contenant **exactement 4 caractères dont le code ASCII est un multiple de 4** (`c & 3 == 0`).

**`KEY0000111`** (pas de notion d'utilisateur ici, donc pas de `petik`).

```bash
python3 tools/easy-crackme-solve.py                 # KEY0000111
python3 tools/easy-crackme-solve.py -r              # clé aléatoire valide
python3 tools/easy-crackme-solve.py --check analysis/zip/easycrack.jar [--java /chemin/java]
```

## Premier regard

`download.bin` n'est pas un jar mais un ZIP chiffré (`python3 -c "zipfile…"` avec `pwd=b'crackmes.one'`) contenant `easycrack.jar` ; le manifest donne `Main-Class: Main`. Pas de JDK sur la machine (pas de `javap`), donc le bytecode a été désassemblé à la main (petit parseur du constant pool en Python) puis le jar a été exécuté avec un JRE obtenu via le paquet pip `jdk4py` (dans `/tmp`, hors dépôt).

`strings Main.class` : `Enter the validation key here…`, `Length requirement not met`, `Validation key accepted/is invalid`, `KEY`, `startsWith`, `charAt`, `keyPoints`.

## Flow

`main` : boucle `Scanner.nextLine().trim()` ; vide → `Exiting..` + `System.exit(0)` ; `length() != 10` → `Length requirement not met` et on reboucle ; sinon `checkValidity(key)` → accepted / invalid.

Octets de `main` : `…2c b6 0036 10 0a 9f 000b … 10 0a a0 ffc6` → `bipush 10`, comparaison de `length()` avec 10.

## Comment on trouve le prédicat

Bytecode de `checkValidity(String)` (`code = 033c2a1246b60048990006840100033d1c2ab60036a2001b1b2a1cb6004b067e9a000704a7000403603c840201a7ffe31b07a0000704a7000403ac`) :

```text
 0: iconst_0 ; istore_1            // cnt = 0
 2: aload_0 ; ldc "KEY" ; invokevirtual startsWith
 8: ifeq +6  -> 14
11: iinc 1, 0                      // 84 01 00 : cnt += 0  → NO-OP (leurre !)
14: iconst_0 ; istore_2            // i = 0
16: iload_2 ; aload_0 ; length ; if_icmpge -> 48
24: iload_1 ; aload_0 ; iload_2 ; charAt
30: iconst_3 ; iand ; ifne -> 39   // (c & 3) != 0 ? 0 : 1
35: iconst_1 ; goto 40 / 39: iconst_0
40: iadd ; istore_1                // cnt += bit
44: iinc 2,1 ; goto 16
48: iload_1 ; iconst_4 ; if_icmpne -> 57  // cnt == 4 ?
```

**Piège** : à la première lecture on voit `iinc 1,1` après `startsWith("KEY")` (donc un bonus +1 pour le préfixe). Les octets sont en réalité `84 01 00` : l'incrément est **0**. Le préfixe `KEY` n'a aucun effet. Preuve live : `0000111111` (sans KEY) est accepté, alors que `KEY0001111` (KEY + 3 multiples de 4) est refusé.

Prédicat final : `len(key.strip()) == 10` et `#{c : ord(c) % 4 == 0} == 4`. Les caractères multiples de 4 sont p. ex. `$ ( , 0 4 8 < @ D H L P T X \ ` d h l p t x |`, et `0` (0x30) en fait partie ; `1` (0x31) non.

Assemblage : `KEY` (K=75, E=69, Y=89 → aucun multiple de 4) + `0000` (4 × 0x30) + `111` (0x31, non) = 10 caractères, compteur = 4.

## Vérification (JRE réel)

| Entrée | Résultat |
|---|---|
| `KEY0000111` | `Validation key accepted` |
| `0000111111`, `1111110000`, `KEY1110000` | accepted |
| clés aléatoires du solveur (`-r`, 3 essais) | accepted |
| `KEY0001111` (3 multiples seulement) | invalid |
| `ABCD000011` (A,B,C non, D=68 oui + 4 zéros = 5) | invalid |
| `KEYabcdefg` | invalid |
| `KEY000111` (longueur 9) | `Length requirement not met` |

`--check` du solveur : `check: OK`.

## Notes

- Pas de GDB / debugger : reverse statique du bytecode + exécution du jar.
- Le préfixe `KEY` et le nom `keyPoints` sont des leurres ; seule compte la parité « multiple de 4 ».
