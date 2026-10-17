# DZONERZY — KGenMe v2

| | |
|---|---|
| **ID** | [`6672bf9ee7b35c09bb266f5e`](https://crackmes.one/crackme/6672bf9ee7b35c09bb266f5e) |
| **Auteur** | DZONERZY (site : dzonerzy) |
| **Plateforme** | Linux ELF64 PIE, **strippé** (14 592 octets) |
| **SHA-256 (rar)** | `3ea1b6f870dc8d65890772dff5c0f3ea29ae8a24a9c94bf97d45027aa1948f42` |

Voir [`ORIGIN.yml`](ORIGIN.yml).

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/kgenmev2.rar` | archive d'origine, **chiffrée** (RAR5, mot de passe `crackmes.one`) |
| `analysis/x/kgenmev2` | binaire extrait : `unrar x -pcrackmes.one original/kgenmev2.rar analysis/x/` (`7z` échoue sur ce RAR) |
| `tools/kgenme-solve.py` | keygen nom → serial (`--user`, `-q`, `--check`) |

## Réponse

Keygen (< 1 s, la règle du challenge est « < 10 min »). Exemples :

| Username | Serial |
|---|---|
| `petik` | `213J7-cqaX8-ON10H-rsO9L-ArdcB` |
| `DZONERZY` (preuve demandée par l'auteur) | `464L9-jvHb4-TU01A-uoJXe-nzO85` |

```bash
unrar x -y -pcrackmes.one original/kgenmev2.rar analysis/x/
python3 tools/kgenme-solve.py --user petik --check
printf 'petik\n213J7-cqaX8-ON10H-rsO9L-ArdcB\n' | ./analysis/x/kgenmev2     # [+] Serial is correct! Now go write a keygen
```

Le serial n'est **pas unique** : le keygen en produit un parmi beaucoup (le tirage est déterministe, graine = nom).

## Premier regard

Banner « *** Welcome to DZONERZY's keygenme v2! *** » avec les règles (pas de patch, keygen < 10 min, preuve pour `DZONERZY`). Binaire strippé et sans table de symboles : 25 fonctions, dont `main` @ `0x1aa0`.

## Flow

`main` @ `0x1aa0` : lit le nom (`read` octet par octet, 32 max) puis le serial (30 max), appelle `sub_1980(user, serial)` ; non nul → « [+] Serial is correct! Now go write a keygen ».

## Comment on trouve

**Ancrage** : MCP `ida` (idalib + Hex-Rays) : `open_database` sur `analysis/x/kgenmev2`, liste des fonctions, pseudo-code de `main`, `sub_1980`, `sub_14B0`, `sub_18D0`, `sub_11B0`, `sub_1240`, `sub_12F0`, `sub_1390`, `sub_1430`.

### 1. Format (`sub_14B0` @ `0x14b0`)

Longueur 29, tirets en 5, 11, 17, 23, puis par groupe de 5 caractères :

| Groupe | Positions | Règle |
|---|---|---|
| 1 | `s[0..4]` | exactement 1 caractère de `KJL` et 4 chiffres |
| 2 | `s[6..10]` | `s[10]` est un chiffre pair ; `s[6..9]` libres |
| 3 | `s[12..16]` | `s[12]`, `s[13]` lettres ; `s[14]`, `s[15]` chiffres ; `abs(s[12]-s[13]) == d14 + d15` ; `s[16]` libre |
| 4 | `s[18..22]` | 5 caractères alphanumériques |
| 5 | `s[24..28]` | au moins 1 caractère de `HBTOP` **ou** tous les chiffres présents impairs |

### 2. Relation nom ↔ serial (`sub_1980` → `sub_18D0`)

```c
// sub_11B0 : hash polynomial, base 31, modulo p = 1000000007
H(s) = sum(s[i] * 31^i) mod p

// sub_18D0
v6 = (H(user) + H(serial)) mod 1000000007
sub_1240(v6) != 0
v6 == sub_1390( sub_12F0( powmod(16370, 32771, 49157) ) )
```

`sub_1430(16370, 32771, 49157)` est une exponentiation modulaire (`= 2511`). `sub_12F0` enchaîne XOR / rotations / multiplication par `0x5851F42D4C957F2D` ; `sub_1390` fait l'**inverse** (multiplication par l'inverse, rotations inverses, mêmes XOR) :
la composition redonne exactement l'entrée, soit **2511** (vérifié en rejouant l'arithmétique 64 bits). La cible ne dépend donc pas du nom, et `sub_1240(2511)` est vrai (condition sans effet pour cette valeur).

Équation à résoudre : **`H(serial) ≡ 2511 − H(user)  (mod p)`**, avec un serial qui respecte le format.

### 3. Keygen

On tire au hasard tout le serial valide, sauf deux blocs de 3 caractères alphanumériques (`s[6..8]` et `s[18..20]`) que l'on énumère en **rencontre au milieu** :
62³ = 238 328 valeurs de chaque côté (≈ 5·10¹⁰ combinaisons pour un modulo de 10⁹ → plusieurs solutions). Table de hachage des sommes pondérées d'un bloc, puis balayage de l'autre.

Exemple `petik` : `H("petik")` ; cible `H(serial) = (2511 − H("petik")) mod p` ; solution trouvée en ~0,2 s.

Pièges :
- le `char` de `sub_11B0` est signé : sans effet en ASCII ; le keygen n'émet que de l'ASCII ;
- `strncpy(dest, s+6, 5)` écrit les 5 octets dans des variables **de pile contiguës** (`v17[4]` + `v18`) : `s[10]` est celui qui doit être un chiffre pair ;
- la condition `v4 >= 1 || v3 == v8` du groupe 5 est vraie aussi quand il n'y a aucun chiffre.

## Vérification

```text
$ python3 tools/kgenme-solve.py --check
user = petik
serial = 213J7-cqaX8-ON10H-rsO9L-ArdcB
OK: True | KO: True | DZONERZY: 464L9-jvHb4-TU01A-uoJXe-nzO85 -> True
```

Contrôle strict sur le message exact (« incorrect » contient « correct ») : `petik` + serial → `[+] Serial is correct!` ; dernier caractère modifié (…`ArdcA`) ou tronqué → `[-] Serial is incorrect :(`.

## Notes

- Preuve demandée par l'auteur (serial pour `DZONERZY` + `time`) : voir ci-dessus ; le keygen s'exécute en ~0,2 s.
- La base IDA (`.i64`) est gitignorée ; aucun patch de binaire.
