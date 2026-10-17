# mt77 — based

| | |
|---|---|
| **ID** | [`64fdf93bd931496abf90994b`](https://crackmes.one/crackme/64fdf93bd931496abf90994b) |
| **Auteur** | mt77 |
| **Plateforme** | Linux ELF64 (non PIE), C++ (gcc 13), non strippé (fonction `luna`) |
| **SHA-256** | `bd72873595f041288d869c267b96d6742f3a9462f1be5c3391fb553bab4dcf08` |

Voir [`ORIGIN.yml`](ORIGIN.yml).

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/luna` | binaire d'origine |
| `tools/luna-solve.py` | émule `luna`, liste des solutions (`--count`, `-q`, `--check`) |

## Réponse

Pas de valeur unique : tout **entier de 100000 à 10 000 000 qui passe le test de Luhn**. Plus petites solutions : **`100008`**, `100016`, `100024`, `100032`, `100040`… Exemples plus « parlants » : `123455`, `2000008`.

```bash
echo 100008 | ./original/luna      # Welcome!
python3 tools/luna-solve.py --check
```

## Premier regard

`strings` : `Enter password, plz: `, `Invalid value`, `Welcome!`, symbole `_Z4lunay` (`luna(unsigned long long)`). L'entrée est **numérique** (`cin >> unsigned long long`), pas une chaîne.

## Flow

`main` @ `0x401262` : `cin >> n` (variable `unsigned long long` à `[rbp-0x10]`), `ok = luna(n)`, puis **annule** `ok` si `n <= 99999` ou `n > 10 000 000` ; `ok == 1` → « Welcome! », sinon « Invalid value ».

## Comment on trouve

**Ancrage** : `objdump -d -M intel --no-show-raw-insn original/luna --start-address=0x401156 --stop-address=0x401308`.

`luna` @ `0x401156` (division par 10 compilée en multiplication par `0xcccccccccccccccd` + `shr 3` — réduction de force) :

```asm
401172: d  = n % 10                          ; mul 0xcccccccccccccccd ; shr 3 ; x*10 ; sub
4011a0: d2 = ((n / 10) % 10) * 2            ; add eax,eax
4011e6: cmp d2,9 ; jle ; sub d2,9           ; si d2 > 9 : d2 -= 9
4011f6: somme += d + d2
4011ff: n = (n >> 2) * 0x28f5c28f5c28f5c3 >> 2   ; = n / 100  (deux chiffres consommés par tour)
401220: jne boucle                           ; tant que n != 0
401250: test edx,edx   ; somme % 10 == 0 ?   -> retourne 1
```

C'est l'**algorithme de Luhn** : en partant du chiffre de poids faible, un chiffre sur deux est doublé (moins 9 s'il dépasse 9), et la somme doit être un multiple de 10.

`main` ajoute la fenêtre de valeurs :

```asm
4012a5: cmp rax,0x1869f ; jbe 4012b9       ; n <= 99 999  -> ok = 0
4012b1: cmp rax,0x989680 ; jbe 4012bd      ; n <= 10 000 000 conservé, sinon ok = 0
```

Pièges : la saisie est un **nombre** ; le Luhn de l'énoncé classique (`79927398713`) est hors fenêtre et refusé ; `10000000` lui-même est dans la fenêtre mais n'est pas Luhn-valide.
Mon émulation de `luna` en Python a été comparée au binaire sur 17 valeurs (bornes `99999`, `100000`, `10000000`, `10000001`, `0`, etc.) : aucun écart.

## Vérification

```text
$ echo 100008 | ./luna      -> Welcome!
$ echo 100009 | ./luna      -> Invalid value   (Luhn faux)
$ echo 99999  | ./luna      -> Invalid value   (hors fenêtre)
$ echo 10000001 | ./luna    -> Invalid value   (hors fenêtre)
```

## Notes

- Reverse statique + essais live ; pas de GDB.
