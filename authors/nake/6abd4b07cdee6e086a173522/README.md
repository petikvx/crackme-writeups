# nake's SP network cipher

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/6abd4b07cdee6e086a173522) · id `6abd4b07cdee6e086a173522`

PE64 **C++** MSVC **Debug** (`xorNT.pdb`). Diff. site **3.0**.  
Keygen : pour la clé imposée `43444956`, retrouver la commande qui chiffre vers `T` et affiche `Goood!`.

| Fichier | Rôle |
|---|---|
| [`original/xorNT.exe`](original/xorNT.exe) | binaire Debug |
| [`tools/xornt-solve.py`](tools/xornt-solve.py) | keygen / `--check` |
| [`analysis/xorNT.c`](analysis/xorNT.c) | Hex-Rays `main` + SP-network |

## Réponse

La commande a la **même longueur que `T`** (10). `petik` (len 5) est hors prédicat.

| | |
|---|---|
| **Key** | `43444956` (donnée auteur, `≤ 400000000`) |
| **Command** | `Adrtl03333` |
| OK | `\nGoood!` puis `Sleep(3000)` |
| KO | re-prompt `Enter the command ` |

```bash
python tools/xornt-solve.py -q
# Adrtl03333
python tools/xornt-solve.py --key 43444956 --check
```

`--check` vérifie `encrypt(cmd, key) == T` (octets extraits de `.rdata` @ `0x140025A10`). Le PE Debug importe `MSVCP140D.dll` / `VCRUNTIME140D.dll` / `ucrtbased.dll` : sans le CRT Debug, Windows rend `STATUS_DLL_NOT_FOUND` (`0xC0000135`).

---

## 1. Premier regard

```text
xorNT.exe: PE32+ executable (console) x86-64, MSVC Debug
sha256  8ddb682a47bc287e9b29a8f467c7dfdfe7ca0a1cfa7328e720b0d319cc736953
md5     a01e0b2f0549581b79597ef814efd1d2
size    122880
pdb     C:\Users\Nake\source\repos\xorNT\x64\Debug\xorNT.pdb
```

```text
Enter the key
Enter the command
Goood!
```

`Goood!` n’est **pas** le ciphertext. `T` est binaire, 10 octets, collé juste avant dans `.rdata` :

```text
140025A10  ee b3 90 97 81 db df af c2 c5 00 ...
140025A20  0a 47 6f 6f 6f 64 21 00          ; "\nGoood!"
```

---

## 2. Flow

`main` = `sub_14001A050` (thunk `0x140011528`).

1. `cin >> uint64 key` tant que `key > 0x17D78400` (400 000 000).
2. `cin >> string cmd` ; longueur **4..15** sinon on relance le prompt.
3. `encrypt(cmd, key)` (pipeline 3 étages) puis `== T`.
4. Match → `cout << "\nGoood!"` ; sinon boucle commande (la clé n’est plus relue).

Le compteur du keystream est un **global** `.data` (`unk_14002A508`, 3 dwords). Il n’est **pas** remis à zéro entre deux commandes : un essai raté décale le XOR du suivant. Le premier essai part de `(0,0,0)`.

---

## 3. Comment on trouve le prédicat

### 3.1 Ancrage IDA (MCP `ida`)

```text
open_database original/xorNT.exe
main      @ 0x14001A050
encrypt   @ 0x1400192F0   (thunk 0x140011244)
permute   @ 0x140018D10
subst     @ 0x140018890
xorstream @ 0x1400191B0
counter++ @ 0x140018610 / normalize 0x140018B90
T         @ 0x140025A10   ee b3 90 97 81 db df af c2 c5
```

`encrypt` enchaîne copie → permute → subst → XOR (chacun prend un `std::string` et le détruit, Debug + EH lourds).

### 3.2 Permutation (4 swaps)

`sub_140018D10`, `n = len(cmd)` :

```c
c = K;
for (j = 0; j < 4; j++) {
    i = c % n;
    v = (c / n) - 0x61C8864680B583EB;   // 2^64/φ  (splitmix)
    k = v % n;
    c = 0xBF58476D1CE4E5B9 * v + 1;     // mix splitmix64
    if (i != k) swap(buf[i], buf[k]);
}
```

Pour `K = 43444956`, `n = 10` : swaps `(6,0) (9,5) (4,1) (6,7)`.

### 3.3 Substitution

`sub_140018890` (Hex-Rays réduit `K` en `__int16` : seuls les 16 bits bas servent) :

```text
lo =  K       & 0xFF
hi = (K >> 8) & 0xFF  XOR  0x5A
si lo ≠ hi : chaque octet == lo devient hi
```

Pour `43444956` (`0x0296EADC`) : `lo = 0xDC`, `hi = 0xEA ^ 0x5A = 0xB0`.  
Aucun octet de `Adrtl03333` n’est `0xDC` → subst no-op sur le plaintext.

Inverse : remplacer `hi` par `lo`.

### 3.4 XOR keystream

Objet 3 dwords `d[0],d[1],d[2]` + accumulateur `a = K` :

```c
++d[0];
if (d[0] > 3) { d[0] = 0; ++d[1]; }
if (d[1] > 3) { d[1] = 0; ++d[2]; }
if (d[2] > 3) { d[2] = 0; ++d[1]; }   // pas un vrai base-4
a += d[0] + d[1] + d[2];
*byte ^= (uint8_t)a;
```

C’est déterministe et **inversible** (XOR). Première commande : `d` à zéro.

### 3.5 Inverse (keygen)

`T` a 10 octets → commande de 10 caractères.

```text
buf  = T XOR keystream(K, 10)
buf  = subst⁻¹(buf, K)
buf  = permute⁻¹  (swaps dans l’ordre inverse)
```

Pour `K = 43444956` :

```text
ks   = dd dfe2 e3e5 e8ec eef1 f5
T⊕ks → après subst⁻¹ et unpermute → Adrtl03333
encrypt("Adrtl03333", 43444956) == T   ✓
```

---

## 4. Prédicat consolidé

```text
cin key  (uint64 ≤ 400000000)
cin cmd  (4 ≤ len ≤ 15)
encrypt(cmd, key) == T[10]
  encrypt = XOR_ks ∘ subst ∘ permute_4swaps
```

---

## 5. Vérification

```text
python tools/xornt-solve.py --check
# logique  encrypt(b'Adrtl03333', 43444956) == T : True
```

| Entrée | Résultat |
|---|---|
| `43444956` / `Adrtl03333` | `encrypt == T` → `Goood!` (si CRT Debug présent) |
| `43444956` / `petik` | len 5 ≠ 10, `encrypt != T` |
| `43444956` / `wrongwrong` | len 10 mais `encrypt != T` → re-prompt, **compteur déjà avancé** |

x64dbg n’était pas attaché. Reverse 100 % IDA + round-trip Python sur `T`.

---

## 6. Notes

- Build **Debug** : piles `0xCCCCCCCC`, thunks `jmp`, iostream partout. Le crypto tient en trois fonctions.
- Constantes `0x61C8864680B583EB` / `0xBF58476D1CE4E5B9` = splitmix64 (Steele / Vigna), pas un « vrai » SPN AES.
- Compteur global : un fail puis le bon plaintext **échoue** au 2ᵉ essai dans le même process.
- Autre `K` ≤ 400 000 000 → autre commande de 10 octets (`--key N`). L’auteur demande spécifiquement `43444956`.
