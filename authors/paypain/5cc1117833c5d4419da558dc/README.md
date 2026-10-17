# paypain — EasyCrack - Much0l0k0

| | |
|---|---|
| **ID** | [`5cc1117833c5d4419da558dc`](https://crackmes.one/crackme/5cc1117833c5d4419da558dc) |
| **Auteur** | paypain |
| **Plateforme** | Linux ELF64 PIE, C, strippé, anti-debug `ptrace` |
| **SHA-256** | `3896a7675f6a974910c04e43d03a3fc2d0d47c8fe6b838767355aa28bdbbd267` (binaire `de_mucholoko` extrait) |

Voir [`ORIGIN.yml`](ORIGIN.yml).

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/de_mucholoko` | binaire d'origine |
| `analysis/de_mucholoko.i64` | base IDA |
| `tools/easycrack-solve.py` | flag gabarit (`-q`, `--check`) |

## Réponse

**Gabarit, flag de 39 octets exactement**, passé en 2ᵉ argument après le mot `check` :

```bash
./original/de_mucholoko check '#AAAAAA-Z##AAAA-Z###AAA-Z####AA-Z#####A'
python3 tools/easycrack-solve.py --check
```

## Premier regard

```bash
file original/de_mucholoko    # ELF64 PIE, stripped
strings -n 5 original/de_mucholoko
```

Chaînes : `[SystemProtect] Anti-debug`, `[SystemAccess]	| Welcome: Mr. Satan 666'`, `[SystemAccess]	| Flag: %s'`, `[SystemError] Unknow Format`, `Shit.. so close!!!`.

## Flow

`main` : `ptrace(PTRACE_TRACEME)` anti-debug, exige `argc==3` et `argv[1]=="check"`, valide le format de `argv[2]` (longueur exacte + 4 tirets aux bonnes positions), découpe en 5 fenêtres de 7 octets qui se chevauchent sur les tirets, et exige un nombre croissant de caractères « spéciaux » dans chaque fenêtre.

## Comment on trouve

**Ancrage** : MCP `ida` sur `original/de_mucholoko`, Hex-Rays sur `main` et les fonctions qu'elle appelle.

### Format et tirets (`sub_12DB` → `sub_125C`)

```c
// sub_12DB : compte les '-' dans argv[2], exige exactement 4
// sub_125C : les 4 tirets doivent etre aux indices 7, 15, 23, 31
```

### Les 5 fenêtres (`main`, indices lus dans `dest = argv[2]`)

```
grp1 = dest[0..6]      (7 caracteres, pas de tiret dedans)
grp2 = dest[9..15]     (dest[15] = '-', 4e tiret partage)
grp3 = dest[17..23]    (dest[23] = '-')
grp4 = dest[25..31]    (dest[31] = '-')
grp5 = dest[33..39]    (dest[39] = octet de fin de chaine si longueur==39)
```

Les octets 8, 16, 24, 32 (juste après chaque tiret) ne sont **jamais lus** — du bourrage pur.

### Le compteur de caractères « spéciaux » (`sub_13F3`)

```c
// compte les octets dans les plages ASCII (34,43] ou (59,64]
// soit '#$%&\'()*+'  et  '<=>?@'
```

Condition : `count(grp1) > 0`, `count(grp2) > 1`, `count(grp3) > 2`, `count(grp4) > 3`, `count(grp5) > 4`.

### La longueur exacte : piège (variable non initialisée)

```c
// sub_11F9() : v0 = (v3*v2+25)/5*(v3*v2+5) ; return v0+v0+15-(v3*v2+5)-99;
// v2, v3 ne sont JAMAIS initialises dans cette fonction !
// sub_13A5() : if (strlen(argv[2]) != sub_11F9() + 78) -> erreur de format
```

Comme pour [D4RKFL0W « Crackme-4 »](../../d4rkfl0w/5e0fa43b33c5d419aa01351e/), le résultat dépend du résidu laissé sur la pile par l'appel précédent — impossible à calculer par relecture statique de `sub_11F9` seule. Voir § Debug GDB.

## Debug GDB (pas à pas)

Le binaire a un anti-debug `ptrace(PTRACE_TRACEME)` : il faut d'abord le contourner avant de pouvoir lire la valeur de `sub_11F9()`.

```bash
objdump -d -M intel --no-show-raw-insn original/de_mucholoko | grep -n "ptrace\|call   11f9\|call   13a5"
#  14a3: call ptrace  ; 14a8: test rax,rax ; jns ...   <- bypass : forcer rax=0 ici
#  13c6: call sub_11F9 ; 13cb: add eax,0x4e             <- lire eax JUSTE ICI (avant le +78)
```

Base PIE standard confirmée via `starti` + `info proc mappings` : `0x555555554000`.

```bash
gdb -q -batch \
  -ex 'break *0x5555555554a8' \
  -ex 'break *0x5555555553cb' \
  -ex 'run' \
  -ex 'set $rax = 0' \
  -ex 'continue' \
  -ex 'print $eax' \
  --args ./original/de_mucholoko check 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'
```

Observé :

```text
Breakpoint 1, 0x00005555555554a8 in ?? ()
Breakpoint 2, 0x00005555555553cb in ?? ()
$1 = -39
```

→ `sub_11F9() = -39`, donc longueur requise = `-39 + 78 = 39`.

## Vérification

```bash
$ ./original/de_mucholoko check '#AAAAAA-Z##AAAA-Z###AAA-Z####AA-Z#####A'
[SystemLoading]	|
[SystemAccess]	| Welcome: Mr. Satan 666'
[SystemAccess]	| Flag: #AAAAAA-Z##AAAA-Z###AAA-Z####AA-Z#####A'

$ ./original/de_mucholoko check wrongflag
[SystemError] Unknow Format
What this m0ther fucker is trying?
```

## Notes

- Toujours lancé directement (jamais sous debugger non préparé) pour les tests normaux ; GDB n'a servi qu'à lire `sub_11F9()` au point exact de son retour, après bypass de l'anti-debug.
- Le chevauchement des fenêtres de 7 octets sur les tirets (chaque groupe se termine *sur* le tiret suivant) est le détail le plus facile à mal lire en diagonale — bien suivre les indices exacts dans `main`.
