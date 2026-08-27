#!/usr/bin/env python3
"""CFM #777 validated crypto primitives (ARX + decrypt)."""
from __future__ import annotations
import struct
from pathlib import Path

TABLE = [
    0x777777771337BEEF,
    0x9E3779B97F4A7C15,
    0x6A09E667BB67AE85,
    0x3C6EF372A54FF53A,
    0x510E527F9B05688C,
    0x1F83D9AB5BE0CD19,
    0x428A2F9871374491,
]
MUL = 0x517CC1B727220A95
ADD = 2004318071
XORC = 0x77777777BEEF1337
PAD = b"_777!\x00"  # asm: dword 0x3737375F + word 0x0021

C = 0x9E3779B97F4A7C15
K = 0x77777777BEEF1337
A = 0x2152411035014542
B = 0x42A482206A028A84
CC = 0x63F6C3309F03CFC6
D = 0x7AB6FBBF2BFAEAF8
E = 0x5964BAAEF6F9A5B6
F = 0x3812799EC1F86074
SUB = 0x61C8864680B583EB
M1 = 0xBF58476D1CE4E5B9
M2 = 0x94D049BB133111EB

TARGET = b"7-7-7 JACKPOT"


def u64(x: int) -> int:
    return x & ((1 << 64) - 1)


def ror1(b: int, n: int) -> int:
    n &= 7
    return ((b >> n) | (b << (8 - n))) & 0xFF


def rol1(b: int, n: int) -> int:
    n &= 7
    return ((b << n) | (b >> (8 - n))) & 0xFF


def rol64(x: int, n: int) -> int:
    n &= 63
    return ((x << n) | (x >> (64 - n))) & ((1 << 64) - 1)


def ror64(x: int, n: int) -> int:
    n &= 63
    return ((x >> n) | (x << (64 - n))) & ((1 << 64) - 1)


def fqword(x: int) -> int:
    out = 0
    for i in range(8):
        b = (x >> (8 * i)) & 0xFF
        out |= ((ror1(b ^ 0x77, 3) + 51) & 0xFF) << (8 * i)
    return out


def ifqword(x: int) -> int:
    out = 0
    for i in range(8):
        y = (x >> (8 * i)) & 0xFF
        out |= (rol1((y - 51) & 0xFF, 3) ^ 0x77) << (8 * i)
    return out


def mix_key(j: int, seed: int) -> tuple[int, int, int]:
    v35 = u64(MUL * (seed ^ XORC))
    v36 = 0
    while True:
        v35 = u64(MUL * ((ADD * v36 + 4919) ^ v35))
        v36 += 1
        if v36 > j:
            break
    v37 = (7 * j + 11) % 61 + 1
    v38 = TABLE[j % 7] ^ v35
    rot1 = v37 & 0x3F
    rot2 = ((3 * v37 + 5) % 61 + 1) & 0x3F
    return v38, rot1, rot2


def round_fwd(state: list[int], j: int, seed: int) -> list[int]:
    state = list(state)
    v38, rot1, rot2 = mix_key(j, seed)
    v39 = 0
    v41 = 0
    for _ in range(7):
        v39 += 1
        idx = v39 % 7
        v42 = v38 ^ u64(state[v41] + rol64(state[idx], rot1))
        state[v41] = v42
        state[idx] ^= ror64(v42, rot2)
        state[v41] = fqword(state[v41])
        v41 += 1
    return state


def round_inv(state: list[int], j: int, seed: int) -> list[int]:
    state = list(state)
    v38, rot1, rot2 = mix_key(j, seed)
    for step in range(6, -1, -1):
        v41 = step
        v39 = step + 1
        idx = v39 % 7
        v42 = ifqword(state[v41])
        s_idx = state[idx] ^ ror64(v42, rot2)
        s_v41 = u64((v42 ^ v38) - rol64(s_idx, rot1))
        state[v41] = s_v41
        state[idx] = s_idx
    return state


def forward(state: list[int], seed: int) -> list[int]:
    st = list(state)
    for j in range(77):
        st = round_fwd(st, j, seed)
    return st


def backward(state: list[int], seed: int) -> list[int]:
    st = list(state)
    for j in range(76, -1, -1):
        st = round_inv(st, j, seed)
    return st


def state_from_pass(pw: bytes) -> list[int]:
    if len(pw) != 50:
        raise ValueError("VIP pass must be exactly 50 bytes")
    return list(struct.unpack("<7Q", pw + PAD))


def pass_from_state(state: list[int]) -> bytes | None:
    raw = struct.pack("<7Q", *state)
    if raw[50:56] != PAD:
        return None
    return raw[:50]


def sm64(v: int) -> int:
    x = u64(v ^ (v >> 30))
    y = u64(M1 * x)
    z = u64(y ^ (y >> 27))
    w = u64(M2 * z)
    return u64(w ^ (w >> 31))


def hash_state(st: list[int]) -> int:
    v = u64(C * (st[0] ^ K))
    v = u64(C * (st[1] ^ v) - A)
    v = u64(C * (st[2] ^ v) - B)
    v = u64(C * (st[3] ^ v) - CC)
    v = u64(C * (st[4] ^ v) + D)
    v = u64(C * (st[5] ^ v) + E)
    return u64(C * (st[6] ^ v) + F)


def decrypt(ct: bytes, st: list[int]) -> bytes:
    v102 = hash_state(st)
    out = bytearray()
    for mm in range(len(ct)):
        v102 = u64(v102 - SUB)
        r = sm64(v102)
        out.append(
            ct[mm]
            ^ ((r >> 56) & 0xFF)
            ^ ((47 * mm + 23) & 0xFF)
            ^ ((st[(r >> 24) % 7] >> (8 * (mm & 7))) & 0xFF)
        )
    return bytes(out)


def load_ct(path: Path | None = None) -> bytes:
    if path is None:
        path = Path(__file__).resolve().parent.parent / "analysis" / "ciphertext.bin"
    return path.read_bytes()
