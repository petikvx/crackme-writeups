# Kryptos's Simple login crackme

| | |
|---|---|
| **ID** | [`69e13f938afd9d6c48b488fd`](https://crackmes.one/crackme/69e13f938afd9d6c48b488fd) ([`ORIGIN.yml`](ORIGIN.yml)) |
| **Auteur** | Kryptos |
| **Plateforme** | Windows PE64, console, C++ (MSVC, `crackme-lvl1.pdb`) |
| **SHA-256** | `f5e0d7eef306e78b0c937d735931d73f542470449b94be15597e437e1e27a1aa` |

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/crackmepls.exe` | binaire d'origine (non modifié) |
| `tools/kryptos-solve.py` | keygen + `--check` (Wine) |

## Réponse

Le mot de passe dépend du user (hash → entier signé affiché en décimal).

| User | Pass |
|---|---|
| `petik` | `-1873409733` |
| `admin` | `2110634480` |

```bash
python3 tools/kryptos-solve.py --user petik          # user=petik pass=-1873409733
python3 tools/kryptos-solve.py --user petik -q
python3 tools/kryptos-solve.py --user petik --check original/crackmepls.exe
```

## Premier regard

- `file` : PE32+ console x86-64, MSVC (iostream `cin`/`cout`, `std::string`).
- `strings` : `User: `, `Pass: `, `Access granted`, `Access denied` (dans `.rdata`, 0x1400033b4…0x1400033d8). Rien d'autre d'utile : pas de mot de passe en clair.
- Pas de `decc`/IDA dispo dans cette session : analyse à `objdump -d -M intel original/crackmepls.exe`.

## Flow

`main` (0x140001290) : affiche `User: `, lit un mot (`cin >> s1`), affiche `Pass: `, lit `s2`, calcule un hash du user, le convertit en chaîne décimale, compare à `s2` (taille puis `memcmp`), affiche granted/denied.

## Comment on trouve

Ancrage : les `lea rdx,[…]` vers `User: ` (0x1400033b4) et `Pass: ` (0x1400033bc) dans la fonction 0x140001290 mènent directement à la boucle de hash.

Boucle à 0x140001350 (s1 = user, `r9` = longueur, `edx` = i, `r8d` = h) :

```asm
movsx ecx, byte [buf+rdx]      ; c (signé)
lea   eax, [rdx+1]             ; i+1
imul  eax, ecx                 ; (i+1)*c
add   eax, r8d                 ; t = (i+1)*c + h
lea   r8d, [rax*8]             ; t<<3
xor   r8d, eax                 ; h = (t<<3) ^ t
```

Puis (0x14000137d) :

```asm
imul edx, r8d, 0x539           ; h*1337
xor  edx, 0x5a5a
lea  rcx,[rsp+0x28]
call 0x140001610               ; int -> std::string
```

0x140001610 est un `std::to_string(int)` : `test edx,edx / jns`, `neg`, division par 10 via `0xcccccccd` (`mul` + `shr 3`), `+0x30`, préfixe `0x2d` (`-`) si négatif. Donc la valeur est interprétée **signée 32 bits** : si le bit 31 est à 1, le pass commence par `-`. Le résultat est comparé (0x1400013ca : tailles, puis `memcmp` en 0x1400013e0) au pass saisi ; `sete r14b` choisit « Access granted » ou « Access denied ».

Exemple `petik` : h final = `0x004ca769` ; `h*0x539 mod 2^32 ^ 0x5a5a` = `0x9056093b` = 2421557563 non signé, soit **-1873409733** en signé.

Pièges : `cin >>` s'arrête au premier espace (user sans espace) ; `movsx` rend les octets ≥ 0x80 négatifs (géré dans le solveur) ; l'affichage est signé, pas `unsigned`.

## Vérification

Binaire d'origine sous Wine (`xvfb-run -a wine`), via `--check` :

```text
petik / '-1873409733' -> Access granted
petik / '0000'        -> Access denied
admin / '2110634480'  -> Access granted
admin / '0000'        -> Access denied
```

Pas de GDB ni de debugger live utilisés (analyse statique + Wine).

## Notes

- Le user sert de seed : un keygen par user, pas de pass universel.
- Le hash est faible (additif/xor, 32 bits) : trivialement inversible/collisionnable.
