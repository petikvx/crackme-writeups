# Tempesta's Lord Winderton

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/67a71e75e36dd9b0e79b2a00) · id `67a71e75e36dd9b0e79b2a00`

Crackme **Windows** PE32 console, assemblé en **MASM**. Keygenme débutant (difficulty **1.7** · quality **4.5**).  
Auteur site : [Tempesta](https://crackmes.one/user/Tempesta).

Dossier : `authors/tempesta/67a71e75e36dd9b0e79b2a00/` — [série auteur](../README.md) · [repo](../../../README.md).

| Fichier | Rôle |
|---|---|
| [`original/LordWinderton.exe`](original/LordWinderton.exe) | PE32 console (3072 o) |
| [`tools/lord-winderton-solve.py`](tools/lord-winderton-solve.py) | keygen + `--check` Wine |
| [`README.md`](README.md) | ce write-up |

## Réponse

Pas de username : **serial hex de 16 caractères**, chaque nibble ∈ `{2, 5, 7, d, f}` (casse libre pour `D`/`F`).

| Exemple | |
|---|---|
| **`ffffffffffffffff`** | 16 × nibble impair valide (défaut solveur) |
| `2222222222222222` | 16 × `2` |
| `257df257df257df2` | mixte |
| `0000000000000000` | passe aussi via le bug NUL (voir notes) |

```bash
python3 tools/lord-winderton-solve.py -q
# ffffffffffffffff

python3 tools/lord-winderton-solve.py --check
# predicate(ffffffffffffffff) = OK
# … Valid!!!You can teach the Lord Winderton now!!
# wine -> OK
```

---

## 1. Premier regard

```text
PE32 executable (console) Intel i386, 3 sections
Linker: Microsoft Linker 5.12 · Compiler: MASM 8.00
sha256 02b83aef1f96ebd6f475585558d255166401c9b5bfd468f2d402b4e4e5012476
```

Imports : `kernel32` (`ReadFile` / `WriteFile` / `GetStdHandle` / …) + `msvcrt` (`printf`, `_kbhit`, `_getch`).

Banner :

```text
Welcome to this little challenge!!!
Developed by Tempesta In honor of the Lord Winderton!!!
Enter a serial: >
Valid!!!You can teach the Lord Winderton now!!
Not valid!!! Call to the Lord Winderton to get the valid key!!!
Shoot me down, baby, please!...
```

---

## 2. Flow

```text
main @ 0x40108f
  printf(welcome)
  edi = "Not valid!!!…"          ; message par défaut
  WriteFile("Enter a serial: > ")
  ReadFile(buf @ 0x403110, 0x104) ; console, mode 7
  longueur effective = bytes_read - 2   ; strip CR/LF Windows
  si longueur ≠ 16 → skip check (reste « Not valid »)
  sinon :
    hex_decode_in_place(buf)     ; @0x401000 → octets 0..15
    si decode OK → check_nibbles  ; @0x401041 (peut mettre edi = Valid)
  printf("%s", edi)
  WriteFile("Shoot me down…")
  attendre une touche (_kbhit / _getch)
  ExitProcess(0)
```

I/O mixte : messages d’invite via `WriteFile` sur le handle console ; succès/échec via `printf` msvcrt → sous Wine, un **PTY** (`script` / `pty`) est nécessaire pour voir `Valid!!!` / `Not valid!!!`.

---

## 3. Prédicat

### Hex decode (`0x401000`)

Chaque caractère `0-9` / `A-F` / `a-f` est remplacé **in-place** par son nibble `0..15`. Autre caractère → échec (`eax = 0`).

### Check par nibble (`0x401041`)

Boucle jusqu’à un octet nul. Pour chaque nibble `n` :

```c
if ((n & 1) == 0) {
    // branche paire : DEAD / BABE
    ok = ((((n ^ 0xDEAD) + 0xBABE) >> 4) + n) == 0x1998;
    // seule solution dans 0..15 : n == 2
} else {
    // branche impaire
    ok = (((n ^ 0x1A) | 0xA) ^ 0x1987) == 0x1998;
    // solutions : n ∈ {5, 7, 0xD, 0xF}
}
```

Les 16 positions sont indépendantes → keygen = 16 tirages dans `{2,5,7,d,f}`.

### Piège : nibble `0` = NUL

Après le décode, la valeur `0` est un **octet nul**. La boucle de check s’arrête immédiatement (`or al,al` / `je success`) et marque **Valid** sans tester le reste. Conséquence : tout serial de 16 hex qui commence par `0`, ou dont le préfixe avant le premier `0` n’utilise que des nibbles valides, est accepté (ex. `0000…0000`, `2000…0000`). Ce n’est pas le chemin « propre » du keygen, mais c’est dans le binaire.

Même famille de prédicat que le keygenme ELF de BinaryNewbie (`DEAD`/`BABE`/`1998`) — ici en PE32/MASM avec I/O Win32.

---

## 4. Vérification

```bash
python3 tools/lord-winderton-solve.py --check
# wine -> OK

python3 tools/lord-winderton-solve.py --check 1111111111111111
# predicate(…) = FAIL   (exit 1)

# preuve manuelle (PTY) :
# printf 'ffffffffffffffff\r' | …  → Valid!!!
```

Console PE32 : `WINEDEBUG=-all wine original/LordWinderton.exe` avec entrée via PTY (le solveur le fait). `xvfb-run` inutile ici (pas de GUI).

---

## 5. Notes

- Specs auteur : pas de patch, pas d’obfuscation / anti-debug — keygen only.  
- Fin du programme : message « Shoot me down, baby, please!… » puis `_kbhit`/`_getch` avant `ExitProcess`.  
- Faux positifs AV possibles sur un PE inconnu de 3 Ko (commentaires site) — reverse = console keygen, rien d’autre.
