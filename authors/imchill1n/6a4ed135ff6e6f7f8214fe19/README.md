# ImChill1n's very simple login

- ORIGIN : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/6a4ed135ff6e6f7f8214fe19)
- Auteur : ImChill1n · Plateforme : Windows x86-64, console, **Rust** (`crackme.rs`)

| Fichier | Rôle |
|---|---|
| `original/crackme.exe` | binaire d'origine (SHA-256 `c55326a6…2b5d`) |
| `tools/imchill1n-login-solve.py` | keygen (`--user`, `-q`, `--check` via Wine) |

## Réponse

| User | Password |
|---|---|
| `petik` | **`954018`** |

```bash
python3 -I tools/imchill1n-login-solve.py --user petik --check
```

## Premier regard

`file` : PE32+ console x86-64. `strings` : chemins `/rustc/…`, `crackme.rs`, `User:`, `Password:`, `Access denied`, `Access granted`. Le reste des strings est du bruit de la std Rust.

## Flow

`User:` → `read_line` → trim ; `Password:` → `read_line` → trim ; calcul du mot de passe attendu à partir du user ; comparaison de chaînes (longueur puis `memcmp`) ; message granted/denied.

## Comment on trouve

Ancrage : `objdump -d -M intel original/crackme.exe`, on cherche la xref de la chaîne `User:` (`0x140019480`) → fonction principale `0x140001410`.

1. Après les deux lectures, le user (trim `0x140001190`) est sommé octet par octet (boucle SSE `paddd` puis reliquat scalaire `0x140001698`) :
   ```asm
   1400016a7: imul r15d, ecx, 0x841   ; n = somme * 0x841
   ```
2. `0x140017560(n)` : `format!("{:b}", n)` (callback `0x140016610` : bits via `and 1` / `shr 1` sur une table `01`), puis chaque caractère est transformé :
   ```asm
   1400176d8: cmp r15d,0x31 ; sete dl ; xor dl,0x31   ; '1'→'0', autre→'1'
   ```
   La chaîne de bits est donc **inversée bit à bit** (sur sa longueur réelle, sans zéros de tête), puis relue en base 2 (boucle `c-'0'`, `eax*2+bit`, `from_str_radix(…,2)`).
3. `0x1400137e0` est un `itoa` décimal (table de paires `00..99`) : le résultat est écrit en décimal et comparé (`0x140017371` = memcmp) au password saisi.

Exemple `petik` : 112+101+116+105+107 = 541 ; 541×0x841 = 1 143 133 = `100010111010111011101₂` (21 bits) ; inversé `011101000101000100010₂` = **954018**.

Piège : première hypothèse (password = `sum*0x841` en décimal) → Access denied ; l'étape bits inversés est cachée dans `0x140017560`, qui ressemble à un simple `to_string`.

## Vérification (Wine, `xvfb-run -a wine original/crackme.exe`)

- OK : `petik` / `954018` → `Access granted` ; `admin` / `996278` → `Access granted`.
- KO : `petik` / `1143133` ou `xx` → `Access denied`.

Pas de GDB ni de debugger live utilisés (reverse statique + Wine).

## Notes

Le user est trimé avant la somme (`\r\n` et espaces de bord ignorés). Un `n` donnant 32 bits (user très long) n'est pas géré dans le keygen au-delà du masquage 32 bits.
