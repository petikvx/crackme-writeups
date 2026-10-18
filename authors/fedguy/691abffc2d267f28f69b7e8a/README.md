# fedguy's FedGuy easy crack

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/691abffc2d267f28f69b7e8a) · id `691abffc2d267f28f69b7e8a`

ELF64 console, **non strippé**, préimage SHA-256 directe. Diff. site **1.6**.
Famille : [`../README.md`](../README.md).

| Fichier | Rôle |
|---|---|
| [`original/crack`](original/crack) | binaire (non strippé, symboles `main`/`bytes_to_hex`) |
| [`tools/fedguy-solve.py`](tools/fedguy-solve.py) | mot de passe connu / `--bruteforce` / `--check` |

## Réponse

| | |
|---|---|
| **Mot de passe** | `chicken` |
| OK | `You win :)` |
| KO | `You lose :(` |

```bash
python3 tools/fedguy-solve.py              # affiche le mot de passe + son sha256
python3 tools/fedguy-solve.py --check      # lance le binaire, code retour 0/1
python3 tools/fedguy-solve.py --bruteforce # refait l'attaque dictionnaire (preuve)
printf 'chicken\n' | ./original/crack
```

## 1. Premier regard

```text
crack: ELF 64-bit LSB pie executable, x86-64, dynamically linked, not stripped
sha256  b4d030cdf3a254b18836d180aca9d2b7b1afb4ff0f73be6726afbf1d1ceb22be
size    15808 bytes
```

```bash
strings -n 5 original/crack
```

```text
SHA256
sprintf
strcmp
libcrypto.so.3
811eb81b9d11d65a36c53c3ebdb738ee303403cb79d781ccf4b40764e0a9d12a
Input Password: 
You win :)
You lose :(
main.c
main
bytes_to_hex
```

Binaire **non strippé** (symboles `main`, `bytes_to_hex` visibles),
lié à **OpenSSL** (`libcrypto.so.3`, import `SHA256`). La constante de 64
caractères hex est clairement le hash cible.

## 2. Pseudocode (MCP `ida`)

```c
int main(int argc, const char **argv, const char **envp)
{
  char s[32];     // mot de passe saisi
  char v7[32];     // digest brut SHA-256 (32 octets)
  char s2[72];      // digest en hexa (64 car. + NUL)

  printf("Input Password: ");
  scanf("%s", s);
  SHA256(s, strlen(s), v7);
  bytes_to_hex(v7, 32, s2);
  if (strcmp("811eb81b9d11d65a36c53c3ebdb738ee303403cb79d781ccf4b40764e0a9d12a", s2) == 0)
    puts("You win :)");
  else
    puts("You lose :(");
}

// bytes_to_hex : sprintf("%02x", octet) pour chacun des 32 octets -> chaine hex classique
```

Pas de transformation intermédiaire, pas de sel : **`SHA256(password) ==
811eb81b9d11d65a36c53c3ebdb738ee303403cb79d781ccf4b40764e0a9d12a`**, une
préimage SHA-256 pure.

## 3. Comment on trouve le mot de passe — attaque au dictionnaire

Aucun indice en clair dans le binaire (titre "easy crack" seulement).
SHA-256 n'est pas réversible analytiquement : on attaque au dictionnaire.
Pas de `rockyou.txt` ni de `hashcat`/`john` disponibles sur la machine
(vérifié : ni `which hashcat`, ni `which john`, ni fichier `rockyou*`), mais
le paquet `dictionaries-common` fournit `/usr/share/dict/american-english`
(~104 000 mots) — suffisant ici :

```python
import hashlib
target = bytes.fromhex("811eb81b9d11d65a36c53c3ebdb738ee303403cb79d781ccf4b40764e0a9d12a")
with open("/usr/share/dict/american-english", errors="ignore") as f:
    for line in f:
        w = line.strip()
        for cand in (w, w.lower(), w.upper(), w.capitalize()):
            if hashlib.sha256(cand.encode()).digest() == target:
                print(cand)   # -> "chicken"
```

~69 000 mots testés (sur 104 334, casse comprise) avant de tomber sur
`chicken` — moins d'une seconde en Python (`hashlib` est du C sous le
capot). Confirmé en recalculant `sha256("chicken")` : correspond exactement
à la constante du binaire.

## 4. Vérification

```text
$ printf 'chicken\n' | ./original/crack
Input Password: You win :)

$ printf 'Chicken\n' | ./original/crack
Input Password: You lose :(   # sensible à la casse (strcmp sur le hex, pas de normalisation)
```

## 5. Notes

- `scanf("%s", s)` sans limite de taille dans `s[32]` : dépassement de
  buffer possible pour une saisie longue (non exploité ici, le but est le
  mot de passe, pas un crash/ROP).
- Pas de GDB utilisé (reverse 100 % statique via le MCP `ida` + attaque au
  dictionnaire côté solveur) — pas de section "Debug GDB" (voir
  `AGENTS.md`, § Debug GDB : uniquement si GDB a servi).
