# weissi1994 — crackme-not

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/5c53840a33c5d475210bc6e9) · id `5c53840a33c5d475210bc6e9`

ELF64 **statique**, NASM (`hello.asm`), non stripé. Premier crackme / premier asm de l’auteur — un hello-world qui demande un password dérivé du name.

| Fichier | Rôle |
|---|---|
| [`hello`](original/hello) | binaire |
| [`crackme-not-solve.py`](tools/crackme-not-solve.py) | keygen + `--check` |

## Réponse

| Name | Password |
|---|---|
| **`petik`** | **`ujynp`** |

```bash
python3 tools/crackme-not-solve.py -q
# ujynp
python3 tools/crackme-not-solve.py --check
# … Great H4x0r Skillz!!!!! … OK
```

Formule : `password[i] = name[i] + 5` (même longueur).

---

## 1. Premier regard

```text
ELF 64-bit LSB executable, x86-64, statically linked, not stripped
sha256: 2bef049184a934a16ae3e11630f17e46f05e4bbd0ef0d3a49ce4919a59ce3b7d
entry: 0x401000  (.text ~0x12d)
symbols: _start, _start.l1, _start.wrong, msg, hello, prompt, wrong, success, buf, welcome
```

Strings utiles : `Please enter your name:`, `Enter your Password:`,  
`Wrong Credentials, GTFO` / `Great H4x0r Skillz!!!!!` (ANSI rouge / vert).

---

## 2. Flow

```text
write(msg)                         # "Please enter your name: "
read(buf, 0x20)                    # name (+ \\n)
welcome ← "Hello " ‖ movq(buf)     # 8 octets du name collés après "Hello "
write(welcome, nread+6)            # affiche Hello <name>
write(prompt)                      # "Enter your Password: "
read(buf, 0x20)                    # password (écrase le name dans buf)
r15 ← nread - 1                    # strip du dernier octet (\\n)
boucle _start.l1 → success / wrong
exit(adresse de ret_code)          # bug : rdi = ptr, pas la valeur
```

Syscalls bruts (`rax` = 0/1/0x3c) — pas de libc.

---

## 3. Prédicat

Boucle (indices après `dec r15` initial = longueur password sans `\\n`) :

```asm
; r15 = len(password)
_start.l1:
  mov  r14, r15
  add  r14, 5
  mov  al,  [welcome + r14]   ; = welcome[r15+5] = name[r15-1]   (welcome+6 = name)
  add  al,  5
  cmp  al,  [buf - 1 + r15]   ; password[r15-1]
  jne  wrong
  dec  r15
  jnz  _start.l1
```

Équivalent :

```text
pour i = 0 .. len(password)-1 :
    password[i] == name[i] + 5
```

Points importants :

- La boucle suit **`len(password)`**, pas `len(name)` : un préfixe plus court suffit si les octets matchent (ex. name `hello`, password `m` → `h+5`).
- Seul un **`movq`** copie le name dans `welcome+6` → **au plus 8** caractères de name sont utilisables pour un password pleine longueur.
- Le name est lu une première fois dans `buf`, puis le password **réutilise** le même buffer.

Exemple `petik` :

| i | name | +5 | password |
|---|---|---|---|
| 0 | `p` | `u` | |
| 1 | `e` | `j` | |
| 2 | `t` | `y` | |
| 3 | `i` | `n` | |
| 4 | `k` | `p` | → **`ujynp`** |

---

---

## Debug GDB (pas à pas)

ELF64 **statique**, non stripé (`_start.l1`, `_start.wrong`).

```bash
gdb -q ./original/hello
(gdb) break *_start+52          # après read name
# attention pipe : name puis password séparés (voir solveur)
(gdb) break _start.l1
```

| Symbole | Rôle |
|---|---|
| `_start` | prompts + reads dans `buf` `@0x402074` |
| `_start.l1` | `password[i] == name[i]+5` |
| `_start.wrong` / succès | messages |

```text
(gdb) # après les deux reads, avant la boucle :
(gdb) x/s 0x40209a              # name copié (max 8)
(gdb) break *_start.l1+16       # cmp al, password
(gdb) commands
> silent
> printf "expect name+5=0x%02x vs pw=0x%02x\n", $al & 0xff, *(unsigned char*)(0x402073+$r15)
> continue
> end
(gdb) # petik → ujynp
```

Preuve : `python3 tools/crackme-not-solve.py --check` (timed stdin).

## 4. Vérification

`read()` sur un pipe peut avaler name+password d’un coup : le solveur écrit le name, attend un peu, puis le password.

```bash
python3 tools/crackme-not-solve.py --check
# Great H4x0r Skillz!!!!!
# 'petik' → 'ujynp' -> OK
```

---

## 5. Notes

- `exit` charge `rdi` avec **l’adresse** de `ret_code` (`0x402070`) au lieu de la valeur → code de retour process bizarre ; se fier au message coloré.
- Les prompts écrivent parfois un octet `\\0` (longueur hardcodée incluant le NUL de la string asm).
- Pas d’anti-debug ; idéal pour un premier contact syscalls + comparaison octet à octet.
