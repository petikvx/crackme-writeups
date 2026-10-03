# JoeJoeJoe's thefirsttest

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/6abc48c1ace07d1c3fbc4816) · id `6abc48c1ace07d1c3fbc4816`

ELF64 **non strippé**, GCC 16 (Red Hat), C. Diff. site **1.0**, qualité **4.0**. Publié le 2026-09-29.  
Pas de username : un entier lu sur stdin.

| Fichier | Rôle |
|---|---|
| [`original/thefirsttest`](original/thefirsttest) | binaire d'origine (12 632 octets) |
| [`tools/thefirsttest-solve.py`](tools/thefirsttest-solve.py) | password / `--check` |

## Réponse

| | |
|---|---|
| **Password** | `1923855305` |
| Immediate | `0x72abb3c9` |
| OK | `Well done, you are a master hacker!` |
| KO | `Wrong password, try agian!` |

```bash
python3 tools/thefirsttest-solve.py -q
# 1923855305
printf '%s\n' 1923855305 | ./original/thefirsttest
python3 tools/thefirsttest-solve.py --check
```

---

## 1. Premier regard

```text
thefirsttest: ELF 64-bit LSB executable, x86-64, dynamically linked, not stripped
BuildID  13bb296b4c5377f764ebbb9fde15b813fb25e51c
sha256    870ec5912a7c2c168a842b13f528a9901b130537e2d1deb83ed26f0280b4e6cf
imports   puts, __isoc23_scanf
symbole   main @ 0x400476 (99 octets)
source    thefirsttest.c (nom dans .symtab, pas le source)
```

```bash
file original/thefirsttest
strings -n 5 original/thefirsttest
```

Les chaînes utiles sont toutes dans `.rodata` :

```text
Welcome to your first test!
Please input the password:
WARNING: Please input password twice
Well done, you are a master hacker!
Wrong password, try agian!
```

Le mot « twice » et la faute « agian » sont des littéraux. Aucun password en clair : le check porte sur un entier.

---

## 2. Flow

1. Trois `puts` : bienvenue, invite, puis l'avertissement « input password twice ».
2. Un seul `scanf("%d\n", &local)` dans `[rbp-4]`.
3. `cmp eax, 0x72abb3c9` ; égalité → message de succès, sinon message d'échec.
4. `return 0` dans les deux cas.

Pas d'anti-debug, pas de seconde lecture. La chaîne « twice » n'est pas un second prompt.

---

## 3. Comment on trouve le password

### 3.1 Ancrage

Le binaire n'est pas strippé. `main` est le seul code utile :

```bash
objdump -d -M intel --no-show-raw-insn original/thefirsttest
objdump -s -j .rodata original/thefirsttest
```

Adresses = VMA (ELF `EXEC`, pas de PIE).

### 3.2 Lecture de `main`

```asm
40047e:  mov    edi, 0x4011d8
400483:  call   puts                 ; "Welcome to your first test!"
400488:  mov    edi, 0x4011f4
40048d:  call   puts                 ; "Please input the password:"
400492:  mov    edi, 0x401210
400497:  call   puts                 ; "WARNING: Please input password twice"
40049c:  lea    rax, [rbp-0x4]
4004a0:  mov    rsi, rax             ; &int
4004a3:  mov    edi, 0x401235        ; "%d\n"
4004ad:  call   __isoc23_scanf
4004b2:  mov    eax, DWORD PTR [rbp-0x4]
4004b5:  cmp    eax, 0x72abb3c9
4004ba:  jne    4004c8               ; échec
4004bc:  mov    edi, 0x401240
4004c1:  call   puts                 ; "Well done, you are a master hacker!"
4004c6:  jmp    4004d2
4004c8:  mov    edi, 0x401264
4004cd:  call   puts                 ; "Wrong password, try agian!"
4004d2:  mov    eax, 0
4004d7:  leave
4004d8:  ret
```

Les pointeurs `.rodata` se lisent à l'offset fichier `VMA - 0x400000` :

| VMA | Texte |
|---|---|
| `0x4011d8` | `Welcome to your first test!` |
| `0x4011f4` | `Please input the password:` |
| `0x401210` | `WARNING: Please input password twice` |
| `0x401235` | `%d\n` |
| `0x401240` | `Well done, you are a master hacker!` |
| `0x401264` | `Wrong password, try agian!` |

### 3.3 Décodage de l'immediate

`scanf` avec `%d` écrit un `int` 32 bits signé. L'immediate tient dans ce domaine :

```text
0x72abb3c9  =  1923855305
INT_MAX     =  2147483647
```

La forme décimale est donc la même en signé et en non signé. Le `\n` du format absorbe le retour ligne ; il ne déclenche pas une deuxième conversion.

### 3.4 Pièges

- « Please input password twice » est imprimé, jamais exécuté comme une seconde saisie.
- Un mot (`password`) ne matche pas `%d` : l'entier local n'est pas écrit, le `cmp` échoue.
- `strings` ne montre pas `1923855305` : la constante est dans l'instruction `cmp`, pas dans `.rodata`.
- Le message d'échec contient la typo `agian`.

---

## 4. Vérification

```bash
python3 tools/thefirsttest-solve.py --check
printf '%s\n' 1923855305 | ./original/thefirsttest
printf '%s\n' 0 | ./original/thefirsttest
```

| Entrée | Sortie |
|---|---|
| `1923855305` | `Well done, you are a master hacker!` |
| `0` | `Wrong password, try agian!` |
| `password` | `Wrong password, try agian!` |

Les trois `puts` du prologue s'affichent dans tous les cas. Le code de sortie est `0` même en échec.

---

## 5. Notes

- Ce n'est pas une comparaison de chaîne, ni un keygen `username → serial`.
- `__isoc23_scanf` vient de glibc 2.38 (symbole ISO C23) ; le format reste un `%d` classique.
- Reverse 100 % statique (`objdump` + `.rodata`), preuve native sur `original/thefirsttest`.
