# xrockmr — synamics (crackmes.de)

- Page : https://crackmes.one/crackme/5ab77f5d33c5d40ad448c69f · [`ORIGIN.yml`](ORIGIN.yml)
- Plateforme : Linux ELF32 **et** ELF64 (`crackme_x86`, `crackme_x64`), C, non strippés (2012)
- Archive : `original/rockmr.zip` → `crackme_x86`, `crackme_x64`

## Réponse

```
hello
```

```bash
python3 -I tools/xrockmr-solve.py --check
# check: OK {'crackme_x64': (True, True, True), 'crackme_x86': (True, True, True)}
echo hello | ./analysis/crackme_x64      # What is the password? / You WIN, congratulations...
```

> ⚠ Au lancement le binaire exécute `killall -q gdb` puis `killall -q strace` (anti-debug) : à savoir avant de le lancer dans une session de debug.

## Premier regard

```text
$ echo test | ./analysis/crackme_x64
What is the password?
$ strings -n 4 analysis/crackme_x64 | grep -E "password|WIN|killall|cheat"
What is the password?   You WIN, congratulations...   killall -q gdb   killall -q strace   Sem cheat, fedepe...
```

## Comment on trouve

**Ancrage** : `nm` (non strippé) : `_init_` @`0x400770` (constructeur), `main` @`0x40080a`, `_finit_` @`0x400734` (destructeur), `password` @`0x601070` (`.data`, initialement `"you rock"`).

```asm
_init_ :  system("killall -q gdb") ; system("killall -q strace") ; ptrace(TRACEME) ; par = malloc(0x40) ; par = "aleef"
main   :  password = "you rock" (deux mov dword)
          srand(time(0)) ; boucle : par[i] ^= rand() % 10 (3 passes) ; tant que par[0] == 'h' on recommence   <- bruit
          puts("What is the password?")
          fgets(password, 8, stdin)                    ; 7 caractères max (« hello\n » tient)
          cmp byte [password+4], 'o' ; je suite        ; sinon password[1] = 'a' (casse la clé)
_finit_ (à l'exit) : password[0..3] == 'h','e','l','l' ? -> puts("You WIN, congratulations...")
```

Le test de victoire est donc dans le **destructeur** : `main` n'affiche rien lui-même. Il faut `password[0..3] = "hell"` **et** `password[4] = 'o'` (sinon `password[1]` devient `'a'` avant la sortie).

**Pièges :**
- `hell` seul échoue : avec `fgets`, `password[4] = '\n'` ≠ `'o'` → `password[1] = 'a'` → `hall` ≠ `hell`.
- `par` / `rand()` / `srand(time)` : leurre (le tableau n'est jamais comparé à la saisie).
- `killall gdb/strace` : lancer sous `gdb` tue le débogueur ; analyse statique ou `LD_PRELOAD`/patch de la copie recommandés.

## Vérification

```text
$ echo hello | ./analysis/crackme_x64        # analysis/verify.txt
What is the password?
You WIN, congratulations...
$ echo hell  | ./analysis/crackme_x64
What is the password?
```

## Fichiers

- `analysis/crackme_x86`, `analysis/crackme_x64`, `analysis/dis-x64.txt`, `analysis/verify.txt`
- `tools/xrockmr-solve.py` : `--check` sur les deux binaires
