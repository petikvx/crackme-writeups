# oloL_neB's Goth House

| | |
|---|---|
| **ID** | [`6a59546f055757d3df60fd53`](https://crackmes.one/crackme/6a59546f055757d3df60fd53) ([`ORIGIN.yml`](ORIGIN.yml)) |
| **Auteur** | oloL_neB (local : `olol_neb`) |
| **Plateforme** | Linux ELF64 PIE, dynamique (libcrypto.so.3), stripped |
| **SHA-256** | `89605fa4f6206e974920bc508130b77d5a8ab0492b23353fc20f7f0697ec2591` |

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/gothhouse` | binaire d’origine (non modifié, non exécutable : copier avant de lancer) |
| `tools/gothhouse-solve.py` | solveur (`-q`, `--check`) |

## Réponse

**Secret : `buttercupcosplays`** (17 caractères)

```bash
python3 -I tools/gothhouse-solve.py          # secret = buttercupcosplays
python3 -I tools/gothhouse-solve.py --check  # lance une copie du binaire → « Access granted »
```

Pas de login/username : le crackme ne demande qu’un secret (pas d’exemple `petik` applicable ; `petik` est refusé car la longueur ≠ 17).

## Premier regard

- `file` : ELF 64-bit PIE, stripped. Imports : `fgets`, `strlen`, `memcmp`, `SHA256` (libcrypto), `memset`, `printf`, `puts`.
- Strings : `Speak the secret:`, `Access denied. The House does not recognize this signature.`, `Invalid sequence at node %d. The mechanism rejects you.`, `Access granted. You may enter.`
- Le blob de 0x220 octets dans `.data` (vaddr `0x4060`, offset fichier `0x3060`) n’est pas une chaîne : c’est la table de comparaison.

## Flow

`main` (`0x1199`) : `fgets(buf,0x80)`, retire le `\n`, exige `strlen == 0x11` (17), puis boucle `i = 0..16` ; au premier `memcmp` raté : « Invalid sequence at node i+1 ».

## Comment on trouve

Ancrage : `objdump -d -M intel original/gothhouse` (le binaire est petit, tout tient dans `0x1199–0x13b6`).

```asm
12aa  movzx eax, [rbp+rax-0xa0]     ; c = input[i]
12be  mov edx,[rbp-8] ; add edx,eax ; mov [rbp+rax-0xe7],dl   ; buf[j] = j + c   (j = 0..5)
12df  mov byte [rbp-0xe1],0         ; (octet suivant, hors des 6 hachés)
12fc  call SHA256(buf, 6, md)       ; md @ rbp-0xe0
130a  acc[k] ^= md[k]   (k = 0..31) ; acc @ rbp-0xc0, initialisé à 0 par memset(…,0x20) avant la boucle
1365  memcmp(acc, 0x4060 + i*32, 0x20)
```

Points clés :

1. `acc` n’est **pas** remis à zéro entre les itérations : il accumule le XOR des hachés. La contrainte à l’étape i est `T[i] = h_0 ⊕ … ⊕ h_i`.
2. On en déduit `h_i = T[i] ⊕ T[i-1]` (avec `T[-1] = 0`) : chaque caractère est **indépendant**.
3. `h_i = SHA256(bytes((j + c) & 0xff for j in 0..5))` : seulement 256 candidats par position → brute-force trivial, pas besoin d’inverser SHA-256.

Les 17 hachés retrouvés donnent `b u t t e r c u p c o s p l a y s`.

Piège : l’écriture `buf[j]` se fait en octets (`dl`), donc `j + c` est tronqué mod 256 ; le tampon haché fait 6 octets (`esi = 6`), pas 7 (le `0` à `-0xe1` est juste après).

## Vérification

```text
$ cp original/gothhouse /tmp/g && chmod +x /tmp/g
$ echo buttercupcosplays | /tmp/g   → Access granted. You may enter.
$ echo buttercupcosplayX | /tmp/g   → Invalid sequence at node 17. The mechanism rejects you.
$ echo petik | /tmp/g               → Access denied. The House does not recognize this signature.
```

Le cas OK a été exécuté via `--check` ; les deux KO à la main, sur le binaire d’origine (copié hors de `original/`).

## Notes

- Pas de GDB ni de debugger utilisés : reverse 100 % statique + exécution native.
- Aucune dépendance à l’état global : le message d’erreur révèle l’index du premier caractère faux (oracle caractère par caractère), mais le solveur n’en a pas besoin.
