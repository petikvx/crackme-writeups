# chillywilly — racecars

| | |
|---|---|
| **ID** | [`5e76c37d33c5d4439bb2df1b`](https://crackmes.one/crackme/5e76c37d33c5d4439bb2df1b) |
| **Auteur** | chillywilly |
| **Plateforme** | Linux ELF64 PIE, C (GCC 9.2.1, `-g`), non strippé, debug info |
| **SHA-256** | `a2bdde3cbe809074c24e70d525b812d782f4e7ba4057f1d55f9069bd909fa6f2` |

Voir [`ORIGIN.yml`](ORIGIN.yml).

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/racecars` | binaire d'origine |
| `tools/racecars-solve.py` | copie le binaire sous un nom palindrome et le rejoue (`-q`, `--check`) |

## Réponse

**Il ne faut ni mot de passe ni argument : exécuter le binaire sous un nom de fichier qui soit un palindrome.**

```bash
cp original/racecars /tmp/racecar && chmod +x /tmp/racecar
/tmp/racecar          # -> That's exactly what I wanted!

python3 tools/racecars-solve.py --check
```

## Premier regard

```bash
file original/racecars    # ELF64 PIE, debug_info, not stripped
strings -n 5 original/racecars
```

Chaînes : `Gimme what I want!`, `That's exactly what I wanted!`. Source nommé `args.c` dans les symboles de debug. Aucun `scanf`/`strcmp`/`cin` : pas de mot de passe à saisir.

## Flow

`main(argc, argv)` n'utilise **que `argv[0]`** (le chemin par lequel le programme a été lancé), jamais `argv[1]` ni stdin.

## Comment on trouve

**Ancrage** : `objdump -d -M intel --no-show-raw-insn original/racecars | awk '/<main>:/,/^$/'`.

```asm
116e: call strlen(argv[0])
1173: sub eax,0x1          ; v4 = strlen(argv[0]) - 1   (indice du dernier caractere)
117c: ...                  ; v5 = v4
1181: sub v5,1             ; boucle : recule v5 tant que argv[0][v5-1] != '/'
119c: cmp al,0x2f ('/')    ;   -> v5 = indice du 1er caractere APRES le dernier '/'
11a2..11ee:                ; boucle de comparaison symetrique :
                            ;   argv0[v5] == argv0[v4] ? v5++, v4-- ... sinon "Gimme what I want!"
11f0: "That's exactly what I wanted!"   ; si toute la boucle passe
```

C'est le test de palindrome le plus classique qui soit (deux index qui se rapprochent du centre), appliqué **au nom du fichier exécutable lui-même** (basename après le dernier `/`), pas à une entrée utilisateur. `"racecars"` (avec le `s` final) **n'est pas** un palindrome — le nom de livraison du crackme est volontairement un piège à un caractère du bon mot. Il suffit de copier/renommer/symlinker le binaire sous un nom qui en est un, par exemple `racecar` (sans le `s`).

## Vérification

```bash
$ cp original/racecars /tmp/racecar && chmod +x /tmp/racecar
$ /tmp/racecar
That's exactly what I wanted!

$ ./original/racecars
Gimme what I want!
```

## Notes

- Aucun GDB nécessaire : le prédicat tient entièrement dans la lecture de `argv[0]` par `main`, visible directement en asm.
- N'importe quel nom palindrome fonctionne (`level`, `deed`, `a`, …) — `racecar` est juste le plus évident vu le titre du challenge.
