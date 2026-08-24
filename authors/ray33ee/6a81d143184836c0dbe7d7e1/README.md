# ray33ee's x or and add

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/6a81d143184836c0dbe7d7e1) · id `6a81d143184836c0dbe7d7e1`

Crackme **Windows** PE64 console, **C/C++** (MinGW).  
Auteur site : **ray33ee**. Difficulty **3.0** · quality **4.3**.

Dossier : `authors/ray33ee/6a81d143184836c0dbe7d7e1/` — [série auteur](../README.md) · [repo](../../../README.md).

| Fichier | Rôle |
|---|---|
| [`original/xor_crackme.exe`](original/xor_crackme.exe) | PE32+ console x86-64 |
| [`tools/xor-and-add-solve.py`](tools/xor-and-add-solve.py) | keygen name → password |
| [`tools/keytable.bin`](tools/keytable.bin) | 1200 octets de clé (extrait du binaire) |

## Réponse

Name + password **12 caractères**. Exemple **`petik`** :

| | |
|---|---|
| Name | **`petik`** |
| Password | **`Vg)vnP&(Y%i$`** |

```bash
python3 tools/xor-and-add-solve.py -q
# Vg)vnP&(Y%i$

python3 tools/xor-and-add-solve.py --check 'Vg)vnP&(Y%i$' --user petik
# user='petik' hash=141 key=(227, 4, 250) check=OK

# preuve live (attention au % dans le password si tu uses printf)
python3 -c "import subprocess,os; r=subprocess.run(['wine','original/xor_crackme.exe'],input='petik\nVg)vnP&(Y%i$\n',capture_output=True,text=True,env={**os.environ,'WINEDEBUG':'-all'}); print(r.stdout,r.returncode)"
# Name: Password: yes
# 0
```

---

## 1. Premier regard

```text
PE32+ executable (console) x86-64, for MS Windows
sha256 0bd5e02796ac81072ea2c49bb83196d702a17329a0355626880d74b4f0affa24
```

Strings utiles : `Name: `, `Password: `, `Cr4ckM35D0t1`, `yes` / `no`, formats `%30s` / `%12s`.

Le littéral `Cr4ckM35D0t1` n’est **pas** le password : c’est la cible du prédicat XOR/ADD.

---

## 2. Flow

1. Prompt `Name:` → `scanf("%30s")`
2. Prompt `Password:` → `scanf("%12s")` (longueur attendue = 12)
3. `h = sum(bytes(name)) % 400`
4. Clé 3 octets : `table[3*h .. 3*h+2]` (tableau de dwords en `.rdata`, on prend le low byte)
5. Pour chaque index `i ∈ [0,11]` :
   ```text
   ((password[i] ^ k0) + k1) ^ k2  ==  Cr4ckM35D0t1[i]
   ```
   (promotion `movsx` sur les chars du password / de la cible, `movzx` sur la clé)
6. Affiche `yes` (exit 0) ou `no` (exit 1)

Titre du challenge = les ops du prédicat : **xor**, **add**, puis **xor** encore.

---

## 3. Prédicat / keygen

Hash du name (équivalent asm avec magie `0x51eb851f` = division par 400) :

```python
h = 0
for c in name.encode():
    h = (h + c) % 400
k0, k1, k2 = table[3*h], table[3*h+1], table[3*h+2]
```

Inversion (octet par octet) :

```python
password[i] = ((Cr4ckM35D0t1[i] ^ k2) - k1) ^ k0   # en respectant les signes 8-bit
```

Table : VA `0x140013040`, pointée via global `0x140014fc0` ; dumpée dans [`tools/keytable.bin`](tools/keytable.bin).

---

## 4. Vérification

```bash
python3 tools/xor-and-add-solve.py --user petik
# user='petik'  hash=141  key=(227, 4, 250)
# password=Vg)vnP&(Y%i$
```

Wine OK → `yes`.

---

## 5. Notes

- `Cr4ckM35D0t1` en clair est un leurre / une constante de comparaison, pas la solution.
- Un `printf '...\n'` shell interprète le `%i` du password → préférer Python/`printf '%s\n'`.
- hwenzy *c++ CrackMe 4/10* (précédent de la liste) laissé **pending** (VMP SDK + anti-debug TF trop long pour cette passe).
