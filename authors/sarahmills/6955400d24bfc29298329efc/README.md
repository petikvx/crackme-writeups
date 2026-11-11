# sarahmills's Gopher Secrets

| | |
|---|---|
| **ID** | [`6955400d24bfc29298329efc`](https://crackmes.one/crackme/6955400d24bfc29298329efc) · [`ORIGIN.yml`](ORIGIN.yml) |
| **Auteur** | sarahmills |
| **Plateforme** | Linux x86-64, ELF Go statique (non strippé) |
| **SHA-256 (ZIP)** | `7c9312c94ec40d20f7ac83867989b75ec2e71003bcd7a2f0587cfa39478a4d69` |

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/download.bin` | ZIP d'origine (mot de passe `crackmes.one`), **non modifié** |
| `analysis/extracted/challenge` | ELF extrait du ZIP |
| `analysis/main-funcs.asm` | `objdump -d -M intel` des 4 fonctions `main.*` |
| `tools/gopher-secrets-solve.py` | solveur (`-q`, `--check`) |

## Réponse

Pas de user/login : le flag est passé en `argv[1]`.

```
CTF{g0_r3v3rs3_m4st3r_1640991415}
```

```bash
python3 tools/gopher-secrets-solve.py [-q] [--check]
```

(`--check` extrait l'ELF dans un tmp et le lance avec le flag.)

## Premier regard

- `original/download.bin` n'est **pas** un ELF : magic `PK\x03\x04` → ZIP chiffré. `unzip -P crackmes.one -d analysis/extracted original/download.bin` → `challenge`.
- ELF64 statique, Go (symboles présents : `main.main`, `main.buildRealFlag`, `main.decoyChecker`, `main.validateFlag`, chemin source `/home/is44c/Music/mycrackmes/go/main.go`).
- Lancé sans argument : bannière « Welcome to the Go Reverse Challenge! » puis `Usage: ./challenge <flag>`.

## Flow

`main.main` (0x49a020) : affiche la bannière, exige `len(os.Args) >= 2`, puis

1. `decoyChecker(argv[1])` : si vrai → affiche un message de leurre et `os.Exit`.
2. `validateFlag(argv[1])` : vrai → « Excellent work! … Flag verified: … », faux → « Incorrect flag. Try again! ».

## Comment on trouve

**Ancrage** : `objdump -d -M intel --no-show-raw-insn analysis/extracted/challenge`, puis lecture des 4 fonctions `main.*` (0x499d20–0x49a2xx ; voir `analysis/main-funcs.asm`). Le binaire n'est pas strippé donc les noms sont directement visibles.

**`main.buildRealFlag` (0x499d20)** construit le flag attendu à l'exécution :

```asm
lea  rax,[4d495f]      ; "1640995200" (len 10)
mov  ebx,0xa ; mov ecx,ebx ; mov edi,0x40
call strconv.ParseInt  ; ParseInt(s, base 10, 64)
xor  rax,0x1337        ; 1640995200 ^ 0x1337 = 1640991415
call strconv.FormatInt ; base 10
; remplit un []string de 6 éléments :
;  "CTF{" (4d3efa,len4) "g0_" (4d3e8b,3) "r3v3rs3_" (4d443c,8)
;  "m4st3r_" (4d4228,7)  <nombre>        "}" (4d3e40,1)
call strings.Join      ; séparateur vide (rdi=rsi=0)
```

Les pointeurs sont des `lea` RIP-relatifs vers `go:string.*` ; les longueurs sont dans les immediates (`mov QWORD PTR [rsp+0x30],0x4`…). Lecture des octets via la table des segments `LOAD` (`readelf -lW`) pour convertir VMA → offset fichier :
`CTF{` `g0_` `r3v3rs3_` `m4st3r_` `1640995200` `}`.

Assemblage : `CTF{` + `g0_` + `r3v3rs3_` + `m4st3r_` + `str(1640995200 ^ 0x1337)` + `}`.
`1640995200` (= 2022-01-01 UTC) `^ 0x1337 (4919)` = `1640991415`.

**`main.validateFlag` (0x499f60)** : appelle `buildRealFlag`, compare les longueurs, puis boucle octet par octet (`cmp dil,sil`) ; un `time.Sleep(0x3e8)` (1000 ns, négligeable) est appelé à chaque caractère égal — simple pseudo-« anti-timing », sans effet pratique.

**`main.decoyChecker` (0x499e40)** : leurre. MD5 de l'argument, converti en hex (32 chars), comparé à une chaîne de longueur **0x30 (48)** (`cmp rbx,0x30` sur la longueur de la chaîne, alors que l'hex en fait 32) → ne peut jamais être vrai. Le chemin « leurre » de `main` n'est donc jamais emprunté ; inutile de chercher une pré-image MD5.

**Pièges** : (1) le fichier téléchargé est un ZIP, pas l'ELF ; (2) le `decoyChecker` fait perdre du temps ; (3) le flag n'est pas une constante en clair (nombre XORé à la volée), donc `strings` ne le donne pas.

## Debug GDB

Non utilisé (reverse 100 % statique + exécution directe ; `gdb` absent de la machine).

## Vérification

```text
$ ./challenge 'CTF{g0_r3v3rs3_m4st3r_1640991415}'
Welcome to the Go Reverse Challenge!
Find the correct flag to proceed...

Excellent work! You've mastered Go reversing!
Flag verified: CTF{g0_r3v3rs3_m4st3r_1640991415}
Challenge completed successfully!

$ ./challenge 'CTF{x}'
...
Incorrect flag. Try again!
```

OK (rc 0) via `python3 tools/gopher-secrets-solve.py --check`, KO avec un flag erroné. Pas de Wine nécessaire (ELF natif).

## Notes

- Binaire d'origine non modifié ; l'ELF est extrait sous `analysis/extracted/`.
- Le message de succès est aussi affiché avec le flag complet : le flag est le seul secret.
