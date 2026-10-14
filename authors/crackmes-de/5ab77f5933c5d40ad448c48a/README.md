# crackme_1 — batman10 (crackmes.de)

- Page : https://crackmes.one/crackme/5ab77f5933c5d40ad448c48a · [`ORIGIN.yml`](ORIGIN.yml)
- Plateforme : Linux ELF32 i386, C++ (libstdc++), dynamique ; readme : « My first crackme! No patch, make a keygen! »
- Archive : `original/crackme_1.zip` → `crackme_1` + `readme.txt` (extraits sous `analysis/`)
- Usage : saisie interactive `Name:` puis `Password:`

## Réponse

| Name | Password |
|---|---|
| `petik` | `u`qln` |
| `admin` | `dahlk` |
| `Zorro` | `_jwwj` |

```bash
python3 -I tools/crackme1-solve.py petik --check
# name: petik / password: u`qln / check: OK (Good=True, mauvais=True)
printf 'petik\nu`qln\n' | ./analysis/crackme_1        # Good!
```

Règle : **`password[i] = name[i] ^ 0x05`** (le mot de passe a la même longueur que le nom).

## Premier regard

```text
$ printf 'petik\n12345\n' | ./analysis/crackme_1
Name:
Password:
Bad!
$ strings -n 4 analysis/crackme_1 | grep -E "Name|Password|Good|Bad"
```

## Comment on trouve

**Ancrage** : `objdump -d -M intel --no-show-raw-insn analysis/crackme_1`, `main` @`0x8048690` (non strippé).

```asm
8048701: [esp+4]=ebx (=buf1)  ; cin >> buf1     ; Name     (buffers de 0x1f4 octets)
804872d: [esp+4]=edi (=buf2)  ; cin >> buf2     ; Password
804873f..: strlen(buf1) (idiome `(x-0x01010101)&~x&0x80808080`) -> eax
8048773..: strlen(buf2) -> esi
80487b8: movzx ecx,[edx] ; xor ecx,0x47 ; movsx ecx,cl ; add ebx,ecx      ; S1 = Σ (name[i]^0x47) (signed)
80487d8: movzx edx,[eax] ; xor edx,0x42 ; movsx edx,dl ; add ecx,edx      ; S2 = Σ (pass[j]^0x42) (signed)
80487ea: cmp ebx,ecx ; je 8048824                                         ; "Good!" sinon "Bad!"
```

Seule la **somme** des octets xorés compte : un caractère `p` contribue `p ^ 0x42` et un caractère `n` du nom `n ^ 0x47`. En prenant `p = n ^ 0x47 ^ 0x42 = n ^ 0x05`, chaque terme est égal : les deux sommes sont identiques. Exemple `petik` :

| name | `^0x05` | password |
|---|---|---|
| `p` (0x70) | 0x75 | `u` |
| `e` (0x65) | 0x60 | `` ` `` |
| `t` (0x74) | 0x71 | `q` |
| `i` (0x69) | 0x6c | `l` |
| `k` (0x6b) | 0x6e | `n` |

**Pièges :**
- Comme la comparaison porte sur une *somme*, d'innombrables mots de passe sont valides (toute permutation, ou des caractères différents de même total) ; la règle xor 5 est la plus simple.
- `cin >> char*` s'arrête au premier blanc : si `name[i] ^ 5` est un blanc (`'%'` ^ 5 = `' '`), le solveur retombe sur une recherche (DP) de caractères imprimables non blancs de même somme.
- `movsx` : les octets ≥ 0x80 sont signés dans la somme.

## Vérification

```text
$ printf 'petik\nu`qln\n' | ./analysis/crackme_1        # analysis/verify.txt
Good!
$ printf 'petik\nwrong\n' | ./analysis/crackme_1
Bad!
```

`--check` valide aussi `admin`, `Zorro` et un nom contenant `%`.

## Fichiers

- `analysis/crackme_1`, `analysis/readme.txt`, `analysis/dis.txt`, `analysis/verify.txt`
- `tools/crackme1-solve.py` : keygen + `--check` natif
