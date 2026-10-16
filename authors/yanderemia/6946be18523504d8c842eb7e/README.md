# YandereMia — simple XOR crackme

| | |
|---|---|
| **ID** | [`6946be18523504d8c842eb7e`](https://crackmes.one/crackme/6946be18523504d8c842eb7e) |
| **Auteur** | YandereMia |
| **Plateforme** | Linux ELF64 PIE, C, non strippé |
| **SHA-256** | `2a49183334834ce77e544366c805d4a374fa01a60e01fc78780392ac7f9e577b` |

Voir [`ORIGIN.yml`](ORIGIN.yml).

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/crackme` | binaire d'origine |
| `tools/xor-solve.py` | calcule la clé depuis les tables de `.rodata` (`-q`, `--check`) |

## Réponse

**Clé (argv[1]) : `ABC&E@GH98K51NOP`**

```bash
python3 tools/xor-solve.py --check
./original/crackme 'ABC&E@GH98K51NOP'   # Pass valid!
```

## Premier regard

```bash
file original/crackme        # ELF64 PIE, not stripped
strings -n 4 original/crackme
```

Chaînes : `usage ./crackme "<key>"`, `Pass valid!`, `Nope.`, puis un bloc illisible
`^62(Ay&3`r7j|Q}>6iu7(...` : ce sont **quatre tables de 16 octets** collées dans `.rodata`, pas du texte.

## Flow

`main` @ `0x1080` : exige `argc == 2`, charge les 4 tables sur la pile (4 × `movdqa` depuis `0x2030..0x2060`), puis boucle
16 fois en comparant `argv[1][i]` à un octet calculé. Tout octet faux → `Nope.`, 16 octets bons → `Pass valid!`.

## Comment on trouve

**Ancrage** : `objdump -d -M intel --no-show-raw-insn original/crackme | awk '/<main>:/,/ret/'`, boucle @ `0x1140` :

```asm
1140: movzx eax,BYTE PTR [rdx]   ; T0[i]  (rdx = rsp      <- 0x2030)
1143: xor   al,BYTE PTR [rsi]    ; ^ T3[i] (rsi = rsp+0x60 <- 0x2060)
1145: xor   al,BYTE PTR [r8]     ; ^ T1[i] (r8  = rsp+0x20 <- 0x2040)
1148: xor   al,BYTE PTR [rdi]    ; ^ T2[i] (rdi = rsp+0x40 <- 0x2050)
114a: xor   eax,0x20
114d: cmp   BYTE PTR [rcx],al    ; rcx = argv[1] + i
114f: jne   Nope
1165: cmp   rdx,r9               ; r9 = rsp+0x10 -> 16 itérations
```

Donc `key[i] = T0[i] ^ T1[i] ^ T2[i] ^ T3[i] ^ 0x20`. Les tables (`objdump -s --start-address=0x2030 --stop-address=0x2070`) :

```text
 2030 5e363228 41792633 6072376a 7c517d3e   T0
 2040 36697537 28695542 70442439 4b6c4943   T1
 2050 3a765433 3f5b5a7d 6356276f 66383f43   T2
 2060 334b702a 332b4e64 6a785f29 406b644e   T3
```

Exemple, octet 0 : `0x5e ^ 0x36 ^ 0x3a ^ 0x33 ^ 0x20 = 0x41` = `A` ; octet 1 : `0x36 ^ 0x69 ^ 0x76 ^ 0x4b ^ 0x20 = 0x42` = `B` ; etc.
Piège : l'ordre des `xor` dans l'asm (rdx, rsi, r8, rdi) est sans importance (XOR commutatif), mais il faut bien les 4 tables et le `^0x20`.

## Vérification

```text
$ python3 tools/xor-solve.py --check
key = ABC&E@GH98K51NOP
OK: Pass valid! | KO: Nope.
```

## Notes

- Seuls les **16 premiers octets** sont comparés, sans test de longueur : une clé plus longue ayant ce préfixe passe aussi.
- Pas d'anti-debug ; reverse 100 % statique (pas de session GDB).
