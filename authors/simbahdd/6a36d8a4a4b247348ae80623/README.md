# SimbaHDD's CRACKME (2)

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/6a36d8a4a4b247348ae80623) · id `6a36d8a4a4b247348ae80623`

Crackme **PE32+ console** x86-64 (**MinGW-w64**), auteur site : **SimbaHDD**.
Dossier : `authors/simbahdd/6a36d8a4a4b247348ae80623/` — [série auteur](../README.md) · [repo](../../../README.md).

| Fichier | Rôle |
|---|---|
| [`original/download.bin`](original/download.bin) | ZIP d’origine (password `crackmes.one`), **non modifié** |
| `analysis/extracted/crackme.exe` | exe extrait du ZIP (`unzip -P crackmes.one`) |
| [`analysis/crackme.asm`](analysis/crackme.asm) | `objdump -d -M intel` complet |
| [`tools/simbahdd-crackme-solve.py`](tools/simbahdd-crackme-solve.py) | solveur (inversion) + `--check` (émulation unicorn) |

## Réponse

Pas de user : une clé fixe de **12 octets**, passée en **argv[1]**. Elle est **non imprimable** (pas de solution ASCII, voir plus bas) :

| Forme | Valeur |
|---|---|
| hex | `3c0f553c2422ac30aeafac55` |
| Python | `'<\x0fU<$"\xac0\xae\xaf\xacU'` (latin-1 / cp1252 : `<`, `^O`, `U`, `<`, `$`, `"`, `¬`, `0`, `®`, `¯`, `¬`, `U`) |

```bash
python3 tools/simbahdd-crackme-solve.py                                   # affiche la clé (hex)
python3 tools/simbahdd-crackme-solve.py -q                                # hex seul
python3 tools/simbahdd-crackme-solve.py --check analysis/extracted/crackme.exe
# sous Linux/Wine (si dispo) : wine crackme.exe "$(printf '<\x0fU<$"\xac0\xae\xaf\xacU')"
```

(Le crackme n’a pas de champ utilisateur ; `petik` n’intervient donc pas ici.)

## Premier regard

```bash
unzip -P crackmes.one original/download.bin -d analysis/extracted
strings -n 4 analysis/extracted/crackme.exe     # peu de choses
objdump -s -j .rdata analysis/extracted/crackme.exe | head
```

- PE32+ MinGW, imports `KERNEL32` + `msvcrt` (dont `strlen`, `strncmp`…), sections standard, TLS/CRT standard (callbacks vérifiés : rien de custom).
- `.rdata` @ `0x140009000` : `"Usage: %s <key>\n"`, `"nope!\n"`, `"correct! You cracked it.\n"` et, juste après, `"CR4CKM3_"` @ `0x140009038` — **leurre/cible** : ce n’est *pas* le mot de passe, c’est la valeur *attendue après transformation*.

## Flow

`main` @ `0x140007b10` : `argc == 2` sinon usage ; `strlen(argv[1]) == 12` ; boucle sur 12 octets qui transforme chaque caractère saisi et compare au tampon cible ; `correct!` / `nope!`.

## Comment on trouve

Ancrage : la seule xref sur `0x140009038` est dans `main` (`grep 140009038 analysis/crackme.asm`).

```asm
140007b20  cmp   ebx,2              ; argc == 2
140007b2c  call  strlen (thunk 0x140007a78 -> IAT 0xd328)
140007b31  cmp   eax,0xc            ; len == 12
140007b36  mov   rax,[0x140009038]  ; "CR4CKM3_" (qword)
140007b3d  mov   DWORD PTR [rsp+0x28],0x34333231   ; "1234" (immediate LE)
140007b4c  mov   [rsp+0x20],rax     ; cible = "CR4CKM3_1234" sur la pile
loop:
140007b58  movzx eax,BYTE PTR [rbx+rdx]   ; c = argv[1][i]
140007b5c  xor   eax,0x55
140007b5f  add   eax,0x7
140007b62  xor   eax,0x33
140007b65  cmp   [rcx+rdx],al              ; == cible[i] ?
140007b68  jne   nope
140007b6e  cmp   rdx,0xc / jne loop
```

Décodage :
- la cible se reconstitue en collant le qword `CR4CKM3_` (`.rdata`) et l’immediate `0x34333231` (octets LE `31 32 33 34` = `"1234"`) → `CR4CKM3_1234` ;
- transformation par octet : `t = ((c ^ 0x55) + 7) ^ 0x33` (comparaison sur l’octet bas `al`, donc mod 256, bijective) ;
- inverse : `c = (((t ^ 0x33) - 7) & 0xff) ^ 0x55`.

Exemple pour `C` (0x43) : `0x43^0x33 = 0x70` ; `-7 = 0x69` ; `^0x55 = 0x3c` (`<`). Pour `R` (0x52) : `0x61 → 0x5a → 0x0f`. Résultat complet : `3c 0f 55 3c 24 22 ac 30 ae af ac 55`.

Pièges :
- **Piège principal** : passer `CR4CKM3_1234` (ou toute chaîne « lisible ») échoue : c’est la sortie du chiffrement, pas l’entrée. Comme la transformation est une bijection sur 256 valeurs, il n’existe qu’**une** clé, et elle contient `0x0f`, `0xac`, `0xae`, `0xaf` (non ASCII).
- `strings` ne montre pas `1234` : c’est un immediate de `mov`, pas une chaîne.

## Vérification

Environnement de l’agent : **ni `wine` ni `gdb` installés** (pas de section Debug GDB, pas de preuve Wine ; la preuve est une émulation du vrai code du binaire). `--check` mappe les sections du PE d’origine dans **unicorn**, exécute `main` @ `0x140007b10` avec `argv = ["crackme.exe", clé]` (stubs : `__main`, `strlen`, `printf` interceptés) et lit le message choisi :

| Entrée | Sortie émulée |
|---|---|
| `3c0f553c2422ac30aeafac55` | **`correct`** (rc 0) |
| même clé, dernier octet `X` | `nope!` |
| `CR4CKM3_1234` | `nope!` |
| clé tronquée à 5 octets | `nope!` (len ≠ 12) |

Limite honnête : pas de run natif/Wine ; sous Windows, la clé doit passer en ANSI (cp1252 : `¬ ® ¯` valides, `\x0f` via un lanceur qui construit la ligne de commande, pas au clavier).

## Notes

- Le « mot de passe » apparent `CR4CKM3_1234` est un leurre involontaire ou volontaire : lire le sens de la comparaison est l’essentiel.
