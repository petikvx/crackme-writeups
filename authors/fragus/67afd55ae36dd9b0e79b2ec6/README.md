# Fragus — Very simple crackme

| | |
|---|---|
| **ID** | [`67afd55ae36dd9b0e79b2ec6`](https://crackmes.one/crackme/67afd55ae36dd9b0e79b2ec6) |
| **Auteur** | Fragus |
| **Plateforme** | Linux ELF64 PIE, C (`main.c`), non strippé |
| **SHA-256** | `2928672a3b0f5d8f4221eae70ca05c850ddf2adc703a16ce6d841ad5fbc296f1` |

Voir [`ORIGIN.yml`](ORIGIN.yml).

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/prog` | binaire d'origine |
| `tools/prog-solve.py` | lit l'immediate comparé (`-q`, `--check`) |

## Réponse

**Mot de passe : `2876`** (nombre décimal, `0xb3c`)

```bash
python3 tools/prog-solve.py --check
echo 2876 | ./original/prog      # YOU HAVE WIN !!!
```

## Premier regard

`strings` : `WHAT IS THE PASSWORD  ? `, `YOU HAVE WIN !!!`, `FAILED !`, et une ligne de métadonnées de paquet glibc (`{"type":"deb","os":"ubuntu",...}`, note du build, sans rapport).
Le mot de passe n'est **pas** une chaîne : le binaire n'importe pas `strcmp`, seulement `puts` et `scanf`.

## Flow

`main` @ `0x1189` : `puts(prompt)`, `scanf("%d", &n)`, `n == secret` → « YOU HAVE WIN !!!  » (retour 0), sinon « FAILED ! » (retour 1).

## Comment on trouve

**Ancrage** : `objdump -d -M intel --no-show-raw-insn original/prog | awk '/<main>:/,/ret/'`.

```asm
11a4: mov  DWORD PTR [rbp-0xc],0xb3c   ; secret = 0xb3c = 2876
11d0: call scanf                       ; "%d" (0x201d) -> [rbp-0x10]
11d5: mov  eax,[rbp-0x10]
11d8: cmp  [rbp-0xc],eax
11db: jne  FAILED
```

`0xb3c = 11·256 + 60 = 2876`.

## Vérification

```text
$ echo 2876 | ./original/prog   -> YOU HAVE WIN !!!
$ echo 1    | ./original/prog   -> FAILED !
```

## Notes

- Reverse statique + essais live, pas de GDB.
