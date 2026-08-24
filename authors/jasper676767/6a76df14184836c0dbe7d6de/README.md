# Jasper676767's Red light

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/6a76df14184836c0dbe7d6de) · id `6a76df14184836c0dbe7d6de`

Crackme **Linux** ELF64 **UPX**, C++ (non stripé une fois unpack).  
Auteur site : **Jasper676767**. Difficulty **2.5** · quality **4.0**.

Dossier : `authors/jasper676767/6a76df14184836c0dbe7d6de/` — [série auteur](../README.md) · [repo](../../../README.md).

| Fichier | Rôle |
|---|---|
| [`original/redLights`](original/redLights) | ELF UPX (packed) |
| [`analysis/redLights-unpacked`](analysis/redLights-unpacked) | unpack UPX 4.x |
| [`tools/red-light-solve.py`](tools/red-light-solve.py) | acrostiche → XOR → Base64 |

## Réponse

| | |
|---|---|
| Flag | **`FLAG{I_@m_A_MaSt3R_Ra1ge_5ai7er}`** |
| Clé XOR | **`fvDhpaDoha`** (acrostiche) |
| Curfew (runtime) | **`3636373736373637`** (`0xceb433cd3bd85`) |

```bash
# unpack
upx -d -o analysis/redLights-unpacked original/redLights

python3 tools/red-light-solve.py -q
# FLAG{I_@m_A_MaSt3R_Ra1ge_5ai7er}

# chemin dynamique (2 ages différentes + magic) — affiche les leurres + « key:105 »
printf 'a\nb\n3636373736373637\n' | ./analysis/redLights-unpacked
```

---

## 1. Premier regard

```text
ELF64, Packer: UPX(4.24)
sha256 c6dc1be3e9133cfe5625769bc516124d2283042bd7e4d0a6d90d29bd7712543c
```

Énoncé site : *flag split into 4 parts*, encoding + encryption. Labels XOR / Base64 / UPX.

---

## 2. Flow (après UPX)

Fonctions non stripées : `checkPass`, `curfew`, `randomFunc`, `part3`.

1. Lit **deux strings** « âge »
2. `checkPass` = égalité des deux  
   - **égales** → branche de distraction (« bypassed round one », phrase acrostiche, **pas** le flag)
   - **différentes** → `cin >> long` puis `curfew(x)`
3. `curfew` : OK si `x == 0xceb433cd3bd85` (= `3636373736373637`)
4. Affiche leurres (`0x23`, octets `ca db ec…`, `key:105` via `part3`)

Le flag se récupère **plus vite en statique** qu’en jouant le scénario.

---

## 3. Prédicat / crypto

Phrase :

```text
Funny vultures Dance happily past ancient Doors over hills again
```

Premières lettres → **`fvDhpaDoha`**.

Fragments hex dans `.rodata` (ex. `021c58360710382e3502320`, material type curfew, etc.)  
reconstruits en blob 44 octets ; XOR répété avec la clé → Base64 :

```text
RkxBR3tJX0BtX0FfTWFTdDNSX1JhMWdlXzVhaTdlcn0=
```

→ **`FLAG{I_@m_A_MaSt3R_Ra1ge_5ai7er}`**.

### Leurres

| Leurre | Pourquoi |
|---|---|
| Ages égales | `checkPass` true → cul-de-sac |
| `0x23` / décimal 35 | texte uniquement |
| `key:105` | imprimé par `part3`, inutile pour le XOR final |
| Octets `ca db ec 69…` | faux ciphertext |

---

## 4. Vérification

```bash
python3 tools/red-light-solve.py --check
# FLAG{I_@m_A_MaSt3R_Ra1ge_5ai7er}
# OK
```

---

## 5. Notes

- UPX obligatoire pour un listing propre (`nm` montre les symboles C++).
- Beaucoup de bruit volontaire — la phrase « nonsense » est le vrai signal.
