# Notes — VSEC Challenger No.1 (`6acace8cca34abba98f8305a`)

**Solved** (2026-10-11). Write-up : [`../README.md`](../README.md) · keygen : [`../tools/vsec1-solve.py`](../tools/vsec1-solve.py).
Ce fichier garde les constantes et adresses de la couche **VM_Garble** (utile si on veut re-décoder les blobs).

Repo ISA : [NIKJOO/VM_Garble](https://github.com/NIKJOO/VM_Garble) (`garble/internal/vm/`). Cousin :
[nimanikjoo nightmare](../../../nimanikjoo/6ac6ee38ace07d1c3fbc499e/).

## Binaire

| | |
|---|---|
| sha256 | `6bd1a18428b2a2439368f6b152b9dcb18863ddc97870f8e83988ce5ef39e5242` |
| PE64 console Go, garble + VM_Garble | ImageBase IDA `0x140000000` |
| Mot de passe ZIP | `crackmes.one` |
| Base IDA | `analysis/VSEC_Challenger_No.1.exe.i64` (gitignorée) |

## Cartographie (VA IDA)

| VA | Rôle |
|---|---|
| `sub_140048CC0` | `runtime.main` → `call [off_140617880]` = stub `sub_1403EC880` (`mov eax,2` → `RunFunc(2)`) |
| `sub_1403EC440` / `EC600` / `EC880` | stubs `RunFunc(0)` (1 arg), `RunFunc(1)` (3 args), `RunFunc(2)` (0 arg) |
| **`sub_1403E4680`** | interpréteur VM_Garble (switch d'opcodes) |
| `sub_1403EBBA0` | `mix64` (SplitMix64) |
| `sub_1403EBBE0` / `EBDC0` | intégrité globale / par fonction |
| `unk_1406A0780` | `Hardening.Dec[256]` (BSS, remplie au runtime ; `xlat.bin`) |
| `qword_14061C570/578/580/588/590` | `Key / TableKey / TableKey2 / EnvKey / Integrity` |
| `off_14063E4D0` → `0x140644568` | 3 × `Function.Code` (`blob0/1/2.bin`) |
| `off_14063E4F0` → `0x1406445B0` | 3 slices **`Dispatch`** : `{0x140620AE8,38}`, `{0x1406200C8,28}`, `{0x14061DCE0,5}` |
| `off_14063E4B0` / `E510` | checksums des fonctions / `NumLocals` |
| `sub_1403E4420` | bind des 22 natives (`CALLN i`) |

Natives **16, 17, 18** (`sub_1403F05E0`, `F0700`, `F08A0`) : push d'une globale, `new`, puis appel de
`sub_1403BFCE0` (le vrai interpréteur — voir README). Natives 0–15, 19–21 : boxing/unboxing
d'`interface{}` (`int8 … int64`, `bool`, `string`, `abs`…).

## Clés (constantes du PE, vérifiées)

```text
KEY        qword_14061C570 = 0x6ebd26981b708354
ENV        qword_14061C588 = 0x0b9c5a429d51d3cd    = envMix() amd64 + windows + ptr 8
TableKey   qword_14061C578 = 0xee089f079d78cd84
TableKey2  qword_14061C580 = 0x6fef9dc0e305b988
Integrity  qword_14061C590 = 0xe8147f2b57d962a1
```

## Décodage d'instruction (calé sur l'asm `0x1403E4B7D`)

```text
mix64(z): z ^= z>>30; z *= 0xBF58476D1CE4E5B9; z ^= z>>27; z *= 0x94D049BB133111EB; return z ^ (z>>31)
pk   = mix64(mix64(ENV ^ KEY ^ pc*0x9E3779B97F4A7C15 ^ (pc<<17)))
wire = code[pc] ^ byte(pk) ^ byte(pk>>8) ^ byte(pk>>16) ;  op = xlat[wire]
wide (1+8 o) si op ∈ {1,2,6,7} ou 45..51 ou 55 ; arg = u64le ^ mix64(pk ^ 0xD6E8FEB86659FD93)
DISPATCH : pc = table[state] ^ TableKey2 ^ TableKey ^ mix64(TableKey) ^ mix64(TableKey2)
```

`xlat` : Fisher-Yates à n = 57 sur `KEY ^ ENV` ; les 3 blobs se consument exactement.

## Contenu des 3 fonctions VM

* **blob0** — `toInt64(any)` : type-switch (`CALLN 0..7` assertions, `CONV`), natives 8/9/10…13 ;
* **blob1** — `cmp(op, a, b)` : normalise `a`,`b` via `CALLV 0` puis compare (`==, !=, <, <=, >, >=`) ;
* **blob2** — `main` : `CALLN 16 ; CALLN 17 ; CALLN 18 ; RET 0`.

Listings : `disasm/blob{0,1,2}.txt` (linéaires) et `disasm/blob{0,1,2}-unflat.txt` (dé-aplatis, junk retiré).

## Où est le vrai check

`sub_1403BFCE0` (+ 8 clones `sub_140395AA0…`) : programme chiffré 2595 o (`off_14063E450`), enregistrements
de 5 octets, microprogramme registre, map → gabarits (35 × 3), opérations sur `reflect.Value`.
Helpers partagés (hookés par `tools/vsec1-trace.py`) :

| VA | Rôle |
|---|---|
| `0x140391460` | binop (`eax` : 0 `+`, 1 `-`, 2 `*`, 3 `/`, 4 `%`, 5 `^`) |
| `0x140391A80` | comparaison (`eax` : 0 `==`, 1 `!=`, 2 `<`, 3 `<=`, 4 `>`, 5 `>=`) |
| `0x1403921A0` | truthy |
| `0x140393FA0` | `reflect.Value.MethodByName` (`rcx`,`rdi` = nom) |
| `0x140393BA0` | `reflect.Value.Call` / chargement de globale |
| `0x140395520` | index |
| `0x140395880` | garde anti-debug (horloge) |
| `0x1403F1A80` / `F38E0` | `sha256.New` init / bloc |

## Pièges

1. `strings` inutiles (garble `-literals`) ; le banner « nightmare » est un reliquat.
2. Hex-Rays se trompe sur les slices Go et l'ABI (`RAX,RBX,RCX…`) : l'asm fait foi.
3. Le mot de passe du cousin nimanikjoo (`G0_VM_15_H4RD_4S_H3LL_2026!`) est invalide ici.
4. Ne jamais pas-à-pas au début de `sub_1403BFCE0` (timing). Ne pas patcher `original/`.
