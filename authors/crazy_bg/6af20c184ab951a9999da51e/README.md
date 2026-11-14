# crazy_bg's Picky Keygen Me!

| | |
|---|---|
| **ID** | [`6af20c184ab951a9999da51e`](https://crackmes.one/crackme/6af20c184ab951a9999da51e) · [`ORIGIN.yml`](ORIGIN.yml) |
| **Auteur** | crazy_bg |
| **Plateforme** | Windows x86-64, console, MinGW C++ (non packé) |
| **SHA-256** (`original/download.bin`) | `f85344a327308b36791917ba72facacb89066078ad88cc4d3d4f6e7416a5f13d` |

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/download.bin` | téléchargement d'origine : en réalité un **ZIP** (mot de passe `crackmes.one`) |
| `analysis/extracted/Keygen2.exe` | le PE contenu dans le ZIP (extrait avec `unzip -P crackmes.one`) |
| `tools/picky-keygen-solve.py` | keygen + `--check` (Wine) |

## Réponse

Le serial est un `int` 32 bits signé qui dépend de **trois** choses : `USER`, l'heure locale (le programme refuse de tourner si `tm_hour != 10`) et le nom du premier fichier commençant par `C`/`c` dans `%WINDIR%\System32`.

| USER | 1er fichier `C*` de System32 | heure | serial |
|---|---|---|---|
| `petik` | `c…` (minuscule, cas Wine) | 10 h | **`140249139`** |
| `petik` | `C…` (majuscule) | 10 h | `139553203` |
| `petik` | aucun | 10 h | `140370023` |

```bash
python3 -I tools/picky-keygen-solve.py                 # --user petik, scanne le system32 du prefix Wine
python3 -I tools/picky-keygen-solve.py -q --first C    # forcer la variante (C / c / n)
python3 -I tools/picky-keygen-solve.py --check analysis/extracted/Keygen2.exe
```

## Premier regard

```text
$ unzip -P crackmes.one original/download.bin -d analysis/extracted   # → Keygen2.exe
$ diec Keygen2.exe      # PE64, MinGW
$ strings Keygen2.exe | grep -i serial
Hello! Interesting name! Please, type in your serial.
That serial is wrong, acess blocked!
Serial correct! You WIN!!!
Yeah no, at this time your PC is not worth to run this.
```

`file`/`diec` sur `download.bin` donnent « ZIP » : piège classique, il faut d'abord extraire. Lancé « à froid » (`echo 123 | wine Keygen2.exe`), le programme affiche juste *« Yeah no, at this time your PC is not worth to run this. »* : c'est le garde-fou horaire, pas une anti-debug.

## Flow

`main` (`0x1400efdb0`) :

1. `localtime64(now)` ; `if (tm_hour != 10)` → message « not worth to run », `sleep 3 s`, exit (`cmp DWORD PTR [rax+8],0xa` en `0x1400efde9`).
2. Affiche l'invite, `cin >> int` (serial signé 32 bits).
3. `calculateSerial()` appelé **deux fois** (comparaison redondante) ; égalité → « Serial correct! You WIN!!! ».

## Comment on trouve

Pas de `decc`/IDA dispo ici : lecture à l'`objdump -d -M intel --no-show-raw-insn` de trois fonctions MinGW non strippées : `main`, `calculateSerial()` (`_Z15calculateSerialv`, `0x1400026f0`) et `core()` (`_Z4corev`, `0x1400015a0`).

### 1. `calculateSerial` — post-traitement du résultat de `core()`

```asm
call   core                  ; eax = h
shl    eax,4
sub    eax,5
sar    eax,2                 ; arithmétique (signé)
xor    eax,0xf7ab7037
add    eax,0x1337
mov    ecx,eax
lea    edx,[rax*8]           ; eax<<3
sar    ecx,0x1d              ; eax>>29 (signé, PAS shr)
or     edx,ecx
xor    eax,edx               ; serial
```

Équivalent : `x = ((h<<4)-5)>>2 ; x ^= 0xf7ab7037 ; x += 0x1337 ; serial = x ^ ((x<<3) | (x>>29))` avec `>>` arithmétique (piège : ce n'est pas une rotation, les 3 bits hauts sont des copies du bit de signe).

### 2. `core()` — hash dépendant de la machine

- `getenv("USER")`, sinon `getenv("USERNAME")`, sinon retourne **1** directement.
- `tm_hour` de `localtime64` → `[rsp+0x4c]`.
- `getenv("WINDIR")` + `"\System32"` (les immédiates `0x336d65747379535c` = `\System3`, puis `0x32`) ; si `WINDIR` absent, repli sur la chaîne en dur `C:\Windows\System32`.
- Un `std::filesystem::directory_iterator` parcourt ce dossier **dans l'ordre de l'OS** (pas de tri). Pour chaque entrée, on prend le nom de fichier ; si le 1er caractère est `C` (`cmp al,0x43`) → `edi=0x43`, si `c` (`cmp al,0x63`) → `edi=0x63`, et **la boucle s'arrête immédiatement** (`jmp 1400019af`). Sans aucune entrée en C/c : `edi = 0x6e` (`'n'`, valeur initiale `mov edi,0x6e` en `0x1400019aa`).
- Puis :

```asm
mov    esi,[rsp+0x4c]        ; hour
add    esi,0x539
imul   esi,edi               ; esi = (hour+0x539)*edi
loop: movsx edx,byte [rbx]   ; chaque octet de USER
      lea  esi,[rsi+rdx+0x539]
      xor  esi,0x1a
```

d'où `h = ((hour+0x539)*edi)` puis, pour chaque caractère `c` de USER : `h = (h + c + 0x539) ^ 0x1a`.

### 3. Assemblage — exemple `petik`, hour = 10, edi = `'c'` (0x63)

1. `h0 = (10+1337)*99 = 1347*99 = 133353`
2. boucle sur `p,e,t,i,k` (112,101,116,105,107) : `h = (h + c + 1337) ^ 26` à chaque pas.
3. `calculateSerial` : `<<4`, `-5`, `sar 2`, `^0xf7ab7037`, `+0x1337`, `^ (x<<3 | x>>29)` → **`140249139`** (calculé par le solveur et confirmé sous Wine, voir plus bas).

### Pièges

- `download.bin` est un ZIP, pas un PE.
- La valeur dépend du **système de fichiers** : la boucle prend le premier `C*`/`c*` **dans l'ordre retourné par l'OS**. Sous Wine, `readdir` renvoie ici `c_1250.nls`… en premier (minuscule → `0x63`). Sur un vrai Windows/NTFS (ordre alphabétique insensible à la casse) le premier serait probablement `catroot`/`catroot2` (minuscule) ou un `C_…`/`CertEnroll`… selon la liste : à vérifier sur la machine cible ; le solveur propose `--first {C,c,n}` et `--sysdir` pour reproduire l'ordre (`os.scandir`, non trié, comme `readdir`).
- La contrainte `hour == 10` est testée dans `main`, mais `core()` relit l'heure : le serial n'est donc valable que pour une exécution à 10 h (le solveur fixe `hour=10`).
- Le serial est lu par `cin >> int` : valeur signée, donc négatif possible selon la variante.

## Vérification

Pas de `faketime` ici et on ne touche pas à `original/` : `--check` fait une **copie temporaire** de `Keygen2.exe` dans laquelle l'immédiat `0x0a` du `cmp hour` est remplacé par l'heure courante (le solveur utilise alors cette même heure dans la formule), puis lance `xvfb-run -a wine` avec `USER=petik` :

```text
$ python3 -I tools/picky-keygen-solve.py --check analysis/extracted/Keygen2.exe
USER=petik first=c hour=21 -> serial = 140252903
Hello! Interesting name! Please, type in your serial.
Serial correct! You WIN!!!
```

(`first=c` est détecté automatiquement depuis le `system32` du prefix Wine.) Cas KO : serial `1` → `That serial is wrong, acess blocked!`.

La formule est identique pour `hour=10` ; seul le paramètre d'heure change (tableau « Réponse »). Le test à 10 h réelle n'a pas été fait (heure de la machine = 21 h) : la preuve live porte sur le binaire patché en mémoire/copie uniquement sur le contrôle horaire.

## Debug GDB

Non utilisé (reverse statique à l'`objdump` + preuve Wine) — pas de walkthrough GDB.

## Notes

- Aucun patch de `original/` ; la copie patchée est temporaire (`tempfile`).
- Ce n'est ni un keygen « pur » ni un crackme à mot de passe : le serial est lié à la machine (heure, utilisateur, contenu de System32), d'où le « Picky ».
