# crackmes.de's second_keygenme (FixedSecondKeyGenMe.exe) by dmichael

| | |
|---|---|
| **ID** | [`5ab77f5833c5d40ad448c3d0`](https://crackmes.one/crackme/5ab77f5833c5d40ad448c3d0) ([`ORIGIN.yml`](ORIGIN.yml)) |
| **Auteur (site)** | crackmes.de / dmichael |
| **Plateforme** | Windows PE32 console, MSVC 2012 (C++, iostream) |
| **SHA-256 (zip)** | `301b7e9c78e3bea82ecaf54dabff97e62acbe6508ae6fb34510fa4f7ccd2c3e4` (mdp zip : `crackmes.one`) |

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/FixedSecondKeyGenMe.zip` | archive d'origine (non touchée) |
| `analysis/x/FixedSecondKeyGenMe.exe` | exe extrait du zip (copie de travail) |
| `analysis/d.asm` | `objdump -d -M intel` complet |
| `tools/second-keygenme-solve.py` | keygen (`--name`, `-q`, `--check EXE`) |

## Réponse

| Nom | Serial |
|---|---|
| `petik` | `j}nqs` |

```bash
python3 tools/second-keygenme-solve.py --name petik            # name=petik serial=j}nqs
python3 tools/second-keygenme-solve.py -q                       # j}nqs
python3 tools/second-keygenme-solve.py --check analysis/x/FixedSecondKeyGenMe.exe   # xvfb-run wine
```

Formule : `serial[i] = (name[i] ^ 0x19) + 1`. Nom : 1 à 11 caractères.

## Premier regard

```bash
file analysis/x/*.exe     # PE32 console, i386, 3 sections
diec analysis/x/*.exe     # MSVC 2012 (LTCG), pas de packer
strings -n 4 …            # "Enter your registration name:", "Enter your serial:", "Like!!"
```

Rien d'obfusqué. `Like!!` est le message de succès ; il n'y a aucun message d'échec (le programme se termine simplement).

## Flow

1. `cin >> name` (tampon global `0x42cc5c`), `cin >> serial` (tampon global `0x42cc68`, soit 12 octets plus loin).
2. Le nom est XORé en place avec `0x19`.
3. Pour chaque `i` : `name[i]++` puis comparaison à `serial[i]` ; à chaque égalité un compteur global est incrémenté.
4. Si compteur == `strlen(name)` → `Like!!`.

## Comment on trouve

**Ancrage.** `strings -t x` donne les chaînes en offset fichier `0x25fa9` / `0x25fc9` / `0x25fdd`. `.rdata` : VA `0x421000` ↔ raw `0x1f800`, donc VA `0x4277a9` / `0x4277c9` / `0x4277dd`. Elles sont référencées dans `objdump` sous la forme `lea edx,[eax+0x4277a8]` (un compteur `eax` global à `0x42cc58`, incrémenté à chaque fois, sert d'index : le `+1` explique l'écart d'un octet). Piège : une recherche de `0x4277a9` en littéral ne trouve rien. Le tout est dans `main` à `0x4019f0`.

**Lecture du check** (`0x401a56`–`0x401b02`) :

```asm
401a70: xor  BYTE PTR [edx+0x42cc5c],0x19   ; name[i] ^= 0x19, pour tout i < strlen
        ...                                 ; (ebx = dernier i = len-1 en sortie de boucle)
401aa0: inc  BYTE PTR [edi+0x42cc5c]        ; name[i]++
401aa6: mov  al,[edi+0x42cc5c]
401aac: cmp  [edi+0x42cc68],al              ; serial[i] == name[i] ?
401ab2: jne  401afd                         ; non -> char suivant (pas de sortie !)
401aba: mov  [0x42b86c],edx                 ; compteur++ (valeur initiale 1 dans .data)
401acc: cmp  edx,ecx  ; compteur == strlen(name) ? -> "Like!!"
401afd: inc edi ; cmp edi,ebx ; jb 401aa0   ; i va de 0 à len-2
```

**Décodage.** La condition de succès est donc `serial[i] == (name[i]^0x19)+1` pour tous les `i < len-1`. Le compteur global démarre à **1** (vérifié dans `.data` : offset fichier `0x28200+0x42b86c-0x42a000` → `01 00 00 00`), et la boucle ne fait que `len-1` tours (borne `ebx = len-1`) : `1 + (len-1) = len` suffit à déclencher `Like!!`. Le dernier caractère du serial n'est donc **jamais comparé** (off-by-one de l'auteur) ; le keygen le génère quand même avec la même formule.

**Assemblage, `petik`** :

| i | name | ^0x19 | +1 | serial |
|---|---|---|---|---|
| 0 | `p` 0x70 | 0x69 | 0x6a | `j` |
| 1 | `e` 0x65 | 0x7c | 0x7d | `}` |
| 2 | `t` 0x74 | 0x6d | 0x6e | `n` |
| 3 | `i` 0x69 | 0x70 | 0x71 | `q` |
| 4 | `k` 0x6b | 0x72 | 0x73 | `s` (non vérifié) |

→ `j}nqs`. (`j}nq` + n'importe quel caractère passe aussi.)

**Pièges.**
- Le nom est modifié en place, et le compteur est global : un seul essai par exécution (le programme ne boucle de toute façon pas).
- Nom limité à 11 caractères (tampon de 12 octets, le serial est juste derrière) ; `cin >>` coupe sur l'espace, donc pas d'espace dans le serial. Un caractère de nom valant `0x19` donnerait un octet nul et raccourcirait le `strlen`.
- Une valeur de serial mauvaise ne produit aucun message : il faut regarder l'absence de `Like!!`.

## Debug GDB

Non utilisé (reverse statique + preuve sous Wine).

## Vérification

```text
$ python3 tools/second-keygenme-solve.py --check analysis/x/FixedSecondKeyGenMe.exe
name=petik serial=j}nqs
Enter your registration name:
Enter your serial:
Like!!                                   (rc=0)

$ python3 tools/second-keygenme-solve.py --name admin --check …      → Like!!
$ printf 'petik\nwrong\n' | xvfb-run -a wine analysis/x/FixedSecondKeyGenMe.exe
Enter your registration name:
Enter your serial:                       (pas de Like!!)
```

## Notes

- Ce n'est pas un hash : transformation réversible caractère par caractère, XOR + incrément.
- Le titre « Fixed » dans le nom du fichier : version corrigée de l'original de dmichael.
