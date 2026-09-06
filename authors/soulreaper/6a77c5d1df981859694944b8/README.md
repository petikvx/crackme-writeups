# soulreaper's Dead Terminal

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/6a77c5d1df981859694944b8) · id `6a77c5d1df981859694944b8`

Crackme **Linux** ELF64 PIE, mini-shell.  
Auteur site : **soulreaper**. Difficulty **2.2** · quality **4.2**.

Dossier : `authors/soulreaper/6a77c5d1df981859694944b8/` — [série auteur](../README.md) · [repo](../../../README.md).

| Fichier | Rôle |
|---|---|
| [`original/soulreaper_shell`](original/soulreaper_shell) | ELF64 PIE stripped |
| [`tools/dead-terminal-solve.py`](tools/dead-terminal-solve.py) | dérive la clé `reap` |

## Réponse

| | |
|---|---|
| Commande | **`reap REAPER42`** |

```bash
python3 tools/dead-terminal-solve.py -q
# REAPER42

printf 'reap REAPER42\nexit\n' | ./original/soulreaper_shell
# Access granted
#  join us : https://t.me/+…
```

---

## 1. Premier regard

```text
ELF 64-bit LSB pie, stripped
sha256 a0ca53ad836de59c992a2d3eeff7ac76ad8539eba960c9c3405b2b419e55301e
```

Prompt `soulreaper shell >`, usage `reap <key>`, anti-debug `TracerPid` via `/proc/self/status` + `fork`.

---

## 2. Flow

1. `fork` : parent surveille le debugger ; enfant = shell
2. Parse ligne (`strtok`) ; commande `exit` / `reap` / sinon `fork`+`execvp`
3. `reap <key>` → check longueur 8 + prédicat XOR/ADD → `Access granted` / `denied`

---

## 3. Prédicat

Constante LE `0x34378e828a78797f` → 8 octets `enc[]`.

Pour `i = 0..7` avec `d = 7 + 3*i` :

```text
enc[i] == ((key[i] ^ 0x2a) + d) & 0xff
⇒ key[i] = ((enc[i] - d) & 0xff) ^ 0x2a
```

→ **`REAPER42`**.

---

## Debug GDB (pas à pas)

ELF64 **PIE**, stripped. Anti-debug : lit `TracerPid` dans `/proc/self/status` + `fork` — sous GDB tu peux voir le warning / branche, le shell enfant reste utilisable.

```bash
gdb -q ./original/soulreaper_shell
(gdb) set follow-fork-mode child
(gdb) set detach-on-fork off
(gdb) catch syscall fork
(gdb) run < <(printf 'reap REAPER42\nexit\n')
```

### Trouver le check `reap`

Constante LE `0x34378e828a78797f` (fichier ~`0x1566`) = `enc[8]`.

```text
(gdb) starti
(gdb) # info proc mappings → base
(gdb) find 0x555555556000, +0x3000, 0x7f, 0x79, 0x78, 0x8a
# ou break après strtok / strcmp "reap"
```

Prédicat (une fois dans la boucle i=0..7) :

```text
(gdb) # après chargement key[i] :
(gdb) print/x ($al ^ 0x2a) + (7 + 3*$i)   # doit matcher enc[i]
```

Inversion live :

```text
key[i] = ((enc[i] - (7+3*i)) & 0xff) ^ 0x2a
→ REAPER42
```

### Succès

```text
(gdb) # après check OK
(gdb) # "Access granted" + lien t.me
```

Hors GDB : `python3 tools/dead-terminal-solve.py --check`.

---

## 4. Vérification

```bash
python3 tools/dead-terminal-solve.py --check REAPER42
# check=OK …
```

---

## 5. Notes

- Même auteur : [XorGate](../6a768ab608712c1a17cbacdd/), [Death Trap](../6a7d0ce1184836c0dbe7d77e/) (solved : double-fork + MITM).
- Anti-debug inoffensif hors gdb (et gênant surtout pour le follow-fork).
