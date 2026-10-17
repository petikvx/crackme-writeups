# b3nd3p — my_f1rs7_cr4ckm3

| | |
|---|---|
| **ID** | [`6296c1ff33c5d45b75903c0f`](https://crackmes.one/crackme/6296c1ff33c5d45b75903c0f) |
| **Auteur** | b3nd3p |
| **Plateforme** | Linux ELF64 PIE, C, non strippé (`entry1`, `check`, `info`, `input`, `sum.0`) |
| **SHA-256** | `65d7f55b0055e639eba7180c636ebf96af9d5307a3c6ed3dcea0677eac591416` |

Voir [`ORIGIN.yml`](ORIGIN.yml).

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/first` | binaire d'origine |
| `tools/myfirst-b3nd3p-solve.py` | recalcule le digit (`-q`, `--check`) |

## Réponse

**Digit : `1337`**

```bash
echo 1337 | ./original/first    # u can do this, congrut / well done go next
python3 tools/myfirst-b3nd3p-solve.py --check
```

## Premier regard

`strings` : `Enter digit:`, `u can do this, congrut`, `try again!!!`, `well done go next`, `try more and u can`. Symboles présents : `entry1`, `check`, `info`, `input`, `sum.0` — aucune valeur en clair, juste des fonctions à additionner.

## Flow

`main` @ `0x1305` : `entry1()` calcule la cible, `input()` lit le digit (`scanf("%d")`), `check(saisie, cible)` compare, `info(résultat)` affiche le message.

## Comment on trouve

**Ancrage** : `entry1` @ `0x11fd` monte 4 immediates et appelle `sum.0` :

```asm
121c: mov [rbp-0x24],0x3e8   ; 1000
1223: mov [rbp-0x20],0x12c   ; 300
122a: mov [rbp-0x1c],0x1e    ; 30
1231: mov [rbp-0x18],0x7     ; 7
1254: call sum.0             ; 1000+300+30+7
```

`sum.0` @ `0x11c8` est une simple addition des 4 arguments. `check` @ `0x1275` : `cmp eax,[rbp-0x18] ; jne échec` (égalité stricte).

`1000 + 300 + 30 + 7 = 1337`.

## Vérification

```text
$ echo 1337 | ./first   -> u can do this, congrut / well done go next
$ echo 1336 | ./first   -> try again!!! / try more and u can
```

## Notes

- Reverse statique + essais live ; pas de GDB.
