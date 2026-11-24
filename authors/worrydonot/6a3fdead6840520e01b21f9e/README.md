# worrydonot's Crackme For Beginners

| | |
|---|---|
| **ID** | [`6a3fdead6840520e01b21f9e`](https://crackmes.one/crackme/6a3fdead6840520e01b21f9e) · [`ORIGIN.yml`](ORIGIN.yml) |
| **Auteur** | worrydonot |
| **Plateforme** | macOS, Mach-O arm64 PIE, C++ (libc++) |
| **SHA-256** | `9ed9e25f458765aa4e5fb1a20b5d48b5874da34f20ff512d119df2c314572c6f` |

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/rollandroll` | binaire d'origine (non modifié) |
| `tools/rollandroll-solve.py` | solveur (`-q`, `--check`) |
| `tools/rollandroll-unicorn-check.py` + `-hooks.py` | preuve : exécute **le code arm64 du binaire** sous Unicorn |
| `tools/rollandroll-disarm.py`, `tools/rollandroll-stubs.py` | désassemblage Capstone de `__text`, table des stubs |
| `analysis/stubs.txt` | stub → import libc++ |

## Réponse

Pas de champ user : un seul mot de passe (pas de `petik` ici).

```
NevERGOnnaRUnaROunDAnDdeseRTyOU
```

```bash
python3 -I tools/rollandroll-solve.py --check
```

## Premier regard

- `file` : `Mach-O 64-bit arm64 executable` — **non exécutable sous Linux**, ni qemu-user ni Darling disponibles.
- `strings` : prompt `hold on where da password at?: `, `yayy that's the right one!`, `wrong, better luck next time.` et surtout une chaîne de 31 groupes `2145-5671-7381-…-4095` (à `0x100004928`, 154 octets).

## Flow

`main` (`0x1000004e8`) : lit un mot de passe (`cin >> std::string`), transforme chaque caractère, stocke les résultats dans un `vector<int>`, applique une 2ᵉ transformation, puis construit une chaîne « n1-n2-… » (`to_string`) comparée à la constante.

## Comment on trouve

Pas d'IDA/objdump arm64 ici : Mach-O parsé à la main, `__text` désassemblé avec Capstone (`tools/rollandroll-disarm.py`). Les `bl` vers `0x100004664` et co. sont des stubs (table dans `analysis/stubs.txt`).

Boucle 1 (`0x100000590`, itération sur la string) :

```
1000005ac ldrb w8,[x0]        ; c
1000005b8 eor  w8,w8,#0xf     ; t = c ^ 0xF
1000005d0 bl   vector<int>::emplace_back
```

Boucle 2 (`0x10000062c`, itération sur le vector) :

```
100000650 ldr w8,[x8]         ; t
100000658 ldr w9,[x9]
10000065c add w9,w9,#1        ; t+1
100000660 mul w8,w8,w9        ; t*(t+1)
100000664 mov w9,#2
100000668 sdiv w8,w8,w9       ; n = t*(t+1)/2   (nombre triangulaire)
```

Boucle 3 (`0x10000068c`) : pour chaque `n`, `to_string(n)` ajouté à une string, séparé par `'-'` (`mov w1,#0x2d`). Puis `0xd20` compare taille + `memcmp` avec la constante `0x100004928` → `yayy…` ou `wrong…`.

Inversion : pour chaque groupe `n`, `t = (isqrt(8n+1)-1)/2`, `c = t ^ 0xF`. Exemple : `2145` → `t=65` (65·66/2 = 2145) → `65^15 = 78` = `N`. `5671` → `t=106` → `106^15=101` = `e`. Chaque groupe est un triangulaire exact (assert dans le solveur), donc la solution est unique.

## Vérification

Pas de run natif possible (macOS arm64). Preuve par émulation du **vrai code du binaire** : `tools/rollandroll-unicorn-check.py` charge le Mach-O dans Unicorn, exécute `main` depuis `0x1000004e8`, et ne remplace que les imports libc++/libc (stubs : `strlen`, `memcpy`, `memcmp`, `operator new`, `string::__init/append/push_back`, `to_string`, `vector::emplace_back`…) ainsi que les appels `cout <<` / `cin >>` (hooks de fonction à `0x894`, `0x8dc`, `0xdb0`). Layout `std::string` Apple « alternate » (flag long = bit 7 de l'octet `+0x17`, ordre ptr/size/cap), lu dans `0x100001100`.

```
$ python3 tools/rollandroll-unicorn-check.py original/rollandroll NevERGOnnaRUnaROunDAnDdeseRTyOU
printed: [... "yayy that's the right one!"]
$ python3 tools/rollandroll-unicorn-check.py original/rollandroll petik
printed: [... 'wrong, better luck next time.']
$ ... NevERGOnnaRUnaROunDAnDdeseRTyOUx      # un caractère de trop → wrong
```

Limites : les imports libc++ sont réimplémentés par moi ; le prédicat (boucles + comparaison) est celui du binaire. Pas testé sur un vrai macOS.

## Notes

- Le mot de passe est une phrase (« never gonna run around and desert you »), casse brouillée par le XOR `0xF` (bit de casse 0x20 intact, donc casse = celle du clair XOR-é sur 4 bits bas).
- Pas de GDB, pas de debug live : reverse 100 % statique + émulation.
