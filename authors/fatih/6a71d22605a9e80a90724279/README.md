# Fatih's S-BOX

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/6a71d22605a9e80a90724279) · id `6a71d22605a9e80a90724279`

Crackme **Windows** PE64 console (« SBoxCrypt v3.0 - Noktos Systems »).  
Auteur site : **Fatih**. Difficulty **3.0** · quality **4.0**.

Dossier : `authors/fatih/6a71d22605a9e80a90724279/` — [série auteur](../README.md) · [repo](../../../README.md).

| Fichier | Rôle |
|---|---|
| [`original/sbox_lab.exe`](original/sbox_lab.exe) | PE32+ console |
| [`tools/sbox-solve.py`](tools/sbox-solve.py) | inverse S-Box + XOR roulant |

## Réponse

| | |
|---|---|
| License key | **`NOKTOSLABKEY`** (12 caractères) |

```bash
python3 tools/sbox-solve.py -q
# NOKTOSLABKEY

printf 'NOKTOSLABKEY\n' | WINEDEBUG=-all wine original/sbox_lab.exe
# license accepted. congratulations!
```

---

## 1. Premier regard

```text
PE32+ console x86-64 (MinGW)
sha256 35bc745fb9f41a1fe22f0dc473534c77c1612d74142bb057f1337c0310fea3b5
```

Banner `enter license key>` ; `wrong length.` si ≠ 12.

---

## 2. Flow

1. Lit la clé (`fgets` / longueur 12)  
2. Construit une S-Box 256 octets (Fisher-Yates + xorshift32, seed `0x12345678`)  
3. Transforme : `out[i] = sbox[ key[i] ^ (0xA5 + i) ]`  
4. Compare aux 12 octets cibles ; OK → `license accepted. congratulations!`

Astuce asm : `ebx = 0xffffffa5 - &buf` puis `lea eax,[rbx+rdx]` → low byte = `0xA5+i`.

---

## 3. Prédicat

Cible (little-endian dans le binaire) :

```text
FF 68 31 7C 90 57 29 97 D9 83 BE 68
```

Inverse :

```python
key[i] = inv_sbox[target[i]] ^ ((0xA5 + i) & 0xff)
```

→ **`NOKTOSLABKEY`**.

---

## 4. Vérification

```bash
python3 tools/sbox-solve.py --check NOKTOSLABKEY
# check=OK …
```

---

## 5. Notes

- L’auteur pointe aussi un toolkit GitHub (`zer0crypt02/S-BOX_Solver`) — même crypto.  
- Pas de patch nécessaire.
