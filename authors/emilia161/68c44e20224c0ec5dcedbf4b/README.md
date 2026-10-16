# Emilia161 — good kitty

| | |
|---|---|
| **ID** | [`68c44e20224c0ec5dcedbf4b`](https://crackmes.one/crackme/68c44e20224c0ec5dcedbf4b) |
| **Auteur** | Emilia161 |
| **Plateforme** | Linux ELF64 PIE, C (`crack.c`), non strippé, lié à `libm` |
| **SHA-256** | `e1d2d0597ffa3214d84042ef7d9e42deb0d033e28cde533ffc21ec5b88bbfdca` |

Voir [`ORIGIN.yml`](ORIGIN.yml).

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/crack` | binaire d'origine |
| `tools/goodkitty-solve.py` | recalcule le mot de passe (`-q`, `--check`) |

## Réponse

**Mot de passe : `00sGo4M0`** (8 caractères)

```bash
python3 tools/goodkitty-solve.py --check
echo 00sGo4M0 | ./original/crack     # good kitty!
```

## Premier regard

`strings` : `bad kitty!`, `good kitty!`, fonctions `ppeuler_3`, `factorial`, imports `cbrt`, `read`, `write`.
Le prompt `enter the right password` n'est **pas** dans `.rodata` : il est reconstruit à l'exécution par des multiplications
d'immediates (3 qwords écrits avec `write`, @ `0x136e`–`0x148d`), donc `strings` ne le voit pas. Il suffit de lancer le binaire.

## Flow

`main` @ `0x12ac` :

1. `p = ppeuler_3()` → `p = (long) cbrt((double) p)` → `p = factorial(p)`.
2. Les 8 octets (LE) de `p` sont **repliés** vers `[0-9A-Za-z]` (boucle @ `0x1329`).
3. Affiche le prompt, `read(0, buf, 0x40)`, puis compare `buf[0..7]` aux 8 octets repliés ; il faut aussi `read() - 1 == 8` (8 caractères + `\n`).

## Comment on trouve

**Ancrage** : `objdump -d -M intel --no-show-raw-insn original/crack | awk '/<main>:/,/^$/'` (+ `ppeuler_3` @ `0x11c9`, `factorial` @ `0x1285`).

### 1. `ppeuler_3` : Project Euler n°3

```asm
11cd: movabs rax,0x8be589eac7   ; = 600851475143
...   division par d = 2,3,... tant que d*d <= n, n /= d à chaque diviseur trouvé
1210: ... retourne n (ou le dernier diviseur)   -> plus grand facteur premier = 6857
```

### 2. `cbrt` puis `factorial`

```asm
12df: cvtsi2sd xmm0,rax ; call cbrt ; cvttsd2si rax,xmm0   ; cbrt(6857) = 18.99... -> tronqué à 18 (pas 19)
12f8: call factorial                                      ; 18! = 6402373705728000 = 0x16beecca730000
```

Piège : `cvttsd2si` **tronque** ; `19³ = 6859 > 6857`, donc 18 et non 19.

### 3. Repli en alphanumérique (@ `0x1329`)

Pour chaque octet `c` de `18!` en LE (`00 00 73 ca ec be 16 00`) :

```asm
1330: and eax,0xffffffdf ; sub eax,0x41 ; cmp al,0x19 ; jbe keep   ; lettre (maj/min) -> inchangé
133a: lea eax,[rcx-0x30] ; cmp al,9 ; jbe keep                     ; chiffre -> inchangé
1343: shr al,1 ; mul 0x85 ; shr ax,12 ; imul eax,62               ; q = c // 62 (réduction de force)
1351: esi = c - q*62                                              ; s = c mod 62
1353: s in [10,35] -> s+0x37 ('A'..'Z')
1314: sinon al = s+0x30 ; si al > 0x53 -> s+0x3d ('a'..'z') sinon al ('0'..'9')
```

| Octet | Traitement | Résultat |
|---|---|---|
| `00` | s=0 → `0x30` | `0` |
| `00` | idem | `0` |
| `73` | lettre | `s` |
| `ca` | q=3, s=16 → 16+0x37 | `G` |
| `ec` | q=3, s=50 → al=0x62 > 0x53 → 50+0x3d | `o` |
| `be` | q=3, s=4 → al=0x34 | `4` |
| `16` | q=0, s=22 → 22+0x37 | `M` |
| `00` | s=0 | `0` |

→ **`00sGo4M0`**.

## Vérification

```text
$ python3 tools/goodkitty-solve.py --check
password = 00sGo4M0
OK: good kitty! | KO: bad kitty!
```

## Notes

- Reverse statique + essais live, pas de GDB.
- Les constantes `0x8be589eac7` (ppeuler_3) et l'ordre `cbrt → factorial` sont le cœur ; le reste est du repli de caractères.
