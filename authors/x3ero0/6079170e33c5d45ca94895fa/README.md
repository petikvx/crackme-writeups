# X3eRo0 — fl04t

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/6079170e33c5d45ca94895fa) · id `6079170e33c5d45ca94895fa`

ELF64 statique, strippé : password **20 octets**, prédicat **float 80-bit** (`fcos` / Dottie).  
Auteur : [X3eRo0](https://crackmes.one/user/X3eRo0).

Dossier : `authors/x3ero0/6079170e33c5d45ca94895fa/` — [famille](../README.md) · [repo](../../../README.md).

| Fichier | Rôle |
|---|---|
| [`fl04t`](original/fl04t) | binaire (~8,5 Ko) |
| [`fl04t-solve.py`](tools/fl04t-solve.py) | keygen + `--check` (fds remappés) |

## Réponse

| | |
|---|---|
| Password | **`fr0m_fl04ts_1mp0rt_*`** |

```bash
python3 tools/fl04t-solve.py -q
python3 tools/fl04t-solve.py --check
# … [- PASSWORD ACCEPTED -]
```

---

## 1. Premier regard

```text
ELF 64-bit LSB executable, x86-64, statically linked, stripped
sha256: c5d23382b4fe9ed760a09d8346311d3bbbbbaf48311906912bb52fc77d903786
[+] input length must be 20
```

**Piège I/O** : `write` utilise `fd=0`, `read` utilise `fd=1` (stdin/stdout inversés).  
Un simple pipe `printf … | ./fl04t` boucle sur le prompt de longueur.

---

## 2. Flow

```text
banner
loop:
  read 0x30 bytes (fd=1), null-termine le dernier octet lu
  strlen == 20 ? sinon re-prompt
xor_inplace(input[0:10],  key @ 0x401005)   # 10 bytes
ok1 = (fld tbyte(input); fcos; fucomi ==)   # x == cos(x)
xor_inplace(input[10:20], key @ 0x40100f)
ok2 = same float check
ok1 && ok2 → PASSWORD ACCEPTED
```

---

## 3. Prédicat

Les clés (dans `.text` juste après l’entry) :

```text
k1 = ad1f4173b3c8588dca4b
k2 = b83240739c9e46c9a115
```

Après XOR, chaque bloc de 10 octets doit être l’encodage **long double x87** d’un point fixe de `cos` (nombre de Dottie ≈ 0.739085…).  
Itérer `fcos` depuis `0.7` jusqu’à stabilité donne :

```text
dottie80 = cb 6d 71 1e ec ae 34 bd fe 3f
password = dottie80 ⊕ k1  ‖  dottie80 ⊕ k2
         = fr0m_fl04ts_1mp0rt_*
```

---

## 4. Vérification

```bash
python3 tools/fl04t-solve.py --check
```

Le solveur `fork` + `dup2` pour brancher les pipes sur les fds attendus par le binaire.

---

## 5. Notes

- `libm cosl` peut différer d’un ulp vs `fcos` x87 — utiliser la boucle x87 (ou les bytes ci-dessus).
- Famille : après [Eat Sleep Trace Repeat](../61efb6a633c5d413767ca678/).
