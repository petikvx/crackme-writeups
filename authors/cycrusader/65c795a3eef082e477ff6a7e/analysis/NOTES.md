# NOTES — cycrusader / sh0uld_b3_e4zy (test)

> État : **analysé, pas de condition de victoire → `ORIGIN.yml` reste `status: pending`.**
> Énoncé de l'auteur : « Its easy to patch ;) try to reverse it! ».

Binaire : `original/test`, ELF64 PIE, C (`test.c`), non strippé, `main` @ `0x1179`.

## Ce que fait `main`

```asm
1190..11ac: tableau {0x61,0x65,0x69,0x6f,0x75} = 'a','e','i','o','u'   ; jamais relu
11b3:       mov [rbp-0x3c],5                                           ; jamais relu
11c4:       puts("MAX INPT 5 CHARS")
11d8:       printf("Enter Input: ")
11f3:       call scanf("%s", [rbp-0xd])      ; AUCUNE limite de largeur, buffer d'environ 8 octets
11fb:       cmp eax,1 ; je 1217              ; sinon "INVALID INPUT!"
121e:       call strlen ; cmp eax,5 ; jle 123b
122c:       puts("INVALID INPUT!")           ; si strlen > 5
123b:       mov eax,0 ; (vérif canari) ; ret
```

- `strlen <= 5` → le programme **termine sans rien afficher** (aucun message de succès n'existe dans `.rodata`).
- `strlen > 5` → « INVALID INPUT! » ; au-delà de la taille du buffer, le canari de pile est écrasé → `*** stack smashing detected ***`.
- Le tableau de voyelles `aeiou` et la constante `5` sont chargés puis jamais utilisés : le « filtre de voyelles » suggéré par l'aménagement n'est pas implémenté.

## Pourquoi pas résolu

Il n'y a ni mot de passe, ni message « correct », ni fonction cachée (`nm` : seulement `main`/`_start`). Les commentaires de la page crackmes.one
(8 commentaires, dont « the password is never verified », « there is no valid message printing out on clearing the crackme ») confirment qu'il n'existe pas de condition de victoire.
Écrire un patch qui ajoute un message de succès reviendrait à inventer l'objectif ; je ne le fais pas.

## Observations vérifiées

| Saisie | Résultat |
|---|---|
| `a`, `ab`, `abc`, `hello`, `aeiou` (≤ 5 car.) | invite seulement, sortie 0 |
| `abcdef` (6 car.) | « INVALID INPUT! » puis `*** stack smashing detected ***` |
