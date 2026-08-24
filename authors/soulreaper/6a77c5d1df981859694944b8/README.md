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

## 4. Vérification

```bash
python3 tools/dead-terminal-solve.py --check REAPER42
# check=OK …
```

---

## 5. Notes

- Même auteur que Death Trap (laissé pending : double-fork + MITM lent).
- Anti-debug inoffensif hors gdb.
