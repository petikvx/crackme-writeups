# mintcocs's party invitation — write-up

- ORIGIN : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/6989bfd9fb46458f1ef6ced9)
- Auteur : **mintcocs** · Plateforme : macOS, Mach-O *fat* (x86_64 + arm64), app **SwiftUI**

| Fichier | Rôle |
|---|---|
| `original/download.bin` | ZIP (mdp `crackmes.one`) → `invitation-party.app.zip` → `.app` |
| `analysis/extracted/` | `.app` décompressée |
| `analysis/invitation-party.x86_64.macho` | slice x86_64 de la fat (offset 16384) |
| `analysis/macho-sections.py` | petit parseur Mach-O (sections / symboles) |
| `tools/party-invitation-solve.py` | keygen / `--check` / `--verify-unicorn` |

## Réponse

Format : `INV-AAAA-BBBBBBBB-CC`

| Exemple (`petik`) | Valeur |
|---|---|
| **Invitation ID** | **`INV-3085-70657469-34`** |
| nom affiché (calculé par la fn `0x100005720`) | `welcome to the party, 5cxpnjc8` |

- `AAAA` = **`3085`** : la seule valeur 1000..9999 acceptée.
- `BBBBBBBB` : 8 chiffres hex **libres** (ici `70657469` = « peti », user `petik`).
- `CC` = `(AAAA*13 + BBBBBBBB) % 100` sur 2 chiffres.

```bash
python3 tools/party-invitation-solve.py            # ID pour petik
python3 tools/party-invitation-solve.py -q
python3 tools/party-invitation-solve.py --check INV-3085-70657469-34
python3 tools/party-invitation-solve.py --verify-unicorn analysis/invitation-party.x86_64.macho
```

## Premier regard

```bash
python3 -I -c "import zipfile;zipfile.ZipFile('original/download.bin').extractall('analysis/extracted',pwd=b'crackmes.one')"
# puis dézipper invitation-party.app.zip ; le binaire est cafebabe (fat), 2 archs :
#   x86_64 @16384 (85248 o) · arm64 @114688
```

Pas de `file`/`otool`/IDA ici : j'ai découpé la slice x86_64 en Python et désassemblé avec **capstone**
(`analysis/macho-sections.py` donne les sections). Binaire strippé (aucun symbole dans `__text`).
`__cstring` : `Enter Your Invitation ID`, `❌ Invalid! It seems like you weren't invited.`,
`welcome to the party, `, et **`0123456789abcdefghijklmnopqrstuvwxyz`** (alphabet de 36 caractères).
`%02d` est visible dans les immediates (`mov edi, 0x64323025` = `"%02d"`).

## Flow

1. L'ID est `split("-")` (fn `0x100001b00`, appel de split `0x100003c30`) : il faut **4 morceaux**.
2. `part0 == "INV"` (`mov r8d, 0x564e49` @`0x100001c67`, comparé via `0x100004dd0`) ; longueurs
   `part1 == 4`, `part2 == 8`, `part3 == 2` (les `cmp r14,4` / `cmp rbx,8` / `cmp rbx,2` @`0x100001cd0/d23/d8e`).
3. `part1` → `Int(…, radix:10)` (`0x100004120` avec `edx=0xa`), `part2` → radix 16 (`edx=0x10`).
4. `0x100004e40(A)` doit renvoyer vrai (filtre sur A).
5. `0x100004e80(A, B)` renvoie `"%02d"` de `(A*13+B)%100` ; doit être **égal** à `part3` (`call 0x1000076e6` = `==` String @`0x100002a20`).
6. Si OK : `0x100005720(A, B, C)` calcule un « nom » 8 car. et l'UI affiche `welcome to the party, <nom>` ; sinon `❌ Invalid!…`.

## Comment on trouve

### Ancrage
Les chaînes (`Enter Your Invitation ID`, `Invalid!`) mènent à la vue SwiftUI ; l'appel `0x100002a53 → 0x100005720`
est précédé du seul test de validité (`0x100002a0e`/`a20`). En remontant, la fn `0x100001b00` fait le parsing
(`INV` = `0x564e49` en LE), puis les deux petites fonctions pures ci-dessous.

### Filtre sur A — `0x100004e40`
```asm
lea rax,[rdi-0x2710] ; cmp rax,-0x2328 ; jae cont    ; => A dans [1000, 9999] sinon false
add edi,edi          ; A*2
xor edi,0xf522 ; rol di,2 ; xor edi,0xace1 ; rol di,3   ; (16 bits)
movzx eax,di ; cmp eax,0xc010 ; sete al
```
Tout est bijectif sur 16 bits : on inverse (`ror 3`, `^0xace1`, `ror 2`, `^0xf522`, `>>1`) ou plus simple, on
force brute les 9000 valeurs : **une seule** passe, `A = 3085` (confirmé en **rejouant la vraie fonction sous Unicorn**
sur l'ensemble 0..19999 : `--verify-unicorn`).

### Checksum — `0x100004e80`
Parse A (décimal) → `rbx`, B (hex) → `r15`, puis :
```asm
imul rbx,rbx,0xd ; add rbx,r15        ; A*13 + B
; division par 100 par réciproque magique 0xa3d70a3d70a3d70b, reste → rbx
; String(format:"%02d", rbx)           ; fmt 0x64323025
```
Exemple `petik→` : B = `0x70657469` = 1885697129 ; `3085*13 = 40105` ; somme = 1885737234 ; `% 100` = **34** → `CC = 34`.

### Le nom — `0x100005720` (pas nécessaire pour valider)
C'est un hash (xorshift/murmur-like) de `A ^ 0xdeadbeef`, de `B & 0xffffff` et d'une suite
`s' = (s_prev + s) ^ 0x1337` itérée `CC` fois, qui sert à piocher 8 indices mod 36 dans l'alphabet
(`0x100008720`) — les `imul … shr … lea [rcx+rcx*8]` sont des `% 36` par réciproque magique. Le solveur les
reproduit à l'identique (`name()`), mais ce n'est qu'un affichage : le write-up ne le fait pas varier.

## Vérification

- `--verify-unicorn` : fonction réelle `0x100004e40` rejouée → `valid A = [3085]`. ✔
- `--check INV-3085-70657469-34` → VALID ; `…-35` (checksum faux) → INVALID ; `INV-3086-…` (A refusé) → INVALID.
- **Pas de run live** : app SwiftUI macOS, aucun macOS/Wine possible ici. La chaîne complète (split, parse, checksum
  formaté) est lue en statique ; seules les fonctions pures ont été rejouées. Le « nom » affiché n'est pas confirmé
  par exécution.

## Notes

- Pas de GDB / x64dbg / IDA MCP utilisés (non disponibles) : analyse 100 % statique + Unicorn.
- B est libre : tout `INV-3085-<8 hex>-<(3085*13+B)%100>` est valide.
