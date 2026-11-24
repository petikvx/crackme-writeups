# OTC's Keygen

| | |
|---|---|
| **ID** | [`6a526a25234391ae74f63b19`](https://crackmes.one/crackme/6a526a25234391ae74f63b19) · [`ORIGIN.yml`](ORIGIN.yml) |
| **Auteur** | OTC |
| **Plateforme** | Linux x86-64 (ELF, stub statique + payload dynamique) |
| **SHA-256** | `fe25f1e9051e8101be086f0038fa40cf4a05afccacfefc9df12e1494db38e51d` |

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/task` | binaire d'origine (non modifié, sans bit x) |
| `analysis/inner-payload.elf` | payload ELF extrait du `write()` vers le memfd (22760 octets) |
| `tools/otc-solve.py` | solveur / `--check` contre le binaire d'origine |

## Réponse

Ce n'est pas un vrai keygen : le **nom est imposé** (`petik` est refusé : le check de nom est une égalité sur son base64).

| Champ | Valeur |
|---|---|
| Nom | `Speed` |
| Second champ | `2cacc3f62f300a06501df12be978b0a0857e768841ccc75d89986da061f0b55f` |

```bash
python3 -I tools/otc-solve.py -q          # affiche la valeur
python3 -I tools/otc-solve.py --check     # lance une copie de original/task, cas OK + KO
```

Sortie : `You are him!` puis `Cybersphere{Speed_2cacc3f6…b55f}`.

## Premier regard

```text
$ file original/task
ELF 64-bit LSB shared object, x86-64, statically linked, no section header
$ strings -n 5 original/task   # memfd_create, fexecv, srand, perror… + blob illisible
```

Pas de section header, `memfd_create` / `fexecve` dans les chaînes, aucune chaîne du crackme : c'est un **loader**. Lancé tel quel (sur une copie `chmod +x`) :

```text
So, who in the blue hell are you?
So, petik What do you wanna talk about?
Bad luck I guess!
```

## Flow

Le stub déchiffre un ELF en mémoire, le écrit dans un `memfd_create("x")` et fait `execveat(fd, "", …, AT_EMPTY_PATH)`. Le programme réel lit deux chaînes : le nom, puis « what do you wanna talk about? ».

## Comment on trouve

1. **Extraire le payload** sans comprendre le déchiffrement du stub : on laisse le stub le faire et on le récupère au `write` :
   ```bash
   cp original/task /tmp/w/task && chmod +x /tmp/w/task
   echo petik | strace -e trace=write -s 100000 -xx -o st.txt /tmp/w/task
   # ligne: write(3, "\x7fELF\x02\x01…", 22760) = 22760  → on décode le \x.. en binaire
   ```
   (`strace -f` complet montre bien `memfd_create("x")` → `write(3, …)` → `execveat(3, "", …, AT_EMPTY_PATH)`.) Résultat : `analysis/inner-payload.elf`, PIE C++ dynamique, strippé, qui importe `EVP_Digest` / `EVP_get_digestbyname` (libcrypto) → hachages MD5 / SHA256 (chaînes `MD5`, `SHA256`, `%02x`).
2. **Lire `main`** (`0x2a4f` dans le payload, `objdump -d -M intel --start-address=0x2a4f`) :
   - lit `s1` (nom) puis `s2` ;
   - `0x25a3(s1)` = base64 maison (alphabet à `0x4008`, padding `=`, boucle de 6 bits) ;
   - `0x31b5(b64, "U3BlZWQ=")` : la constante est à `0x40a7` → base64 de **`Speed`** ;
   - si égal : `0x2968(s1, s2)` ; sinon `Bad luck I guess!` + `exit(0)`.
3. **Fonction `0x2968`** (prédicat du second champ) :
   ```text
   a = md5hex(s1)          # 27c0(…, "MD5")   → 32 caractères hexa minuscules
   xor_each(a, 0x42)       # 2549 : a[i] ^= 0x42 pour chaque octet
   b = sha256hex(a)        # 27c0(…, "SHA256") → 64 hexa
   return b == s2          # 312d : tailles égales puis comparaison
   ```
   `27c0` = `EVP_Digest(data, len, md, &mdlen, EVP_get_digestbyname(algo), NULL)` puis `sprintf("%02x")` octet par octet.
4. **Assemblage** pour `Speed` : `md5hex("Speed")` → XOR `0x42` sur les 32 caractères ASCII → SHA-256 → `2cacc3f62f300a06501df12be978b0a0857e768841ccc75d89986da061f0b55f`.

Pièges : le binaire sur disque n'a rien du crackme (loader + `memfd`), donc `strings` ne montre rien ; le nom attendu n'est pas en clair mais en base64 ; l'ordre MD5 → XOR → SHA256 (testé directement, pas d'autre variante nécessaire).

## Vérification

```text
$ python3 -I tools/otc-solve.py --check
So, who in the blue hell are you?
So, Speed What do you wanna talk about?
You are him!
Cybersphere{Speed_2cacc3f62f300a06501df12be978b0a0857e768841ccc75d89986da061f0b55f}
--- KO ---
So, Speed What do you wanna talk about?
Bad luck I guess!
OK
```

Cas KO : bon nom mais second champ `000…0` → `Bad luck I guess!`. Nom `petik` → `Bad luck I guess!` quelle que soit la 2e saisie.

## Notes

- Aucun GDB utilisé (statique + strace + objdump) ; pas de section Debug GDB.
- Le flag affiché est `Cybersphere{<nom>_<sha256>}`.
- `original/` n'a pas été modifié ; le binaire est exécuté via une copie temporaire.
