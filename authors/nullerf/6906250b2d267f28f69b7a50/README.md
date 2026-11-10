# NullerF's Easiest

| | |
|---|---|
| **ID** | [`6906250b2d267f28f69b7a50`](https://crackmes.one/crackme/6906250b2d267f28f69b7a50) ([`ORIGIN.yml`](ORIGIN.yml)) |
| **Auteur** | NullerF (local : `nullerf`) |
| **Plateforme** | Windows PE64 console, MinGW-w64 GCC 15.2.0 |
| **SHA-256 (`original/download.bin`)** | `8c915250356d15e5f8fe9bfef07dc1cd634aa08438de64ebcb44ab9fa1ab75b2` |

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/download.bin` | ZIP chiffré (mot de passe `crackmes.one`) contenant `easiest.exe` — **non modifié** |
| `analysis/extracted/easiest.exe` | exe extrait (SHA-256 `bc1e83e2…6832`) |
| `analysis/easiest.asm` | `objdump -d -M intel` complet |
| `tools/nullerf-easiest-solve.py` | solveur + `--check` (émulation unicorn de `main`) |

## Réponse

**PIN = `8569`** (`0x2179`). Pas de user/login : le crackme ne demande qu'un entier.

```bash
python3 tools/nullerf-easiest-solve.py -q      # 8569
python3 tools/nullerf-easiest-solve.py --check # preuve sur le vrai exe
```

## Premier regard

`original/download.bin` n'est pas un PE mais un ZIP (`PK`, flag de chiffrement dans l'en-tête) :

```bash
unzip -P crackmes.one -d analysis/extracted original/download.bin
strings -n 4 analysis/extracted/easiest.exe | grep -iE 'pin|correct'
```

Strings utiles (`.rdata` @ `0x14000c000`) : `Enter PIN: `, `%d`, `Correct! by NullerF`, `Incrorrect :/` (faute de l'auteur). Entrée `0x14000134a`, `main` en `0x140001380`.

## Flow

`printf("Enter PIN: ")` → `scanf("%d", &x)` → `x == 0x2179` ? "Correct! by NullerF" : "Incrorrect :/" → `_getch()`.

## Comment on trouve

Ancrage : `objdump -d -M intel easiest.exe`, symbole `main` (binaire non strippé, MinGW), 0x140001380 :

```asm
140001394  lea rax,[rip+0xac65]   ; "Enter PIN: "
14000139e  call __mingw_printf
1400013a3  lea rax,[rbp-0x4]      ; &x
1400013a7  lea rcx,[rip+0xac5e]   ; "%d"
1400013b1  call __mingw_scanf
1400013b6  mov eax,[rbp-0x4]
1400013b9  cmp eax,0x2179         ; <-- le prédicat
1400013be  jne 1400013d1          ; sinon "Incrorrect :/"
```

Décodage : `0x2179 = 8*1024 + 1*256 + 7*16 + 9`… soit 0x2000+0x100+0x70+0x9 = 8192+256+112+9 = **8569**. Comme `scanf` lit avec `%d`, il faut saisir la valeur **en décimal**, pas `2179`.

Piège : saisir `2179` (lecture naïve de l'immediate comme décimal) donne KO.

## Debug GDB

Non utilisé (reverse 100 % statique ; Wine et gdb absents de la machine).

## Vérification

Wine n'est pas installé sur cette machine : la preuve se fait en **émulant le `main` réel du PE** (sections mappées depuis `easiest.exe`, `printf`/`scanf`/`_getch`/`__main` stubbés) avec unicorn :

```text
$ python3 tools/nullerf-easiest-solve.py --check
PIN 8569 -> ['Enter PIN: ', 'Correct! by NullerF']
PIN 1234 -> ['Enter PIN: ', 'Incrorrect :/']
```

Cas OK et KO couverts. À rejouer sous Wine (`xvfb-run -a wine easiest.exe`, saisir `8569`) quand disponible.

## Notes

- Aucun anti-debug, aucune transformation : comparaison directe d'un `int`.
- Le fichier « .bin » est un ZIP, pas un exécutable.
