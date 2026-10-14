# asm_is_fun by qhf (crackmes.de)

- Origine : [ORIGIN.yml](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/5ab77f5633c5d40ad448c2bf)
- Auteur : **qhf** (archive crackmes.de, publié sur crackmes.one par `crackmes.de`)
- Plateforme : Windows x86, PE32 **console**, NASM + GoLink, 2 Ko (msvcrt : `printf`, `gets`, `sprintf`, `_getch`)
- Difficulté site : 1.0
- Consigne (`original/readme.txt`) : loader, serial fisher ou **keygen** ; pas de patch

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/qhfasmcrackme.zip` | archive d’origine (password `crackmes.one`) |
| `original/crackme.exe` | PE extrait (non modifié) |
| `original/readme.txt` | règles de l’auteur |
| `analysis/crackme.objdump.txt` | désassemblage complet de `.text` (0x401000–0x40116b) |
| `analysis/check.txt` | sortie du `--check` Wine (OK / KO) |
| `tools/asm_is_fun-solve.py` | keygen `-q` / `--check` |

## Réponse

Exemple avec le username de démo **`petik`** :

```text
Name: petik
Key:  7dz479z8zed
```

```bash
./tools/asm_is_fun-solve.py -q petik       # → 7dz479z8zed
./tools/asm_is_fun-solve.py --check petik  # keygen + vérif Wine (OK et KO)
```

Sous Wine : *Thanks for registering!*

## Premier regard

```console
$ file original/crackme.exe
PE32 executable for MS Windows 4.00 (console), Intel i386, 3 sections
$ strings -n 3 original/crackme.exe
GoLink www.GoDevTool.com
%c%cName:
Key:
%s%x
Name must be greater than 3.
Thanks for registering!
The key is invalid.
```

Le format `%s%x` passé à `sprintf` trahit déjà l’idée : la clé est une concaténation de valeurs hexa.

## Flow

1. Bannière, `Name: ` → `gets(0x402120)`.
2. `strlen(name) <= 3` → *Name must be greater than 3.*
3. `Key: ` → `gets(0x402521)`.
4. Construction de la clé attendue dans `0x402922` (boucle `sprintf`).
5. Substitution de trois caractères.
6. Comparaison octet par octet (NUL compris) → *Thanks for registering!* / *The key is invalid.*

Petite astuce NASM : les chaînes `Name: `, `Key:  ` et `%s%x` sont **dans `.text`**, sautées par un `jmp` (d’où le désassemblage « bizarre » en `0x40101f`, `0x401072`, `0x4010d0`).

## Comment on trouve la clé

Tout le check tient dans `.text` ; `objdump -d -M intel original/crackme.exe` suffit (pas de symboles, mais 360 octets de code).

### Génération (`0x401099`–`0x4010ef`)

```asm
401099  mov   edx, 0x402120          ; edx = name
40109e  mov   cl, [edx]              ; c = *name
4010a2  movzx eax, cl
4010a5  test  cl, 1                  ; c impair ?
4010a8  je    0x4010b9
4010aa  sub   eax, 0xf               ; impair : (c - 15) ^ 2
4010af  xor   eax, 2
4010b4  jmp   0x4010c3
4010b9  add   eax, 2                 ; pair   : (c + 2) ^ 15
4010be  xor   eax, 0xf
4010c3  push  edx / push ecx         ; sauvegarde
4010c5  push  eax / push 0x402922 / push "%s%x" / push 0x402922
4010df  call  sprintf                ; key = key + "%x" % v
4010ea  pop   ecx / pop edx
4010ec  inc   edx
4010ed  test  cl, cl                 ; test APRÈS traitement :
4010ef  jne   0x40109e               ; le NUL final est aussi encodé
```

Le test `test cl, cl` arrive **après** le `sprintf` : le terminateur NUL (`c = 0`, pair) ajoute toujours `(0+2)^15 = 0xd` → chaque clé finit par **`d`**.

### Substitution (`0x4010f1`–`0x40112d`)

```asm
4010fa  cmp cl, 0x66 ; 'f' → mov byte [eax], 0x71 ; 'q'
40110a  cmp cl, 0x31 ; '1' → mov byte [eax], 0x48 ; 'H'
40111a  cmp cl, 0x35 ; '5' → mov byte [eax], 0x7a ; 'z'
```

### Comparaison (`0x40112f`–`0x401150`)

`strcmp` maison entre `0x402521` (saisie) et `0x402922` (attendu), terminateur compris : la clé doit être **exactement** la chaîne générée (pas de préfixe accepté).

### Exemple déroulé : `petik`

| c | hex | parité | v | `%x` | après substitution |
|---|---|---|---|---|---|
| `p` | 0x70 | pair | (0x72)^0xf = 0x7d | `7d` | `7d` |
| `e` | 0x65 | impair | (0x56)^2 = 0x54 | `54` | `z4` |
| `t` | 0x74 | pair | (0x76)^0xf = 0x79 | `79` | `79` |
| `i` | 0x69 | impair | (0x5a)^2 = 0x58 | `58` | `z8` |
| `k` | 0x6b | impair | (0x5c)^2 = 0x5e | `5e` | `ze` |
| NUL | 0x00 | pair | (0x02)^0xf = 0x0d | `d` | `d` |

→ **`7dz479z8zed`**

## Prédicat consolidé

```python
def keygen(name):
    out = ""
    for c in name.encode() + b"\0":
        v = ((c - 15) ^ 2) if c & 1 else ((c + 2) ^ 15)
        out += "%x" % v
    return out.translate(str.maketrans("f15", "qHz"))
```

## Vérification

```console
$ ./tools/asm_is_fun-solve.py --check petik crackmes qHFrocks
Name: petik
Key:  7dz479z8zed
  wine OK=True  KO(key+'0')=True
Name: crackmes
Key:  z67bz0z6zezcz466d
  wine OK=True  KO(key+'0')=True
Name: qHFrocks
Key:  604z477b62z6ze66d
  wine OK=True  KO(key+'0')=True
```

OK = Wine affiche *Thanks for registering!* ; KO = la même clé suivie d’un `0` donne *The key is invalid.*

## Notes

- Le `_getch()` final bloque si stdin est un simple pipe sous Wine : le `--check` passe par un pseudo-terminal (`script -qc 'wine …'`).
- Noms de 1 à 3 caractères refusés (*Name must be greater than 3.*).
- Un caractère impair < 15 (contrôle) donnerait une valeur négative imprimée en `%x` 32 bits (`ffff…`) : le keygen applique le même masque, mais `gets` ne laisse guère passer ces octets.
