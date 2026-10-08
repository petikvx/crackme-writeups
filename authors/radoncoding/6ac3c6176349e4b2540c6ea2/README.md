# RadonCoding's binsafe

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/6ac3c6176349e4b2540c6ea2) · id `6ac3c6176349e4b2540c6ea2`

PE64 **MinGW-w64** console, protégé par l’obfuscateur open-source **[binsafe](https://github.com/RadonCoding/binsafe)** (VM, sections `💀` / `☠️`). Description site : *Challenge #3 for an open-source obfuscator.* Quality **4.0**.

| Fichier | Rôle |
|---|---|
| [`original/crack-me.protected.exe`](original/crack-me.protected.exe) | PE protégé |
| [`tools/binsafe-solve.py`](tools/binsafe-solve.py) | serial / `--check` (Wine) |
| [`analysis/main.cpp`](analysis/main.cpp) | source publié `examples/cpp/crack-me/main.cpp` |

## Réponse

| | |
|---|---|
| **Serial** | `0xP4553D17501P455` |
| **Flag site** | `CMO{0xP4553D17501P455}` |
| OK | `Access granted.` |
| KO | `Access denied.` |
| usage | `Usage: crack-me <serial>` (exit 1 si pas d’`argv[1]`) |

```bash
python3 tools/binsafe-solve.py -q
# 0xP4553D17501P455
wine original/crack-me.protected.exe '0xP4553D17501P455'
# Access granted.   (libstdc++-6.dll + libgcc_s_seh-1.dll à côté de l’exe)
python3 tools/binsafe-solve.py --check
```

Login **fixe** (pas un keygen name→serial). L’exe n’imprime pas `CMO{…}` ; la soumission auto-validée crackmes.one est `CMO{0xP4553D17501P455}`.

---

## 1. Premier regard

```text
crack-me.protected.exe  PE32+ console x86-64  22 sections
sha256  5915033807c7405d129fdbb5e96f769d636a95e09845b77bc621e86cafe9a901
size    215161
GCC     (Rev5, Built by MSYS2 project) 16.1.0
```

```bash
strings -n 6 original/crack-me.protected.exe | grep -E 'Usage|Access|binsafe'
nm -C original/crack-me.protected.exe | grep -E 'validate|main'
objdump -h original/crack-me.protected.exe
```

| | |
|---|---|
| `Usage: crack-me <serial>` | `argv[1]` obligatoire |
| `Access granted.` / `Access denied.` | verdict |
| section `.binsafe` | RVA `0x3000`, fonctions marquées `BINSAFE` |
| sections `💀` / `☠️` | runtime VM (code + data mélangés) |
| DWARF | seulement le CRT MinGW, pas le `main.cpp` du crackme |

Le serial **n’est pas** une C-string. `strings` ne montre ni `0xP455` ni le tableau `constraints`.

Symboles encore là (Itanium) :

```text
main                                            0x140003430
validate(char const*)                           0x1400033f0
validate<0, constraints> … <31, constraints>    0x1400033d0 … 0x140003000
```

32 instantiations `Ly0`…`Ly31` → 32 contraintes, donc **17** caractères (`(32/2)+1`).

---

## 2. Flow

`main` et tout `validate` vivent dans `.binsafe` et sont **virtualisés** : chaque fonction commence par un stub

```asm
; exemple validate<0>  VMA 0x1400033d0
68 ac 02 cc 11          push   0x11cc02ac      ; id de bloc VM
e8 …                    call   0x1400260d1     ; dispatcher (section 💀)
…
eb ce                    jmp    validate<1>     ; chaîne i → i+1
```

Le dispatcher est dans la section emoji (VMA `0x1400260d1`). Les immediates du prédicat sont chiffrées dans le bytecode (pass *Encryption* de binsafe) : on ne relit pas le tableau `Constraint` en `.rdata`.

Côté source (avant protection), le flow est :

1. `argc < 2` → usage, exit 1.
2. `validate(argv[1])` : longueur exacte 17 (pas de NUL interne, octet 17 == NUL).
3. `validate<0>(serial)` puis récursion templates `i+1` jusqu’à `i == 32` → `true`.
4. Chaque cran : `serial[i] + serial[i+1]` et `serial[i] ^ serial[i+1]` vs constantes.

---

## 3. Comment on trouve le serial

### 3.1 Ancrage binaire

```bash
nm original/crack-me.protected.exe | c++filt | grep validate
objdump -d -M intel --start-address=0x1400033f0 --stop-address=0x1400034b0 \
    original/crack-me.protected.exe
```

`validate(char const*)` (VMA `0x1400033f0`) est un stub VM, puis un `jmp` vers `validate<0>`. `main` (`0x140003430`) est le même motif (`push imm` / `call 0x1400260d1`).

Le déchiffreur de VM n’est pas nécessaire : les **noms** suffisent à identifier l’exemple officiel.

### 3.2 Source publié = le crackme

Le README binsafe pointe `examples/`. Le dossier [`examples/cpp/crack-me/main.cpp`](https://github.com/RadonCoding/binsafe/blob/main/examples/cpp/crack-me/main.cpp) (copie : [`analysis/main.cpp`](analysis/main.cpp)) a :

- les mêmes strings `Usage: crack-me <serial>`, `Access granted.`, `Access denied.`
- `BINSAFE` sur `main` / `validate` → section `.binsafe`
- `create("0xP4553D17501P455")` → `(17-1)*2 = 32` contraintes
- `template <size_t i, auto &constraints> bool validate(...)` → exactement les 32 symboles `Ly0`…`Ly31`

Le binaire crackmes.one s’appelle `crack-me.protected.exe` : sortie typique de

```text
cargo run --release --bin obfuscator -- crack-me.exe --virtualization
```

### 3.3 Prédicat

```cpp
constexpr auto constraints = create("0xP4553D17501P455");
```

`create` pose, pour chaque paire adjacente `(a, b)` :

| op | test |
|---|---|
| `Add` | `(uint8_t)(serial[i] + serial[i+1]) == (uint8_t)(a + b)` |
| `Xor` | `(uint8_t)(serial[i] ^ serial[i+1]) == (uint8_t)(a ^ b)` |

Add + Xor d’une paire détermine les deux octets (mod 256, avec retenue gérée par le `uint8_t`). 16 paires chaînées → la chaîne de 17 octets est **unique**. C’est le littéral passé à `create`.

Leet : `0xP4553D17501P455` ≈ `0xPASSED17501PASS`.

### 3.4 Exemple (première paire)

| i | chars | Add | Xor |
|---|---|---|---|
| 0 | `'0'` `0x30`, `'x'` `0x78` | `0xa8` | `0x48` |
| 1 | `'x'` `'P'` | `0xc8` | `0x28` |
| … | … | … | … |
| 15 | `'5'` `'5'` | `0x6a` | `0x00` |

`validate<0>` vérifie Add de `(0,1)`, `validate<1>` Xor de `(0,1)`, etc. jusqu’à `validate<31>`.

### 3.5 Pièges

- Le serial n’est **pas** dans le PE en ASCII ; le chercher au `strings` échoue.
- Les octets après le `call` VM dans `.binsafe` sont du bytecode / du padding, pas du x86 fiable (`objdump` décode n’importe quoi).
- `Sub` existe dans l’enum mais `create()` ne l’émet pas.
- Wine sans `libstdc++-6.dll` (MinGW) sort souvent **53** sans message.

### 3.6 Pseudo-code

```python
KEY = b"0xP4553D17501P455"

def check(serial: bytes) -> bool:
    if len(serial) != 17:
        return False
    for i in range(16):
        a, b = serial[i], serial[i + 1]
        ea, eb = KEY[i], KEY[i + 1]
        if ((a + b) & 0xFF) != ((ea + eb) & 0xFF):
            return False
        if (a ^ b) != (ea ^ eb):
            return False
    return True
# check(KEY) is True
```

---

## 4. Vérification

Wine + DLLs MinGW (`libstdc++-6.dll`, `libgcc_s_seh-1.dll`, `libwinpthread-1.dll`) à côté de l’exe :

```text
$ wine crack-me.protected.exe '0xP4553D17501P455'
Access granted.

$ wine crack-me.protected.exe 'wrong'
Access denied.

$ wine crack-me.protected.exe '0xP4553D17501P455x'
Access denied.

$ wine crack-me.protected.exe
Usage: crack-me <serial>
```

```bash
python3 tools/binsafe-solve.py --check
# Access granted.
# OK
```

Le solveur recoupe les noms mangled `validate<0>` / `<31>` dans le PE, simule Add/Xor, puis lance Wine.

---

## 5. Notes

- Mot de passe **fixe**, `argv[1]`.
- Reverse : `nm` + source public binsafe ; la VM n’a pas besoin d’être liftée pour ce challenge #3.
- x64dbg MCP injoignable depuis cette session ; preuve = Wine.
- GPL-3.0 sur le source d’exemple (copie sous `analysis/`).
