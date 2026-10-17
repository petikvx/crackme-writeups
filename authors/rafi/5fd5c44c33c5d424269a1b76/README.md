# rafi — what

| | |
|---|---|
| **ID** | [`5fd5c44c33c5d424269a1b76`](https://crackmes.one/crackme/5fd5c44c33c5d424269a1b76) |
| **Auteur** | rafi |
| **Plateforme** | Linux ELF64 PIE, C++, non strippé (`decoder`), **code mort : `decoder()` jamais appelée normalement** |
| **SHA-256** | `c1cf0701ae4b79e6105e0c532e5ec32fecd0f657a37dd37c3adc1827c8dbe76b` |

Voir [`ORIGIN.yml`](ORIGIN.yml).

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/crackme` | binaire d'origine |
| `tools/what-solve.py` | décode le flag, preuve sous gdb (`-q`, `--check`) |

## Réponse

**Flag : `F{BGDeGOVCIRT}`**

```bash
python3 tools/what-solve.py --check
```

**`./original/crackme` seul n'affiche jamais ce flag** : il faut appeler `decoder()` directement sous GDB (voir plus bas).

## Premier regard

`strings` : `Flag is: F{%s}`, `Decode me:F{%s}`, le fragment chiffré `6/!:!#7$=:1`, la clé `the_flag`. Symbole `decoder(char*, char*)`. En lançant le binaire : `Decode me:F{6/!:!#7$=:1}` — rien d'autre.

## Flow

`main` @ `0x797` : construit la chaîne chiffrée et la clé sur la pile, affiche `"Decode me:F{<chiffré>}"`, puis **si un compteur `> 0`** appelle `decoder(chiffré, clé)` — mais ce compteur reste à `0` tout du long : la condition est toujours fausse.

## Comment on trouve

**Ancrage** : `objdump -d -M intel --no-show-raw-insn original/crackme | awk '/<main>:/,/ret/'`.

```asm
7ae: mov DWORD PTR [rbp-0x24],0x0    ; compteur = 0, jamais modifié ensuite
7f4: cmp DWORD PTR [rbp-0x24],0x0
7f8: jle 80d                          ; 0 <= 0 : TOUJOURS vrai -> saute l'appel à decoder()
```

`decoder(enc, key)` @ `0x6fa` :

```asm
745: movzx esi,[enc+i]
74c: idiv  [keylen]        ; i % strlen(key)
75b: movzx ecx,[key+idx]
76b: xor   esi,ecx
76f: mov   [enc+i],dl       ; enc[i] ^= key[i % strlen(key)]   (en place)
77e: call  printf           ; "Flag is: F{%s}" une fois la boucle terminée
```

C'est un XOR cyclique classique avec la clé `the_flag` (8 octets) sur les 11 octets chiffrés `6/!:!#7$=:1`.
Calcul direct (sans exécuter le programme) : `chr(ord(enc[i]) ^ ord(key[i % 8]))` pour chaque `i` → `BGDeGOVCIRT`.

## Debug GDB (pas à pas)

`decoder()` étant du code mort, la preuve passe par un appel direct sous GDB, avec des buffers valides (contrairement au `main` cassé de `Harel21` vu précédemment, ici c'est juste une branche jamais prise, pas un bug — on fournit simplement les bons arguments à la fonction).

```bash
gdb -q ./original/crackme
(gdb) break *0x5555554005f0     # _start du binaire (PIE ; base observée : 0x555555400000, non standard)
(gdb) run
(gdb) call (char*)malloc(16)                      #  : buffer chiffré
(gdb) call (char*)malloc(16)                      #  : buffer clé
(gdb) call (int)strcpy(,"6/!:!#7$=:1")
(gdb) call (int)strcpy(,"the_flag")
(gdb) call (void)0x5555554006fa(,)            # decoder(,)
(gdb) call (int)fflush(0)
# Flag is: F{BGDeGOVCIRT}
```

Piège : la base PIE observée pour ce binaire est `0x555555400000`, **différente** de la base `0x555555554000` habituelle sous gdb — toujours la vérifier via `starti` + `info proc mappings` plutôt que la supposer.

## Vérification

```text
$ python3 tools/what-solve.py --check
flag = F{BGDeGOVCIRT}
gdb call decoder() -> OK
```

## Notes

- Flag « moche » en apparence (`BGDeGOVCIRT`) mais c'est le résultat exact et reproductible du XOR ; rien n'indique une erreur de décodage.
- Aucun patch du binaire ; uniquement des appels de fonction sous GDB.
