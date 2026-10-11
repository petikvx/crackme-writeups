#!/usr/bin/env python3
"""Disassemble VSEC Challenger No.1 VM_Garble bytecode (listing only, not the solver).

Le prédicat n'est pas dans ces 3 fonctions : voir README.md (tools/vsec1-solve.py).
Détails des clés / formats : analysis/NOTES.md. Run from anywhere:

  python tools/vsec1-disasm.py
"""
from __future__ import annotations

import hashlib
import struct
from pathlib import Path

MASK = (1 << 64) - 1
GOLDEN = 0x9E3779B97F4A7C15
ARG_MIX = 0xD6E8FEB86659FD93
KEY = 0x6EBD26981B708354
ENV = 0x0B9C5A429D51D3CD

OPNAMES = {
    0: "NOP",
    1: "CONST",
    2: "CONSTF",
    3: "POP",
    4: "DUP",
    5: "SWAP",
    6: "LOAD",
    7: "STORE",
    8: "ADD",
    9: "SUB",
    10: "MUL",
    11: "DIV",
    12: "REM",
    13: "NEG",
    14: "DIVU",
    15: "REMU",
    16: "AND",
    17: "OR",
    18: "XOR",
    19: "NOT",
    20: "SHL",
    21: "SHR",
    22: "SHRU",
    23: "ADDF",
    24: "SUBF",
    25: "MULF",
    26: "DIVF",
    27: "NEGF",
    28: "EQI",
    29: "NEI",
    30: "LTI",
    31: "LEI",
    32: "GTI",
    33: "GEI",
    34: "LTU",
    35: "LEU",
    36: "GTU",
    37: "GEU",
    38: "EQF",
    39: "NEF",
    40: "LTF",
    41: "LEF",
    42: "GTF",
    43: "GEF",
    44: "NOTB",
    45: "CONV",
    46: "JMP",
    47: "JZ",
    48: "JNZ",
    49: "CALLV",
    50: "CALLN",
    51: "RET",
    52: "DISPATCH",
    53: "REMF",
    54: "NESTED",
    55: "HALT",
}

# Live dump of unk_1406A0780 from x64dbg (image+0x6A0780)
XLAT_HEX = (
    "0A250C1C1F0B092F152B342E371B1930"  # +00
    "2216000E3528212C3112332A02040836"  # +10
    "0F2D1806320703201A05110110170D14"  # +20
    "23271D261E3824291300000102020303"  # +30
    "04050506060708090A0A0B0B0C0C0D0E"  # +40
    "0F0F1011111213141515161617171818"  # +50
    "19191A1B1B1C1D1D1E1F202021212222"  # +60
    "23242425262627282829292A2A2B2B2C"  # +70
    "2C2D2D2E2E2F30303131323233343536"  # +80
    "373738389495969798999A9B9C9D9E9F"  # +90
    "A0A1A2A3A4A5A6A7A8A9AAABACADAEAF"  # +A0
    "B0B1B2B3B4B5B6B7B8B9BABBBCBDBEBF"  # +B0
    "C0C1C2C3C4C5C6C7C8C9CACBCCCDCECF"  # +C0
    "D0D1D2D3D4D5D6D7D8D9DADBDCDDDEDF"  # +D0
    "E0E1E2E3E4E5E6E7E8E9EAEBECEDEEEF"  # +E0
    "F0F1F2F3F4F5F6F7F8F9FAFBFCFDFEFF"  # +F0
)
XLAT = bytes.fromhex(XLAT_HEX)
assert len(XLAT) == 256, len(XLAT)

ROOT = Path(__file__).resolve().parents[1]
ANALYSIS = ROOT / "analysis"


def mix64(z: int) -> int:
    z &= MASK
    z = (z ^ (z >> 30)) * 0xBF58476D1CE4E5B9 & MASK
    z = (z ^ (z >> 27)) * 0x94D049BB133111EB & MASK
    return (z ^ (z >> 31)) & MASK


def env_mix_amd64_windows() -> int:
    x = 0xC0FFEE
    x ^= ord("a") << 8
    x ^= ord("m") << 16
    x ^= ord("w") << 24
    x ^= 32
    x ^= 8 << 32
    return mix64(x)


def is_wide(op: int) -> bool:
    if op <= 7:
        return op != 0 and (op <= 2 or op >= 6)
    if 45 <= op <= 51:
        return True
    return op == 55


def decode_pk(pc: int, key: int = KEY, env: int = ENV) -> int:
    z = (env ^ key ^ ((pc * GOLDEN) & MASK) ^ ((pc << 17) & MASK)) & MASK
    return mix64(mix64(z))


def disasm(code: bytes, key: int = KEY, env: int = ENV):
    pc = 0
    n = len(code)
    insns = []
    while pc < n:
        pk = decode_pk(pc, key, env)
        wire = code[pc] ^ (pk & 0xFF) ^ ((pk >> 8) & 0xFF) ^ ((pk >> 16) & 0xFF)
        op = XLAT[wire & 0xFF]
        size = 9 if is_wide(op) else 1
        arg = 0
        if size == 9:
            if pc + 9 > n:
                insns.append((pc, op, None, f"TRUNCATED need 9 have {n - pc}"))
                break
            raw = struct.unpack_from("<Q", code, pc + 1)[0]
            arg = raw ^ mix64(pk ^ ARG_MIX)
            arg &= MASK
        name = OPNAMES.get(op, f"OP?{op}")
        insns.append((pc, op, arg, name, size))
        pc += size
    return insns, pc


def fmt_arg(op: int, arg: int) -> str:
    if arg is None:
        return ""
    signed = arg if arg < (1 << 63) else arg - (1 << 64)
    if op in (1, 2):
        ch = ""
        if 32 <= signed <= 126:
            ch = f" '{chr(signed)}'"
        return f" 0x{arg:016x} ({signed}){ch}"
    if op in (6, 7, 45, 46, 47, 48, 49, 50, 51, 54, 55):
        return f" {signed}"
    if is_wide(op):
        return f" 0x{arg:x}"
    return ""


def rebuild_xlat(seed: int, env: int, n: int = 57) -> bytes:
    perm = list(range(n))
    state = seed ^ env
    for i in range(n - 1, 0, -1):
        state = mix64((state + i) & MASK)
        j = int(state % (i + 1))
        perm[i], perm[j] = perm[j], perm[i]
    dec = list(range(256))
    for logical in range(n):
        wire = perm[logical]
        dec[wire] = logical
    # handler dups
    alias = n
    state = mix64(seed ^ 0xD401)
    # skip opBodiesMissing — try all ops
    for op in range(n):
        dups = int(1 + (state % 2))
        state = mix64((state + op) & MASK)
        for _ in range(dups):
            if alias >= 256:
                break
            dec[alias] = op
            alias += 1
    return bytes(dec)


def main() -> None:
    print("envMix computed", hex(env_mix_amd64_windows()))
    print("env stored     ", hex(ENV))
    print("match", env_mix_amd64_windows() == ENV)

    first57 = XLAT[:57]
    print("xlat unique 0-56 in first 57?", sorted(first57) == list(range(57)))
    print("xlat unique 0-55 in first 56?", sorted(XLAT[:56]) == list(range(56)))

    for n in (56, 57):
        rebuilt = rebuild_xlat(KEY, ENV, n)
        print(f"rebuild n={n} first57 match", rebuilt[:57] == XLAT[:57], "full", rebuilt == XLAT)
        if rebuilt[:16] != XLAT[:16]:
            print("  live   ", XLAT[:24].hex())
            print("  rebuilt", rebuilt[:24].hex())

    blobs = [
        (0, ANALYSIS / "blob0.bin", 0x2C, 0xCE0D2520966C03D9),
        (1, ANALYSIS / "blob1.bin", 0x16, 0x2A080CA324E3A807),
        (2, ANALYSIS / "blob2.bin", 0x03, 0x974388BF27FA1082),
    ]
    for idx, path, nloc, csum in blobs:
        code = path.read_bytes()
        insns, end = disasm(code)
        print(f"\n===== blob{idx} len={len(code)} end={end} leftover={len(code)-end} ninsns={len(insns)} nloc={nloc} =====")
        ops = {}
        for item in insns:
            op = item[1]
            ops[op] = ops.get(op, 0) + 1
        print("op hist", {OPNAMES.get(k, k): v for k, v in sorted(ops.items())})
        show = insns if idx == 2 else insns[:80]
        for item in show:
            pc, op, arg, name = item[0], item[1], item[2], item[3]
            size = item[4] if len(item) > 4 else ("?")
            extra = fmt_arg(op, arg) if arg is not None else ""
            print(f"  {pc:04d}: {name:<10}{extra}")
        if idx != 2 and len(insns) > 80:
            print(f"  ... {len(insns)-80} more")
        # dump CONST immediates that look like ASCII
        ascii_chunks = []
        for item in insns:
            if item[1] == 1 and item[2] is not None:
                a = item[2]
                if 32 <= a <= 126:
                    ascii_chunks.append(chr(a))
                elif a == 0:
                    ascii_chunks.append("\\0")
        if ascii_chunks:
            s = "".join(ascii_chunks)
            print("CONST ascii chars:", s[:200])


if __name__ == "__main__":
    main()
