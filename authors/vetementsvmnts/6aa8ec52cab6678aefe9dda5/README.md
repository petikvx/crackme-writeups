# vetementsvmnts's My First crackme

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/6aa8ec52cab6678aefe9dda5) · id `6aa8ec52cab6678aefe9dda5`

ELF64 console **C**, non strippé. Diff. site **1.0**.  
Famille : [`../README.md`](../README.md).

| Fichier | Rôle |
|---|---|
| [`original/my_crackme`](original/my_crackme) | binaire (symbole `main`) |
| [`tools/my-first-crackme-solve.py`](tools/my-first-crackme-solve.py) | password / `--check` |

## Réponse

| | |
|---|---|
| **Password** | `my_first_crackme` |
| OK | `Access Granted! You solved it.` |
| KO | `Access Denied.` |

```bash
python3 tools/my-first-crackme-solve.py -q
# my_first_crackme
printf '%s\n' my_first_crackme | ./original/my_crackme
# ou :
python3 tools/my-first-crackme-solve.py --check
```

---

## 1. Premier regard

```text
my_crackme: ELF 64-bit LSB pie executable, x86-64, dynamically linked, not stripped
sha256  236b6cae6332d78fe8b85ccbfef7f7ba3ddb722c1b0393dd94af8d633cfd7f6d
size    ~16 KiB
```

```bash
strings -n 4 original/my_crackme
nm -C original/my_crackme | grep main
```

Tout le dialogue et le secret sont déjà en clair dans les strings :

```text
Enter password:
%99s
my_first_crackme
Access Granted! You solved it.
Access Denied.
```

Imports : `printf`, `scanf` (`__isoc23_scanf`), **`strcmp`**, `puts`.  
Source d’origine visible dans les symboles / commentaire linker : `my_crackme.c`.  
Binaire **non strippé** → `main` à VMA `0x1169` (adresses `objdump` sans rebase).

Même taille / toolchain que le [KeygenMe](../6aa94afadbb3353b7539687a/) de la même famille (GCC Debian 15.3, ~16 KiB) — ici le prédicat est encore plus simple.

---

## 2. Flow

1. `printf("Enter password: ")`.
2. `scanf("%99s", buf)` → buffer local `[rbp-0x70]`.
3. `strcmp(buf, "my_first_crackme")`.
4. Retour `0` → `puts("Access Granted! You solved it.")` ; sinon → `puts("Access Denied.")`.

Pas d’anti-debug, pas de XOR, pas de keygen name→serial : password **fixe** en `.rodata`.

---

## 3. Comment on trouve le password

### 3.1 Voie la plus courte : `strings`

Dès le premier regard, `my_first_crackme` apparaît **à côté** du prompt et des messages OK/KO.  
Avec l’import `strcmp`, l’hypothèse naturelle est : comparaison directe contre cette C-string.

Confirmation live immédiate :

```bash
printf '%s\n' my_first_crackme | ./original/my_crackme
# Enter password: Access Granted! You solved it.
```

### 3.2 Confirmation dans `.rodata`

```bash
objdump -s -j .rodata original/my_crackme
```

```text
2008  Enter password:
2019  %99s
201e  my_first_crackme          ← littéral attendu
2030  Access Granted! You solved it.
204f  Access Denied.
```

### 3.3 Confirmation dans `main` (`strcmp`)

```bash
objdump -d -M intel --disassemble=main original/my_crackme
```

```asm
; prompt
1171:  lea    rax, [rip+0xe90]        # "Enter password: "
1180:  call   printf@plt

; lecture
1185:  lea    rax, [rbp-0x70]         # buf
1189:  lea    rdx, [rip+0xe89]        # "%99s"
119b:  call   __isoc23_scanf@plt

; prédicat
11a0:  lea    rdx, [rip+0xe77]        # 201e → "my_first_crackme"
11a7:  lea    rax, [rbp-0x70]         # buf
11ab:  mov    rsi, rdx
11ae:  mov    rdi, rax
11b1:  call   strcmp@plt
11b6:  test   eax, eax
11b8:  jne    denied                  # ≠ 0 → Access Denied
       ; sinon puts("Access Granted! …")
```

Le second argument de `strcmp` pointe pile sur le littéral `.rodata` `0x201e` — pas de déchiffrement, pas de table.

### 3.4 Pseudo-code

```c
char buf[0x70];
printf("Enter password: ");
scanf("%99s", buf);
if (strcmp(buf, "my_first_crackme") == 0)
    puts("Access Granted! You solved it.");
else
    puts("Access Denied.");
```

---

## 4. Vérification

```text
$ printf 'my_first_crackme\n' | ./original/my_crackme
Enter password: Access Granted! You solved it.

$ printf 'wrong\n' | ./original/my_crackme
Enter password: Access Denied.
```

```bash
python3 tools/my-first-crackme-solve.py --check
# … Access Granted / OK
```

---

## 5. Notes

- Diff. **1.0** : intro classique « password in strings / strcmp ».
- `scanf("%99s")` : pas d’espaces dans le password ; longueur max 99.
- Reverse 100 % statique (`strings` suffit ; `objdump` pour croiser) ; GDB inutile.
- Suite de la famille un cran au-dessus : [KeygenMe](../6aa94afadbb3353b7539687a/) (`sum*7+0x7b`), [Tricky](../6aac1a61dbb3353b753968c0/) (XOR + ptrace).
