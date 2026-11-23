# 0xg_m3's latch

| | |
|---|---|
| **ID** | [`6b006f8f5fa39ab0d4ac259f`](https://crackmes.one/crackme/6b006f8f5fa39ab0d4ac259f) ([`ORIGIN.yml`](ORIGIN.yml)) |
| **Auteur** | 0xg_m3 |
| **Plateforme** | Linux x86-64, ELF PIE stripped, console (lit stdin) |
| **SHA-256** | `76c97eead25325fd6abc578850915c6ccce17e546a0f0ce133487eb81b93b16a` |

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/latch` | binaire d'origine (non modifié, sans bit exécutable : `cp` + `chmod +x` ailleurs pour le lancer) |
| `tools/latch-solve.py` | solveur (lit les tables dans le binaire, inverse le chiffrement) |

## Réponse

Pas de user : le « flag est votre entrée », un seul champ stdin de 46 caractères (pas de `petik` applicable).

**`SNHT{bc124766cca7ecfe7518d8c46d3cfec1b39d0c95}`**

```bash
python3 -I tools/latch-solve.py          # affiche le flag
python3 -I tools/latch-solve.py --check  # + lance le binaire d'origine (copie en /tmp)
```

## Premier regard

- `file` : ELF64 PIE, stripped, GCC/clang Ubuntu 24.04. Imports : `fgets`, `strcspn`, `memset`, `memcpy`, `puts`.
- Strings : `Correct. Le flag est votre entree.` / `Wrong.`. Rien d'autre de lisible : le flag n'est pas en clair.
- Un seul gros bloc de code en `0x1180` (le `main`, passé à `__libc_start_main` en `0x10a8`), `.rodata` de `0x540` octets = uniquement des tables.

## Flow

1. `fgets(buf, 0x100, stdin)` ; `strcspn(buf, "\n")` retire le saut de ligne.
2. Si la longueur ≠ `0x2e` (46) → `Wrong.` (`cmp r15,0x2e` en `0x11ce`/`0x1222`).
3. 4 rondes sur l'état de 46 octets, puis xor final, puis comparaison avec la cible → `Correct.` ou `Wrong.`.

## Comment on trouve

Commande : `objdump -d -M intel original/latch` (310 lignes, le tout tient dans `0x1180–0x14d2`, pas besoin d'IDA). Pour ce binaire offset fichier == VMA dans `.rodata` (`readelf -S`), donc les tables se lisent directement.

Boucle externe (`rdx` = 0..3, `cmp rdx,4` en `0x13d2`), chaque ronde :

```asm
1270 imul rax,rdx,0x2e        ; clé de ronde = 0x2070 + 46*rdx
127d xor  rcx,[rax+rsi]  ...  ; état ^= K[rdx]   (qwords puis octets, 46 au total)
1310 movzx ecx,[rsp+rax-1]
1315 movzx ecx,[rcx+r8]       ; r8 = 0x2160 : état[i] = SBOX[état[i]]  (256 octets)
1350 movzx r11d,WORD [r10]    ; r10 = 0x2260, entrées u16 ; boucle 0x170 = 368 = 46*8 bits
135b ...  bt r14d,r11d ; cmovae ; ...
```

Le dernier bloc est une **permutation de bits** : pour chaque bit de sortie `i` (0..367), on lit `src = perm[i]` (u16 à `0x2260 + 2i`) ; le bit de sortie `i` (octet `i>>3`, bit `i&7`, LSB first) vaut le bit `src` de l'état (`bt` sur l'octet `src>>3`, bit `src&7`).

Après la 4ᵉ ronde : xor avec des constantes immédiates (5 qwords `0xb889b94491e7cf7a, 0x27348fe81140efa1, 0x34c0ba823b04d08e, 0x448679276a0e5f59, 0x8628d9fcd7fe59d8` puis octets `d4 1d 05 56 08 84`), et comparaison octet par octet avec la cible en `0x2040` (46 octets).

### Inversion

Tout est bijectif et sans dépendance à l'entrée → on remonte :

```
s = cible ^ final
pour r = 3..0 :
    s = inverse_perm(s)           # bit perm[i] de t := bit i de s
    s = inv_sbox[s[i]] ^ K[r][i]
flag = s
```

(`inv_sbox` se déduit de la sbox, qui est une permutation de 0..255.) Résultat : `SNHT{bc124766cca7ecfe7518d8c46d3cfec1b39d0c95}`, 46 caractères.

Pièges : les `movq/punpcklqdq` du xor ne sont que de la vectorisation du compilateur ; la compare finale lit la cible par paires d'octets (déroulé ×2, `cmp rax,0x2f`) ; le binaire téléchargé n'est pas exécutable.

## Vérification

```text
$ python3 -I tools/latch-solve.py --check
flag = SNHT{bc124766cca7ecfe7518d8c46d3cfec1b39d0c95}
binaire : Correct. Le flag est votre entree.
```

KO : entrée `x` → `Wrong.` ; flag valide + `Z` (47 caractères) → `Wrong.`.
Aucune session GDB/debugger live n'a été utilisée : analyse 100 % statique + exécution native.

## Notes

- Ce n'est pas un keygen : un seul flag possible (chiffrement bijectif d'un bloc de 46 octets).
- L'original n'a pas été modifié.
