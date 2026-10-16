# Mark_Godez — Godez_Mark crackme

| | |
|---|---|
| **ID** | [`688328248fac2855fe6fb07d`](https://crackmes.one/crackme/688328248fac2855fe6fb07d) |
| **Auteur** | Mark_Godez |
| **Plateforme** | Linux ELF64 PIE, C (`source_code.c`), non strippé (malgré l'extension `.exe`) |
| **SHA-256** | `bafd131b340992b25e52c2d86172ed049965e2edafba6401d2c953e63b7f840e` |

Voir [`ORIGIN.yml`](ORIGIN.yml).

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/godez-crackme.exe` | binaire d'origine |
| `tools/godez-solve.py` | lit le secret dans l'ELF (`-q`, `--check`) |

## Réponse

**Serial : `godez123`**

```bash
python3 tools/godez-solve.py --check
echo godez123 | ./original/godez-crackme.exe     # Correct!
```

## Premier regard

Malgré son nom `godez-crackme.exe`, c'est un **ELF Linux** (`file`). `strings -n 4` : `Enter the serial key: `, `godez123`, `Correct!`, `Wrong!`. Le serial saute aux yeux.

## Flow

`main` @ `0x1169` : `printf("Enter the serial key: ")`, `scanf("%s", buf)` (buffer `[rbp-0x70]`), `strcmp(buf, secret)`, `puts("Correct!")` ou `puts("Wrong!")`.

## Comment on trouve

**Ancrage** : `objdump -d -M intel --no-show-raw-insn original/godez-crackme.exe | awk '/<main>:/,/ret/'`.

```asm
119b: call scanf            ; buf = [rbp-0x70]
11a4: lea  rdx,[rip+0xe73]  # 0x201e  -> secret
11b1: call strcmp           ; strcmp(buf, secret)
11b6: test eax,eax / jne 11cb
11ba: lea  rax,[rip+0xe66]  # 0x2027 "Correct!"
```

`objdump -s -j .rodata` : à `0x201e` on lit `67 6f 64 65 7a 31 32 33 00` = `godez123`. Aucune transformation de la saisie ni du secret.

## Vérification

```text
$ echo godez123 | ./original/godez-crackme.exe
Enter the serial key: Correct!
$ echo nope | ./original/godez-crackme.exe
Enter the serial key: Wrong!
```

## Notes

- Reverse statique + essais live, pas de GDB.
- Piège : l'extension `.exe` est trompeuse, c'est bien un ELF (inutile de passer par Wine).
