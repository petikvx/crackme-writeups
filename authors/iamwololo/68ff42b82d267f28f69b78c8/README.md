# iamwololo's Matryoshka

| | |
|---|---|
| **ID** | [`68ff42b82d267f28f69b78c8`](https://crackmes.one/crackme/68ff42b82d267f28f69b78c8) · [`ORIGIN.yml`](ORIGIN.yml) |
| **Auteur** | iamwololo |
| **Plateforme** | Linux ELF64 x86-64 (C / GCC 15.2), dans 2 ZIP imbriqués |
| **SHA-256** | `f0ae9c5d3784212ae0cb97c724204fc554a5ea91f07a02810393c7a93d8d523d` |

## Contenu

| Fichier | Rôle |
|---|---|
| `original/download.bin` | en réalité un ZIP (non modifié) |
| `tools/matryoshka-solve.py` | solveur : déballe les ZIP, pèle les couches XOR, calcule la clé, `--check` |

## Réponse

```text
./matryoshka fb39        →  u win good job!!!!
```

La clé est fixe (pas de nom d'utilisateur, donc pas d'exemple `petik`).

```bash
python3 -I tools/matryoshka-solve.py --check
```

## Premier regard

- `download.bin` commence par `PK` : c'est un ZIP chiffré (mot de passe du site, `crackmes.one`) contenant `crackme.zip`.
- `crackme.zip` (même mot de passe) contient `matryoshka` (ELF64) et `readme.txt` (« usage: ./matryoshka key », « it's supposed to print `u win good job!!!` »).
- `strings` sur l'ELF : `memfd_create`, `fdopen`, `fwrite`, `ftruncate`, `execve`, `/proc/self/fd/%d` → un loader qui exécute un ELF embarqué en mémoire. Les couches internes ont exactement la même structure (poupées russes).

## Flow

Chaque couche, dans `main` (ex. couche 0 : `0x11c9`) :

1. `argc != 2` → `puts("usage: ./matryoshka key")`.
2. `k = argv[1][0] - C` (C diffère selon la couche).
3. XOR de tout le blob embarqué (`.data` + 0x20, taille = dernier dword de `.data`) avec `k`.
4. `memfd_create(.., MFD_CLOEXEC)` + `ftruncate` + `fwrite` + `rewind`, puis `execve("/proc/self/fd/N", {"", argv[1]+1})`.
5. Une mauvaise clé donne un blob qui n'est pas un ELF : l'`execve` échoue et le programme sort **sans rien afficher** (rc 0).

La dernière couche est un petit programme : `atoi(argv[1]) == 9` → `puts("u win good job!!!!")`.

## Comment on trouve

**Ancrage.** `python3 -I` + `zipfile` pour déballer (pas de `file` sur la machine). Puis `objdump -d -M intel` sur l'ELF extrait.

**Lecture.** Extrait de `main` couche 0, commenté :

```asm
11e... movzx eax, BYTE PTR [rax]   ; argv[1][0]
1211   sub   eax, 0x57             ; k = c - 0x57
...    mov   eax, [ea60]           ; taille du blob
1246   lea   rdi, [4080]           ; blob chiffré dans .data
124f   call  1344                  ; xor_buf(blob,size,k) -> memfd -> execve
```

La routine `12f4` est la boucle `buf[i] ^= k`. Le blob est en clair à `0x4080` ; son XOR avec `k` doit redonner `7f 45 4c 46`.

**Décodage.** Plutôt que de deviner : pour chaque couche on essaie les 256 valeurs de `k` jusqu'à obtenir `\x7fELF`, puis `char = k + C` où `C` est l'immédiat du `sub eax, C` lu dans `main` :

| Couche | `C` | `k` (xor) | caractère |
|---|---|---|---|
| 0 | `0x57` | `0x0f` | `f` |
| 1 | `0x57` | `0x0b` | `b` |
| 2 | `0x30` | `0x03` | `3` |
| 3 (finale) | `atoi == 9` | – | `9` |

**Assemblage.** `f` + `b` + `3` + `9` = **`fb39`**. Chaque couche consomme un caractère et passe `argv[1]+1` à la suivante.

**Pièges.**
- La taille du blob est un dword stocké à la fin de `.data` (`0xea60` en couche 0) ; ne pas retirer les `\0` finaux après XOR (ils deviennent `0x0f`, donc font partie du blob).
- Le premier essai avec `C = 0x57` partout donnait `fbZ9` : faux, la couche 2 utilise `0x30` (chiffre ASCII). Toujours relire `C` à chaque couche.
- Sans clé valide aucune sortie, donc le test de réussite est la présence du message.
- Pas de GDB utilisé : reverse statique + exécution native.

## Vérification

```text
$ ./matryoshka fb39
u win good job!!!!
$ ./matryoshka fb38      # KO : rien, rc 0
$ ./matryoshka fbZ9      # KO (erreur de couche 2) : rien
$ python3 -I tools/matryoshka-solve.py --check
clé : fb39
OK : 'u win good job!!!!' | KO (fb38) : ''
```

(Exécuté sur l'ELF extrait de `original/download.bin`, qui reste intact.)
