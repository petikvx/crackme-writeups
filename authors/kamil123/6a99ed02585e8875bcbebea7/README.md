# kamil123's echo_labyrinth

| | |
|---|---|
| **ID** | [`6a99ed02585e8875bcbebea7`](https://crackmes.one/crackme/6a99ed02585e8875bcbebea7) · [`ORIGIN.yml`](ORIGIN.yml) |
| **Auteur** | kamil123 |
| **Plateforme** | Windows x86-64 PE console (MinGW-w64), « Level 3 CrackMe », password seul |
| **SHA-256** (`original/download.bin`) | `9b12882957faf8b63cef91372e7fd6a507e19cb4e37047d3a47d6d3d6cfe3686` |

| Fichier | Rôle |
|---|---|
| `original/download.bin` | en réalité un **ZIP** (mdp `crackmes.one`) contenant `echo_labyrinth.exe` |
| `analysis/x/echo_labyrinth.exe` | exe extrait (`unzip -P crackmes.one`) ; `analysis/echo.asm` = `objdump -d -M intel` |
| `tools/echo_labyrinth-solve.py` | solveur (MITM numpy, ~30 s), `-q`, `--check` |

## Réponse

**Password : `r3flect`** (pas d'username ; pas de `petik` ici).

```bash
python3 -I tools/echo_labyrinth-solve.py            # solutions : ['r3flect']
python3 -I tools/echo_labyrinth-solve.py -q --check # relance l'exe sous wine
```

## Premier regard

- `download.bin` commence par `PK\3\4` : on dézippe dans `analysis/x/` (on ne touche pas `original/`).
- Bannière : « Echo Labyrinth | Level 3 CrackMe — Find the password. No username. » ; succès `ACCESS GRANTED / The echo returns your voice.`, échec `ACCESS DENIED / Only silence in the labyrinth.`
- Imports anti-debug : `IsDebuggerPresent`, `CheckRemoteDebuggerPresent`, PEB `BeingDebugged` (`gs:[0x60]+2`). Chaîne « Unusual environment detected ».

## Flow (main @ `0x140007bc0`)

1. `0x140001480` calcule la constante globale `[0x140008000]` : `0xeef10ef1 - 0x2eef3ee4 = 0xc001d00d` si aucun debugger (sinon valeur altérée → les `xor` conditionnels de la suite faussent les hashes). Valeur initiale dans `.data` : `0dd001c0` = `0xc001d00d`.
2. `fgets` de 0x40 octets, longueur (`0x140007ac0` = strlen) **doit valoir 7** (`cmp rax,7`).
3. Cinq contraintes, toutes nécessaires (`eax == 0xf0` = 0x10+0x20+0x40+0x80, plus un hash final).

## Comment on trouve

Ancrage : `objdump -d -M intel` puis lecture à partir de `0x140007cf4` (la chaîne « ACCESS GRANTED » est référencée en `0x140007e8e`, atteinte seulement si `cmp eax,0xf0` passe).

**Étape A — transformation e[i]** (`0x140007d30`) :
```asm
movzx eax,[rbx+rdx]; add eax,r8d      ; p[i] + 7*i  (r8d += 7 par tour)
rol al,3 ; xor al,[r10+rdx]           ; clé 66 57 40 b1 a2 93 fc (immediates en 0x140007d14..23)
```
`e[i] = rol8(p[i]+7i, 3) ^ KEY[i]` (le `xor` avec `[0x140008000]` n'a lieu qu'en cas de debugger).

**Étape B** (`0x140007d89`) : `r9 = Σe (16 bits)`, `r8 = ⊕e`. Le bloc `or al,1; imul` ne sert que de piège (impair×impair reste impair → toujours « vrai »). Contraintes : `Σe == 0x478`, `⊕e == 0x2c`.

**Étape C** (`0x140007dc8`) : djb2 *xor* sur `p` : `h = 0x1505 ; h = (h*33) ^ c` → `h == 0x9c670a5c`.

**Étape D** (`0x140007e00`) : petit hash 8 bits sur 7 octets : `dl = (dl>>3) ^ ((dl*65 + cl + c) & 0xff)`, `dl0=0xa5`, `cl += 3` → `dl == 0x73`.

**Étape E** : `((dl*0x1000193) ^ (r8b<<16 | r9) ^ (h & 0xffff)) == 0x732cbb2d`.

**Résolution** : l'espace 95⁷ est trop grand en brute force, mais le hash C est **inversible** (`h_prev = ((h' ^ c) * 33⁻¹) mod 2³²`). Meet-in-the-middle : 3 premiers car. en avant (857 k), 4 derniers en arrière depuis `0x9c670a5c` (81 M), jointure triée par `searchsorted`, puis filtre A/B/D/E. Résultat unique en ASCII imprimable : `r3flect` (« reflect », leetspeak).

Pièges : le `imul/test al,1` (toujours vrai), le `[0x140008000]` qui dépend du debugger (ne pas lancer sous debug), le fichier est un zip nommé `.bin`.

## Vérification

Wine (`xvfb-run -a wine analysis/x/echo_labyrinth.exe`, entrée suivie d'un Enter) :

| Entrée | Sortie |
|---|---|
| `r3flect` | `*** ACCESS GRANTED ***` / `The echo returns your voice.` |
| `r3flecu` | `*** ACCESS DENIED ***` / `Only silence in the labyrinth.` |

Analyse 100 % statique (objdump) + Wine : pas de session GDB/x64dbg/IDA.
