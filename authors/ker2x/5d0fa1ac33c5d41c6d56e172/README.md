# ker2x — guild hall adventure Ch.1

| | |
|---|---|
| **ID** | [`5d0fa1ac33c5d41c6d56e172`](https://crackmes.one/crackme/5d0fa1ac33c5d41c6d56e172) |
| **Auteur** | ker2x |
| **Plateforme** | Linux ELF64 PIE, C, non strippé |
| **SHA-256** | `1fa5f3843c50c243a01f82129da9673c9cb4ab2aa88c72914d90c427807edcf0` |

Voir [`ORIGIN.yml`](ORIGIN.yml).

## ⚠️ Version incomplète (voir le chapitre 2)

L'auteur indique dans le `README.txt` du [chapitre 2](../5d1a344033c5d410dc4d0c3e/) que **cette version de `adventure` soumise sur crackmes.one n'était pas la version finale** — il manque un challenge (sécurité + bureau d'inscription, racontés comme déjà faits dans l'intro du chapitre 2). La version complète est fournie en bonus dans l'archive du chapitre 2 (`adventure2-package/adventure`, SHA-256 différent). Ce write-up couvre la version **officiellement téléchargeable sous cet ID**, qui ne contient qu'un seul challenge.

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/adventure` | binaire d'origine (version incomplète, 1 seul challenge) |
| `tools/adventure-solve.py` | rejoue la séquence gagnante (`-q`, `--check`) |

## Réponse

```bash
cd original
./adventure hello
# à la question "So, why are you here ? :" répondre : ./adventure
```

```bash
python3 tools/adventure-solve.py --check
```

## Premier regard

```bash
file original/adventure     # ELF64 PIE, not stripped
strings -n 5 original/adventure
```

Chaînes : `hello`, `Friendly greetings to you, hacker from another world !`, `So, why are you here ? : `, `good, good, welcome to the guild hall!`, message de mort si refusé.

## Flow

`main(argc, argv)` : exige `argc==2` et `argv[1]=="hello"` (`strncmp` sur 5 octets), puis demande une 2ᵉ saisie et la compare à `argv[0]`.

## Comment on trouve

**Ancrage** : `objdump -d -M intel --no-show-raw-insn original/adventure | awk '/<main>:/,/^$/'`.

```asm
859: mov rax,[rax]            ; rax = argv[1]
864: cmp rax,0x5 ; jne fail    ; strlen(argv[1]) == 5
88e: call strncmp(argv[1], "hello", 5)   ; doit etre "hello"
...
907: mov rax,[rax]             ; rax = argv[0]  (PAS argv[1] !)
917: call strncmp(argv[0], saisie, strlen(saisie))
91c: test eax,eax ; je success
```

Même famille de piège que [racecars](../../chillywilly/5e76c37d33c5d4439bb2df1b/) et [keygenme](../../kawaii-flesh/5d24585133c5d410dc4d0cbd/) : la seconde comparaison porte sur `argv[0]` (le chemin d'invocation), pas sur une constante ni sur la première saisie. Comme `strncmp` utilise `n = strlen(saisie)`, n'importe quel **préfixe exact** de `argv[0]` convient — pas besoin de reproduire le chemin complet si on tape moins.

## Vérification

```bash
$ cd original
$ ./adventure hello
Friendly greetings to you, hacker from another world !
So, why are you here ? : ./adventure
./adventure ?  good, good, welcome to the guild hall!

$ ./adventure hello
...
wrong ?  This is the guild hall, i can't let you in, sorry, i need to kill you now. Byyye~~~
Segmentation fault (core dumped)

$ ./adventure wrong
no no no ! it's not a socially appropriate greeting !
```

## Notes

- Pas de GDB nécessaire : tout le prédicat est lisible statiquement.
- Contrairement au chapitre 2 (qui crashe **toujours**, même en cas de succès), ici le chemin de succès **ne crashe pas** : seul l'échec de la 2ᵉ question appelle le pointeur de fonction non initialisé.
- Voir [guild hall adventure Ch.2](../5d1a344033c5d410dc4d0c3e/) pour la version complète bonus (`adventure2-package/adventure`, challenge supplémentaire non présent ici).
