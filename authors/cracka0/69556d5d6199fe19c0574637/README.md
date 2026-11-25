# cracka0's Derive64 v1.0

| | |
|---|---|
| **ID** | [`69556d5d6199fe19c0574637`](https://crackmes.one/crackme/69556d5d6199fe19c0574637) · [`ORIGIN.yml`](ORIGIN.yml) |
| **Auteur** | cracka0 |
| **Plateforme** | Windows PE32+ x86-64, console (MSVC) |
| **SHA-256** | `4fe691a06881c57700fae78cac00547bea3c3bbae6be51436284eadae5279b7e` |

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/craackme.exe` | binaire d'origine (non modifié) |
| `tools/cracka0-solve.py` | solveur / vérificateur (`--check` lance Wine sur l'exe) |

## Réponse

| user | password |
|---|---|
| **`you`** | **`solved`** |

```bash
python3 -I tools/cracka0-solve.py          # affiche la paire
python3 -I tools/cracka0-solve.py --check  # teste contre l'exe d'origine (xvfb-run + wine)
```

> Pas de keygen par utilisateur : `petik` + `solved` est refusé (voir Vérification).
> Je n'ai pas inversé le hash 64 bits ; seule la paire de référence est donnée.

## Premier regard

```bash
file original/craackme.exe     # PE32+ console x86-64
strings -n 5 original/craackme.exe
```

Chaînes utiles : `Derive64 v1.0`, `user: `, `password: `, `granted, congrats! show us how u bypassed it`, `access denied`, et deux mots isolés dans `.rdata` : `solved` et `you`.

## Flow

`main` (VA `0x1400019f0`) :

1. affiche la bannière, lit `user` et `password` (`fgets`, 0x80 max, `\r\n` retirés) ;
2. calcule `ref = H("you", "solved")` — `H` est la fonction en `0x1400011c0` ;
3. calcule `H(user, password)` et le compare à `ref` ;
4. égal → `granted`, sinon `access denied`.

## Comment on trouve

- **Ancrage** : `objdump -d -M intel original/craackme.exe --start-address=0x1400019f0`. Le check est en `0x140001af6`–`0x140001b17`.
- **Lecture** :

```asm
lea rdx,[rip+0x1776]   ; 0x140003260 -> "solved"
lea rcx,[rip+0x1772]   ; 0x140003268 -> "you"
call 0x1400011c0       ; H(rcx=a, rdx=b) -> rax
mov [0x140005668],rax ; ref
mov rbx,rax
lea rdx,[rsp+0x20]     ; password saisi
lea rcx,[rsp+0xa0]     ; user saisi
call 0x1400011c0
cmp rax,rbx            ; égalité des deux hash -> granted
```

  Le décalage fichier ↔ VA de `.rdata` est `0x2000 → 0x140003000`, donc `solved` (offset `0x2260`) est en `0x140003260` et `you` en `0x140003268`. L'ordre des arguments est (rcx = user, rdx = password) : la référence est donc `H(user="you", password="solved")`.
- **`H`** : fonction de hash 64 bits maison (ARX : `ror`, `rol`, `xor`, `add`, `imul`, une table de 64 qwords en `0x1400032e0`, boucles dont le nombre de tours dépend des longueurs, 7·len+13 et 11·len+19, etc.). Elle est volontairement lourde à lire ; on n'en a pas besoin : le crackme compare deux hash de la même fonction, donc la paire utilisée comme référence passe forcément.
- **Piège** : `strings` montre `solved` et `you` sans contexte ; il faut l'asm pour voir qu'ils sont les arguments de la référence, et dans quel ordre (user = `you`, pas l'inverse).
- Le message « show us how u bypassed it » invite plutôt à chercher une collision / un bypass ; cette solution est la paire de référence, pas une collision.

## Vérification

Preuve live (Wine, binaire d'origine) :

```text
$ python3 -I tools/cracka0-solve.py --check
user: password: granted, congrats! show us how u bypassed it
OK

$ python3 -I tools/cracka0-solve.py --check --user petik
user: password: access denied
KO
```

## Notes

- Analyse 100 % statique (`objdump`) + Wine ; pas de GDB, pas d'IDA MCP, pas de debugger live.
- Le hash n'a pas été porté en Python : le solveur ne recalcule rien, il rejoue la paire dans l'exe.
- Non traité : un keygen `petik → password` demanderait de reconstituer `H` et de chercher une préimage/collision 64 bits.
