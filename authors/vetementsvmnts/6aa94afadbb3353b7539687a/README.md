# vetementsvmnts's KeygenMe

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/6aa94afadbb3353b7539687a) · id `6aa94afadbb3353b7539687a`

ELF64 console **name → serial**. Diff. site **1.7**.  
Famille : [`../README.md`](../README.md).

| Fichier | Rôle |
|---|---|
| [`original/keygen_crackme`](original/keygen_crackme) | binaire (non strippé, symbole `main`) |
| [`tools/keygenme-solve.py`](tools/keygenme-solve.py) | keygen / `--check` |

## Réponse

| | |
|---|---|
| **Name** (exemple) | `petik` |
| **Serial** | `3910` |
| Formule | `sum(ord(c) for c in name) * 7 + 0x7b` |
| OK | `Correct! Access Granted.` |
| KO | `Wrong serial. Access Denied.` |

```bash
python3 tools/keygenme-solve.py -q --name petik
# 3910
printf 'petik\n3910\n' | ./original/keygen_crackme
# ou :
python3 tools/keygenme-solve.py --name petik --check
```

---

## 1. Premier regard

```text
keygen_crackme: ELF 64-bit LSB pie executable, x86-64, dynamically linked, not stripped
sha256  b8bf4521ee2faf1d7c9552cc905f5d16e1c3c0d4882e00727ca48f1da21b0690
size    ~16 KiB
```

```bash
strings -n 4 original/keygen_crackme
nm -C original/keygen_crackme | grep main
```

Messages et I/O tout de suite visibles :

```text
Enter your name:
%49s
Enter your serial:
Correct! Access Granted.
Wrong serial. Access Denied.
```

Imports utiles : `printf`, `scanf` (`__isoc23_scanf`), `strlen`, `puts`.  
Binaire **non strippé** → on attaque directement `main` (VMA `0x1169` telle que `objdump` la montre sans rebase).

Pas de password en clair dans `.rodata` : il faut **dériver** le serial à partir du name.

---

## 2. Flow

1. `printf("Enter your name: ")` → `scanf("%49s", name)`.
2. `printf("Enter your serial: ")` → `scanf` d’un entier (`serial` utilisateur).
3. Accumulation `sum += (signed char) name[i]` pour `i = 0 .. strlen(name)-1`.
4. Transformation de `sum`, puis comparaison au serial saisi.
5. Égalité → `Correct! Access Granted.` ; sinon → `Wrong serial. Access Denied.`.

---

## 3. Comment on trouve la formule

### 3.1 Ancrage sur `main`

```bash
objdump -d -M intel --disassemble=main original/keygen_crackme
```

### 3.2 Boucle de somme (caractères du name)

```asm
; [rbp-0x14] = sum  (init 0)
; [rbp-0x18] = i
; [rbp-0x50] = name[]
11e0:  movzx  eax, BYTE PTR [rbp+rax*1-0x50]   ; name[i]
11ea:  movsx  eax, al                          ; sign-extend
11ed:  add    DWORD PTR [rbp-0x14], eax        ; sum += name[i]
…      ; i++ ; tant que i < strlen(name)
```

Donc d’abord :

```text
sum = Σ ord(c)   pour c dans name
```

(Pour un name ASCII classique comme `petik`, `movsx` ne change rien : tous les octets sont &lt; 0x80.)

### 3.3 Le `* 7` n’apparaît pas comme `imul …, 7`

Juste après la boucle :

```asm
120b:  mov    edx, DWORD PTR [rbp-0x14]   ; edx = sum
120e:  mov    eax, edx
1210:  shl    eax, 0x3                    ; eax = sum << 3  = sum * 8
1213:  sub    eax, edx                    ; eax = 8*sum - sum = sum * 7
1215:  add    eax, 0x7b                   ; eax = sum * 7 + 0x7b
1218:  mov    DWORD PTR [rbp-0x14], eax   ; expected serial
```

Astuce classique du compilateur (réduction de force) : **`x * 7` = `(x << 3) - x`**.  
La constante finale est littérale : **`+ 0x7b`** (123 decimal).

### 3.4 Comparaison

```asm
121b:  mov    eax, DWORD PTR [rbp-0x54]   ; serial saisi
121e:  cmp    DWORD PTR [rbp-0x14], eax   ; expected == input ?
1221:  jne    denied
       ; sinon → puts("Correct! Access Granted.")
```

### 3.5 Exemple `petik`

| Étape | Calcul | Valeur |
|---|---|---|
| `ord` | `p+e+t+i+k` | `112+101+116+105+107 = 541` (`0x21d`) |
| `× 7` | `541 * 7` via `(541<<3)-541` | `3787` (`0xecb`) |
| `+ 0x7b` | `3787 + 123` | **`3910`** |

### 3.6 Pseudo-code

```python
def serial_for(name: str) -> int:
    return sum(ord(c) for c in name) * 7 + 0x7B

assert serial_for("petik") == 3910
```

---

## 4. Vérification

```text
$ printf 'petik\n3910\n' | ./original/keygen_crackme
Enter your name: Enter your serial: Correct! Access Granted.

$ printf 'petik\n0\n' | ./original/keygen_crackme
Enter your name: Enter your serial: Wrong serial. Access Denied.
```

```bash
python3 tools/keygenme-solve.py --name petik --check
# … Access Granted / OK
```

---

## 5. Notes

- Keygen **déterministe** name→entier décimal (pas de hex, pas de checksum multi-blocs).
- `scanf("%49s")` sur le name : longueur max 49 ; le solveur n’impose pas de charset.
- Reverse 100 % statique (`strings` + `objdump` sur `main`) ; GDB inutile ici.
- Piège pédagogique : chercher un `imul`/`*7` littéral et rater le couple `shl 3` / `sub`.
