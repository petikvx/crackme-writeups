# Pera — Simple keygenme for beginners

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/6a8e45513b246e477b6c09a9) · id `6a8e45513b246e477b6c09a9`

Keygenme **PE64** console (MSVC 2022), débutant. Name → serial numérique.
Auteur : [Pera](https://crackmes.one/user/Pera).

Dossier : `authors/pera/6a8e45513b246e477b6c09a9/` — [famille](../README.md) · [repo](../../../README.md).

| Fichier | Rôle |
|---|---|
| [`crack.exe`](original/crack.exe) | binaire d’origine |
| [`README.md`](README.md) | ce write-up |
| [`simple-keygenme-solve.py`](tools/simple-keygenme-solve.py) | keygen |
| [`crack.exe.i64.c`](analysis/crack.exe.i64.c) | Hex-Rays (`decc`) |

## Réponse

| User | Key |
|---|---|
| **`petik`** | **`60704`** |
| `ABC` | `12805` |

```bash
python3 tools/simple-keygenme-solve.py -q
# 60704
xvfb-run -a wine original/crack.exe petik 60704
# Good job
```

---

## 1. Premier regard

```text
file original/crack.exe
# PE32+ executable (console) x86-64, for MS Windows

diec → Microsoft Visual C/C++ 19.43 / VS 2022
sha256: 4b6ee3f658260683ec2ae4cc129f7adcceafe630f36860c1908425430e4a5386
```

```text
Usage: crack.exe [text] [key for the text]
Good job / bad kitty
```

Labels site : *String / data encryption*, *XOR* — surtout cosmétique (voir notes).

---

## 2. Flow

```text
main(argc, argv)
  si argc != 3 → Usage ; return 1
  gate = sub_1000(argc*8 + 0x48)   ; pour argc=3 → 96 ; toujours ≠ 0
  key  = strtol(argv[2], 10)
  si key == formule(argv[1], argc) → "Good job"
  sinon → "bad kitty"
```

---

## 3. Prédicat

### Checksum `sub_140001020`

```c
unsigned sum = 0;
for (i = 0; i != strlen(s) + 1; ++i)   // inclut le NUL (+0)
    sum += (int)(signed char)s[i];      // movsx
```

### Clé

```text
v4  = argc/3 + 42*argc                 # argc=3 → 127
key = movsx(name[0]) * (sum ^ 3)
    + (stack_byte[4] ^ v4) - 0x62
```

`stack_byte[4] = 0x1D` (issu d’un buffer XOR « get baited lol » avec clé `0x7F` — seul cet octet entre dans la formule).

Avec `argc == 3` : `(0x1D ^ 127) - 98 = 0`, donc :

```text
key = first_char * (sum_chars ^ 3)
```

Exemples :

| Name | sum | sum^3 | first | key |
|---|---|---|---|---|
| `ABC` | 198 | 197 | 65 | **12805** |
| `petik` | 541 | 542 | 112 | **60704** |

### Gate `sub_140001000`

```asm
cmp ecx, 0x52D1      ; 21201
jne ret_with_eax     ; eax intact (= arg) → 96 ≠ 0
mov eax, 0xFFFFFFCE  ; -50
ret
```

Appelé avec `argc*8+0x48` (= 96). Jamais égal à 21201 en usage normal → **toujours passe**. Leur anti-analyse / bruit.

Hex-Rays (`analysis/crack.exe.i64.c`) simplifie à tort `sub_1000(96)` en constante et omet le `0x1D` stack — le listing asm ci-dessus fait foi.

---

## 4. Vérification

```bash
python3 tools/simple-keygenme-solve.py --check
# petik 60704 -> 'Good job'  OK
# ABC 12805 -> 'Good job'    OK
```

---

## 5. Notes

- Buffer stack XOR → `get baited lol` (`^ 0x7F`) : decoy pour le label « encryption ».
- Pas d’UI : argv only.
- User d’exemple : **`petik`**.
