# pitou's Evaisve

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/6a73209208712c1a17cbac90) · id `6a73209208712c1a17cbac90`

Crackme **Windows** PE64 console, packer **Fatpack** (resource FPACK + LZMA).  
Auteur site : **pitou**. Difficulty **2.3** · quality **5.3**.

Dossier : `authors/pitou/6a73209208712c1a17cbac90/` — [série auteur](../README.md) · [repo](../../../README.md).

| Fichier | Rôle |
|---|---|
| [`original/Evasive.exe`](original/Evasive.exe) | stub Fatpack |
| [`analysis/Evasive-unpacked.exe`](analysis/Evasive-unpacked.exe) | PE interne (LZMA) |
| [`tools/evasive-solve.py`](tools/evasive-solve.py) | unpack + XOR flag |

## Réponse

| | |
|---|---|
| Flag | **`IEEE{S031me_T1mes_We_h1s_t0_Su111ffer}`** |
| Leurres | `F12ag_i5_somehow_1_hidden_XD` (écrit dans `flag.txt`) |

```bash
python3 tools/evasive-solve.py -q
# IEEE{S031me_T1mes_We_h1s_t0_Su111ffer}
```

Le vrai flag commence par **`IEEE{`** (énoncé : `####{}`).

---

## 1. Premier regard

```text
PE32+ console x86-64, Fatpack[resources payload]
sha256 e65ea4b309617314a6d01168aa0711da8825351e1764dca5eb4498a4ed3fc35f
```

Imports du stub : `FindResourceW` / `LoadResource` / `VirtualAlloc` / `VirtualProtect` — loader réflectif.

---

## 2. Flow

1. Stub lit la resource **FPACK** (RVA `0x60ac`)  
2. Décompresse **LZMA alone** → PE64 interne (~127 KiB)  
3. Mappe / exécute le payload  
4. `main` du payload construit un tableau de dwords puis XOR → flag  

---

## 3. Prédicat

Dans le PE interne, autour de `0x1400014A5` : **40** instructions  
`mov dword [rbp+disp8], imm32` → tableau `tab[0..39]`.

```text
key  = tab[38]
flag = join( chr(tab[i] ^ key) for i in 0..37 )
```

→ **`IEEE{S031me_T1mes_We_h1s_t0_Su111ffer}`**.

---

## 4. Vérification

```bash
python3 tools/evasive-solve.py --check
# IEEE{S031me_T1mes_We_h1s_t0_Su111ffer}
# OK
```

---

## 5. Notes

- Wine sur le stub/payload peut rester muet sans dump — la voie statique suffit.  
- Ne pas confondre avec le leurre `flag.txt`.
