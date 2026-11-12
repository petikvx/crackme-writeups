# BadEngineer's EasiestEver

| | |
|---|---|
| **ID** | [`697fd52a16739b40dcb5dabd`](https://crackmes.one/crackme/697fd52a16739b40dcb5dabd) · [`ORIGIN.yml`](ORIGIN.yml) |
| **Auteur** | BadEngineer (`badengineer`) |
| **Plateforme** | Windows PE64 x86-64, console, MinGW-w64 (symboles non strippés) |
| **SHA-256** (`original/download.bin`, c'est le ZIP) | `b148455afb68a6e2a42ba73325be802be9b90c7a17edd3a8829ca2c9ddf10130` |

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/download.bin` | ZIP du site (mot de passe `crackmes.one`) contenant `simplecrackme.exe` — non modifié |
| `analysis/extracted/simplecrackme.exe` | exe extrait du ZIP (sha256 `b20e1cdf…1350`), pour objdump |
| `tools/easiestever-solve.py` | keygen + preuve par émulation unicorn de la vraie `PasswordCheck` |

## Réponse

Mot de passe de **≤ 16 caractères contenant au moins un caractère de chacune des 10 classes** ci-dessous.
Pas de username dans ce crackme (donc pas de `petik` à injecter) ; exemple minimal :

```
0Hta!;jzo\
```

```bash
python3 tools/easiestever-solve.py                       # 0Hta!;jzo\
python3 tools/easiestever-solve.py --len 15 --seed 3     # variante aléatoire
python3 tools/easiestever-solve.py --check original/download.bin   # preuve (unicorn)
```

## Premier regard

- `download.bin` commence par `PK\3\4` avec le flag « chiffré » : c'est un ZIP (mdp `crackmes.one`), pas un exe.
  `python3 -c "zipfile…extractall(pwd=b'crackmes.one')"` → `simplecrackme.exe` (PE32+ MinGW, symboles présents).
- `strings` : `Please enter the password : `, `Wrong Password,Try again : `, `Congrats, You deserve this!`,
  puis une URL YouTube (rickroll) ouverte par `ShellExecuteA` en cas de succès.
- Pas de `file` / `diec` / Wine / gdb sur la machine de travail : analyse statique `objdump` + émulation unicorn.

## Flow

`main` (0x140001673) : `printf("Please enter the password : ")`, `scanf("%s", buf)` (buf = `rbp-0x10`, 16 octets),
puis boucle `while (!PasswordCheck(buf)) { printf("Wrong Password,Try again : "); scanf(...); }`.
Succès → `Congrats` + `ShellExecuteA(…youtube…)`.

## Comment on trouve

Ancrage : `objdump -d -M intel simplecrackme.exe --start-address=0x140001490 --stop-address=0x140001673`
(la fonction a un symbole : `PasswordCheck`, 0x140001490).

1. Prologue : dix compteurs `QWORD` mis à 0 (`[rbp-0x8]` … `[rbp-0x50]`), puis
   `strlen(pw) > 0x10 → return 0` (`cmp rax,0x10 ; jbe`). Donc **longueur ≤ 16**.
2. Boucle sur chaque octet `c = (signed char)pw[i]`, chaîne de `if / else if` : le premier intervalle qui matche
   incrémente son compteur (asm : `cmp c,lo-1 ; jle next ; cmp c,hi ; jg next ; add [cnt],1`) :

   | # | compteur | intervalle | caractères |
   |---|---|---|---|
   | 1 | `[rbp-0x08]` | 0x30–0x34 | `0 1 2 3 4` |
   | 2 | `[rbp-0x10]` | 0x48–0x4e | `H I J K L M N` |
   | 3 | `[rbp-0x18]` | 0x74–0x79 | `t u v w x y` |
   | 4 | `[rbp-0x20]` | 0x61–0x66 | `a b c d e f` |
   | 5 | `[rbp-0x28]` | 0x21–0x26 | `! " # $ % &` |
   | 6 | `[rbp-0x30]` | 0x3b–0x3f | `; < = > ?` |
   | 7 | `[rbp-0x38]` | 0x6a–0x6d | `j k l m` |
   | 8 | `[rbp-0x40]` | 0x7a–0x7d | `z { \| }` |
   | 9 | `[rbp-0x48]` | 0x6f–0x73 (`cmp c,0x6e ; jle` exclut `n`) | `o p q r s` |
   | 10 | `[rbp-0x50]` | 0x5c–0x60 | `\ ] ^ _ `` ` |

   (Piège : la classe 3 va jusqu'à 0x79 et la classe 8 commence à 0x7a ; les intervalles sont disjoints
   car chaque test est `> lo-1` et `<= hi`, vérifié ligne par ligne.)
3. Fin de boucle : les dix compteurs sont testés `!= 0` (`cmp QWORD PTR [..],0 ; je fail`) → retour 1 sinon 0.
   Il faut donc ≥ 10 caractères, un par classe. Les compteurs n'ont pas de borne supérieure.

Assemblage : on prend un caractère par classe dans l'ordre : `0` `H` `t` `a` `!` `;` `j` `z` `o` `\` → `0Hta!;jzo\`
(10 chars). On peut ajouter jusqu'à 5 caractères de n'importe quelle classe ; au-delà de 15, `scanf("%s")` écrit
le NUL au-delà de `buf[16]` (le crackme tolère 16 mais le solveur reste ≤ 15 par prudence). Un espace est interdit
(`scanf %s` coupe aux blancs) mais aucune classe n'en contient.

## Vérification

Wine n'est pas installé sur la machine : preuve par **émulation unicorn de la vraie `PasswordCheck`** extraite du PE
(sections mappées à `0x140000000`, thunk `strlen` @ 0x140010fc0 émulé) :

```text
$ python3 tools/easiestever-solve.py --check original/download.bin
password = '0Hta!;jzo\\' (len=10)
emu PasswordCheck('0Hta!;jzo\\') = 1 ; KO attendus : [0, 0, 0]
```

KO testés : `petik` (classes manquantes), le mot de passe privé de sa classe `\ ] ^ _ \``, et mot de passe de 17 caractères.
Variante `--len 15 --seed 3` (`1Lxb#?mzs\3Jxb"`) : OK également.
La sortie console réelle (`Congrats…` + rickroll) n'a **pas** été observée sous Wine ; elle découle du flow statique
de `main` (`PasswordCheck != 0` → printf Congrats). `--wine <exe>` est prévu dans le solveur si Wine est disponible.

## Notes

- Aucune section GDB : reverse 100 % statique + émulation (pas de session gdb).
- Ce n'est pas une comparaison à un secret fixe : tout mot de passe respectant les 10 classes passe.
