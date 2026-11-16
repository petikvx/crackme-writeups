# fon37's The Winner

| | |
|---|---|
| **ID** | [`6ad6b78f4ab951a9999d9f4e`](https://crackmes.one/crackme/6ad6b78f4ab951a9999d9f4e) · [`ORIGIN.yml`](ORIGIN.yml) |
| **Auteur** | fon37 |
| **Plateforme** | Linux x86-64 (ELF, GCC, libgmp) |
| **SHA-256** | `5166c5e2b71beefe50e9eb52af5620f7b0ae3019c7bdb766280ecab06d14f127` |

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/download.bin` | en réalité un **ZIP** chiffré (mdp `crackmes.one`) contenant l'ELF `crackme` (non modifié) |
| `analysis/zip/crackme` | ELF extrait (`unzip -P crackmes.one`) |
| `tools/the-winner-solve.py` | solveur (Wiener) ; `-q`, `--check` |

## Réponse

**Password : `CMO{the_WI3NERSSS_takes_1t_ALL}`**

```bash
python3 -I tools/the-winner-solve.py          # d + password
python3 -I tools/the-winner-solve.py -q       # password seul
python3 -I tools/the-winner-solve.py --check  # lance l'ELF d'origine -> "You win!"
```

(Pas de champ user : pas de `petik` ici.)

## Premier regard

- `file` absent ; `head` montre `PK\x03\x04` : le « binaire » est un ZIP. Extraction : `unzip -P crackmes.one original/download.bin -d analysis/zip`.
- `diec` : ELF64 GCC, dépend de `libgmp.so.10`. Imports : `__gmpz_powm`, `__gmpz_import`, `__gmpz_cmp`, `fgets`.
- `strings` : trois grands nombres décimaux (~309 chiffres), `Enter the password:`, `You win!`, `Try again.`.

## Flow

`main` (0x1160) :

1. `mpz_set_str` des 3 constantes décimales → `A`, `B`, `Cc` (0x2008, 0x2140, 0x2278).
2. Dé-obfuscation : `A = ror(A,3)`, `B = rol(B,4)`, `Cc = rol(Cc,7)` sur 1024 bits (fonctions `ror` 0x1540 / `rol` 0x1430 : masque `2^1024-1` + `fdiv_q_2exp`/`mul_2exp`/`ior`/`and`).
3. `fgets` 256 octets, `strcspn` retire le `\n`.
4. `mpz_import(m, len, order=1, size=1, endian=1, 0, buf)` → entier big-endian.
5. `mpz_powm(r, m, B, A)` puis `mpz_cmp(r, Cc)` : égal → « You win! ».

## Comment on trouve

- **Ancrage** : `objdump -d -M intel --no-show-raw-insn crackme | awk '/<main>:/,/^$/'`. L'ordre des arguments de `powm` (`rdi=r14, rsi=r13, rdx=rbp, rcx=rbx`) donne `r = m^B mod A` : RSA chiffrement avec **n = A**, **e = B**, **C = Cc**.
- **Constantes** : extraites des `.rodata` par regex `\d{100,}`, puis rotations 1024 bits (le piège : les valeurs brutes ne sont pas les vraies).
- **Faiblesse** : `e` fait ~1021 bits (même ordre que `n`) ⇒ `d` probablement petit. Développement en fraction continue de `e/n` (attaque de **Wiener**) : une convergente `k/d` vérifie `(e·d−1)/k = φ(n)` avec `p+q = n−φ+1` et discriminant carré parfait. Trouvé : `d = 987799643873358373775626810090929604326703289017` (~160 bits).
- **Décodage** : `m = C^d mod n`, puis `m.to_bytes(big)` donne l'ASCII `CMO{the_WI3NERSSS_takes_1t_ALL}` (jeu de mots sur Wiener).
- **Pièges** : le fichier téléchargé est un ZIP ; les constantes sont rotatées ; Fermat et petits facteurs ne marchent pas (testés avant Wiener).

## Vérification

```text
$ python3 -I tools/the-winner-solve.py -q | ./analysis/zip/crackme
Enter the password: You win!
$ echo wrong | ./analysis/zip/crackme
Enter the password: Try again.
```

`--check` du solveur extrait l'ELF d'origine dans un dossier temporaire et obtient `You win!`.

## Notes

- Analyse 100 % statique + exécution native ; ni GDB, ni debugger MCP, ni IDA utilisés.
- Un seul password valide à ≤ 127 octets (m < n, représentation big-endian sans zéros de tête).
