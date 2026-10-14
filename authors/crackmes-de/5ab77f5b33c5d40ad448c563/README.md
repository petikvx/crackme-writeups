# EyeCandyLOCKED — nexy (crackmes.de)

- Page : https://crackmes.one/crackme/5ab77f5b33c5d40ad448c563 · [`ORIGIN.yml`](ORIGIN.yml)
- Plateforme : Linux ELF64 x86-64, C++ (libstdc++), **non strippé** (symboles + debug) ; anti-debug `ptrace`
- Archive : `original/EyeCandyLOCKED.tar.gz` → `EyeCandyLOCKED`
- Usage : mot de passe sur stdin (boucle jusqu'à `exit`)

## Réponse

```
d00r1$m@licious
```

(« doorismalicious » en leetspeak ; seuls les 14 premiers caractères sont comparés)

```bash
python3 -I tools/eyecandy-solve.py --check
# password : d00r1$m@licious / check: OK (ok=True, mauvais=True)
printf 'd00r1$m@licious\nexit\n' | ./analysis/EyeCandyLOCKED     # *** THE DOOR IS UNLOCKED! ***
```

## Premier regard

```text
$ strings -n 6 analysis/EyeCandyLOCKED | grep -E "DOOR|password|Debugging"
*** THE DOOR IS LOCKED! ***   Gimme your password:   Wrong password!!   *** THE DOOR IS UNLOCKED! ***
Debugging tools like that..?  Show some respect ;)  Outta here.
```

Le mot de passe n'apparaît pas dans `strings` : il est construit dans la pile par `checkIt` (15 `mov dword [rbp-x], imm`).

## Comment on trouve

**Ancrage** : `nm EyeCandyLOCKED | grep main` → `0x400fc3` ; `objdump -d -M intel` ; la fonction `_Z7checkItSs` (= `checkIt(std::string)`) @`0x400eda`.

```asm
400ef5..400f57: [rbp-0x50 + 4i] = 0x64 0x30 0x30 0x72 0x31 0x24 0x6d 0x40 0x6c 0x69 0x63 0x69 0x6f 0x75 0x73
400f5e: i = 0
400f67: c = s[i] ; if (tab[i] != (int)c) return false      ; std::string::operator[]
400f9e: i++ ; cmp i, 0xd ; jle 400f67                        ; i = 0 .. 13 (14 itérations)
400fa8: return true
```

`main` : `ptrace(TRACEME)` (`call 400cf0`) puis `shr rax,0x3f` : < 0 ⇒ message « Did you really think… » et sortie ; sinon boucle : `cin >> s` ; `s != "exit"` → `checkIt(s)` → `UNLOCKED` ou « Wrong password!! ».

Décodage : `64 30 30 72 31 24 6d 40 6c 69 63 69 6f 75 73` = `d 0 0 r 1 $ m @ l i c i o u s`.

**Pièges :**
- Le test `jle 0xd` s'arrête à l'indice 13 : le 15ᵉ caractère (`s`) n'est **pas** vérifié ; `d00r1$m@liciou` + n'importe quoi passe aussi.
- L'anti-debug `ptrace(TRACEME)` : sous `gdb`/`strace` le programme se ferme tout de suite (lancer en natif).
- Un mot de passe plus court (13 caractères) échoue : `s[i]` lit alors le NUL final.

## Vérification

```text
$ printf 'd00r1$m@licious\nexit\n' | ./analysis/EyeCandyLOCKED      # analysis/verify.txt
*** THE DOOR IS UNLOCKED! ***  …  Anyway.. here is your prize :3
$ printf 'petik\nexit\n' | ./analysis/EyeCandyLOCKED
Wrong password!!
```

## Fichiers

- `analysis/EyeCandyLOCKED`, `analysis/dis.txt` (objdump), `analysis/verify.txt`
- `tools/eyecandy-solve.py` : décodage du tableau + `--check`
