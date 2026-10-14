# easy_crackme_1 — stefanie (crackmes.de)

- Page : https://crackmes.one/crackme/5ab77f5a33c5d40ad448c507 · [`ORIGIN.yml`](ORIGIN.yml)
- Plateforme : Linux ELF32 i386, GCC 3.3.5 (Gentoo, ssp), **sans section headers**
- Archive : `original/easycrack1.zip` → `easycrack1/easycrack` (extrait sous `analysis/`)
- Usage : `./easycrack <argument>` (+ un fichier dans le répertoire courant)

## Réponse

```bash
printf 'abcde' > LiuYiFei_143          # fichier de 5 octets, dans le répertoire d'exécution
./easycrack 'n?n?n?????'
# ..:: easy crackme1 by niel anthony acuna ::..
# cracked!
```

Conditions : (1) un fichier **`LiuYiFei_143`** de **5 octets** existe dans le répertoire courant ; (2) `argv[1]` fait **≥ 10 caractères** avec `argv[1][0] + argv[1][2] + argv[1][4] == 330` (ex. `n?n?n?????`, `n`=110 ×3) ; (3) pas de `LD_PRELOAD` ni de débogueur.

```bash
python3 -I tools/easycrack1-solve.py --check
# check: OK (ok=True, sans fichier→non=True, mauvais arg→non=True, taille≠5→non=True)
```

## Premier regard

```text
$ ./easycrack petik
..:: easy crackme1 by niel anthony acuna ::..
```

Aucune autre chaîne lisible : les noms (`LiuYiFei_143`, `LD_PRELOAD`, `cracked!`) sont stockés XORés avec leur indice ; `file` signale « no section header » : on désassemble en mode binaire (`objdump -D -b binary -m i386 --adjust-vma=0x8048000`).

## Comment on trouve

**Ancrage** : entrée `0x80483c0` → `push 0x8048682` = `main` ; trois fonctions « init/fini » (appelées via `.ctors`/`.dtors`) + `0x804861b` (vérification de l'argument). Le décodeur commun `0x8048470(buf, n)` fait `buf[i] ^= i`.

| Fonction | Rôle | Chaîne décodée |
|---|---|---|
| `0x8048526` | anti-debug | `LD_PRELOAD` → `getenv != NULL` ⇒ `exit` ; puis `ptrace(PTRACE_TRACEME)` < 0 ⇒ `exit` |
| `0x80484b0` | **bit0** | `LiuYiFei_143` : `stat()` (appel `0x8048790` → `__xstat(3, …)`), puis `st_size == 5` ⇒ flag |= 1 |
| `0x804861b` | **bit1** | `strlen(arg) > 9` ; `arg[0] + arg[2] + arg[4] == 0x14a` ⇒ flag \|= 2 |
| `0x80485af` | résultat | `cracked!` décodé ; `puts` seulement si `(flag & 3) == 3` |

Décodage de `LiuYiFei_143` : octets `4c 68 77 5a 6d 43 63 6e 57 38 3e 38` ⊕ `00..0b` = `L i u Y i F e i _ 1 4 3` ; `cracked!` : `63 73 63 60 6f 60 62 26` ⊕ `00..07`.

**Pièges :**
- Le test de taille porte sur `st_size == 5` (offset `0x2c` de `struct stat`, lu en `[ebp-0x3c]`) : un fichier de 4 ou 6 octets ne convient pas.
- `LD_PRELOAD` **défini même vide** ⇒ sortie sans message (le solveur le retire de l'environnement).
- Sous `strace`/`gdb` le `ptrace(TRACEME)` échoue ⇒ pas de message : lancer en natif.
- Le fichier est cherché dans le **répertoire courant** (chemin relatif).

## Vérification

```text
$ cd $(mktemp -d); printf abcde > LiuYiFei_143; ./easycrack 'n?n?n?????'     # cracked!
$ ./easycrack aaaaaaaaaaaa                                                    # (rien)
$ rm LiuYiFei_143; ./easycrack 'n?n?n?????'                                   # (rien)
```

## Fichiers

- `analysis/easycrack1/easycrack`, `analysis/easycrack1/dis.txt`
- `tools/easycrack1-solve.py` : recette + `--check` (répertoire temporaire)
