# 4n006135_level_4 (borismilner)

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/5ab77f6433c5d40ad448cad1) · id `5ab77f6433c5d40ad448cad1`  
> Import crackmes.de — auteur **borismilner** / « 605 ». Diff ~1.0.

Crackme **PE32 console** MinGW : password + piège `argc` / self-mod.

| Fichier | Rôle |
|---|---|
| [`original/_u/level-4.exe`](original/_u/level-4.exe) | binaire |
| [`tools/level4-solve.py`](tools/level4-solve.py) | password + cmdline |

## Réponse

| Champ | Valeur |
|---|---|
| Password | **`THISWORLDISCRUEL`** |
| Ligne de commande | **`level-4.exe 1 2 3 4 5 6`** (`argc == 7`) |

```bash
python3 tools/level4-solve.py -q --check
# THISWORLDISCRUEL
# check: OK

printf 'THISWORLDISCRUEL\n' | WINEDEBUG=-all wine original/_u/level-4.exe 1 2 3 4 5 6
# GOOD JOB !
```

Sans les 6 args → *NOT A GOOD JOB !* même avec le bon password.

## Prédicat

1. Ban « Mario » : si l’un des 5 premiers caractères du password égale `M`/`a`/`r`/`i`/`o` à la même position → fail immédiat.
2. Stub self-mod `@0x409000` (xor byte / `or ecx,0xF0F0`) branché depuis `main`.
3. Parité + overflow sur une valeur dérivée de **`argc`** : solution **`argc = 7`** (exe + 6 arguments).
4. Password clair `THISWORLDISCRUEL` (message chiffré `IHS'F'@HHC'MHE'&` = leurre / bonne branche).

## Notes

- Reverse / preuve : **objdump + Wine** (pas de debugger).
- Le PDF « aldeid » du site est corrompu ici ; soluce texte *acruel* confirmée live.
