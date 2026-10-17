# marufmurtuza — Illogical Logic

| | |
|---|---|
| **ID** | [`637c66b633c5d43ab4ecec2a`](https://crackmes.one/crackme/637c66b633c5d43ab4ecec2a) |
| **Auteur** | marufmurtuza |
| **Plateforme** | Linux ELF64 PIE, C++, non strippé (`checker`, `flag`) |
| **SHA-256** | `88e705cf495f60772ed333d073d8f9f1c80e6fc78f49b95a16eb3ac9200346b5` |

Voir [`ORIGIN.yml`](ORIGIN.yml).

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/illogical_logic` | binaire d'origine |
| `tools/illogical-solve.py` | fournit le PIN (`-q`, `--check`) |

## Réponse

**PIN : `0`** → **`FLAG{hehe_you_solved_an_illogical_mathematical_logic_xD}`**

```bash
echo 0 | ./original/illogical_logic
python3 tools/illogical-solve.py --check
```

## Premier regard

`strings` : `---x---`, `I don't know if the pin is correct or not. Try digging deeper.`, `Enter The Correct Pin: `, et même le flag en clair (`FLAG{hehe_you_solved_an_illogical_mathematical_logic_xD}`) — mais afficher le flag sans la bonne entrée ne le déclenche pas.
Fait amusant : taper n'importe quelle valeur **non numérique** (ex. `test`) affiche quand même le flag, car `std::cin` échoue silencieusement et laisse la variable `pin` à sa valeur par défaut (0).

## Flow

`main` @ `0x143d` : `cin >> pin` (int), `checker(pin)` @ `0x13b7` : si `pin == 0` → `flag()` (affiche le flag), sinon → message d'échec.

## Comment on trouve

**Ancrage** : `nm -C` donne `checker(int)`, `flag()`, `main`. `objdump -d -M intel --no-show-raw-insn original/illogical_logic | awk '/<_Z7checkeri>:/,/ret/'` :

```asm
1402: cmp DWORD PTR [rbp-0x4],0x0   ; pin == 0 ?
1406: jne 140f                      ; sinon -> "Try digging deeper."
1408: call flag                     ; pin == 0 -> affiche le flag
```

« Illogique » : un simple `0` suffit, pas de calcul caché.

## Vérification

```text
$ echo 0 | ./illogical_logic   -> FLAG{hehe_you_solved_an_illogical_mathematical_logic_xD}
$ echo 1 | ./illogical_logic   -> I don't know if the pin is correct or not. Try digging deeper.
```

## Notes

- Reverse statique + essais live ; pas de GDB.
