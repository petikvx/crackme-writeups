# bitwise_fun (app.exe) — reductor (crackmes.de)

| | |
|---|---|
| **ID** | [`5ab77f5833c5d40ad448c3e4`](https://crackmes.one/crackme/5ab77f5833c5d40ad448c3e4) ([`ORIGIN.yml`](ORIGIN.yml)) |
| **Auteur** | reductor (miroir crackmes.de) |
| **Plateforme** | Windows PE32 console (MSVC 6, i386) |
| **SHA-256 `original/app.zip`** | `4aea9a4a3d8008fceba3fa0cdf615c0e1c49bdb8b9925ba14e3992d1302760bb` |

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/app.zip` | archive d'origine (mot de passe `crackmes.one`), contient `app.exe` |
| `analysis/extracted/app.exe` | `app.exe` extrait (SHA-256 `cc33092c…e1bec`) — preuve live |
| `analysis/app.decrypted.exe` | copie avec le code déchiffré (pour `objdump`, **non exécutable tel quel**) |
| `tools/bitwise-fun-solve.py` | keygen (`--user`, `-q`, `--check` = lance Wine) |

## Réponse

Le serial est un **nombre décimal** dépendant du nom :

| user | serial |
|---|---|
| **`petik`** | **`459`** |
| `admin` | `503` |

```bash
python3 tools/bitwise-fun-solve.py --user petik          # serial=459
python3 tools/bitwise-fun-solve.py --user petik --check  # lance app.exe sous Wine
```

## Premier regard

```bash
unzip -P crackmes.one original/app.zip -d analysis/extracted
diec analysis/extracted/app.exe     # MSVC 6, PE32 console
strings -n 6 analysis/extracted/app.exe
```

Chaînes utiles : `Please enter your username:`, `Please enter your serial(only numbers):`,
`Invalid Serial, it can only contain numbers`, `Well done your serial is correct`, `Invalid Serial`.

Piège : l'entry point est `0x401000` (début de `.text`), et le désassemblage est du charabia dès `0x401037`
(`int 0x20`…) → code **auto-déchiffré** au démarrage.

## Flow

1. Stub de déchiffrement (`0x401000`), puis `jmp 0x401804` (startup CRT) → `main` = `0x40105e`.
2. Nom lu avec `getchar` jusqu'à `\n` : `sum` de **tous** les caractères, **`\n` compris** (+10).
3. Serial lu chiffre par chiffre ; tout caractère hors `0-9`/`\n`/`\0` → `Invalid Serial, it can only contain numbers`.
4. Une longue chaîne de « bitwise fun » transforme le serial → `f(serial)`.
5. `f(serial) == sum` → `Well done…`.

## Comment on trouve

### Ancrage : le stub auto-modifiant (`0x401000`)

```asm
401006: mov [ebp-0xc], 0x401054      ; début de la zone chiffrée
40100d: mov [ebp-0x4], 0x13eb        ; 0x13eb dwords
40101b: mov dword [0x401037], 0x3bf84d8b   ; patch de la boucle elle-même (octets 8b 4d f8 3b)
...
401045: mov ecx,[eax+edx*4]
401048: not ecx                       ; chaque dword est inversé (NOT)
401050: mov [eax+edx*4], ecx
```

`0x401037` est `cd 20` sur disque ; le stub se réécrit lui-même en `mov ecx,[ebp-8] / cmp ecx,[ebp-4]`.
Pour lire le code sans exécuter : NOT de `0x13eb*4` octets à partir de l'offset fichier `0x1054`, plus les 4 octets patchés
(c'est ce qu'on a fait en 5 lignes de Python, résultat `analysis/app.decrypted.exe`) :

```bash
objdump -d -M intel --start-address=0x40105e --stop-address=0x40177b analysis/app.decrypted.exe
```

### Lecture du `main` (`0x40105e`)

* `0x401086…0x4010a9` : `getchar` (`0x401787`), `ebp-0xc += c`, arrêt sur `\n`/`\0` → **sum du nom, avec le `\n`**
  (`petik` : 112+101+116+105+107 = 541, +10 = **551**).
* `0x4010b8…0x40112e` : parseur du serial : `acc = (acc + c - '0') * 10` pour chaque chiffre
  (le `*10` est appliqué **aussi au dernier chiffre** : `acc` = 10 × serial). Arrêt si `acc ≥ 0xffff`.
* `0x40113d…0x4011e2` : initialisation de trois globales (valeurs finales) :
  `g8 = 0x10000` (`0x4077f8`, borne de toutes les boucles de bits), `g0 = 0x8000`, `g4 = 0x10001`
  (`3*0x33+0x66 = 255 ; 255²+0x7f = 65152 ; +0x180 = 0x10000`, etc.). Le même bloc est rejoué à `0x40167c`.

### La transformation `f` (ce qui rend le crackme « bitwise fun »)

Chaque étape est une opération arithmétique **réécrite à la main avec des `and/or/xor` et des boucles sur les bits**
(le compilateur n'a rien optimisé). Reconnaissance, dans l'ordre :

| Adresses | Ce que ça fait |
|---|---|
| `0x4011ee–0x40120e` | `x = acc // 10` (soustractions successives de 10) → on retrouve le serial |
| `0x40121b–0x4012bd` | additionneur bit à bit : `x = x + 0x3b1` (retenue : `t \|= m<<1` si les deux bits sont à 1, `t ^= (m<<1)\|m` si retenue entrante) |
| `0x4012c3–0x4013a5` | `x < 0x36f` ? calcule `0x36f - x` (emprunt propagé dans la boucle `0x401345`), puis `×(-1)` si `x < 0x36f` → `x - 0x36f` modulo 2³² |
| `0x401408–0x4014fd` | boucle sur `k` ; seul `k = 4` (bit 2, `and 4`) agit : ajoute `x << 2` à 0 avec le même additionneur → `(x<<2) & 0xffff` |
| `0x401509–0x40154b` | 2 × « rotation à droite » 16 bits (`shr 1` + `or 0x8000` si bit 0) |
| `0x4015c3–0x40162f` | `x ^= 0x2a` (bits < 0x10000) en `and`/`test` |
| `0x401635–0x401676` | rotation gauche 1 bit sur 16 bits (`shl 1`, si bit 16 : `xor 0x10001`) |
| `0x401726–0x40174d` | `x = x // 2` (soustractions successives de 2) |
| `0x401753–0x401759` | `cmp x, sum` → `Well done` / `Invalid Serial` |

Rien n'est irréversible mais on n'a pas besoin d'inverser à la main : le serial valide est ≤ 6553
(au-delà `acc ≥ 0xffff` coupe la lecture), donc **on porte `f` fidèlement en Python
([`tools/bitwise-fun-solve.py`](tools/bitwise-fun-solve.py), fonctions `adder`, `sub`, `f`) et on brute-force 0…6553**.

Exemple `petik` : `sum = 551` → `f(459*10) = 551` (seule solution dans l'intervalle) → serial `459`.

## Debug GDB / x64dbg / IDA

Non utilisés : reverse statique (objdump + déchiffrement Python) + preuve Wine. Pas de walkthrough inventé.

## Vérification

```text
$ python3 tools/bitwise-fun-solve.py --user petik --check
user='petik' serial=459 (toutes: [459])
Please enter your username:
Please enter your serial(only numbers):
Well done your serial is correct
```

Autres cas, sous `xvfb-run -a wine analysis/extracted/app.exe` (stdin par pipe) :

| Entrée | Résultat |
|---|---|
| `petik` / `459` | `Well done your serial is correct` |
| `petik` / `458` | `Invalid Serial` |
| `petik` / `460` | `Invalid Serial` |
| `admin` / `503` (keygen) | `Well done your serial is correct` |
| `petik` / `12a` | `Invalid Serial, it can only contain numbers` |

## Notes

* **Stdin Wine** : ne pas lancer avec `</dev/null` — `getchar` renvoie EOF (−1), jamais `\n`/`\0` : la boucle du nom ne finit pas.
* Le `\n` fait partie de la somme du nom (+10) : oublier ça décale tout.
* Le parseur multiplie par 10 après le dernier chiffre, d'où la division initiale par 10.
* Plusieurs serials pourraient exister en théorie ; dans 0…6553 le solveur n'en trouve qu'un pour `petik` et `admin`.
