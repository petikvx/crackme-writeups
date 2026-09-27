#!/usr/bin/env python3
"""Keygen for 5's Quintessence (crackmes.one 6ab04161cab6678aefe9de58).

The ELF runs a straight-line stack VM. The name is folded into register 1.
The 8 serial bytes are packed big-endian into register 2, then

    reg3 = ROL(bitperm(sbox_lanes(reg2 ^ 0xF0F1F2F3F4F5F6F7)), 17)

A serial is valid exactly when reg1 == reg3. The lane S-box and the
64-bit permutation are bijections, so the serial is unique per name.
"""

from __future__ import annotations

import argparse
import pathlib
import sys

MASK = (1 << 64) - 1
HERE = pathlib.Path(__file__).resolve().parent
BINARY = HERE.parent / "original" / "quintessence"
VA_BASE = 0x400000

# XOR applied to the packed serial before the lane S-box (VM tail).
SERIAL_XOR = 0xF0F1F2F3F4F5F6F7


def xorshift32(x: int) -> int:
    x &= 0xFFFFFFFF
    x ^= (x << 13) & 0xFFFFFFFF
    x ^= x >> 17
    x ^= (x << 5) & 0xFFFFFFFF
    return x


def fisher_yates(n: int, seed: int) -> list[int]:
    """Identity 0..n-1, then i = n-1..1 swap with xorshift() % (i+1)."""
    table = list(range(n))
    state = seed & 0xFFFFFFFF
    for i in range(n - 1, 0, -1):
        state = xorshift32(state)
        j = state % (i + 1)
        table[i], table[j] = table[j], table[i]
    return table


def load_prog(blob: bytes) -> bytes:
    mask = blob[0x497C10 - VA_BASE : 0x497C10 - VA_BASE + 16]
    raw = blob[0x4974C0 - VA_BASE : 0x4974C0 - VA_BASE + 0x746]
    return bytes(raw[i] ^ mask[i & 0xF] for i in range(len(raw)))


def rol(value: int, count: int) -> int:
    count &= 63
    if count == 0:
        return value & MASK
    value &= MASK
    return ((value << count) | (value >> (64 - count))) & MASK


def ror(value: int, count: int) -> int:
    return rol(value, -count & 63)


def sbox_lane(value: int, lane: int, sbox: list[int]) -> int:
    lane &= 7
    shift = 8 * lane
    byte = (value >> shift) & 0xFF
    new = sbox[(byte + 17 * lane) & 0xFF] ^ ((44 * lane) & 0xFF)
    return (value & ~(0xFF << shift)) | (new << shift)


def inv_sbox_lane(value: int, lane: int, inv: list[int]) -> int:
    lane &= 7
    shift = 8 * lane
    new = (value >> shift) & 0xFF
    old = (inv[new ^ ((44 * lane) & 0xFF)] - 17 * lane) & 0xFF
    return (value & ~(0xFF << shift)) | (old << shift)


def bitperm(value: int, perm: list[int]) -> int:
    out = 0
    for src in range(64):
        out |= ((value >> src) & 1) << perm[src]
    return out


def inv_bitperm(value: int, perm: list[int]) -> int:
    out = 0
    for src in range(64):
        out |= ((value >> perm[src]) & 1) << src
    return out


def fold_name(name: str, sbox: list[int], prog: bytes) -> int:
    """Run the VM until the single STORE 1. Register 1 does not depend on the serial."""
    data = name.encode("latin1")
    length = len(data)
    stack: list[int] = []
    reg = [0] * 8
    pc = 0

    def push(value: int) -> None:
        if len(stack) > 15:
            raise RuntimeError("vm stack overflow before STORE 1")
        stack.append(value & MASK)

    def pop() -> int:
        return stack.pop() if stack else 0

    while pc < len(prog):
        op = prog[pc]
        pc += 1
        if op == 0:
            break
        if op == 1:
            push(int.from_bytes(prog[pc : pc + 8], "little"))
            pc += 8
        elif op == 2:
            push(0)  # serial byte; unused before STORE 1
            pc += 1
        elif op == 3:
            index = prog[pc]
            pc += 1
            push(data[index % length])
        elif op == 4:
            push(length)
        elif op == 5:
            a, b = pop(), pop()
            push(a + b)
        elif op == 6:
            top, second = pop(), pop()
            push(second - top)
        elif op == 7:
            push(pop() * pop())
        elif op == 8:
            a, b = pop(), pop()
            push(a ^ b)
        elif op == 9:
            a, b = pop(), pop()
            push(a & b)
        elif op == 10:
            a, b = pop(), pop()
            push(a | b)
        elif op == 11:
            count = prog[pc]
            pc += 1
            push(rol(pop(), count))
        elif op == 12:
            count = prog[pc]
            pc += 1
            push(ror(pop(), count))
        elif op == 13:
            count = prog[pc]
            pc += 1
            push((pop() & MASK) >> (count & 63))
        elif op == 14:
            push(sbox[pop() & 0xFF])
        elif op == 15:
            lane = prog[pc]
            pc += 1
            push(sbox_lane(pop(), lane, sbox))
        elif op == 16:
            raise RuntimeError("bitperm before STORE 1")
        elif op == 17:
            pop()
        elif op == 18:
            value = pop()
            push(value)
            push(value)
        elif op == 19:
            a, b = pop(), pop()
            push(a)
            push(b)
        elif op == 20:
            pop()
        elif op == 21:
            slot = prog[pc] & 7
            pc += 1
            reg[slot] = pop()
            if slot == 1:
                return reg[1]
        elif op == 22:
            slot = prog[pc] & 7
            pc += 1
            push(reg[slot])
        else:
            raise RuntimeError(f"bad opcode {op:#x} at {pc - 1:#x}")
    raise RuntimeError("STORE 1 not reached")


def serial_bytes(reg1: int, sbox: list[int], perm: list[int]) -> bytes:
    inv = [0] * 256
    for i, value in enumerate(sbox):
        inv[value] = i
    mixed = ror(reg1, 17)
    mixed = inv_bitperm(mixed, perm)
    for lane in range(7, -1, -1):
        mixed = inv_sbox_lane(mixed, lane, inv)
    raw = (mixed ^ SERIAL_XOR) & MASK
    return raw.to_bytes(8, "big")


def format_serial(raw: bytes) -> str:
    hexdigits = raw.hex().upper()
    return "-".join(hexdigits[i : i + 4] for i in range(0, 16, 4))


def proof_token(reg1: int, length: int) -> str:
    """%016llX printed on success. Matches the imul/shr sequence at 0x402732."""
    value = (reg1 ^ ((length & MASK) << 32) ^ 0x5A5A5A5A5A5A5A5A) & MASK
    value = (value + 0x9E3779B97F4A7C15) & MASK
    value = ((value ^ (value >> 30)) * 0xBF58476D1CE4E5B9) & MASK
    value = ((value ^ (value >> 27)) * 0x94D049BB133111EB) & MASK
    value = (value ^ (value >> 31)) & MASK
    return f"{value:016X}"


def keygen(name: str, blob: bytes | None = None) -> tuple[str, str]:
    if not 3 <= len(name) <= 31:
        raise ValueError("name length must be 3..31")
    if any(ord(ch) < 32 or ord(ch) > 126 for ch in name):
        raise ValueError("name must be printable ASCII")
    if blob is None:
        blob = BINARY.read_bytes()
    sbox = fisher_yates(256, 1052827226)
    perm = fisher_yates(64, (-1515864337) & 0xFFFFFFFF)
    reg1 = fold_name(name, sbox, load_prog(blob))
    serial = format_serial(serial_bytes(reg1, sbox, perm))
    return serial, proof_token(reg1, len(name))


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--name", default="petik", help="login (default: petik)")
    parser.add_argument("-q", action="store_true", help="print only the serial")
    parser.add_argument("--check", action="store_true", help="re-fold and compare reg1/reg3")
    args = parser.parse_args()
    try:
        serial, token = keygen(args.name)
    except ValueError as exc:
        print(exc, file=sys.stderr)
        return 2
    if args.q:
        print(serial)
    else:
        print(f"name:  {args.name}")
        print(f"serial: {serial}")
        print(f"token: {token}")
    if args.check:
        blob = BINARY.read_bytes()
        sbox = fisher_yates(256, 1052827226)
        perm = fisher_yates(64, (-1515864337) & 0xFFFFFFFF)
        reg1 = fold_name(args.name, sbox, load_prog(blob))
        raw = bytes.fromhex(serial.replace("-", ""))
        packed = int.from_bytes(raw, "big")
        mixed = packed ^ SERIAL_XOR
        for lane in range(8):
            mixed = sbox_lane(mixed, lane, sbox)
        reg3 = rol(bitperm(mixed, perm), 17)
        if reg1 != reg3:
            print(f"check failed reg1={reg1:#x} reg3={reg3:#x}", file=sys.stderr)
            return 1
        if not args.q:
            print("check: reg1 == reg3")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
