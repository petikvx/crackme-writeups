# acheylate's Find the password

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/6aac1a0c585e8875bcbec009) · id `6aac1a0c585e8875bcbec009`

ELF64 **Rust** strippé (PIE). Diff. site **2.0**.  
Jumeau Windows : [`../6aac22ff48cda5a2aaa3de2d/`](../6aac22ff48cda5a2aaa3de2d/) (même password).

| Fichier | Rôle |
|---|---|
| [`original/crackme-01`](original/crackme-01) | binaire |
| [`tools/find-password-solve.py`](tools/find-password-solve.py) | password / `--check` |

## Réponse

| | |
|---|---|
| **Password** | `HVUHADN` |
| OK | `Correct Password` |
| KO | `Incorrect password` |

```bash
python3 tools/find-password-solve.py -q
# HVUHADN
printf '%s\n' HVUHADN | ./original/crackme-01
# ou :
python3 tools/find-password-solve.py --check
```

---

## 1. Premier regard

```text
crackme-01: ELF 64-bit LSB pie executable, x86-64, dynamically linked, stripped
sha256  67b49753e7e578cc2ac5c4a564e99cebe5a76535c323963c3422cc2f9e0455e4
size    ~308 KiB
```

```bash
strings -n 4 original/crackme-01 | grep -iE 'pass|correct|incorrect|enter'
```

On voit tout de suite le dialogue et les messages de verdict :

```text
Enter the password:
Incorrect password
Correct Password
```

En revanche **aucune** C-string `HVUHADN` dans le binaire. Un `strings` un peu trop large remonte seulement des fragments trompeurs du type `HVUH3` / `HADN3T` : ce ne sont **pas** des littéraux Rust, ce sont les octets des immediates **collés** aux opcodes suivants (`xor ecx, […]`, `xor edx, […]`) que `strings` lit comme du texte.

---

## 2. Flow

1. Prompt `Enter the password:`, lecture stdin (Rust `String`).
2. Check longueur + comparaison par XOR sur deux fenêtres u32 chevauchantes.
3. Succès → `Correct Password` ; sinon → `Incorrect password`.

Pas d’anti-debug, pas de keygen name→serial : juste retrouver le password.

---

## 3. Comment on trouve le password

### 3.1 Ancrage sur le check

Le prédicat est dans `.text` (PIE ; adresses ci-dessous = VMA du binaire tel que `objdump` les affiche sans rebase) :

```bash
objdump -d -M intel --start-address=0x10100 --stop-address=0x10130 original/crackme-01
```

```asm
; rsi = longueur du mot de passe (après ajustements de slice Rust)
10106:  cmp    rsi, 0x7
1010a:  jne    fail                 ; longueur ≠ 7 → Incorrect

1010c:  mov    ecx, 0x48555648      ; "HVUH" en little-endian
10111:  xor    ecx, DWORD PTR [rbx+rax]       ; password[0..3]

10114:  mov    edx, 0x4e444148      ; "HADN" en little-endian
10119:  xor    edx, DWORD PTR [rbx+rax+0x3]   ; password[3..6]

1011d:  or     edx, ecx
1011f:  je     success              ; les deux XOR nuls → Correct Password
```

Lecture immédiate → ASCII (u32 LE) :

| Immediate | Octets LE | Texte |
|---|---|---|
| `0x48555648` | `48 56 55 48` | `HVUH` |
| `0x4e444148` | `48 41 44 4e` | `HADN` |

### 3.2 Pourquoi ce n’est pas une string unique

Le check ne compare **pas** 7 octets d’affilée à une seule constante. Il exige **deux** égalités sur des fenêtres de 4 octets qui **se chevauchent d’un caractère** (offset `+0` et `+3`) :

```text
index:     0 1 2 3 4 5 6
password:  H V U H A D N
fenêtre1:  H V U H          == 0x48555648
fenêtre2:        H A D N    == 0x4e444148
```

Donc :

- `password[0:4] == b"HVUH"`
- `password[3:7] == b"HADN"`
- longueur `== 7`

Le caractère à l’index 3 doit être à la fois le `H` final de `HVUH` et le `H` initial de `HADN` → cohérent. On assemble :

```text
HVUH + ADN  =  HVUHADN
```

(`ADN` = les 3 derniers octets de la seconde immediate ; le `H` est déjà fourni par la première.)

### 3.3 Piège `strings`

Sur le fichier brut, autour de l’offset `0xf10d` :

```text
… b9 48 56 55 48 33 0c 03 ba 48 41 44 4e 33 54 03 …
     |  H  V  U  H |xor|   |  H  A  D  N |xor|
```

`strings` voit `HVUH3` puis `HADN3T` parce que `33` = opcode `xor r/m32, r32` et `54 03` suit. Ce n’est **pas** le password `HVUH3…` : il faut lire les immediates via le désassemblage (ou un dump aligné sur les `mov ecx` / `mov edx`), puis recomposer le chevauchement.

### 3.4 Pseudo-code

```python
def check(pw: bytes) -> bool:
    if len(pw) != 7:
        return False
    w0 = int.from_bytes(pw[0:4], "little") ^ 0x48555648  # HVUH
    w1 = int.from_bytes(pw[3:7], "little") ^ 0x4E444148  # HADN
    return (w0 | w1) == 0
# check(b"HVUHADN") is True
```

---

## 4. Vérification

```text
$ printf 'HVUHADN\n' | ./original/crackme-01
Enter the password: Correct Password

$ printf 'HVUHXXX\n' | ./original/crackme-01
Enter the password: Incorrect password

$ printf 'HVUHAD\n' | ./original/crackme-01    # len 6
Enter the password: Incorrect password
```

```bash
python3 tools/find-password-solve.py --check
# … Correct Password / OK
```

---

## 5. Notes

- Mot de passe **fixe** (pas de username).
- Même prédicat / même password sur le jumeau PE Windows.
- Reverse 100 % statique (`strings` + `objdump`) ; GDB inutile ici.
- Diff. 2.0 justifiée surtout par le piège « pas de C-string contiguë » + encoding LE des immediates Rust.
