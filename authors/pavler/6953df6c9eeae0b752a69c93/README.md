# pavler's pavler6 (`XMM.exe`)

| | |
|---|---|
| **ID** | [`6953df6c9eeae0b752a69c93`](https://crackmes.one/crackme/6953df6c9eeae0b752a69c93) ([`ORIGIN.yml`](ORIGIN.yml)) |
| **Auteur** | pavler |
| **Plateforme** | Windows PE64 console (C++ MSVC), mini-VM SSE |
| **SHA-256** | `dc072b785c9c48d4c9713d22b53b8fd778b62fbe6134006962071cb44216a935` |

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/XMM.exe` | binaire d'origine (non modifié) |
| `tools/pavler6-solve.py` | solveur : inverse la VM (`-q`, `--check` = preuve Wine) |

## Réponse

**Mot de passe : `R3v3rs3_S1MD_K3y`** (pas de username ; `petik` donne « Wrong password! »).

```bash
python3 -I tools/pavler6-solve.py --check
# FLAG: f13{$V1rtMach1n3_SIMD_m4st3r_!!}
```

## Premier regard

- `file` : PE32+ console x86-64. `strings` : `Enter password: `, `Wrong password!`, et un **leurre** `Fr13nd!!` (c'est la clé de déchiffrement du flag affiché, pas le mot de passe).
- Beaucoup de `movdqu`/`pshufb`/`psrldq` + des `cpuid` (le CRT teste AVX-512 pour le chemin `vpmovdb` de l'op `0x20`).

## Flow

`main` (`0x140001dd3`) lit une ligne ; elle doit faire **exactement 16 octets** (`cmp [rbp-0x60],0x10`). Puis un interpréteur (`0x1400011c0`) exécute 0x26 instructions de 16 octets à `0x1400067d0` sur 8 registres 128 bits ; le registre de sortie est comparé à une constante calculée à la volée. Succès → affichage du flag (XOR avec la saisie).

## Comment on trouve

**Ancrage** : `objdump -d -M intel original/XMM.exe`, puis lecture de `main` (xref sur `Enter password`) → appel `0x1400011c0(ctx, prog=0x1400067d0, n=0x26, input, out)`. Les données `.rdata` : mémoire VM à `0x140006440` (0x390 octets).

**Dispatcher** (`0x1400011f8…0x140001d38`) : opcode = octet 0 de chaque instruction. Opcodes utilisés par le programme :

| op | sémantique (observée dans l'asm) |
|---|---|
| `01` / `02` | charger l'entrée dans r / stocker r en sortie |
| `10` | `pshufb r, mem[imm32]` (`0x140001311`) |
| `11` | `r ^= mem[imm32]` (`xorps`, `0x140001364`) |
| `17` | rotation gauche de chaque octet de `imm8` (`shr 8-n`/`shl n`) |
| `20` | `r[i] *= imm8` mod 256 |
| `21` | `paddb r, imm8` diffusé |
| `22` | `r ^= r << (imm8 octets)` (`pslldq` via table de sauts) |
| `90` / `ff` | nop / fin |

**Programme VM** (dump des 0x26×16 octets du `.rdata`), les `90` ignorés :

```text
r0 = input
r0 = pshufb(r0, M[0x00]);  r0 += 0x13 (par octet);  r0 ^= M[0x10]
r0 = rol8(r0, 3);          r0 = pshufb(r0, M[0x20]); r0 ^= M[0x30]
r0 ^= r0 << 4 octets;      r0 = pshufb(r0, M[0x40]); r0 ^= M[0x50]
r0 *= 3 (par octet)        -> sortie
```

**Cible** (`0x140001f0f`…`0x14000202f`) : `T = perm(C[0x6a50] ^ C[0x64a0]) ^ C[0x6a40]`, où `perm` est la suite de `psrldq`/`movd` (octets 11,14,1,4,7,10,13,0,3,6,9,12,15,2,5,8). La comparaison `sub rcx,rax` sur les deux qwords vaut 0 ssi sortie == T.

**Inversion** : chaque étape est bijective (les masques `pshufb` sont des permutations sans bit 7 ; `*3` inversible par `*171` mod 256 ; `r ^= r<<4` s'inverse séquentiellement `o[i] ^= o[i-4]`). Le solveur applique les inverses dans l'ordre inverse, puis **re-joue la VM en avant** (`assert fwd(pw) == T`).

**Pièges** : `pshufb` avec bit 7 = zéro (non rencontré ici, assert) ; `Fr13nd!!` n'est pas le mot de passe ; l'op `0x20` a deux implémentations (AVX-512 / scalaire), même résultat.

## Vérification

```text
$ printf 'R3v3rs3_S1MD_K3y\n' | xvfb-run -a wine original/XMM.exe
Enter password: Fr13nd!!
FLAG: f13{$V1rtMach1n3_SIMD_m4st3r_!!}

$ printf 'petik\n' | xvfb-run -a wine original/XMM.exe
Enter password: Wrong password!
```

Reverse 100 % statique (objdump) + Wine ; pas de GDB ni de debugger live.
