# crackme_july_8th_2002_release — JunkCode (crackmes.de)

- Page : https://crackmes.one/crackme/5ab77f5333c5d40ad448c106
- Plateforme : Windows PE32 GUI (dialogue, CRTDLL), x86 — difficulté 2.0
- Archive : `original/crackme_junkcode.zip` (mot de passe `crackmes.one`), contient `CrackMe.exe`, `ReadMe.txt` et un `Tutorial.txt` de l'auteur.

## Réponse

- **Name** : n'importe quoi (non vide), ex. `petik`
- **Key** : un nombre **premier** impair entre 10000 et 20000, ex. **`19991`**
- **Combinaison** : les 16 cases représentent le même nombre en binaire, **bit 0 en premier** (case en haut à gauche, lecture ligne par ligne).

Pour 19991 = `0b100111000010111` :

```
[X] [X] [X] [ ]
[X] [ ] [ ] [ ]
[ ] [X] [X] [X]
[ ] [ ] [X] [ ]
```

Keygen : `python3 tools/junkcode-solve.py [premier]`.

## Comment on trouve

1. `strings` donne `Sorry! Wrong Key` / `Good! You have stunned me!! :-)`. Le handler du bouton (vers `0x401340`) vérifie que les deux champs ne sont pas vides puis appelle `0x40148E` et compare le retour à `-1` (`cmp eax,0xffffffff`).
2. `0x40148E` appelle `IsDlgButtonChecked` pour chaque case et range le résultat dans un mot de 16 bits (`0x402004`). L'ordre des ID poussés donne la correspondance bit → case : `0x74`→bit 0, `0x65`→bit 1, puis `0x66`…`0x73`→bits 2…15 (entre les appels, des appels « junk » sans effet).
3. Fin de la fonction (`analysis/objdump-check.txt`) :
   ```
   push [0x4030d0]      ; combinaison
   call 0x401426        ; isprime(comb) -> edi
   mov  eax,[ebp-8]     ; atoi(key)
   xor  eax,[0x4030d0]
   sub  eax,edi         ; (key ^ comb) - isprime(comb)
   ```
   Pour obtenir `-1` il faut `key ^ comb == 0` et `isprime(comb) == 1`, donc **key == comb** et premier.
4. `0x401426` (`analysis/objdump-isprime.txt`) : retourne 0 si le nombre est pair ou hors `[0x2710, 0x4E20]` = [10000, 20000], sinon essaie les diviseurs impairs 3, 5, 7… tant que `d <= sqrt(n)` : c'est un test de primalité.

## Vérification

Crackme GUI (cases à cocher) non pilotable en headless : la preuve est **statique**. Le solveur réimplémente exactement la formule `(key ^ comb) - isprime(comb) == -1` et le test de primalité, et l'assert vérifie qu'un mauvais key échoue. La grille obtenue pour 19991 est identique à celle donnée par l'auteur dans son `Tutorial.txt`.
