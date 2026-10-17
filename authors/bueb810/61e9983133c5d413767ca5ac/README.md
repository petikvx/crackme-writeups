# bueb810 — gugus the first

| | |
|---|---|
| **ID** | [`61e9983133c5d413767ca5ac`](https://crackmes.one/crackme/61e9983133c5d413767ca5ac) |
| **Auteur** | bueb810 |
| **Plateforme** | Linux ELF **32 bits**, C, non strippé |
| **SHA-256** | `02970c7eb3f8533663b6dcdb07fd1fdb61f0ea0c3d929cc6572b308cb13e3aba` |

Voir [`ORIGIN.yml`](ORIGIN.yml).

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/gugus.out` | binaire d'origine |
| `tools/gugus-solve.py` | relit les immediates dans le code (`-q`, `--check`) |

## Réponse

**Argument : `gu!gu?s`**

```bash
./original/gugus.out 'gu!gu?s'     # ...Good morning... / Access granted / Congratulation
python3 tools/gugus-solve.py --check
```

## Premier regard

`strings` : `missing argument`, `Access granted`, `Congratulation`, `Sorry....`, `Try again`. Sans argument : « missing argument ».

## Flow

`main` @ `0x11bd` : exige `argc > 1`, construit un secret de 7 caractères sur la pile, `strcmp(argv[1], secret)` → succès ou échec.

## Comment on trouve

**Ancrage** : `objdump -d -M intel --no-show-raw-insn original/gugus.out | awk '/<main>:/,/ret/'`.

```asm
1201: mov DWORD PTR [eax],0x67217567      ; octets 67 75 21 67 = "gu!g"
1207: mov DWORD PTR [eax+0x4],0x733f75    ; octets 75 3f 73 00 = "u?s\0"
1220: mov eax,[esi+0x4] ; add eax,4 ; mov eax,[eax]   ; argv[1]
1230: call strcmp
```

Concaténation : `gu!g` + `u?s` = **`gu!gu?s`**.

## Vérification

```text
$ ./gugus.out 'gu!gu?s'   -> Access granted / Congratulation
$ ./gugus.out wrong       -> Sorry.... / Try again
$ ./gugus.out             -> missing argument
```

## Notes

- Reverse statique + essais live ; pas de GDB.
