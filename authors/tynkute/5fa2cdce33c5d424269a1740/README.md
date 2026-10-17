# tynkute — Just crackme

| | |
|---|---|
| **ID** | [`5fa2cdce33c5d424269a1740`](https://crackmes.one/crackme/5fa2cdce33c5d424269a1740) |
| **Auteur** | tynkute |
| **Plateforme** | Linux ELF64 PIE, C, non strippé (`compare`, `strcp`, `stlen`) |
| **SHA-256** | `72d3a62cd4286c3102b689c4a7c8c84c20adb7b8196c25091fec2cf976b801b6` |

Voir [`ORIGIN.yml`](ORIGIN.yml).

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/a.out` | binaire d'origine |
| `tools/justcrackme-solve.py` | calcule la réponse en fonction de `$USER` et de l'heure courante (`--user`, `-q`, `--check`) |

## Réponse

La réponse dépend de **$USER** et de **l'heure courante** (pas une chaîne fixe). Avec `$USER=petik` et n'importe quel jour du mois ≥ 6 (la quasi-totalité du temps, voir plus bas) :

**`Wait, your name ispetik`**

```bash
printf 'Wait, your name ispetik\n' | USER=petik ./original/a.out      # Done.
python3 tools/justcrackme-solve.py --user petik --check
```

## Premier regard

`strings` : `Enter your flag.`, `Done.`, `Try again`, `USER`, et un fragment `Wait, yoH` / `ur name H` (le message « Wait, your name is » tronqué par les octets d'opcodes voisins). Imports `getenv`, `localtime` : l'heure et une variable d'environnement interviennent.

## Flow

`main` @ `0x1236` : lit `$USER`, construit `"Wait, your name is" + $USER` dans un buffer neuf (jamais affiché), appelle `compare(buf)`, lit la saisie (`scanf`), compare via `strcp` (octet par octet, sur la longueur du buffer encodé).

## Comment on trouve

**Ancrage** : `objdump -d -M intel --no-show-raw-insn original/a.out | awk '/<compare>:/,/ret/'`.

```asm
13c2: call time ; call localtime         ; tm = localtime(now)
1406: mov edx,[tm+4]    ; tm_min
140d: mov eax,[tm+0xc]  ; tm_mday
1412: sar edx,cl         ; tm_min >> tm_mday   (MÊME décalage pour TOUS les octets du buffer)
1425: xor esi,ecx ; mov [buf+i],dl            ; buf[i] ^= (tm_min >> tm_mday), en place
```

`strcp(a, b)` @ `0x11d9` compare `a[i]` à `b[i]` pour `i` de `0` à `strlen(a)-1` : la saisie doit reproduire exactement `buf` après XOR.

Point clé : `tm_min` est toujours `< 60` (donc `< 64 = 2^6`). Dès que `tm_mday ≥ 6` (jours 6 à 31 du mois, soit la quasi-totalité du mois), le décalage `>> tm_mday` vide tous les bits : **la clé vaut 0**, et la chaîne à fournir est simplement le texte en clair `"Wait, your name is" + $USER`, sans aucun calcul. Seuls les jours 1 à 5 du mois (et selon la minute) peuvent donner une clé non nulle.

## Vérification

```text
$ printf 'Wait, your name ispetik\n' | USER=petik ./original/a.out   -> Done.
$ printf 'wrong\n'                     | USER=petik ./original/a.out   -> Try again
```

(Testé le 17 du mois : clé = `tm_min >> 17` = 0 quelle que soit la minute.)

## Notes

- Reverse statique + essais live ; pas de GDB.
- Réponse dynamique par construction (dépend de $USER et de l'horloge système) ; le solveur recalcule à chaque exécution.
