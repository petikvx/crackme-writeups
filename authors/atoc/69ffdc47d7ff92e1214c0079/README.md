# atoc's superEZcrackME

| | |
|---|---|
| **ID** | [`69ffdc47d7ff92e1214c0079`](https://crackmes.one/crackme/69ffdc47d7ff92e1214c0079) ([`ORIGIN.yml`](ORIGIN.yml)) |
| **Auteur** | atoc |
| **Plateforme** | Windows PE64 (mingw-w64), mini-VM + bytecode `.bvs` |
| **SHA-256** | `ae114043c137d2509d63e112cd88bd77fd8a574622a4491b2af9075cd568f8e6` |

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/download.bin` | ZIP d'origine (mot de passe site `crackmes.one`), **non modifié** |
| `analysis/extracted/` | contenu dézippé : `crackme1.zip` → `bvessel.exe` (VM) + `cm.bvs` (programme) |
| `analysis/bv.asm` | `objdump -d -M intel` de `bvessel.exe` |
| `tools/superez-solve.py` | solveur / `--check` (Wine) |

## Réponse

Créer un `in.txt` contenant **`420`** à côté de `cm.bvs`, puis `bvessel.exe cm.bvs` → `you winner`.
(Pas de username dans ce challenge, donc pas d'exemple `petik`.)

```bash
python3 -I tools/superez-solve.py -q        # 420
python3 -I tools/superez-solve.py --check   # dézippe, teste 421 et vide (KO), puis 420 (OK) sous Wine
```

## Premier regard

- `download.bin` est un ZIP chiffré (`crackmes.one`) contenant lui-même `crackme1.zip` (non chiffré) → `bvessel.exe` (51 712 o) + `cm.bvs` (66 o).
- `strings bvessel.exe` : `BVES`, `invalid bvs`, `--debug`, `Var[%d]: %s`, et une table de mnémoniques `NOP RET IMPEXT MOV ADD SUB JMP JIL JIG JLE JGE JE JNE PRINT`. C'est donc un **interpréteur de bytecode** ; le crackme est le programme `cm.bvs`.
- Lancé sans `in.txt` : `you failure`, puis dump `Var[0..2]`.

## Comment on trouve

### 1. Format `.bvs` (loader, `main` ≈ `0x140009820`)

```
42 56 45 53        'BVES'  (magic, fopen "rb" + fread 4 puis comparaison)
01 00 06           version, ?, nb_vars<<1  → 6>>1 = 3 variables
"in.txt>>you failure>>you winner>>"   variables, terminées par '>' '>' (cmp 0x3e deux fois)
puis instructions : u16 opcode + N × u16 opérandes
```

Table des opcodes en `.rdata` `0x14000b180` (entrées de 16 o : opcode u32, nb opérandes u32, nom\*) :
`NOP0 RET1 IMPEXT2(1) MOV3(2) ADD4(2) SUB5(2) JMP6(1) JIL7(3) JLE8(3) JIG9(3) JGE10(3) JE11(3) JNE12(3) PRINT13(1)`.
Une instruction décodée fait 0x1c octets (`imul rdx,rdx,0x1c`), dispatch par jump table (`cmp eax,0xc ; ja`, `0x140009b74`). Un opérande avec le bit 15 (`0x8000`) est un **immédiat**, sinon un index de variable.

### 2. Décodage de `cm.bvs`

```
02 00 | 00 00                IMPEXT var0            ; importe le fichier "in.txt" dans var0
0b 00 | 04 80 | a4 81 | 00 00   JE  imm4, imm0x1a4(=420), var0   ; si var0 == 420 → saut à l'instr 4
0d 00 | 01 00                PRINT var1  "you failure"
06 00 | 05 80                JMP imm5   (fin)
0d 00 | 02 00                PRINT var2  "you winner"
01 00                        RET
```

Le prédicat est donc `contenu(in.txt) == "420"` (`0x81a4 & 0x7fff = 0x1a4 = 420`). `IMPEXT` remplace la valeur de `var0` (le nom de fichier) par le contenu du fichier, comparé comme chaîne décimale.

### Pièges

- ZIP imbriqué (2 niveaux), et le binaire à analyser n'est pas dans `original/` directement.
- `--debug` en 2ᵉ argument (`argc==3`) attend/boucle sous Wine, inutile ici.
- Le `.bvs` est lu dans le répertoire courant, `in.txt` aussi : lancer depuis le dossier de `cm.bvs`.

## Vérification (Wine, binaire d'origine dézippé)

```bash
cd <tmp avec bvessel.exe + cm.bvs>
printf 420 > in.txt;  xvfb-run -a wine bvessel.exe cm.bvs   # you winner
printf 421 > in.txt;  xvfb-run -a wine bvessel.exe cm.bvs   # you failure
: > in.txt;           xvfb-run -a wine bvessel.exe cm.bvs   # you failure
printf '420\n' > in.txt                                     # you winner aussi (newline toléré)
```

Tous les cas ci-dessus ont été exécutés et donnent le résultat indiqué.

## Notes

- Aucun GDB / x64dbg / IDA utilisé : désassemblage statique `objdump` + exécution Wine.
- Le Hex-Rays (`decc`) n'était pas disponible dans l'environnement.
