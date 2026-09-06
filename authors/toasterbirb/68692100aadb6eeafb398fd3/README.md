# toasterbirb — off_by_one

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/68692100aadb6eeafb398fd3) · id `68692100aadb6eeafb398fd3`

Crackme **ELF64** NASM static/stripped. Dispatcher par **table d’adresses + 1**, prédicat sur 8 octets.  
Auteur : [toasterbirb](https://crackmes.one/user/toasterbirb).

Dossier : `authors/toasterbirb/68692100aadb6eeafb398fd3/` — [famille](../README.md) · [repo](../../../README.md).

| Fichier | Rôle |
|---|---|
| [`off-by-one`](original/off-by-one) | binaire d’origine |
| [`off-by-one-solve.py`](tools/off-by-one-solve.py) | keygen + `--check` |

## Réponse

| | |
|---|---|
| Passphrase | **`DXUPWYfU`** |

```bash
python3 tools/off-by-one-solve.py -q
# DXUPWYfU

printf 'DXUPWYfU' | ./original/off-by-one
# Passphrase: Yes! You found the correct passphrase ヽ(・∀・)ﾉ

python3 tools/off-by-one-solve.py --check
```

---

## 1. Premier regard

```text
ELF 64-bit LSB executable, x86-64, statically linked, stripped
sha256: f6ce1665a3ae011f0cad79cb7cc73a3ab6c38795c74a16c777c601f1f87b04dd
```

```text
Passphrase: 
Yes! You found the correct passphrase …
The given password is unfortunately incorrect
```

---

## 2. Flow (off-by-one)

En tête de `.text`, une **table de qwords** (adresses de stubs). Au boot :

```text
r12 = ([rsp] >= 0) ? 1 : 0     # argc typiquement ≥ 1 → r12 = 1
push table[i]
[rsp] += r12                   # adresse + 1
ret                            # « call » vers stub+1
```

Chaque transition CFG saute donc **un octet trop loin** dans le stub suivant — d’où le titre. Les vrais handlers commencent juste après un octet « padding » / fin d’instruction précédente.

`read(stdin, buf@0x402000, 0x1e)` puis boucle de vérif.

---

## 3. Prédicat

Pointeur secret `r11 = 0x401069` = début de la string d’**échec** `"The given password…"`.

Pour `i = 0..7` :

```text
dl = (secret[i] % 0x40) + 0x30
accepte ⇔ input[i] == dl
```

| secret (`The give`) | %64 | +`0x30` |
|---|---|---|
| T h e [sp] g i v e | … | **`DXUPWYfU`** |

Utiliser le message d’erreur comme oracle est cohérent avec le thème « off by one » (mauvais pointeur / mauvaise string).

---

## 4. Vérification

```bash
printf 'DXUPWYfU' | ./original/off-by-one
# Yes! You found the correct passphrase
```

---

## 5. Notes

- Exit code peut rester `1` même en succès (syscall `exit` / registre) — se fier au message.
- Suite série : `branchless branching`, `branchless`, `jump`, `branchless-fixed`.
