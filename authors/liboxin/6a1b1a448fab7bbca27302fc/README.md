# liboxin's CrackMe Hard 4 (`rust_cm.exe`)

| | |
|---|---|
| **ID** | [`6a1b1a448fab7bbca27302fc`](https://crackmes.one/crackme/6a1b1a448fab7bbca27302fc) · [`ORIGIN.yml`](ORIGIN.yml) |
| **Auteur** | liboxin |
| **Plateforme** | Windows PE64 (Rust, console), SHA-256 `94b6da61…0fb1` |

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/rust_cm.exe` | binaire d'origine (non modifié) |
| `tools/liboxin-hard4-solve.py` | solveur (`-q`, `--check` lance le vrai exe sous Wine) |

## Réponse

```
RUSTCM{4lG3brAic_VM_0bfusc4t3d_2026!}
```

```bash
python3 tools/liboxin-hard4-solve.py -q
python3 tools/liboxin-hard4-solve.py --check   # xvfb-run -a wine original/rust_cm.exe
```

Pas de username : la clé est fixe (37 octets), donc pas d'exemple `petik`.

## Premier regard

- `file` : PE32+ console x86-64, Rust (`src\main.rs`). Bannière : `========= Rust Crackme By lbx =========`, prompt `> `, puis `rejected.` ou `accepted. flag core unlocked.`
- Les chaînes de succès/échec ne sont pas lisibles via `strings` (elles sont reconstruites à l'exécution) ; on part donc du code.

## Flow

La fonction `0x140004445` reçoit (ptr, len) : si `len != 0x25` (37) → faux. Sinon elle appelle **8 checks sans court-circuit** et fait un ET de leurs résultats :

| # | Fonction | Nature |
|---|---|---|
| 1 | `0x140002cd4` | mélange 64 bits de deux valeurs d'environnement (appels `0x1400020db`/`0x1400020d6`), non analysé en détail — vrai sous Wine |
| 2 | constante `1` | — |
| 3 | `0x1400046a0` | hash 4×u64 des 37 octets, comparé à `0x14001aba0` |
| 4 | `0x140002be4` | **polynôme mod p** (celui qui fixe la clé) |
| 5 | `0x140004660` | appelle `0x1400019c7` (IV de type SHA-512 `6a09e667f3bcc909…`, table PRNG seed `0x8badf00d`), compare 8 u64 à `0x14001ab60` |
| 6 | `0x140001986` | comparaison de 4 u64 |
| 7 | `0x1400015b4` | hash 256 tours (état init = décimales de π), compare 6 u64 au blob `0x14001a598` déchiffré (`xor` puis `ror`) |
| 8 | `0x140002e94` | check sans argument (non analysé) |

## Comment on trouve

1. `objdump -d -M intel` sur le `.text`, on remonte depuis `0x140004445` (test `rdx == 0x25`).
2. Les checks 3, 5, 6, 7 sont des hashs/mixers non inversibles à la main. Le check 4 (`0x140002be4`) est différent : il est **linéaire modulo p**.
3. Lecture du check 4 :
   ```asm
   ; construction de 16 mots u32 : mot j = octets[3j] | octets[3j+1]<<8 | octets[3j+2]<<16
   ; (j=0..11 : octets 0..35 ; j=12 : octet 36 seul ; j=13..15 = 0)
   mov esi,0x7fe001          ; p = 8380417
   imul rax,rcx,0x6d9        ; x_i = x_{i-1} * 0x6d9 mod p (x_0 = 1)
   ; boucle interne r14 = 0x40..4 : r9 = (r9*x + w[j] % p) % p   -> Horner
   xor ebp,r9d / xor ebp,0x5a17c3 ; or r10d,ebp   -> exige r9 == table[i] ^ 0x5a17c3
   ```
   Donc `P(x_i) = Σ w_j·x_i^j mod p = table[i] ^ 0x5a17c3` pour 16 points `x_i = 0x6d9^(i+1)`, table à `0x14001aac8` (16 u32).
4. 16 équations, 16 inconnues (w13..w15 = 0 et w12 < 256 servent de vérification) : matrice de Vandermonde inversible mod p → Gauss mod p. Résultat : w0..w12, que l'on recolle en octets (3 par mot) → la clé de 37 octets. Les valeurs sont < 2²⁴ et < p, donc pas d'ambiguïté (assert dans le solveur).
5. Les 7 autres checks sont alors satisfaits par construction : l'auteur a vérifié la même clé de plusieurs façons, donc aucune inversion de hash n'est nécessaire.

Pièges : `strings` n'affiche rien d'utile ; les checks sont tous évalués (pas de `jne` précoce) donc un break sur le premier ne dit rien ; le blob `0x14001a598` n'est pas une chaîne mais des u64 chiffrés.

## Vérification

```text
$ echo test | xvfb-run -a wine original/rust_cm.exe
========= Rust Crackme By lbx =========
> rejected.

$ python3 tools/liboxin-hard4-solve.py --check
key = RUSTCM{4lG3brAic_VM_0bfusc4t3d_2026!}
========= Rust Crackme By lbx =========
> accepted. flag core unlocked.
```

Cas OK (clé trouvée) et KO (`test`) testés sur le binaire d'origine sous Wine. Pas de GDB ni de debugger utilisé : reverse 100 % statique + exécution Wine.

## Notes

- Ne pas confondre les 16 points x_i avec 16 octets : les mots sont de 24 bits et p ≈ 2²³, tous les mots de la solution sont < p.
- Les checks 3/5/7 n'ont pas été rétro-analysés en détail : ils ne sont pas nécessaires et ont été validés uniquement en pratique (le binaire accepte la clé).
