# RodrigoTeixeira's Loggin

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/6abfc1a30885f990699dc0c2) · id `6abfc1a30885f990699dc0c2`

PE32 **C** MinGW.org GCC 6.3.0, console, DWARF (`main.c`, `_hash`, `_next`). Diff. site **3.0**.  
Objectif : afficher `Logged in successfully`.

| Fichier | Rôle |
|---|---|
| [`original/main.exe`](original/main.exe) | binaire |
| [`tools/loggin-solve.py`](tools/loggin-solve.py) | keygen MITM / `--check` |
| [`analysis/main.c`](analysis/main.c) | Hex-Rays `hash` / `next` / `main` |

## Réponse

Le username n’est **pas** libre : `xorshift32` est une bijection, donc `hash(user)` est forcé à `0xCF1B4D38`.  
`petik` est exclu (hash `0x0659F281`). Plus courte préimage alnum : **`vefxne`**.

| | |
|---|---|
| **Username** | `vefxne` |
| **Password** | `mrqbixn` |
| OK | `Logged in successfully` |
| KO | `Incorrect username or password.` |

Autre password pour le même user (collision du `hash32`) : `8kja9ga`.

```bash
python tools/loggin-solve.py -q
# vefxne
# mrqbixn
python tools/loggin-solve.py --check
```

`--check` pose à côté de l’exe un stub PE32 `libmingwex-0.dll` (imports CRT `fesetenv` / `__mingw_glob`). Sans cette DLL, Windows rend `STATUS_DLL_NOT_FOUND` (`0xC0000135`).

---

## 1. Premier regard

```text
main.exe: PE32 executable (console) Intel 80386, for MS Windows
sha256  707d4e4bf7944e07af1b42eaeaae8e77a5afdce7de473f85fa530cca04e3dcfc
md5     2c32e080676f1c07878ce868406f1d37
size    31939
```

Strings utiles :

```text
Enter username:
Enter password:
Logged in successfully
Incorrect username or password.
GCC: (MinGW.org GCC-6.3.0-1) 6.3.0
.file  main.c
_hash
_next
_main
```

Le titre du site dit « Loggin in successfully » ; le binaire imprime **`Logged in successfully`** (`printf`, sans newline).

---

## 2. Flow

1. `scanf("%99s")` username puis password (buffers 100 / 112 octets sur la pile).
2. Username vide → on lit quand même le password, puis fail.
3. `h = hash(user, 0)` (inliné) puis `next(h) == 0x713FD2A6` sinon fail.
4. `hash(password || username, 0) == 0x439CF161` (1134358881) sinon fail.
5. Succès → `printf("Logged in successfully")`.

`hash` et `next` existent à `0x401460` / `0x401490` (DWARF) mais **GCC `-O2` les inline** dans `main` (`0x402170`) : pas de `call`.

---

## 3. Comment on trouve le prédicat

### 3.1 Ancrage IDA (MCP `ida`)

```text
open_database original/main.exe
hash  @ 0x401460
next  @ 0x401490
main  @ 0x402170
```

Pseudo Hex-Rays (extrait, types nettoyés) :

```c
int hash(unsigned char *s, int h)   // seed h
{
  for (; *s; s++)
    h = *s + 31 * h;                // shl 5 ; sub  (h*32 - h)
  return h;
}

unsigned next(unsigned x)
{
  x ^= x << 13;
  x ^= x >> 17;
  x ^= x << 5;                      // Marsaglia xorshift32
  return x;
}
```

Dans `main`, après le `scanf` username, la boucle inlinée calcule `hash(user, 0)` dans `esi`, puis le mixer, puis la constante :

```asm
; esi = hash(username, 0)
4021e9  mov  edx, esi
4021eb  shl  edx, 0Dh          ; x << 13
4021ee  mov  eax, edx
4021f0  xor  eax, esi
4021f2  mov  edx, eax
4021f4  shr  edx, 11h          ; >> 17
4021f7  xor  edx, eax
4021f9  mov  esi, edx
4021fb  shl  esi, 5            ; << 5
4021fe  xor  edx, esi
402200  cmp  edx, 713FD2A6h    ; next(hash(user)) ?
402206  jnz  fail
```

Le second check enchaîne le même `*31+c` sur le password **puis** reprend le username (concaténation polynomiale) :

```asm
; eax = hash(password, 0)  puis hash(username, eax)
402255  cmp  eax, 439CF161h    ; 1134358881
40225a  jz   ok                ; printf "Logged in successfully"
```

### 3.2 Décodage

`hash` = `String.hashCode` Java sur u32 :

\[
H(s) = \sum_i s_i \cdot 31^{n-1-i} \pmod{2^{32}}
\]

`next` est **inversible** bit à bit :

- inverse de `x ^= x << k` : reconstruire les bits du bas vers le haut ;
- inverse de `x ^= x >> k` : du haut vers le bas.

```text
next(H) = 0x713FD2A6
H = inv_xorshift32(0x713FD2A6) = 0xCF1B4D38
```

Vérif : `xorshift32(0xCF1B4D38) == 0x713FD2A6`.

Donc **tout** username valide a le même `hash32`. Ce n’est pas un login au choix.

Le password, une fois `len(user)` connu :

\[
H(\mathrm{pass})\cdot 31^{L} + 0x\mathrm{CF1B4D38} \equiv 0x439\mathrm{CF161} \pmod{2^{32}}
\]

Pour `L = 6` : `H(pass) = 0x4EF636E9`.

Préimages alnum par **meet-in-the-middle** (pas un brute user×pass) :

| Cible | Longueur mini `[a-z0-9]` | Exemple |
|---|---|---|
| `H(user) = 0xCF1B4D38` | 6 | `vefxne` (aussi `vefxoF`, … en printable) |
| `H(pass) = 0x4EF636E9` | 7 | `mrqbixn`, `8kja9ga`, `mt3bixn`, … |

`petik` : `hash = 0x0659F281`, `next = 0x39301E25` ≠ cible. Aucun `L < 100` ne rend `petik` valide comme password.

### 3.3 Pièges

- `hash` / `next` sans xref : tout est inliné dans `main`.
- `strings` « Loggin » / description site ≠ message réel.
- Username vide court-circuite le xorshift (fail après le 2ᵉ prompt).
- Collisions nombreuses : beaucoup de couples marchent, un seul `H` username.

---

## 4. Prédicat consolidé

```text
hash(s, h=0):
    for c in s: h = (31*h + c) & 0xFFFFFFFF

next(x):
    x ^= x << 13
    x ^= x >> 17
    x ^= x << 5

next(hash(user)) == 0x713FD2A6          # ⇔ hash(user) == 0xCF1B4D38
hash(password + user) == 0x439CF161
```

---

## 5. Vérification

```text
python tools/loggin-solve.py --check
# Enter username: Enter password: Logged in successfully
# OK
```

| Entrée | Sortie |
|---|---|
| `vefxne` / `mrqbixn` | `Logged in successfully` (printf retourne 22) |
| `vefxne` / `8kja9ga` | idem |
| `petik` / `petik` | `Incorrect username or password.` |
| `vefxne` / `wrong` | `Incorrect username or password.` |

x32dbg n’était pas attaché (MCP injoignable). Reverse 100 % statique IDA + preuve native du PE d’origine.

---

## 6. Notes

- Import `libmingwex-0.dll` (MinGW.org, pas mingw-w64) : uniquement `fesetenv` et `__mingw_glob` pour le CRT. Le check lui-même ne s’en sert pas (`printf` / `scanf` / `puts` → `msvcrt`).
- Brute force « user×pass » est autorisé par l’auteur ; l’inversion du xorshift + MITM sur `hash32` évite le produit cartésien.
- `scanf("%99s")` : pas d’espace dans user/pass.
