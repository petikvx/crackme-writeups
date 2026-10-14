# cm1 — lagalopex (crackmes.de)

- Page : https://crackmes.one/crackme/5ab77f5833c5d40ad448c3f5 · [`ORIGIN.yml`](ORIGIN.yml)
- Plateforme : Linux ELF32 i386, dynamique, non strippé ; readme : « Get a working key/keygen. Allowed are only GPLed-tools. Patching/Hijacking prohibited ;) »
- Archive : `original/cm1.zip` → `cm1` + `readme` (extraits sous `analysis/`)
- Usage : `./cm1` (sans argument)

## Réponse

Un fichier **`<home>/.key_<utilisateur>`** (ici `~/.key_petik`) dont le contenu est :

```text
*****+*****+*****+*****-**,p*****+*****+*****+**++,e*****+*****+*****+*****+++,t*****+*****+*****+***+,i*****+*****+*****+****-,k
```

(129 octets, aucun retour à la ligne). Générateur :

```bash
python3 -I tools/cm1-solve.py petik -o ~/.key_petik      # écrit la clé pour `petik`
./analysis/cm1
# Hello petik, lets see what you've done so far...
# Seems you've got it ;)
python3 -I tools/cm1-solve.py --check                    # fait tout seul : écrit, teste (ok + clé altérée), supprime
```

La clé dépend du **nom d'utilisateur** (`pw_name`) de celui qui lance `./cm1` ; le générateur accepte n'importe quel nom.

## Premier regard

```text
$ ./analysis/cm1
Hello petik, lets see what you've done so far...
$ strings -n 6 analysis/cm1 | grep -E "Hello|key_|Seems"
Hello %s, lets see what you've done so far...     %s/.key_%s     Seems you've got it ;)
```

Pas de saisie : le binaire attend un fichier-clé dans le home (`getpwuid` → `pw_dir`, `pw_name`). Imports : `getuid`, `getpwuid`, `snprintf`, `open`, `read`, `puts`.

## Comment on trouve

**Ancrage** : `objdump -d -M intel analysis/cm1` → `main` @`0x80484d4` (symbole présent). Uniquement des outils GPL (objdump/gdb), comme le demande l'auteur.

```asm
80484eb: call getuid ; call getpwuid                ; pw = getpwuid(getuid())
8048501: push [eax] ; push 0x8048750 ; call printf  ; "Hello %s, …"   (pw_name = [pw+0])
804851c: push [eax]=pw_name ; push [eax+0x14]=pw_dir ; push 0x804877f ("%s/.key_%s") ; snprintf(path,0x1001,…)
8048537: open(path, O_RDONLY)                       ; échec -> exit(1)
        — boucle de lecture : 1 octet par read() —
8048565: c = octet lu ; al = c - 0x2a ; si al > 5 -> échec (0x804867d)
804857e: jmp [0x80487a4 + al*4]                      ; table de 6 entrées :
            '*'(0x2a) -> 804858f : esi += 5
            '+'(0x2b) -> 8048585 : esi += 1
            ','(0x2c) -> 80485bc : validation (voir ci-dessous)
            '-'(0x2d) -> 804859b : esi -= 1
            '.'(0x2e) -> 804867d : échec
            '/'(0x2f) -> 80485a5 : esi -= 5
        pour + * - / : si le caractère précédent est le même -> ebx++ (échec si > 5), sinon ebx = 1
80485bc: read 1 octet B ; B == esi ?                 ; sinon échec
80485df: esi == (signed char) name[k] ?              ; sinon échec ; k++
8048600: si name[k] == 0 : read() doit renvoyer 0 (fin de fichier)
804861a: esi /= 10                                   ; (div ecx, ecx = 10)
8048653: EOF : name[k] doit valoir 0 -> puts("Seems you've got it ;)")
```

**Lecture** : un petit « langage » à 4 opérations sur un accumulateur `esi` ; la virgule *signe* un caractère du nom : l'octet qui suit doit être la valeur courante de l'accumulateur, qui doit aussi être le caractère du nom attendu. Après chaque caractère l'accumulateur est divisé par 10 puis on continue avec les opérations suivantes.

**Keygen** : pour chaque caractère `c` du nom, plus court chemin d'opérations `{*:+5, +:+1, -:-1, /:-5}` de la valeur courante vers `c` (BFS, séries d'au plus 5 caractères identiques), puis `,` suivi de l'octet `c`. Exemple `petik` :

| Car. | valeur | départ | chemin | ensuite |
|---|---|---|---|---|
| `p` | 112 | 0 | `*****+*****+*****+*****-**` (+25+1+25+1+25+1+25−1+10) | 112 → `,p`, puis 112/10 = 11 |
| `e` | 101 | 11 | `*****+*****+*****+**++` | 101 → `,e`, 101/10 = 10 |
| `t` | 116 | 10 | `*****+*****+*****+*****+++` | `,t`, 11 |
| `i` | 105 | 11 | `*****+*****+*****+***+` | `,i`, 10 |
| `k` | 107 | 10 | `*****+*****+*****+****-` | `,k` puis EOF |

**Pièges :**
- Les séries d'un même opérateur sont limitées à 5 (compteur `ebx`) : on ne peut pas écrire 25 `*` d'affilée, il faut intercaler un autre opérateur.
- L'octet après la virgule est lu **brut** : pas de retour à la ligne ni d'espace, et rien après le dernier octet (le dernier `read` doit renvoyer 0).
- La clé est liée à `pw_name` (celui du `uid` réel), pas à `$USER`.
- `.` (0x2e) est dans la plage de la table mais mène à l'échec.

## Vérification

```text
$ tools/cm1-solve.py --check
check: OK (utilisateur petik : ok=True, clé altérée rejetée=True)
$ cat analysis/verify.txt
ok: Seems you've got it ;)
ko: (rien : clé invalide)
```

## Fichiers

- `analysis/cm1`, `analysis/readme`, `analysis/key_petik.sample` (clé de l'exemple) , `analysis/verify.txt`
- `tools/cm1-solve.py` : générateur de clé + `--check` (écrit puis supprime `~/.key_<user>`)
