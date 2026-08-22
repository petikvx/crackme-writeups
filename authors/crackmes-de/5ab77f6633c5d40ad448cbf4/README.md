# crackmes.de's negligent_deobfuscate_1 (neon)

> [crackmes.one](https://crackmes.one/crackme/5ab77f6633c5d40ad448cbf4) · [`ORIGIN.yml`](ORIGIN.yml)

| | |
|---|---|
| **Auteur** | neon (miroir crackmes.de) |
| **Plateforme** | Windows PE32 (MASM, 2 sections, ~10 KiB) |
| **Type** | déobfuscation (trash + code brisé) — pas de serial |

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/negligent.zip` | archive |
| `original/deobfuscate.exe` | PE obfusqué |
| `original/readme.txt` | énoncé (newbie = source ; pro = auto-deob) |
| `tools/negligent-deobfuscate-solve.py` | deobfuscateur + simu |

## Réponse

Pas de password : le programme **déplace la dword `2`** à travers 4 slots `.data` via une routine `transfer`, puis `ret` (sortie process).

État final vérifié :

| VA | Valeur |
|---|---|
| `0x404000` | `0` |
| `0x404004` | `0` |
| `0x404008` | `0` |
| `0x40400C` | **`2`** |

```bash
python3 tools/negligent-deobfuscate-solve.py -q
# transfer 2 through 4 dwords → [0x40400C]=2
python3 tools/negligent-deobfuscate-solve.py --check
python3 tools/negligent-deobfuscate-solve.py --asm
```

## Premier regard

```text
PE32 executable (GUI) Intel 80386, 2 sections
Linker: Microsoft Linker(5.12) · Compiler: MASM(6.14)
SHA-256 deobfuscate.exe: d59928cf37d2fbb949d2bae17ddb487a837b72d814a826429b1a4b68fbc8c23f
```

Aucune import table : pas d’API, juste du code + 16 octets de `.data` (`dd 2,0,0,0`).

## Flow obfusqué

Motifs récurrents de NeoN :

1. **`eb 01`** + 1 octet poubelle (désaligne le désassembleur linéaire).
2. **`e9 rel32`** entre micro-blocs éparpillés dans `.text`.
3. Trash : `lea reg, imm` absurdes, `bswap`, `mov` partial (`ah`/`ch`/…), imm 32-bit aléatoires, préfixes `rep`/`repnz` inutiles.
4. Une seule vraie `xchg edi, edx` (ne pas la classer comme trash).

## Prédicat / source clean

```asm
transfer:                 ; déc [edx], inc [edi] jusqu’à [edx]==0
.loop:
        dec     dword [edx]
        inc     dword [edi]
        cmp     dword [edx], 0
        jne     .loop
        ret

main:
        mov     edx, 0x404000
        mov     edi, 0x404004
        call    transfer      ; 2 → slot1
        xchg    edi, edx
        add     edi, 8        ; edi → 0x404008
        call    transfer      ; 2 → slot2
        mov     edx, edi
        mov     edi, 0x40400C
        jmp     transfer      ; tail-call : 2 → slot3, ret → exit
```

## Vérification

- Solveur : simulation Capstone/`pefile` du CFG + filtre trash → mem finale OK.
- Live : `wine original/deobfuscate.exe` quitte silencieusement (exit 0), cohérent avec un `ret` sans imports.

## Notes

- Challenge **éducatif obfuscation**, pas keygen.
- Le mode « pro » demandé par l’auteur = automatiser exactement ce que fait `negligent-deobfuscate-solve.py`.
- Piège : filtrer tous les `xchg` comme trash casse le 2ᵉ transfert.
