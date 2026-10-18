# TrynaToBe6for6Def's My Third Crackme (Medium + Flag)

| | |
|---|---|
| **ID** | [`6ac8f2506349e4b2540c6fc0`](https://crackmes.one/crackme/6ac8f2506349e4b2540c6fc0) · [`ORIGIN.yml`](ORIGIN.yml) |
| **Auteur** | TrynaToBe6for6Def |
| **Plateforme** | Windows PE64 (MinGW, console) |
| **SHA-256** | `8948aa8ccb0001dbc3270a286fd7d70aed5fd4f386217ac46c885ff55a9b0ca0` |

| Fichier | Rôle |
|---|---|
| `original/My_Third_Crackme.exe` | binaire d'origine |
| `analysis/My_Third_Crackme.exe.i64.c` | dump Hex-Rays (`bash -ic 'decc original/My_Third_Crackme.exe'`) |
| `tools/third-solve.py` | solveur (`-q`, `--check`) |

## Réponse

Mot de passe (17 caractères) : **`L565L3O63OM0L5454`** → `Flag : CMO{Level3/6completed}`

```bash
python3 -I tools/third-solve.py --check
```

⚠️ Il existe plusieurs mots de passe valides (voir plus bas) ; le flag, lui, est fixe.

## Premier regard

- `file` : PE32+ console x86-64, MinGW (pas de packer).
- `strings` : `enter the password : `, `Not today...`, `Yeaaaaa!!! Discord : imrate`, `Flag : CMO{%s}`. Le flag n'est pas en clair (la chaîne `Level3/6completed` est construite par `strcpy` d'immediates).
- Imports : `IsDebuggerPresent` — utilisé dans le prédicat final.

## Flow

`sub_140001440` (main, VMA `0x140001440`) : `fgets` 64 → retrait du `\r\n` → `strlen == 17` obligatoire → boucle de transitions sur la table `byte_1400030E0` → comparaison de l'état final.

## Comment on trouve

Ancrage : xref de la chaîne `enter the password` → `sub_140001440` (`decc`).

```c
v5 = 0;                                   // état initial
while (1) {
  v6 = tbl[16*v5 + (((Buffer[v3]   ^ 0xA) + 1) & 0xF)];   // transition sur char pair
  if (v3 == 16) break;
  v5 = tbl[16*v6 + (((Buffer[v3+1] ^ 0xA) + 1) & 0xF)];   // transition sur char impair
  v3 += 2;
}
if (!IsDebuggerPresent() + 16 == v6) → succès
```

C'est un **DFA** : chaque caractère est réduit à un nibble `n = ((c ^ 0xA) + 1) & 0xF`, qui sert de colonne dans une table 19 états × 16 colonnes (304 octets à RVA `0x30E0`). Deux pièges :

- l'état final attendu est `!IsDebuggerPresent() + 16` = **17** sans débogueur (16 sous débogueur → échec silencieux) ;
- l'état 18 est un puits (« Not today »).

Dump de la table (états 0..17, une seule colonne ≠ 18 par état) → chemin unique de nibbles :

`7, 0, 13, 0, 7, 10, 6, 13, 10, 6, 8, 11, 7, 0, 15, 0, 15` (états 0→1→2→…→17).

Inversion du nibble : `low(c) = (n - 1) ^ 0xA`, le nibble haut est libre (4 bits de liberté par caractère). Exemple : n=7 → `6^0xA = 0xC` → `L` (0x4C), `l` (0x6C) ou `|`… ; n=0 → `(−1)&0xF = 0xF ^ 0xA = 5` → `5` (0x35). Le solveur prend le premier alphanumérique : `L 5 6 5 L 3 O 6 3 O M 0 L 5 4 5 4`.

## Vérification

```text
$ printf 'L565L3O63OM0L5454\n\n' | wine original/My_Third_Crackme.exe
enter the password : Yeaaaaa!!! Discord : imrate
Flag : CMO{Level3/6completed}
$ printf 'AAAAAAAAAAAAAAAAA\n\n' | wine original/My_Third_Crackme.exe
enter the password : Not today...
```

## Notes

- Preuve statique + Wine ; pas de GDB / x64dbg utilisé.
- Le flag « Level3/6completed » est une constante : tout mot de passe accepté par le DFA donne le même flag.
