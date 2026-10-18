# 0xf00's Ghost

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/682f69bd6297cca3ff7d7b9b) · id `682f69bd6297cca3ff7d7b9b`

ELF64 PIE console, **pas un crackme "serial"** : un petit gestionnaire de notes
façon pwn/heap-CTF (`Add / Update / Erase / Trigger / Leak / Chaos / Quit`)
avec une **format string** exploitable dans `5. Leak`. Diff. site **2.0**.
Famille : [`../README.md`](../README.md).

| Fichier | Rôle |
|---|---|
| [`original/ghost`](original/ghost) | binaire (PIE x86-64, stripped) |
| [`tools/ghost-solve.py`](tools/ghost-solve.py) | exploit complet, `-q` / `--check` |

## Réponse

Pas de mot de passe à entrer : le binaire s'exploite lui-même. En lançant
`tools/ghost-solve.py` sur `original/ghost`, le programme finit par afficher
(et quitter) :

```text
Congratulations, you triggered the ghost heap!
```

```bash
python3 tools/ghost-solve.py
# ... logs de l'exploit ...
# Congratulations, you triggered the ghost heap!
python3 tools/ghost-solve.py --check   # code retour 0/1, pas de sortie
```

Le script relance le binaire automatiquement (jusqu'à 5 fois) si une étape
de lecture heap tombe sur une valeur incohérente (rare, voir § Pièges) ;
en pratique il réussit du premier coup dans l'écrasante majorité des essais
(20/20 sur une série de tests).

## 1. Premier regard

```text
ghost: ELF 64-bit LSB pie executable, x86-64, dynamically linked, stripped
sha256  13d79788f097ff7371ec65c3aa0060832b1825d8113a319f7b5547363ca7056a
size    14784 bytes
```

```bash
strings -n 5 original/ghost
```

```text
Entry: %s
Note: 
[#%d] logged.
Too full.
Invalid.
New note: 
?? Resurrection ??
Erased.
Broken meta.
Leak: 
Congrats, But no Congrats!!
1. Add
2. Update
3. Erase
4. Trigger
5. Leak
6. Chaos
7. Quit
```

Binaire **stripped**, pas de symboles de debug. Les noms de fonctions
(`sub_XXXX`) viennent de l'auto-analyse IDA via le MCP `ida`
(`open_database` + `execute_python` → `db.pseudocode.get_text`).

En le lançant on obtient un menu interactif. C'est un CTF-style heap
challenge (note manager avec `malloc`/`free`, "Resurrection" évoquant un
bug use-after-free volontaire) plutôt qu'un crackme classique.

## 2. Flow — pseudocode consolidé (Hex-Rays via MCP `ida`)

### Add (`1`, `sub_13C0`)

```c
// malloc(0x18) -> struct note { data*; meta*; int magic; }
v3[0] = malloc(0x40);           // data  (buffer, 0x3F octets lus + NUL)
v4    = malloc(8);
*v4   = sub_13A0;                // meta[0] = &print_entry ("Entry: %s\n")
v3[1] = v4;
v3[2] = rand();                  // "magic" (dword à struct+16), inutilisé dans l'exploit
qword_41A0[slot] = v3;
```

### Trigger (`4`, `sub_16A0`) — le cœur de la vulnérabilité

```c
v0 = qword_41A0[id];             // struct* (si NULL -> "Invalid.")
v1 = *(void***)(v0 + 8);         // meta*
v2 = *v1;                        // fonction pointée par meta[0]
if (*(DWORD*)(v0 + 16) == 0xF00C0DE) { dword_4180 = 1; LABEL_11: ... }
if (dword_4180) goto LABEL_11;   // LABEL_11: if (v2 == sub_1960) sub_1960();
LABEL_6:
if (v2) v2();                    // <-- appel de pointeur de fonction, v2 == meta[0]
else puts("Broken meta.");
```

`LABEL_6` appelle **toujours** `v2()` si non-nul — peu importe le "magic"
(`0xF00C0DE`, "f00code" en leet, signature de l'auteur) ou `dword_4180`.
Normalement `v2` vaut `sub_13A0` (juste un `printf("Entry: %s\n", data)`).
**Si on parvient à changer le contenu du chunk `meta` pour qu'il contienne
l'adresse d'une autre fonction, `Trigger` l'appelle à notre place.**

La fonction visée, trouvée en listant toutes les fonctions du binaire via
le MCP `ida` (`db.functions`) :

```c
// sub_1960 (section .exec dédiée, 0x1960-0x19bc), __noreturn
void sub_1960() {
    char *p = &a06761nb7b600B6;    // = adresse 0x4101 = byte_4100+1
    char v0 = byte_4100;           // = *0x4100, 1er octet de la chaîne
    while (v0) { write(1, &(v0 ^ 0x42), 1); v0 = *p++; }
    exit(0);
}
```

Lu directement via `ida_bytes.get_byte` sur la plage `0x4100`, XOR `0x42` :
`"Congratulations, you triggered the ghost heap!\n"`. C'est le message de
victoire, pas un flag séparé.

### Leak (`5`, `sub_1790`) — la faille

```c
char buf[72];
printf("Leak: ");
read(0, buf, 0x3F);
buf[63] = 0;
printf(buf);           // <-- format string non contrôlée : buf = l'entrée !
```

Aucune validation : le buffer saisi par l'utilisateur est passé **comme
format** à `printf`. Lecture arbitraire (`%s` sur un pointeur qu'on fournit)
et écriture arbitraire (`%n`/`%hn`) deviennent possibles.

### Chaos (`6`) et magic `0xF00C0DE` / `0x13377331`

`sub_17F0` scanne les notes et compare le dword à `data+16` aux constantes
`0xF00C0DE` ("f00code") et `0x13377331` ("1337 7331") pour positionner
`dword_4180` — un chemin alternatif (forcer `dword_4180`, ou faire
correspondre le "magic" via le hasard de `rand()`/heap grooming de
"Resurrection") existe mais est **inutile** : `Trigger` appelle `v2()`
inconditionnellement dès qu'il est non-nul (`LABEL_6`), donc corrompre le
pointeur de fonction `meta[0]` suffit, sans toucher à `dword_4180` ni au
"magic".

## 3. Comment on trouve l'exploit

### Étape 0 — écarter les fausses pistes (lecture seule, IDA)

Le jump-table du `switch` principal (`case 0..7`) est dans `.rodata`
(`readelf -lW` : segment `LOAD 0x2000 R`, **pas** `W`) — l'écraser via la
format string segfault immédiatement (`%hn` sur de la mémoire read-only).
Même chose pour le `.got` : `readelf -d` montre `FLAGS BIND_NOW` et un
segment `GNU_RELRO 0x3d50..0x4000` qui couvre exactement `.got` — **Full
RELRO**, donc le GOT est remis en lecture seule au démarrage par le loader.
Seules `.data`/`.egg`/`.ghost`/`.bss` (à partir de `0x4000`, hors RELRO) et
le **heap** restent inscriptibles. Les deux ont été vérifiés en pratique
(`original/ghost` segfault avec `rc=-11` en ciblant la jump-table ou le
GOT) avant de changer de cible — pas de patch deviné sans test.

### Étape 1 — leak de la base PIE

`printf("%17$p")` sur `5. Leak` : la position **17** des arguments variadiques
tombe exactement sur l'adresse de retour du `call sub_1790` (case `5` du
`switch` dans `main`, VMA `0x126a` vue dans le désassemblage IDA) restée en
mémoire sur la pile juste avant notre propre frame. Vérifié en testant
plusieurs positions (`%1$p`…`%40$p`) et en reconnaissant, parmi les valeurs
qui partagent un même préfixe haut (indice d'une adresse PIE), celle dont
`valeur - 0x126a` est alignée sur `0x1000` (propriété d'une base PIE) :

```text
leak = 0x5bc36a54026a  ->  base = leak - 0x126a = 0x5bc36a53f000  (% 0x1000 == 0 ✓)
```

Position **6** correspond toujours au tout premier octet de notre propre
buffer (vérifié en envoyant `"AAAAAAAA"` → `%6$p` renvoie `0x4141414141414141`) :
c'est la base qui permet ensuite tout le reste (lecture/écriture arbitraires
via des pointeurs qu'on place soi-même dans le buffer, référencés par leur
position).

### Étape 2 — lecture arbitraire (`%N$s`)

En plaçant une adresse cible dans le buffer et en la référençant par sa
position avec `%s`, `printf` la **déréférence** et imprime les octets
trouvés là-bas (jusqu'au premier `0x00`). Piège : une adresse 64 bits "réelle"
a ses 2 octets hauts à `0x00` ; si on la met en tête du buffer, elle termine
la "chaîne" **avant** même d'atteindre la directive `%N$s` plus loin dans le
texte. Solution : le texte vient **en premier** (paddé à 8 octets), l'adresse
**après** :

```python
payload = b"%7$s" + b"AAAA" + struct.pack("<Q", addr)   # texte (8o, pos. 6) puis addr (pos. 7)
```

Utilisé deux fois en chaîne : lire `qword_41A0[0]` (adresse `base+0x41a0`,
.bss) donne le pointeur de la **struct note** sur le heap ; lire `struct+8`
donne le pointeur **meta** — la cible finale.

### Étape 3 — écriture arbitraire (`%hn` ×2) sans connaître `meta` à l'avance

Classique "write-what-where" : padder le compteur de caractères déjà imprimés
à la valeur 16 bits voulue (`%<pad>c`) puis l'écrire avec `%N$hn` (position
= l'adresse placée dans le buffer). On ne réécrit que les **32 bits bas**
du pointeur `meta[0]` : les 32 bits hauts d'une adresse `sub_1960` (nouvelle
valeur) et de `sub_13A0` (ancienne valeur) sont **identiques**, car les deux
sont des adresses du même binaire PIE — donc déjà corrects, pas besoin d'un
3ᵉ mot de 16 bits (qui aurait fait dépasser les 63 octets du buffer).

```python
value  = (base + 0x1960) & 0xFFFFFFFF      # sub_1960, tronqué à 32 bits
payload = fmt_write_low32(meta_ptr, meta_ptr + 2, value)
```

Piège rencontré en développant ça : la position d'argument de `meta_ptr`
dépend de la longueur du texte des directives (`%<pad>c%N$hn…`) qui vient
*avant* lui dans le buffer — texte dont la longueur dépend elle-même du
nombre de chiffres de `<pad>`. Résolu par point fixe (la position reste à
1 chiffre, donc ça converge en une itération) plutôt que supposé fixe.

### Étape 4 — déclenchement

`4. Trigger` sur le slot 0 : `v2 = meta[0]` vaut maintenant l'adresse de
`sub_1960`, qui est appelée sans condition (`LABEL_6`) → message affiché,
`exit(0)`.

## 4. Pièges

- **Pas de pty** pour piloter le binaire : `pexpect` (pty) fait de
  l'édition de ligne côté terminal et **mutile** les payloads binaires
  (un octet `0x00`/`0x0a` au milieu d'une adresse est traité comme un
  caractère de contrôle). Le solveur utilise des pipes bruts (`subprocess.Popen`
  + `select`/`os.read`), sans pty.
- **Jump-table en `.rodata`, GOT en Full RELRO** : deux cibles d'écriture
  "classiques" qui segfault ici (vérifié, pas supposé) — voir Étape 0.
- **Ordre texte/adresse dans le buffer format-string** : toute adresse
  64 bits placée *avant* le texte des directives tronque le format au
  premier octet `0x00` (systématique, puisque les adresses réelles sont
  sur 48 bits). Toujours texte d'abord, adresses après, alignées sur 8 octets.
- **Fiabilité heap (~90-95 %/run)** : rarement, la lecture de `qword_41A0[0]`
  ou de `meta` tombe sur une valeur incohérente (artefact du canal de
  communication, pas un vrai alea du binaire : aucun `Erase`/`rand()` n'est
  utilisé dans cet exploit). Le solveur détecte le cas (adresse heap dont les
  32 bits hauts ne correspondent pas à la base PIE) et relance le binaire
  (jusqu'à 5 fois) plutôt que de continuer sur une valeur fausse.

## 5. Vérification

```text
$ python3 tools/ghost-solve.py
[+] base PIE       = 0x5810b2ec5000
[+] note[0] struct = 0x5810e01d5010
[+] note[0] meta   = 0x5810e01d5080
[+] *meta <- 0x5810b2ec6960 (payload 48o)
Congratulations, you triggered the ghost heap!

$ for i in $(seq 1 20); do python3 tools/ghost-solve.py --check; echo $?; done | sort | uniq -c
     20 0
```

20/20 succès sur une série de lancements indépendants (chaque run relance le
binaire, donc ré-tire l'ASLR). Edge case testé : lancer `4. Trigger` sur un
slot vide (`qword_41A0[id] == 0`) → `"Invalid."`, pas de crash — confirme
que le binaire d'origine, non modifié par l'exploit, gère bien ce cas (pas
de condition de victoire "gratuite").

## 6. Notes

- Ce n'est **pas** un crackme à formule/serial : la "réponse" est l'exploit
  lui-même (une format string → write-what-where → hijack de pointeur de
  fonction). Rien n'est patché dans `original/ghost` ; tout passe par
  l'entrée standard du binaire tel que fourni.
- Reverse **100 % statique via le MCP `ida`** (pseudocode Hex-Rays,
  `ida_bytes` pour le message XORé, `readelf`/`strings` pour les sections
  et protections) + **vérification dynamique en boîte noire** (pipes vers
  le binaire natif, pas de GDB utilisé) — donc pas de section "Debug GDB"
  ici (voir `AGENTS.md`, § Debug GDB : uniquement si GDB a servi).
- `dword_4180` et le "magic" `0xF00C0DE`/`0x13377331` (option `6. Chaos`)
  sont un chemin alternatif plus retors (heap grooming autour du bug
  "Resurrection" de `3. Erase`) volontairement **non emprunté** : le hijack
  direct du pointeur `meta[0]` via la format string est plus court et
  totalement déterministe une fois la base leakée.
