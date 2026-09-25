# vetementsvmnts's trust me this is really easy :)

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/6ab2c094c2d73ca6ae44d7f6) · id `6ab2c094c2d73ca6ae44d7f6`

ELF64 **C++** non strippé (PIE, GCC Debian 15.3.0). Source : `crackme.cpp`.  
`ptrace(PTRACE_TRACEME)` puis un check caractère par caractère.  
Famille : [`../README.md`](../README.md) — même auteur que [Tricky](../6aac1a61dbb3353b753968c0/) (`ptrace` + password en clair après décodage) et [a bit of a challenge](../6aaad62d48cda5a2aaa3de08/).

| Fichier | Rôle |
|---|---|
| [`original/crackme`](original/crackme) | binaire (`main`, `target`, `target_len`) |
| [`tools/trust-me-solve.py`](tools/trust-me-solve.py) | relit `target` dans l'ELF / `--check` |

## Réponse

| | |
|---|---|
| **Password** | `ilovecrackmes` |
| OK | `CMO{ilovecrackmes}` |
| KO | `Access Denied.` |
| Anti-debug | `Debugger detected. Exiting.` (`ptrace` → return 1) |

```bash
python3 tools/trust-me-solve.py -q
# ilovecrackmes
printf '%s\n' ilovecrackmes | ./original/crackme
python3 tools/trust-me-solve.py --check
```

Le code de sortie ne suffit pas. Mauvaise longueur → **1**. Bonne longueur, mauvais octets → **0**, avec `Access Denied.` Un debugger → **1**.

---

## 1. Premier regard

```text
crackme: ELF 64-bit LSB pie executable, x86-64, dynamically linked, not stripped
NEEDED      libstdc++.so.6, libgcc_s.so.1, libc.so.6
compiler    GCC: (Debian 15.3.0-2) 15.3.0   (.comment)
sha256      f48044268a44d4543b70fb15ba869b991642c294245b666669211657f80eadbf
size        23528
```

```bash
file original/crackme
strings -n 4 original/crackme
nm -S original/crackme | grep -E 'main|target'
readelf -p .comment original/crackme
```

`strings` donne le dialogue et deux blocs qui ont l'air d'un secret :

```text
Debugger detected. Exiting.
Enter the password:
Access Denied.
CMO{ilovecrackmes}
37+#32"21.-*%
```

Symboles locaux (C++ `static`) :

| Symbole | VMA | Taille | Rôle |
|---|---|---|---|
| `main` | `0x2199` | | prédicat |
| `target` (`_ZL6target`) | `0x3008` | `0xd` | les 13 octets chiffrés |
| `target_len` (`_ZL10target_len`) | `0x3018` | 8 | qword `13` |

`.rodata` (offset fichier = VMA) :

```text
00003008  33 37 2b 23 33 32 22 32 31 2e 2d 2a 25 00 00 00   37+#32"21.-*%...
00003018  0d 00 00 00 00 00 00 00                           target_len = 13
00003020  Debugger detected. Exiting.
0000303c  Enter the password:
00003051  Access Denied.
00003060  CMO{ilovecrackmes}
```

`37+#32"21.-*%` est le contenu de `target`, pas le password. `CMO{ilovecrackmes}` est le message de succès : le password est le texte entre accolades, et la boucle ci-dessous le reconstruit octet par octet.

---

## 2. Flow

1. `ptrace(PTRACE_TRACEME, 0, 1, 0)`. Retour `-1` → message anti-debug, `return 1`.
2. `std::getline(cin, s)` après le prompt.
3. `s.length() != 13` → `Access Denied.`, `return 1`.
4. Sinon, pour `i` de 0 à 12 : `((s[i] + i) ^ 0x5a)` comparé à `target[i]`. Premier écart → échec.
5. Tout bon → `CMO{ilovecrackmes}` et `return 0`. Bonne longueur mais écart → `Access Denied.` et `return 0` aussi.

---

## 3. Comment on trouve le password

### 3.1 Ancrage

```bash
objdump -d -M intel --disassemble=main original/crackme
nm -S original/crackme | grep target
xxd -s 0x3008 -l 32 original/crackme
```

Le check tient dans `main` (`0x2199`–`0x2383`), compilé sans optimisation (frame, appels à `basic_string::length` / `operator[]`).

```asm
; ptrace(PTRACE_TRACEME, 0, 1, 0)  — request dans edi
21a2:  mov    ecx, 0
21a7:  mov    edx, 1
21ac:  mov    esi, 0
21b1:  mov    edi, 0
21bb:  call   ptrace
21c0:  cmp    rax, -1
21c4:  sete   al
21c9:  je     2200 <suite>          ; rax != -1 → on continue
       ; sinon cout << "Debugger detected. Exiting." << endl ; return 1

2200:  ; string s @ rbp-0x50
220c:  lea    rdx, [rip+...]        ; "Enter the password: "
2220:  call   operator<<
2236:  call   getline                   ; getline(cin, s)

2242:  call   length
2247:  cmp    rax, 0xd
224b:  setne  al
2250:  je     2287 <boucle>           ; len == 13
       ; sinon "Access Denied." ; return 1

2287:  mov    BYTE PTR [rbp-0x11], 1   ; ok = true
228b:  mov    QWORD PTR [rbp-0x20], 0  ; i = 0
2293:  jmp    22da <test>

2295:  mov    rsi, [rbp-0x20]
2299:  lea    rdi, [rbp-0x50]
22a3:  call   operator[]              ; &s[i]
22a8:  movzx  eax, BYTE PTR [rax]     ; s[i]
22ab:  mov    edx, eax
22ad:  mov    rax, [rbp-0x20]         ; i
22b1:  add    eax, edx                ; i + s[i]
22b3:  xor    eax, 0x5a
22b6:  mov    BYTE PTR [rbp-0x21], al ; octet calculé

22b9:  lea    rdx, [rip+0xd48]        ; 0x3008 target
22c0:  mov    rax, [rbp-0x20]
22c4:  add    rax, rdx
22c7:  movzx  eax, BYTE PTR [rax]     ; target[i]
22ca:  cmp    BYTE PTR [rbp-0x21], al
22cd:  je     22d5
22cf:  mov    BYTE PTR [rbp-0x11], 0  ; ok = false
22d3:  jmp    22f1 <fin>
22d5:  add    QWORD PTR [rbp-0x20], 1
22da:  call   length
22e6:  cmp    [rbp-0x20], rax
22ea:  setb   al                       ; i < length
22ef:  jne    2295

22f1:  cmp    BYTE PTR [rbp-0x11], 0
22f5:  je     2324                     ; Access Denied. ; return 0
22f7:  lea    rdx, [rip+...]           ; 0x3060 "CMO{ilovecrackmes}"
       ; cout << ... << endl ; return 0
```

`operator[]` (`0x2470`) refuse `i >= size()` via `__glibcxx_assert_fail` (chaîne longue dans `.rodata`, fichier `/usr/include/c++/15/bits/basic_string.h`, ligne `0x559`). Le `cmp` de longueur passe avant la boucle : un password de 13 octets ne déclenche pas l'assert.

`target_len` n'est pas relu. Objdump s'en sert seulement comme symbole proche pour les `lea` vers les chaînes qui suivent (`target_len+0x8` = le message anti-debug, etc.). Le `13` du check est l'immédiat `0xd`.

### 3.2 Inversion

Comparaison, octet bas seulement (`al`) :

```text
((password[i] + i) ^ 0x5a) & 0xff == target[i]
password[i] = ((target[i] ^ 0x5a) - i) & 0xff
```

`target` :

```text
33 37 2b 23 33 32 22 32 31 2e 2d 2a 25
 3  7  +  #  3  2  "  2  1  .  -  *  %
```

Le NUL en `0x3015` est **après** les 13 octets du symbole. Le dernier octet attendu est `'%'` (`0x25`), pas `0x00`.

| i | password | `ord` | `c+i` | `^ 0x5a` | `target` |
|---|---|---|---|---|---|
| 0 | `i` | 105 | 105 | 51 | `3` |
| 1 | `l` | 108 | 109 | 55 | `7` |
| 2 | `o` | 111 | 113 | 43 | `+` |
| 3 | `v` | 118 | 121 | 35 | `#` |
| 4 | `e` | 101 | 105 | 51 | `3` |
| 5 | `c` | 99 | 104 | 50 | `2` |
| 6 | `r` | 114 | 120 | 34 | `"` |
| 7 | `a` | 97 | 104 | 50 | `2` |
| 8 | `c` | 99 | 107 | 49 | `1` |
| 9 | `k` | 107 | 116 | 46 | `.` |
| 10 | `m` | 109 | 119 | 45 | `-` |
| 11 | `e` | 101 | 112 | 42 | `*` |
| 12 | `s` | 115 | 127 | 37 | `%` |

Lecture : `ilovecrackmes`. Le message OK est ce password entouré de `CMO{` … `}`.

```python
target = bytes.fromhex("33372b2333322232312e2d2a25")  # ELF @ 0x3008, 13 octets
pw = bytes(((target[i] ^ 0x5A) - i) & 0xFF for i in range(13))
# b"ilovecrackmes"
```

Équivalent du corps utile :

```cpp
static const unsigned char target[] = {
    0x33,0x37,0x2b,0x23,0x33,0x32,0x22,0x32,0x31,0x2e,0x2d,0x2a,0x25
};
if (ptrace(PTRACE_TRACEME, 0, (void*)1, 0) == -1) {
    cout << "Debugger detected. Exiting." << endl;
    return 1;
}
string s;
cout << "Enter the password: ";
getline(cin, s);
if (s.length() != 13) {
    cout << "Access Denied." << endl;
    return 1;
}
bool ok = true;
for (size_t i = 0; i < s.length(); i++) {
    unsigned char x = (unsigned char)((s[i] + i) ^ 0x5a);
    if (x != target[i]) { ok = false; break; }
}
cout << (ok ? "CMO{ilovecrackmes}" : "Access Denied.") << endl;
return 0;
```

---

## 4. Debug GDB (pas à pas)

PIE, symbole `main` à la VMA non relogée `0x2199`. `break *main+…` est relogé au chargement.

Sous GDB, `PTRACE_TRACEME` échoue (`rax = -1`) avant toute saisie :

```bash
printf '%s\n' ilovecrackmes > /tmp/pw
gdb -q -ex 'set debuginfod enabled off' ./original/crackme
(gdb) break *main+0x27          # 0x21c0  cmp rax, -1
(gdb) run < /tmp/pw
(gdb) printf "rax=%ld\n", $rax
(gdb) continue
```

```text
Breakpoint 1, 0x00005555555561c0 in main ()
rax=-1
Debugger detected. Exiting.
[Inferior 1 (process …) exited with code 01]
```

Pour voir la boucle, forcer le retour de `ptrace` puis s'arrêter sur le `cmp` (`main+0x131` = VMA `0x22ca`) :

```gdb
break *main+0x27
commands
set $rax = 0
continue
end
break *main+0x131
run < /tmp/pw
printf "i=%lu in=%02x calc=%02x tgt=%02x\n", \
  *(unsigned long*)($rbp-0x20), \
  *(unsigned char*)(*(char**)($rbp-0x50)+*(unsigned long*)($rbp-0x20)), \
  *(unsigned char*)($rbp-0x21), $eax & 0xff
```

Relevé sur `ilovecrackmes` (biais PIE de la session, `0x555555554000`) :

```text
i=0  in=69 calc=33 tgt=33     ; 'i' → '3'
i=12 in=73 calc=25 tgt=25     ; 's' → '%'
CMO{ilovecrackmes}
[Inferior 1 exited normally]
```

`rbp-0x50` est le `std::string` (pointeur SSO en tête, taille en `+8`). `rbp-0x21` est l'octet calculé, `al` est `target[i]`. Les 13 comparaisons passent, le `je` en `0x22cd` ne tombe jamais sur `ok = 0`.

Sans le `set $rax = 0`, on n'atteint pas `getline`.

---

## 5. Vérification

```bash
python3 tools/trust-me-solve.py -q
printf '%s\n' ilovecrackmes | ./original/crackme ; echo exit:$?
printf '%s\n' short | ./original/crackme ; echo exit:$?
printf '%s\n' petikpetikpet | ./original/crackme ; echo exit:$?
python3 tools/trust-me-solve.py --check
```

OK :

```text
Enter the password: CMO{ilovecrackmes}
exit:0
```

KO, longueur ≠ 13 (`short`, ligne vide) :

```text
Enter the password: Access Denied.
exit:1
```

KO, 13 octets faux (`petikpetikpet`) — même code de sortie que le succès :

```text
Enter the password: Access Denied.
exit:0
```

`--check` exige le message `CMO{ilovecrackmes}` sur le password reconstruit, l'exit 1 sur un mot trop court, et `Access Denied.` avec l'exit 0 sur un mot de 13 octets.

---

## 6. Notes

- Le password est l'inverse de `target`, et il est aussi écrit en clair dans le message OK. La boucle est le prédicat : `strings` seul ne montre pas *pourquoi* ces 13 octets passent.
- Dernier octet de `target` : `'%'` (`0x25`). Le `00` qui suit dans le dump est le terminateur / le padding avant `target_len`, pas un 13ᵉ octet du tableau.
- `target_len == 13` est émis en `.rodata` ; `main` compare l'immédiat `0xd`.
- Frères : [Tricky](../6aac1a61dbb3353b753968c0/) (autre `ptrace`, password `supersecret123`) et [a bit of a challenge](../6aaad62d48cda5a2aaa3de08/) (autre `ptrace`, sigil sur le nom).
