#!/usr/bin/env python3
"""Keygen / recon for SVz's Orrery 2 (crackmes.one 6ac2301aca34abba98f82e95).

Daily stack-VM (opcode-permuted + murmur-stream encrypted) implements
orbit tick + Black-Box probes on a 14×14 board (12×12 interior, 11 planets
on 6 square rings). Serial = 15 Crockford chars of a Feistel'd combinadic.
"""
from __future__ import annotations

import argparse
import os
import struct
import sys
from datetime import date, timedelta
from pathlib import Path

ALPHABET = "0123456789ABCDEFGHJKMNPQRSTVWXYZ"
DAY0 = 20686  # 2026-08-21
DAY_COUNT = 366  # inclusive 20686 .. 21051
N = 14
INTERIOR = 12
MASK32 = 0xFFFFFFFF
MASK64 = 0xFFFFFFFFFFFFFFFF
GOLDEN64 = 0x9E3779B97F4A7C15
GOLDEN64_NEG = 0x61C8864680B583EB  # -GOLDEN64
SPLITMIX_M1 = 0xBF58476D1CE4E5B9
SPLITMIX_M2 = 0x94D049BB133111EB
FNV64_OFF = 0xCBF29CE484222325
FNV64_PRIME = 0x100000001B3
MUR_C1 = 0x85EBCA6B
MUR_C2 = 0xC2B2AE35
OP_PERM_CONST = 0x564D5F4F50434F44  # "DOCP_OMV" LE
DAY_SEED_CONST = 0x42435F5354524D00
MAX_STEPS = 100001
MEM_SIZE = 0xC4  # 196
STACK_MAX = 64
LOCALS = 16
CALL_MAX = 16

# PE .rdata: VA 0x140006000, file 0x4000 → file = rva - 0x2000
RVA_BC = 0x61C0
RVA_LENS = 0x6F240
RVA_OFFS = 0x6F520
RVA_SURVEY = 0x6FAE0
RVA_PROBE = 0x74B00


def _exe_candidates() -> list[Path]:
    here = Path(__file__).resolve().parent
    root = here.parent
    return [
        root / "analysis" / "extracted" / "orrery2-2.0" / "orrery2.exe",
        root / "original" / "orrery2-2.0" / "orrery2.exe",
    ]


def find_exe(explicit: Path | None = None) -> Path:
    if explicit is not None:
        return explicit
    for c in _exe_candidates():
        if c.is_file():
            return c
    raise FileNotFoundError("orrery2.exe not found")


def rva_to_off(rva: int) -> int:
    return rva - 0x2000


def splitmix64(x: int) -> int:
    z = x & MASK64
    z = (z ^ (z >> 30)) * SPLITMIX_M1 & MASK64
    z = (z ^ (z >> 27)) * SPLITMIX_M2 & MASK64
    return (z ^ (z >> 31)) & MASK64


def fmix32(h: int) -> int:
    h &= MASK32
    h ^= h >> 16
    h = (h * MUR_C1) & MASK32
    h ^= h >> 13
    h = (h * MUR_C2) & MASK32
    h ^= h >> 16
    return h


def ror32(x: int, n: int) -> int:
    n &= 31
    x &= MASK32
    return ((x >> n) | (x << (32 - n))) & MASK32


def rol32(x: int, n: int) -> int:
    n &= 31
    x &= MASK32
    return ((x << n) | (x >> (32 - n))) & MASK32


def unix_day(d: date | None = None) -> int:
    d = d or date.today()
    return (d - date(1970, 1, 1)).days


def resolve_day(day_arg: str | None) -> int:
    if day_arg is None or day_arg == "":
        env = os.environ.get("ORRERY_DAY")
        if env:
            day_arg = env
        else:
            return unix_day()
    if day_arg.isdigit() or (day_arg.startswith("-") and day_arg[1:].isdigit()):
        return int(day_arg)
    return unix_day(date.fromisoformat(day_arg))


def load_tables(exe: Path) -> dict:
    data = exe.read_bytes()

    def at(rva: int, n: int) -> bytes:
        o = rva_to_off(rva)
        return data[o : o + n]

    lens = struct.unpack("<366H", at(RVA_LENS, 366 * 2))
    offs = struct.unpack("<366I", at(RVA_OFFS, 366 * 4))
    surveys = at(RVA_SURVEY, 366 * 56)
    probes = at(RVA_PROBE, 366 * 56)
    bc_blob = at(RVA_BC, offs[-1] + lens[-1] if offs[-1] + lens[-1] > 0 else 0x69080)
    # full blob until lens table
    bc_blob = at(RVA_BC, RVA_LENS - RVA_BC)
    return {
        "data": data,
        "lens": lens,
        "offs": offs,
        "surveys": surveys,
        "probes": probes,
        "bc": bc_blob,
    }


def opcode_perm(day: int) -> bytes:
    """Inverse map: encrypted_opcode_byte -> ISA 0..35, else 0xFF."""
    arr = list(range(256))
    state = day ^ OP_PERM_CONST
    for n in range(256, 1, -1):
        state = (state - GOLDEN64_NEG) & MASK64
        r = splitmix64(state) % n
        arr[n - 1], arr[r] = arr[r], arr[n - 1]
    inv = bytearray(b"\xff" * 256)
    for j in range(36):
        inv[arr[j]] = j
    return bytes(inv)


def fmix_noshift16(h: int) -> int:
    """Murmur fmix32 without the final xor-shift-16 (matches the SHRD path)."""
    h &= MASK32
    h ^= h >> 16
    h = (h * MUR_C1) & MASK32
    h ^= h >> 13
    h = (h * MUR_C2) & MASK32
    return h


def day_stream_seed(day: int) -> int:
    """v81: custom splitmix64 of (day ^ 'BC_STRM\\0'-ish), low 32."""
    rdx = ((day ^ DAY_SEED_CONST) + GOLDEN64) & MASK64
    rdx ^= 0x381EB6433
    rdx = (rdx * SPLITMIX_M1) & MASK64
    rdx ^= rdx >> 27
    rdx = (rdx * SPLITMIX_M2) & MASK64
    r8 = rdx ^ (rdx >> 31)
    return r8 & MASK32


def pc_xor_key(a: int, b: int) -> int:
    """16-bit key: shrd(fmix_partial(a), fmix_partial(b)>>24, 24)."""
    fa = fmix_noshift16(a)
    fb = fmix_noshift16(b)
    return ((fa >> 24) | ((fb >> 24) << 8)) & 0xFFFF


def header_pcs(blob: bytes, v81: int) -> tuple[int, int]:
    w0 = blob[0] | (blob[1] << 8)
    w1 = blob[2] | (blob[3] << 8)
    pc_orbit = w0 ^ pc_xor_key(v81, (v81 - 0x61C88647) & MASK32)
    pc_probe = w1 ^ pc_xor_key((v81 + 0x3C6EF372) & MASK32, (v81 - 0x255992D5) & MASK32)
    return pc_orbit, pc_probe


def decrypt_byte(enc: int, pc: int, seed: int) -> int:
    h = (pc * 0x9E3779B9 + seed) & MASK32
    return enc ^ (fmix32(h) >> 24)


class VMError(Exception):
    pass


def i16_from_u16(v: int) -> int:
    v &= 0xFFFF
    if v & 0x8000:
        v -= 0x10000
    return v


def run_vm(
    blob: bytes,
    length: int,
    perm: bytes,
    seed: int,
    pc: int,
    inputs: list[int],
    mem: bytearray | None = None,
) -> tuple[int, int | None, bytearray]:
    """Return (status, out_value, mem). status 1 = HALT1, 0 = HALT0, -1 = fail."""
    if mem is None:
        mem = bytearray(MEM_SIZE)
    stack = [0] * STACK_MAX
    sp = 0
    locals_ = [0] * LOCALS
    for i, v in enumerate(inputs[:LOCALS]):
        locals_[i] = v & MASK32
        if v < 0:
            locals_[i] = v
    callst = [0] * CALL_MAX
    csp = 0
    steps = 0

    def fetch(p: int) -> int:
        if p >= length:
            return -1
        return decrypt_byte(blob[p], p, seed)

    def push(v: int) -> None:
        nonlocal sp
        if sp >= STACK_MAX:
            raise VMError("stack overflow")
        stack[sp] = v
        sp += 1

    def pop() -> int:
        nonlocal sp
        if sp <= 0:
            raise VMError("stack underflow")
        sp -= 1
        return stack[sp]

    while True:
        if pc >= length or pc < 0:
            return -1, None, mem
        steps += 1
        if steps >= MAX_STEPS:
            return -1, None, mem
        raw = fetch(pc)
        if raw < 0:
            return -1, None, mem
        op = perm[raw]
        if op == 0xFF:
            return -1, None, mem

        def imm8() -> int:
            b = fetch(pc + 1)
            if b < 0:
                raise VMError("imm")
            return b

        def imm16() -> int:
            lo = fetch(pc + 1)
            hi = fetch(pc + 2)
            if lo < 0 or hi < 0:
                raise VMError("imm16")
            return i16_from_u16(lo | (hi << 8))

        def imm32() -> int:
            bs = [fetch(pc + i) for i in range(1, 5)]
            if any(b < 0 for b in bs):
                raise VMError("imm32")
            v = bs[0] | (bs[1] << 8) | (bs[2] << 16) | (bs[3] << 24)
            if v & 0x80000000:
                v -= 0x100000000
            return v

        try:
            if op == 0:  # NOP
                pc += 1
            elif op == 1:  # PUSHi16
                push(imm16())
                pc += 3
            elif op == 2:  # PUSHi32
                push(imm32())
                pc += 5
            elif op == 3:  # POP
                pop()
                pc += 1
            elif op == 4:  # DUP
                if sp < 1:
                    return -1, None, mem
                push(stack[sp - 1])
                pc += 1
            elif op == 5:  # SWAP
                if sp < 2:
                    return -1, None, mem
                stack[sp - 1], stack[sp - 2] = stack[sp - 2], stack[sp - 1]
                pc += 1
            elif op == 6:  # OVER
                if sp < 2:
                    return -1, None, mem
                push(stack[sp - 2])
                pc += 1
            elif op == 7:  # GETLOCAL
                idx = imm8()
                if idx > 15:
                    return -1, None, mem
                push(locals_[idx])
                pc += 2
            elif op == 8:  # SETLOCAL
                idx = imm8()
                if idx > 15 or sp < 1:
                    return -1, None, mem
                locals_[idx] = pop()
                pc += 2
            elif op == 9:  # ADD
                if sp < 2:
                    return -1, None, mem
                b = pop()
                stack[sp - 1] = (stack[sp - 1] + b) & MASK32
                if stack[sp - 1] >= 0x80000000:
                    stack[sp - 1] -= 0x100000000
                pc += 1
            elif op == 10:  # SUB
                if sp < 2:
                    return -1, None, mem
                b = pop()
                stack[sp - 1] -= b
                pc += 1
            elif op == 11:  # MUL
                if sp < 2:
                    return -1, None, mem
                b = pop()
                stack[sp - 1] = (stack[sp - 1] * b) & MASK32
                if stack[sp - 1] >= 0x80000000:
                    stack[sp - 1] -= 0x100000000
                pc += 1
            elif op == 12:  # DIV
                if sp < 2:
                    return -1, None, mem
                b = pop()
                a = stack[sp - 1]
                if b <= 0:
                    return -1, None, mem
                # idiv truncates toward 0, then the handler floors (q-1 if rem != 0
                # and signs differ) => floor division
                stack[sp - 1] = a // b
                pc += 1
            elif op == 13:  # MOD (positive remainder)
                if sp < 2:
                    return -1, None, mem
                b = pop()
                a = stack[sp - 1]
                if b <= 0:
                    return -1, None, mem
                stack[sp - 1] = a % b
                pc += 1
            elif op == 14:  # AND
                if sp < 2:
                    return -1, None, mem
                b = pop()
                stack[sp - 1] = stack[sp - 1] & b
                pc += 1
            elif op == 15:  # XOR
                if sp < 2:
                    return -1, None, mem
                b = pop()
                stack[sp - 1] ^= b
                pc += 1
            elif op == 16:  # NEG
                if sp < 1:
                    return -1, None, mem
                stack[sp - 1] = -stack[sp - 1]
                pc += 1
            elif op == 17:  # SHL
                if sp < 2:
                    return -1, None, mem
                b = pop() & 31
                stack[sp - 1] = (stack[sp - 1] << b) & MASK32
                if stack[sp - 1] >= 0x80000000:
                    stack[sp - 1] -= 0x100000000
                pc += 1
            elif op == 18:  # EQ
                if sp < 2:
                    return -1, None, mem
                b = pop()
                a = pop()
                push(1 if a == b else 0)
                pc += 1
            elif op == 19:  # GT  (TOS > NOS)
                if sp < 2:
                    return -1, None, mem
                b = pop()
                a = pop()
                push(1 if b > a else 0)
                pc += 1
            elif op == 20:  # MIN
                if sp < 2:
                    return -1, None, mem
                b = pop()
                if b < stack[sp - 1]:
                    stack[sp - 1] = b
                pc += 1
            elif op == 21:  # JMP
                rel = imm16()
                pc = pc + 3 + rel
            elif op == 22:  # JZ
                if sp < 1:
                    return -1, None, mem
                rel = imm16()
                v = pop()
                pc = pc + 3
                if v == 0:
                    pc = pc + rel
            elif op == 23:  # JNZ
                if sp < 1:
                    return -1, None, mem
                rel = imm16()
                v = pop()
                pc = pc + 3
                if v != 0:
                    pc = pc + rel
            elif op == 24:  # CALL
                if csp > 15:
                    return -1, None, mem
                rel = imm16()
                ret = pc + 3
                tgt = rel  # asm: r9d = signext16, compared to length; NOT pc-relative?
                # from 24C0: or edx, eax; mov r9d, edx  — absolute PC
                callst[csp] = ret
                csp += 1
                pc = rel
            elif op == 25:  # RET
                if csp <= 0:
                    return -1, None, mem
                csp -= 1
                pc = callst[csp]
            elif op == 26:  # LOAD
                if sp < 1:
                    return -1, None, mem
                addr = stack[sp - 1]
                if addr < 0 or addr > 0xC3:
                    return -1, None, mem
                stack[sp - 1] = mem[addr]
                pc += 1
            elif op == 27:  # STORE
                if sp < 2:
                    return -1, None, mem
                val = pop()
                addr = pop()
                if addr < 0 or addr > 0xC3:
                    return -1, None, mem
                mem[addr] = val & 0xFF
                pc += 1
            elif op == 28:  # HALT0  *out = TOS; return 0
                if sp < 1:
                    return -1, None, mem
                return 0, stack[sp - 1], mem
            elif op == 29:  # HALT1
                return 1, None, mem
            else:
                return -1, None, mem
        except VMError:
            return -1, None, mem





def binom_table() -> list[list[int]]:
    """C(n, k) for n=0..144, k=0..11."""
    c = [[0] * 12 for _ in range(145)]
    for n in range(145):
        c[n][0] = 1
        for k in range(1, 12):
            if k > n:
                c[n][k] = 0
            else:
                c[n][k] = c[n - 1][k] + c[n - 1][k - 1]
    return c


BINOM = binom_table()


def combinadic_decode(rank: int, k: int = 11, n: int = 144) -> list[int]:
    """Largest-first combinadic → k strictly decreasing indices in 0..n-1."""
    if rank >= BINOM[n][k]:
        raise ValueError("rank out of range")
    out = []
    r = rank
    for i in range(k, 0, -1):
        c = i
        while c < n and BINOM[c][i] <= r:
            c += 1
        c -= 1
        out.append(c)
        r -= BINOM[c][i]
    return out  # high to low, length k


def combinadic_encode(idxs: list[int], k: int = 11) -> int:
    s = sorted(idxs, reverse=True)
    if len(s) != k or len(set(s)) != k:
        raise ValueError("need unique k indices")
    r = 0
    for i, c in zip(range(k, 0, -1), s):
        r += BINOM[c][i]
    return r


def fnv1a64_name(name: str) -> int:
    s = name.strip()
    if not s:
        return FNV64_OFF
    buf = s.upper().encode("ascii", "ignore")[:256]
    h = FNV64_OFF
    for b in buf:
        h = ((h ^ b) * FNV64_PRIME) & MASK64
    return h


def name_mix(name: str) -> tuple[int, int, int]:
    """Return (splitmix1, splitmix2, fnv>>54) matching sub_140002690."""
    h = fnv1a64_name(name)
    s1 = splitmix64((h - GOLDEN64_NEG) & MASK64)  # h + GOLDEN
    # asm: (h - 0x61C8864680B583EB) then splitmix body
    s1 = splitmix64((h + GOLDEN64) & MASK64)
    # wait: v7 = m1 * ((v6 - GOLDEN_NEG) ^ ((v6 - GOLDEN_NEG)>>30))
    # that's splitmix64 WITHOUT adding golden first, starting from (h - GOLDEN_NEG) = h+GOLDEN
    x = (h - GOLDEN64_NEG) & MASK64
    s1 = splitmix64(x)
    x2 = (h + 0x3C6EF372FE94F82A) & MASK64
    s2 = splitmix64(x2)
    return s1, s2, h >> 54


def key_expand(name: str) -> list[int]:
    """26-round key schedule used to Feistel the 64-bit payload."""
    s1, s2, _ = name_mix(name)
    # 16 bytes: s1 || s2
    raw = struct.pack("<QQ", s1, s2)
    # 12-byte window as in main: LODWORD(v117)=v112 (s1 lo32),
    # pNumArgs = 8 bytes at offset 4 of the 16, + 4 bytes at offset 12
    # Layout v112 at B0: bytes 0..15 of s1||s2
    # LODWORD(v117[0]) = v112 = bytes 0-3
    # *QWORD pNumArgs = v113 at B4 = bytes 4-11
    # DWORD pNumArgs[8] = v114 at BC = bytes 12-15
    # Then they iterate v68=pNumArgs (ints starting at byte 4), v69=v117
    #
    # This is messy. Build 29 dwords as the loop does.
    # Initial:
    #   v117[0] low 32 = s1 & 32
    #   pNumArgs[0:8] = bytes[4:12]
    #   pNumArgs[8:12] = bytes[12:16]
    p = bytearray(12 + 26 * 8)  # plenty
    p[0:8] = raw[4:12]
    p[8:12] = raw[12:16]
    v117 = bytearray(4 + 26 * 4 + 16)
    struct.pack_into("<I", v117, 0, s1 & MASK32)
    # loop v70=0..25:
    #   v71 = *v68 (int at pNumArgs, advancing 4)
    #   v72 = *v69 (int at v117, advancing 4)
    #   v73 = v70 ^ (v72 + ror(v71,8))
    #   v68[2] = v73   # write at current v68+8 after increment? 
    #   after ++v68, v68[2] is original index+1+2 = index+3
    #   *v69 = rol(v72,3) ^ v73  after v69 advanced, so write at original+1
    #
    # Let's simulate with lists of dwords.
    # pNumArgs dwords: dP[0], dP[1], dP[2] initially = bytes 4-15 as 3 le dwords
    dP = list(struct.unpack("<3I", raw[4:16])) + [0] * 40
    dV = [s1 & MASK32] + [0] * 40
    ip = 0
    iv = 0
    for t in range(26):
        v71 = dP[ip]
        v72 = dV[iv]
        ip += 1
        iv += 1
        v73 = (t ^ ((v72 + ror32(v71, 8)) & MASK32)) & MASK32
        dP[ip + 2] = v73  # v68[2] after increment
        dV[iv] = rol32(v72, 3) ^ v73
    # decrypt uses *((_DWORD *)v117 + v74) for v74=26..0
    return dV[:27]


def feistel_decrypt(payload64: int, key: list[int], chk10: int) -> int | None:
    lo = payload64 & MASK32
    hi = (payload64 >> 32) & MASK32
    for i in range(26, -1, -1):
        lo = ror32(hi ^ lo, 3)
        hi = rol32(((key[i] ^ hi) - lo) & MASK32, 8)
    if (lo & 0x3FF) != chk10:
        return None
    return ((lo | (hi << 32)) >> 10) & ((1 << 54) - 1)


def feistel_encrypt(rank: int, name: str) -> int:
    s1, s2, chk10 = name_mix(name)
    key = key_expand(name)
    packed = ((rank << 10) | chk10) & ((1 << 64) - 1)
    lo = packed & MASK32
    hi = (packed >> 32) & MASK32
    # inverse of decrypt. decrypt:
    #   for i=26..0:
    #     lo = ror(hi^lo, 3)
    #     hi = rol((key[i]^hi) - lo, 8)
    # encrypt is reverse:
    #   for i=0..26:
    #     hi = (ror(hi,8) + lo) ^ key[i]
    #     lo = rol(lo,3) ^ hi
    for i in range(0, 27):
        hi = ((ror32(hi, 8) + lo) ^ key[i]) & MASK32
        lo = (rol32(lo, 3) ^ hi) & MASK32
    return (lo | (hi << 32)) & MASK64


def fnv16_8(payload64: int) -> int:
    raw = struct.pack("<Q", payload64)
    h = 0x9DC5  # -25147 as u16
    for b in raw:
        h = (403 * ((b ^ h) & 0xFFFF)) & 0xFFFF
    return h


def encode_serial(name: str, cells: list[int]) -> str:
    rank = combinadic_encode(cells)
    ct = feistel_encrypt(rank, name)
    chk = fnv16_8(ct) & 0x7FF
    full = (ct << 11) | chk
    chars = []
    for i in range(14, -1, -1):
        chars.append(ALPHABET[(full >> (5 * i)) & 31])
    s = "".join(chars)
    return f"{s[:5]}-{s[5:10]}-{s[10:]}"


def decode_serial(serial: str, name: str) -> list[int]:
    cleaned = "".join(c for c in serial.upper() if c not in "- ")
    if len(cleaned) != 15:
        raise ValueError("serial must be 15 Crockford chars")
    v = 0
    for ch in cleaned:
        idx = ALPHABET.find(ch)
        if idx < 0:
            raise ValueError(f"bad char {ch!r}")
        v = (v << 5) | idx
    payload = v >> 11
    chk = v & 0x7FF
    if (fnv16_8(payload) ^ (v & 0xFFFF)) & 0x7FF:
        raise ValueError("checksum mismatch")
    key = key_expand(name)
    _, _, chk10 = name_mix(name)
    rank = feistel_decrypt(payload, key, chk10)
    if rank is None:
        raise ValueError("feistel auth failed")
    return combinadic_decode(rank)


def edges() -> list[tuple[int, int]]:
    out = []
    for i in range(196):
        x, y = i % 14, i // 14
        onx = x in (0, 13)
        ony = y in (0, 13)
        if onx ^ ony:
            out.append((x, y))
    return out


EDGES = edges()


def disasm(blob: bytes, length: int, perm: bytes, seed: int, start: int, limit: int = 400) -> str:
    names = {
        0: "NOP",
        1: "PUSHi16",
        2: "PUSHi32",
        3: "POP",
        4: "DUP",
        5: "SWAP",
        6: "OVER",
        7: "GETLOCAL",
        8: "SETLOCAL",
        9: "ADD",
        10: "SUB",
        11: "MUL",
        12: "DIV",
        13: "MOD",
        14: "AND",
        15: "XOR",
        16: "NEG",
        17: "SHL",
        18: "EQ",
        19: "GT",
        20: "MIN",
        21: "JMP",
        22: "JZ",
        23: "JNZ",
        24: "CALL",
        25: "RET",
        26: "LOAD",
        27: "STORE",
        28: "HALT0",
        29: "HALT1",
    }
    lines = []
    pc = start
    n = 0
    seen = set()
    while pc < length and n < limit and pc not in seen:
        seen.add(pc)
        raw = decrypt_byte(blob[pc], pc, seed)
        op = perm[raw]
        if op == 0xFF:
            lines.append(f"{pc:04x}: ILLEGAL raw={raw:02x}")
            break
        name = names.get(op, f"OP{op}")
        extra = ""
        size = 1
        if op in (1, 21, 22, 23, 24):
            lo = decrypt_byte(blob[pc + 1], pc + 1, seed)
            hi = decrypt_byte(blob[pc + 2], pc + 2, seed)
            imm = i16_from_u16(lo | (hi << 8))
            extra = f" {imm}"
            if op == 21:
                extra += f" -> {pc + 3 + imm:04x}"
            if op == 24:
                extra += f" abs {imm:04x}"
            size = 3
        elif op in (7, 8):
            extra = f" {decrypt_byte(blob[pc + 1], pc + 1, seed)}"
            size = 2
        elif op == 2:
            bs = [decrypt_byte(blob[pc + i], pc + i, seed) for i in range(1, 5)]
            v = bs[0] | (bs[1] << 8) | (bs[2] << 16) | (bs[3] << 24)
            extra = f" {v}"
            size = 5
        lines.append(f"{pc:04x}: {name}{extra}")
        if op in (28, 29):
            break
        pc += size
        n += 1
    return "\n".join(lines)


def disasm_cfg(blob: bytes, length: int, perm: bytes, seed: int, start: int, limit: int = 800) -> str:
    names = {
        0: "NOP", 1: "PUSHi16", 2: "PUSHi32", 3: "POP", 4: "DUP", 5: "SWAP",
        6: "OVER", 7: "GETLOCAL", 8: "SETLOCAL", 9: "ADD", 10: "SUB", 11: "MUL",
        12: "DIV", 13: "MOD", 14: "AND", 15: "XOR", 16: "NEG", 17: "SHL",
        18: "EQ", 19: "GT", 20: "MIN", 21: "JMP", 22: "JZ", 23: "JNZ",
        24: "CALL", 25: "RET", 26: "LOAD", 27: "STORE", 28: "HALT0", 29: "HALT1",
    }
    q = [start]
    seen: set[int] = set()
    lines: list[tuple[int, str]] = []
    calls: list[int] = []

    def dec(p: int) -> int:
        if 0 <= p < length:
            return decrypt_byte(blob[p], p, seed)
        return -1

    while q and len(lines) < limit:
        pc = q.pop(0)
        if pc in seen or pc < 0 or pc >= length:
            continue
        seen.add(pc)
        raw = dec(pc)
        if raw < 0:
            continue
        op = perm[raw]
        if op == 0xFF:
            lines.append((pc, f"{pc:04x}: ILLEGAL raw={raw:02x}"))
            continue
        name = names.get(op, f"OP{op}")
        extra = ""
        size = 1
        succs: list[int] = []
        if op in (1, 21, 22, 23, 24):
            lo, hi = dec(pc + 1), dec(pc + 2)
            imm = i16_from_u16(lo | (hi << 8))
            extra = f" {imm}"
            size = 3
            succs = [pc + 3]
            if op == 21:
                extra += f" -> {pc + 3 + imm:04x}"
                succs = [pc + 3 + imm]
            elif op in (22, 23):
                extra += f" -> {pc + 3 + imm:04x}"
                succs = [pc + 3, pc + 3 + imm]
            elif op == 24:
                extra += f" abs {imm & 0xFFFF:04x}"
                calls.append(imm & 0xFFFF)
        elif op in (7, 8):
            extra = f" {dec(pc + 1)}"
            size = 2
            succs = [pc + 2]
        elif op == 2:
            bs = [dec(pc + i) for i in range(1, 5)]
            v = bs[0] | (bs[1] << 8) | (bs[2] << 16) | (bs[3] << 24)
            extra = f" {v}"
            size = 5
            succs = [pc + 5]
        elif op in (25, 28, 29):
            succs = []
        else:
            succs = [pc + 1]
        lines.append((pc, f"{pc:04x}: {name}{extra}"))
        for s in succs:
            if s not in seen:
                q.append(s)
    lines.sort()
    text = "\n".join(t for _, t in lines)
    for c in sorted(set(calls)):
        if c not in seen:
            text += f"\n\n; ---- sub {c:04x} ----\n"
            text += disasm_cfg(blob, length, perm, seed, c, limit)
    return text


# ---------------------------------------------------------------- physics
# Native re-implementation of the probe VM = Black Box (Atoms) on 14x14,
# validated 56/56 against the VM + the real exe (see README).

def echo_code(x: int, y: int) -> int:
    """Exit-cell encoding of the VM (0 absorbed / 1 reflected / >=2 exit)."""
    if y == 0:
        return x + 1
    if y == 13:
        return x + 37
    return 2 * y + 12 + (1 if x == 13 else 0)


def echo_label(code: int) -> str:
    """Human-readable survey line (same mapping as the native binary)."""
    if code == 0:
        return "absorbed"
    if code == 1:
        return "reflected"
    if 2 <= code <= 13:
        return f"deflected to ({code - 1},0)"
    if 38 <= code <= 49:
        return f"deflected to ({code - 37},13)"
    if code % 2 == 0:
        return f"deflected to (0,{(code - 12) // 2})"
    return f"deflected to (13,{(code - 13) // 2})"


def trace(occ, x: int, y: int):
    """Black Box ray from border cell (x,y).

    occ(cx, cy) -> 1 / 0 / None (unknown). Returns ('need', cellidx) when an
    unknown cell is required, else ('done', code).
    """
    dx = (x == 0) - (x == 13)
    dy = (y == 0) - (y == 13)
    first = True
    for _ in range(2000):
        hx, hy = x + dx, y + dy
        v = occ(hx, hy)
        if v is None:
            return "need", (hx, hy)
        if v:
            return "done", 0
        ax, ay = hx + dy, hy + dx  # shoulder A
        bx, by = hx - dy, hy - dx  # shoulder B
        a = occ(ax, ay)
        if a is None:
            return "need", (ax, ay)
        b = occ(bx, by)
        if b is None:
            return "need", (bx, by)
        if a and b:
            return "done", 1
        if a:
            if first:
                return "done", 1
            dx, dy = -dy, -dx
        elif b:
            if first:
                return "done", 1
            dx, dy = dy, dx
        x, y = x + dx, y + dy
        first = False
        if x in (0, 13) or y in (0, 13):
            return "done", echo_code(x, y)
    return "done", -1


def orbit_positions(blob, length, perm, seed, pc0) -> list[list[int]]:
    """POS[t][i] = cell (y*14+x) of planet index i at tick t (from the orbit VM)."""
    from concurrent.futures import ProcessPoolExecutor

    jobs = [(blob, length, perm, seed, pc0, t) for t in range(56)]
    with ProcessPoolExecutor() as ex:
        return list(ex.map(_orbit_row, jobs))


def _orbit_row(job) -> list[int]:
    blob, length, perm, seed, pc0, t = job
    row = []
    for i in range(144):
        st, _, mem = run_vm(blob, length, perm, seed, pc0, [i] * 11 + [t])
        assert st == 1
        cells = [k for k, b in enumerate(mem) if b]
        assert len(cells) == 1  # one planet alone -> one lit cell
        row.append(cells[0])
    return row


MAX_RAY = 40


def solve_cells(pos, probes, survey):
    """SAT/SMT model of the sky (z3): 144 booleans "planet index i is chosen",
    exactly 11 true, and for every tick t the Black-Box ray of probe t must end
    on the surveyed echo. The ray is unrolled symbolically (memoised over
    (cell, direction, first-step) states, rays are reversible so no cycles).
    Returns (cells, n_models_checked) ; a second model would mean an ambiguous sky.
    """
    try:
        import z3
    except ImportError:
        raise SystemExit("pip install z3-solver")

    p = [z3.Bool(f"p{i}") for i in range(144)]
    sol = z3.Solver()
    sol.add(z3.PbEq([(v, 1) for v in p], 11))

    for t in range(56):
        inv = {c: i for i, c in enumerate(pos[t])}
        target = survey[t]
        memo: dict = {}

        def occ(cx, cy):
            i = inv.get(cy * 14 + cx)
            return z3.BoolVal(False) if i is None else p[i]

        def move(x, y, dx, dy, k):
            x, y = x + dx, y + dy
            if x in (0, 13) or y in (0, 13):
                return z3.BoolVal(echo_code(x, y) == target)
            return walk(x, y, dx, dy, False, k + 1)

        def walk(x, y, dx, dy, first, k):
            if k > MAX_RAY:  # contradictory assumptions can loop; real rays do not
                return z3.BoolVal(False)
            key = (x, y, dx, dy, first, k)
            if key in memo:
                return memo[key]
            hx, hy = x + dx, y + dy
            h = occ(hx, hy)
            a = occ(hx + dy, hy + dx)
            b = occ(hx - dy, hy - dx)
            refl = z3.BoolVal(target == 1)
            if first:
                nxt = z3.If(z3.Or(a, b), refl, move(x, y, dx, dy, k))
            else:
                nxt = z3.If(
                    z3.And(a, b),
                    refl,
                    z3.If(a, move(x, y, -dy, -dx, k),
                          z3.If(b, move(x, y, dy, dx, k), move(x, y, dx, dy, k))),
                )
            memo[key] = z3.If(h, z3.BoolVal(target == 0), nxt)
            return memo[key]

        x0, y0 = EDGES[probes[t]]
        sol.add(walk(x0, y0, (x0 == 0) - (x0 == 13), (y0 == 0) - (y0 == 13), True, 0))

    if sol.check() != z3.sat:
        return None, 0
    m = sol.model()
    cells = [i for i in range(144) if z3.is_true(m.eval(p[i], model_completion=True))]
    sol.add(z3.Not(z3.And([p[i] for i in cells])))  # uniqueness check
    return cells, (1 if sol.check() == z3.unsat else 2)


def try_seeds(day: int, blob: bytes, length: int) -> None:
    perm = opcode_perm(day)
    seed = day_stream_seed(day)
    pc0, pc1 = header_pcs(blob, seed)
    print(f"seed={seed:08x} pc_orbit={pc0} pc_probe={pc1} len={length}")
    if 0 <= pc0 < length:
        print("--- orbit cfg ---")
        print(disasm_cfg(blob, length, perm, seed, pc0, 400))
    else:
        print("pc_orbit out of range")
    if 0 <= pc1 < length:
        print("--- probe cfg ---")
        print(disasm_cfg(blob, length, perm, seed, pc1, 900))
    else:
        print("pc_probe out of range")


def main(argv: list[str] | None = None) -> int:
    # Windows: ProcessPoolExecutor re-imports this file in workers; keep entry guarded (see bottom)
    ap = argparse.ArgumentParser(description="Orrery 2 keygen / recon (SVz)")
    ap.add_argument("-u", "--user", "--name", default="petik", dest="name")
    ap.add_argument("-d", "--day", default=None)
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--exe", type=Path, default=None)
    ap.add_argument("--dump-vm", action="store_true")
    ap.add_argument("--survey", action="store_true")
    ap.add_argument("--check", action="store_true", help="run orrery2.exe on the serial")
    ap.add_argument("--decode", default=None, help="decode a serial for --name")
    args = ap.parse_args(argv)

    exe = find_exe(args.exe)
    tables = load_tables(exe)
    day = resolve_day(args.day)
    if day < DAY0 or day >= DAY0 + DAY_COUNT:
        print(f"day {day} out of range {DAY0}..{DAY0 + DAY_COUNT - 1}", file=sys.stderr)
        return 1
    idx = day - DAY0
    blob = tables["bc"][tables["offs"][idx] : tables["offs"][idx] + tables["lens"][idx]]
    length = tables["lens"][idx]
    survey = tables["surveys"][idx * 56 : (idx + 1) * 56]
    probes = tables["probes"][idx * 56 : (idx + 1) * 56]

    if args.dump_vm:
        print(f"day {day} idx {idx} bc_len {length} off {tables['offs'][idx]}")
        print("survey", list(survey[:16]), "...")
        print("probes", list(probes[:16]), "...")
        print("n_edges", len(EDGES))
        try_seeds(day, blob, length)
        perm = opcode_perm(day)
        seed = day_stream_seed(day)
        pc0, pc1 = header_pcs(blob, seed)
        print("\n=== orbit placement t=0 all cells ===")
        pos_of = {}
        for cell in range(144):
            inputs = [cell] * 11 + [0]
            st, out, mem = run_vm(blob, length, perm, seed, pc0, inputs)
            occupied = [(i % 14, i // 14) for i, b in enumerate(mem) if b]
            pos_of[cell] = (st, occupied)
        from collections import Counter
        c = Counter(tuple(v[1]) for v in pos_of.values())
        print("unique layouts", len(c), "fails", sum(1 for st,_ in pos_of.values() if st != 1))
        print("most common", c.most_common(8))
        print("sample", {k: pos_of[k] for k in [0, 1, 2, 3, 4, 5, 11, 12, 23, 24, 71, 72, 143]})
        print("\n=== cell 0 over t=0..8 ===")
        for t in range(9):
            st, out, mem = run_vm(blob, length, perm, seed, pc0, [0] * 11 + [t])
            occupied = [(i % 14, i // 14) for i, b in enumerate(mem) if b]
            print(f"  t={t} {occupied} st={st}")
        print("\n=== probe empty edges 0..5 ===")
        for ei in range(6):
            x0, y0 = EDGES[ei]
            st, out, mem = run_vm(blob, length, perm, seed, pc1, [x0, y0], mem=bytearray(MEM_SIZE))
            print(f"  edge{ei} {EDGES[ei]} st={st} out={out}  encoded={x0 + y0 * 14 + 2}")
        print("\n=== t=0 live vs vm (empty then with planets later) ===")
        print("table probe0", probes[0], "edge", EDGES[probes[0]], "survey", survey[0])
        px, py = EDGES[probes[0]]
        st, out, mem = run_vm(blob, length, perm, seed, pc1, [px, py], mem=bytearray(MEM_SIZE))
        print("empty vm", st, out)
        print("orbit t=0 map of 0..23:", [pos_of[i][1][0] for i in range(24)])
        return 0

    if args.decode:
        cells = decode_serial(args.decode, args.name)
        print("cells", cells)
        return 0

    if args.survey:
        for t, (p, s) in enumerate(zip(probes, survey)):
            x, y = EDGES[p]
            print(f"  t={t:02d}  ({x},{y}) -> {echo_label(s)}")
        return 0

    perm = opcode_perm(day)
    seed = day_stream_seed(day)
    pc0, _ = header_pcs(blob, seed)
    print(f"[1/2] jour {day} : table d'orbites via la VM (8064 runs, ~20-60 s)...", file=sys.stderr, flush=True)
    pos = orbit_positions(blob, length, perm, seed, pc0)
    print("[2/2] z3 : recherche du ciel de 11 planetes (~1-2 min)...", file=sys.stderr, flush=True)
    cells, nodes = solve_cells(pos, probes, survey)
    if cells is None:
        print(f"no sky found ({nodes} nodes)", file=sys.stderr)
        return 1
    serial = encode_serial(args.name, cells)
    if args.q:
        print(serial)
    else:
        print(f"day {day}  planets {sorted(cells, reverse=True)}  ({nodes} nodes)")
        print(f"name   {args.name}")
        print(f"serial {serial}")

    if args.check:
        import subprocess

        env = dict(os.environ, ORRERY_DAY=str(day))
        r = subprocess.run([str(exe), args.name, serial], env=env, capture_output=True, text=True)
        out = (r.stdout + r.stderr).strip()
        print(out)
        return 0 if "ORRERY2{" in out else 1
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
