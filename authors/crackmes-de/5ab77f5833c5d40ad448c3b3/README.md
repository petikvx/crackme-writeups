# crackmes.de's lil_crackme (`crackme2.exe`) by abcd

| | |
|---|---|
| **ID** | [`5ab77f5833c5d40ad448c3b3`](https://crackmes.one/crackme/5ab77f5833c5d40ad448c3b3) |
| **Auteur (site)** | crackmes.de (abcd) |
| **Plateforme** | Windows PE32 console, MinGW (C++/libstdc++ statique) |
| **SHA-256 (zip)** | `a44a6b76760929180f2b96675ff0d5a1004f5cf51ff8c800f2e411877aa154d2` |
| **SHA-256 (`crackme2.exe`)** | `034f534db2226dae4ca579184747ebae7440c83f611cef2505f6763468894e98` |

Voir [`ORIGIN.yml`](ORIGIN.yml). ZIP password : `crackmes.one`.

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/crackme2.zip` | archive d'origine (non modifiée) |
| `analysis/x/crackme2.exe` | exe extrait du zip (`unzip -P crackmes.one`) |
| `analysis/crackme2.asm` | `objdump -d -M intel` complet |
| `tools/lil-crackme-solve.py` | keygen (username) + création du `kernel32.dll` factice |

## Réponse

Deux conditions à remplir **ensemble** :

1. un fichier **`kernel32.dll`** dans le répertoire courant contenant `naumaan` (1er mot) ;
2. un **username de plus de 8 caractères** tel que `Σ ((10·c_i) mod (3i+3)) · (i XOR 3) = 0x1be = 446`.

| Username | Résultat |
|---|---|
| `petik!!,;` (préfixe `petik` complété par le keygen) | `Congrats!!` |
| `petik` | `Wrong!` (≤ 8 caractères → somme = 0) |

```bash
python3 -I tools/lil-crackme-solve.py              # petik!!,;
python3 -I tools/lil-crackme-solve.py --user petik -q
python3 -I tools/lil-crackme-solve.py --check 'petik!!,;'   # OK 446
python3 -I tools/lil-crackme-solve.py --write-file DIR      # DIR/kernel32.dll = "naumaan"
```

`petik` seul est refusé par le binaire (longueur ≤ 8) : on garde le préfixe `petik` et le solveur ajoute 4 caractères.

## Premier regard

```text
$ file crackme2.exe   → PE32 executable (console), Intel i386, 5 sections
$ diec crackme2.exe   → Compiler: MinGW
$ strings -n 4 …      → techfest, kernel32.dll, naumaan, Congrats!!, SOFTWARE\Microsoft\Windows\CurrentVersion\Policies
```

Gros binaire (480 Ko) car libstdc++ statique : le code utile est uniquement `_main` @ `0x401452` et `terminate()` @ `0x401390`. Chaînes `.rdata` utiles :

| VA | Chaîne |
|---|---|
| `0x441000` | `ConsoleWindowClass` |
| `0x441014` | `SOFTWARE\Microsoft\Windows\CurrentVersion\Policies` |
| `0x441047` | `techfest` (nom de valeur registre) |
| `0x441050` | `kernel32.dll` (utilisé comme **nom de fichier** local !) |
| `0x44105d` | `naumaan` |
| `0x441065` | `Congrats!!\n` |
| `0x441071` | `0` |

Piège : `Wrong!` n'est **pas** une chaîne en clair — `terminate()` (`0x401390`) l'écrit caractère par caractère (`push 0x57 'W'`, `0x72 'r'`, `0x6f 'o'`, `0x6e 'n'`, …) via `operator<<(ostream&, char)`, d'où l'absence dans `strings`.

## Flow

`_main` (@ `0x401452`) :

1. `AllocConsole`, `FindWindowA("ConsoleWindowClass")` + `ShowWindow(…, 9)`.
2. `RegOpenKeyExA(HKCU, "SOFTWARE\…\Policies")` ; échec → `terminate()` (= « Wrong! »).
3. `RegQueryValueExA(key, "techfest")` : si la valeur **existe** et que son 1er octet vaut `'0'` (`cmp BYTE PTR [ebp-0xb8],0x30` @ `0x4015c1`) → `terminate()`. C'est un verrou « une seule tentative » : un échec écrit `techfest="0"` dans le registre (cf. fin du `main`, `RegSetValueExA` @ `0x401b34`).
4. `ifstream.open("kernel32.dll")` ; si l'ouverture échoue → flag d'échec `[ebp-0x20]=1`.
5. `get(buf, 100, '.')` sur ce fichier, puis tests sur `buf` (index du 1er `,` ≤ 8 → échec ; nombre d'octets NUL…) — voir « Pièges ».
6. Prompt `Username: ` (construit à partir du tableau de caractères `U s e r n a m e`), `cin >> name`.
7. Si `len(name) > 8` : boucle de hash → `[ebp-0x23c]`.
8. Réouverture de `kernel32.dll`, `ifstream >> str` (1er mot) ; succès si `hash == 0x1be` **et** `str == "naumaan"` **et** compteur de NUL `[ebp-0x30] > 2` → affiche `Congrats!!` et met `[ebp-0x240]=0`.
9. Fin : si pas d'échec fichier et `[ebp-0x240]==0` → sortie normale ; sinon écriture `techfest="0"` + `terminate()` (`Wrong!`).

## Comment on trouve

**Ancrage** : `objdump -d -M intel crackme2.exe > analysis/crackme2.asm`, puis `grep 0x441050` (la chaîne `kernel32.dll`) → deux xrefs dans `_main` (`0x4015ef` et `0x4018f2`) : un programme qui `open()` un fichier appelé `kernel32.dll` est inhabituel, c'est le cœur du check.

**Hash du username** (`0x401846`–`0x4018cb`) :

```asm
cmp  eax,0x8            ; name.size() <= 8 → saute le hash (somme reste 0)
...
mov  eax,[ebp-0x24]     ; i
xor  eax,0x3            ; i ^ 3             → [ebp-0x3a8]
...                     ; c = name[i]
movsx edx,BYTE PTR [eax]
shl  eax,2 / add eax,edx / lea ecx,[eax+eax] ; ecx = c*10
mov  eax,i ; add eax,eax ; add eax,edx ; add eax,3 ; 3*i+3 → [ebp-0x3cc]
cdq ; idiv DWORD PTR [ebp-0x3cc]            ; edx = (10*c) mod (3i+3)  (reste !)
imul edx,[ebp-0x3a8]                         ; * (i^3)
add  [ebp-0x23c],edx                         ; somme
```

Piège : c'est le **reste** de l'`idiv` (`edx`) qui est accumulé, pas le quotient. Cible : `cmp DWORD PTR [ebp-0x23c],0x1be` @ `0x40192a`.

Le poids `i^3` vaut `3,2,1,0,7,6,5,4,11,10,…` : le caractère d'indice 3 n'a aucun effet.

**Résolution** : DP sur la somme (alphabet ASCII imprimable `0x21..0x7e`) en partant du hash partiel de `petik` (indices 0–4 : 3+4+8+0+35 = 50). Le solveur ajoute 1..5 caractères jusqu'à atteindre 446 avec longueur ≥ 9.

Exemple `petik!!,;` : `petik` contribue `p`→3, `e`→4, `t`→8, `i`→0, `k`→35 = 50, puis :

| i | c | 10·c | 3i+3 | reste | i^3 | terme | cumul |
|---|---|---|---|---|---|---|---|
| 5 | `!` | 330 | 18 | 6 | 6 | 36 | 86 |
| 6 | `!` | 330 | 21 | 15 | 5 | 75 | 161 |
| 7 | `,` | 440 | 24 | 8 | 4 | 32 | 193 |
| 8 | `;` | 590 | 27 | 23 | 11 | 253 | **446** |

**Le fichier `kernel32.dll`** : comparaison `operator==(string, "naumaan")` @ `0x40194b` (`0x44105d`) sur le mot lu par `>>` dans le fichier. Le fichier doit donc commencer par `naumaan` suivi d'un blanc/EOF. Sur Windows réel la vraie `kernel32.dll` est protégée (KnownDLLs), le fichier local n'est qu'un fichier de données ; sous Wine c'est plus délicat (voir Pièges).

## Pièges

- **Wine charge `./kernel32.dll`** : si le cwd contient un faux `kernel32.dll` *et* que l'on lance `wine crackme2.exe` depuis ce dossier, Wine échoue (`could not load kernel32.dll, status c000012f`). Solution : mettre l'exe ailleurs et lancer depuis le dossier du fichier factice :
  ```bash
  mkdir -p /tmp/lc/app /tmp/lc/exe
  cp analysis/x/crackme2.exe /tmp/lc/exe/
  python3 -I tools/lil-crackme-solve.py --write-file /tmp/lc/app
  cd /tmp/lc/app && printf 'petik!!,;\n' | xvfb-run -a wine /tmp/lc/exe/crackme2.exe
  ```
- **Clé de registre `Policies`** absente dans un préfixe Wine neuf → le binaire fait `terminate()` d'office : `wine reg add 'HKCU\Software\Microsoft\Windows\CurrentVersion\Policies' /f`.
- **Verrou `techfest=0`** : après un échec, remettre à zéro entre deux essais : `wine reg delete 'HKCU\…\Policies' /v techfest /f`.
- Les tests sur la zone de `get()` (index du 1er `,` > 8, ≥ 3 octets NUL dans le buffer non initialisé de la pile) passent avec le contenu `naumaan\n` : le buffer reste majoritairement nul sur la pile fraîche, aucun contenu particulier n'est nécessaire dans le fichier à part le mot `naumaan`.
- `Wrong!` construit caractère par caractère (invisible pour `strings`).

## Vérification (Wine / xvfb, binaire d'origine)

Session réelle (clé `Policies` créée, `techfest` supprimée avant chaque essai ; cwd = dossier contenant `kernel32.dll` = `naumaan\n`) :

```text
--- petik!!,;
Username: Congrats!!
--- wrongname123
Username: Wrong!        techfest    REG_SZ    0     ← verrou posé
--- petik
Username: Wrong!        techfest    REG_SZ    0
```

Cas OK (`petik!!,;`) et KO (`wrongname123`, `petik` trop court) confirmés.

## Debug GDB

Non utilisé : reverse statique (`objdump`) + preuve live Wine/xvfb. Pas de MCP IDA / x64dbg actif pour ce challenge.

## Notes

- Ce n'est pas un keygen « serial » : la seule saisie est le username ; la partie `kernel32.dll`/`naumaan` est une condition d'environnement.
- Solution non unique (n'importe quel username > 8 car. dont la somme vaut 446).
