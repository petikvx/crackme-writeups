# Lambogames's Hide and C#

| | |
|---|---|
| **ID** | [`6964291088fc494dab5d937f`](https://crackmes.one/crackme/6964291088fc494dab5d937f) ([`ORIGIN.yml`](ORIGIN.yml)) |
| **Auteur** | Lambogames |
| **Plateforme** | Windows PE64, console, C++/CLI mixed-mode (CLR 4) |
| **SHA-256** | `853f2980702c9ea4e9092fcc75436fe7a227513120fc2b7a37039a2814450c14` |

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/CrackMe_Protected.exe` | binaire d'origine (non modifié) |
| `tools/lambogames-solve.py` | solveur (`-q`, `--check <exe>` via `xvfb-run wine`) |

## Réponse

Pas de user : un seul mot de passe.

```
SUPER_SECRET_KEY
```

```bash
python3 tools/lambogames-solve.py -q --check original/CrackMe_Protected.exe
```

## Premier regard

- `file` : PE32+ console « Mono/.Net assembly », DIE : MSVC 19.44 + CLR → **C++/CLI mixed mode**. Section inhabituelle `.nep`.
- `strings` : seulement du bruit CRT/CLR ; pas de mot de passe en clair. Les messages (`Enter the secret password:`, `Correct Password!`…) sont XORés (clés `0x5d`, `0xba`, `0x6d`, `0x7b`) et décodés à l'exécution ; `.rdata` contient les masques `]]]]…`, `mmmm…`.
- `ilspycmd -p -o /tmp/lg/src original/CrackMe_Protected.exe` donne un `_0xC._0x0` factice (`while(true) Sleep(1000)`) : le vrai code est **natif**.

## Flow

1. `main` → `_0xD()` → `_0xB()` remplit des globaux : `l` (longueur), `k` (clé octet), `c[]` (table).
2. `_0xD` retrouve par réflexion la méthode `_0xC._0x0` (nom XOR `0x55`), la `PrepareMethod`, puis `_p` **écrase son code JIT** par un saut vers le code natif (`.text`, ~`0x140001110`) : c'est lui qui affiche le prompt, lit l'entrée et appelle le vérificateur.
3. Vérificateur natif à `0x1400010b0`.

## Comment on trouve

**Vérificateur** (`objdump -d -M intel --start-address=0x1400010b0`) :

```asm
call strlen                      ; eax = len(input)
cmp  eax, [0x14000c260]          ; == l ?
movzx r9d, byte [0x14000c264]    ; k
lea  r10, [0x14000c270]          ; c[]
...
movzx ecx, r9b
xor  cl, [input+i]               ; input[i] ^ k
cmp  cl, [c+i]                   ; == c[i] ?
```

Donc `password[i] = c[i] ^ k`, longueur `l`. Les globaux `l`, `k`, `c` sont vides dans le fichier (`.data` à `0x14000c260…`) : ils sont posés au démarrage par `_0xB` à partir de **`DynamicMethod`** dont l'IL est émis à l'exécution (anti-lecture statique).

**Décodage des DynamicMethod** (`_0xA.cs`) : chaque opcode est donné par son *nom* XORé (`_z`, clé par appel), retrouvé par `OpCodes` par réflexion (`_og`) puis `ILGenerator.Emit` (`_invoke`). Lu à la main :

- `_0x3()` : `ldc.i4 91 ; conv.u1 ; ret` → **k = 91 = 0x5b**.
- `_0x2()` : `ldc.i4 16 ; newarr byte`, puis 16 fois `dup ; ldc.i4 idx ; ldc.i4 val ; stelem.i1` → **l = 16** et
  `c = [8,14,11,30,9,4,8,30,24,9,30,15,4,16,30,2]`.

**Assemblage** : `c[i] ^ 0x5b` → `53 55 50 45 52 5f 53 45 43 52 45 54 5f 4b 45 59` = `SUPER_SECRET_KEY`.

Pièges : le C# décompilé ne montre pas le vrai check (corps patché) ; `strings` ne donne rien car tout est XORé / construit en IL dynamique.

## Vérification

```text
$ python3 tools/lambogames-solve.py -q --check original/CrackMe_Protected.exe
SUPER_SECRET_KEY
Enter the secret password:
Correct Password!

$ echo petik | xvfb-run -a wine original/CrackMe_Protected.exe
Enter the secret password:
Wrong Password!
```

Statique uniquement (pas de session GDB / x64dbg) ; preuve live sous Wine.

## Notes

Pas de user/login. L'analyse a été faite avec `ilspycmd` + `objdump`, sans MCP IDA.
