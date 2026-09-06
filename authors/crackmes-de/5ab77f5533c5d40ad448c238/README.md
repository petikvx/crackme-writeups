# crackmes.de's crackme1 (darius949)

> [crackmes.one](https://crackmes.one/crackme/5ab77f5533c5d40ad448c238) · [`ORIGIN.yml`](ORIGIN.yml)

| | |
|---|---|
| **Auteur** | darius949 (miroir crackmes.de) |
| **Plateforme** | Linux ELF32 |
| **Type** | name → serial |

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/crackme1.tgz` | binaire d’origine (ELF malgré l’extension) |
| `original/crackme1` | copie exécutable |
| `tools/crackme1-solve.py` | keygen |

## Réponse

| Nom | Serial |
|---|---|
| `petik` | **`970`** |

```text
serial = Σ (name[i] + name[i+1])  pour i ∈ [0, len(name))
avec name[len] = 0
```

```bash
python3 tools/crackme1-solve.py -q --name petik
# petik:970
printf 'petik\n970\n' | ./original/crackme1
# Vous avez craque le no de serie
python3 tools/crackme1-solve.py --check --name petik
```

## Premier regard

```text
ELF 32-bit LSB executable, Intel 80386, dynamically linked, not stripped
```

Le fichier livré s’appelle `crackme1.tgz` mais c’est l’ELF lui-même (pas une archive).

## Flow

1. Demande le nom (`Donnez votre nom:`).
2. Demande le serial (`Donnez le no de serie:`).
3. Calcule `c` sur le nom, compare au serial lu.
4. Succès → `Vous avez craque le no de serie`.

## Prédicat

Pour chaque caractère du nom (C-string, NUL final inclus dans le voisin de droite) :

```c
c = 0;
for (i = 0; name[i]; i++)
    c += (unsigned)name[i] + (unsigned)name[i+1];
```

Exemple `petik` : `(p+e)+(e+t)+(t+i)+(i+k)+(k+0)` = `970`.

## Debug GDB (pas à pas)

ELF32 dynamique, **non stripé**. Entry `_start` `0x80484b0`, logique dans `main` `@0x8048564`. Pas de PIE.

```bash
printf 'petik\n970\n' > /tmp/crackme1.in
gdb -nx -q ./original/crackme1
(gdb) set debuginfod enabled off
(gdb) starti
(gdb) break *0x08048694          # cmp c / serial
(gdb) break *0x080486b0          # branche succès (puts)
(gdb) run < /tmp/crackme1.in
```

| Adresse | Rôle |
|---|---|
| `0x80485b7` | `fgets` nom → `@0x804a080` |
| `0x8048612` | `fscanf("%d")` serial → `@0x804a060` |
| `0x804862b`…`0x8048670` | boucle somme `name[i]+name[i+1]` → `@0x804a480` |
| `0x8048694` | `cmp` accumulateur vs serial |
| `0x80486b0` | succès → `"Vous avez craque…"` |

```text
(gdb) printf "c=%d serial=%d\n", *(int*)0x804a480, *(int*)0x804a060
# c=970 serial=970
(gdb) x/s 0x804a080
# "petik"
(gdb) continue
# Vous avez craque le no de serie
```

Batch équivalent :

```bash
gdb -nx -batch \
  -ex 'set debuginfod enabled off' \
  -ex 'break *0x08048694' \
  -ex 'run < /tmp/crackme1.in' \
  -ex 'printf "c=%d serial=%d\n", *(int*)0x804a480, *(int*)0x804a060' \
  --args ./original/crackme1
```

## Vérification

```bash
printf 'petik\n970\n' | ./original/crackme1
# c=970
# Vous avez craque le no de serie
```

## Notes

- Serial décimal affiché aussi en debug (`c=…`).
- Pas de protection anti-debug.
