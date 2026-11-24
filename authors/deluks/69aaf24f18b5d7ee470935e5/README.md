# DeLuks's Chamber of Reflections

| | |
|---|---|
| **ID** | [`69aaf24f18b5d7ee470935e5`](https://crackmes.one/crackme/69aaf24f18b5d7ee470935e5) ([`ORIGIN.yml`](ORIGIN.yml)) |
| **Auteur** | DeLuks (local : `deluks`) |
| **Plateforme** | Multiplateforme — JavaScript Node.js, obfusqué, mini-VM |
| **SHA-256** | `a4d9f721e3c504e282ba48fa841f18201b12b15f58cef6981c345923714663ba` |

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/crackme_mini.js` | crackme d'origine (non modifié) |
| `tools/deluks-solve.py` | solveur (`-q`, `--check`) |
| `analysis/dump.js` | copie instrumentée : affiche le bytecode de la VM |

## Réponse

**Mot de passe : `FLAG-JSVM-1337`** (pas de username ; `petik` n'a pas de rôle ici).

```bash
python3 tools/deluks-solve.py --check     # -q pour la sortie brute
printf 'FLAG-JSVM-1337\n' | node original/crackme_mini.js
```

## Premier regard

- `file` : « JavaScript source, very long lines ». 22 764 octets, tout en identifiants `_0x…`.
- Des centaines de constantes chaînes encodées (alphabet permuté par fonction de décodage, base ~91 type « basE91 ») ; un tableau de constantes `_0x977a019a` remplace les nombres littéraux.
- Lancé : `welcome to the chamber of reflections, a silly little vm crackme` / `enter the password:` puis `Correct!` ou `Wrong!`.

## Flow

Une boucle `while(true)` + `switch` = **VM à pile**. Chaque mot du programme : opcode = `(w & 0xff00) >> 8`, opérande = `w & 0xff`. Le programme (42 mots) n'est pas dans le source en clair : `_0x7bca0721()` relit **son propre fichier** (`__filename`), applique une regex, déduplique et prend les 2 derniers caractères hex de chaque identifiant, jusqu'à 42 (`slice(0,0x2a)`). Piège : modifier le fichier change donc le bytecode (anti-tampering) — d'où ma copie instrumentée qui remplace `__filename` par le chemin d'origine.

## Comment on trouve

1. **Ancrage** : fin du fichier, le `switch` de `_0x17a1076f` ; les index du tableau `_0x977a019a` donnent les valeurs des `case` (ex. `[0x1b]`=0x10, `[0x14]`=0x0f).
2. **Dump du programme** : `analysis/dump.js` = l'original avec `__filename` remplacé et le dernier appel remplacé par `console.log(JSON.stringify(_0x7bca0721()))` (lancer avec `</dev/null`, readline garde le process ouvert). Résultat :
   `[455,211,1792,3279,3584,3499,535,2259,769,2318,3842,4344,1859,…]`, clé `_0xbe4a019a = [237,231,234,236,134,225,248,253,230,134,154,152,152,156]`.
3. **Sémantique des opcodes** (déduite du switch) : `0x00` push(readline) · `0x01` pop+print · `0x02` jne rel · `0x0f` je rel · `0x10` jmp rel signé · `0x07` push imm · `0x08` reg=pop · `0x09` reg=imm · `0x03` add imm · `0x0d` xor imm · `0x0c` reg=stack[0].charCodeAt(top) · `0x0e` push KEY[top] · `0x0b` exit.
4. **Boucle de vérification** (mots 3..11) :
   ```
   3  0x0ccf  reg = input.charCodeAt(i)      ; i = sommet de pile
   4  0x0e00  push KEY[i]
   5  0x0dab  top ^= 0xab                    ; KEY[i]^0xab
   6  0x0217  jne +0x17 → "Wrong!"          ; si != reg
   7  0x08d3  pop                            ; (reg reçoit la valeur ok)
   8  0x0301  i += 1
   9  0x090e  reg = 14                       ; longueur
   10 0x0f02  je +2 → "Correct!" si i == 14
   11 0x10f8  jmp -8 → mot 3
   ```
5. **Réponse** : `KEY[i] ^ 0xab` → `46 4c 41 47 2d 4a 53 56 4d 2d 31 33 33 37` = `FLAG-JSVM-1337` (14 caractères, d'où le `reg = 14`).

## Vérification

```
$ printf 'FLAG-JSVM-1337\n' | node original/crackme_mini.js
…>Correct!
$ printf 'FLAG-JSVM-1338\n' | node original/crackme_mini.js
…>Wrong!
```

## Notes

- Aucune session GDB / debugger : reverse statique + instrumentation d'une copie.
- Le piège : le cache `_0x7d7c076f` est partagé entre décodeurs ; décoder les chaînes ≥ 0x57 avec le mauvais décodeur empoisonne le cache et fait planter la VM.
- Seule la longueur 14 est testée par l'index ; un préfixe correct plus long (`FLAG-JSVM-1337xyz`) est accepté, testé en live (la boucle s'arrête à i=14).
