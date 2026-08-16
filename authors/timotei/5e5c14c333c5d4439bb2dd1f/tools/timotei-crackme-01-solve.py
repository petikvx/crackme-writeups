#!/usr/bin/env python3
"""Solveur timotei-crackme-01 — PIN checksum + FNV-1 32 bits."""

from __future__ import annotations

import string
import subprocess
import time
from pathlib import Path

BINARY = Path(__file__).resolve().parent / "timotei-crackme-01"

# --- check 1 : PIN ----------------------------------------------------------
# acc = 0x539
# for b in buffer[1:strlen]: acc += b          # le '\n' compte
# (acc * 2) % 17 + 0x30  ==  buffer[0]


def pin_ok(pin: str) -> bool:
    buf = (pin + "\n").encode("ascii", errors="strict")
    if len(buf) <= 3:
        return False
    acc = 0x539
    for b in buf[1:]:
        acc = (acc + b) & 0xFFFFFFFF
    reste = (acc * 2) % 17
    return buf[0] == reste + 0x30


def pin_trace(pin: str) -> None:
    buf = (pin + "\n").encode("ascii")
    print(f"\n===== PIN {pin!r}  buffer={buf!r}  strlen={len(buf)} =====")
    if len(buf) <= 3:
        print("FAIL: trop court")
        return
    acc = 0x539
    print(f"edx seed = {acc} (0x{acc:x})")
    for i, b in enumerate(buf[1:], start=1):
        acc += b
        ch = chr(b) if 32 <= b < 127 else repr(chr(b))
        print(f"  + buf[{i}] = {b:3d} {ch!r:6}  -> edx={acc}")
    doubled = acc * 2
    reste = doubled % 17
    attendu = reste + 0x30
    print(f"edx*2 = {doubled}")
    print(f"{doubled} % 17 = {reste}")
    print(f"attendu 1er char = {reste} + 0x30 = {attendu} {chr(attendu)!r}")
    print(f"1er char réel     = {buf[0]} {chr(buf[0])!r}")
    print("OK" if buf[0] == attendu else "FAIL")


# --- check 2 : FNV-1 32 bits sur 4 octets -----------------------------------
OFFSET = 0x811C9DC5
PRIME = 0x01000193
TARGET = 0x86CFDCF8


def fnv1_32(data: bytes) -> int:
    h = OFFSET
    for b in data:
        h = (h * PRIME) & 0xFFFFFFFF
        h ^= b
    return h


def fnv1_trace(data: bytes) -> None:
    print(f"\n===== FNV-1 {data!r} =====")
    print(f"offset = 0x{OFFSET:08x} ({OFFSET})")
    print(f"prime  = 0x{PRIME:08x} ({PRIME})")
    print(f"target = 0x{TARGET:08x}")
    h = OFFSET
    for i, b in enumerate(data):
        prod = (h * PRIME) & 0xFFFFFFFF
        h2 = prod ^ b
        print(f"byte[{i}] {b:#04x} {chr(b)!r}")
        print(f"  mul  0x{h:08x} * 0x{PRIME:08x} = 0x{prod:08x}")
        print(f"  xor  0x{prod:08x} ^ 0x{b:02x}     = 0x{h2:08x}")
        h = h2
    print("match" if h == TARGET else "NO MATCH", hex(h))


def brute_fnv_printable() -> list[bytes]:
    """Inverse le dernier XOR : 96^3 tests au lieu de 96^4."""
    alphabet = (string.ascii_letters + string.digits + string.punctuation + " \n").encode(
        "ascii"
    )
    found: list[bytes] = []
    for a in alphabet:
        ha = ((OFFSET * PRIME) & 0xFFFFFFFF) ^ a
        for b in alphabet:
            hb = ((ha * PRIME) & 0xFFFFFFFF) ^ b
            for c in alphabet:
                hc = ((hb * PRIME) & 0xFFFFFFFF) ^ c
                d = ((hc * PRIME) & 0xFFFFFFFF) ^ TARGET
                if d < 256 and d in alphabet:
                    found.append(bytes([a, b, c, d]))
    return found


def run_binary(pin: str, answer: str) -> None:
    """Deux writes séparés : sinon read(10) avale les deux lignes."""
    if not BINARY.is_file():
        print(f"(binaire introuvable: {BINARY})")
        return
    p = subprocess.Popen(
        [str(BINARY)],
        stdin=subprocess.PIPE,
        stdout=subprocess.PIPE,
        stderr=subprocess.STDOUT,
    )
    assert p.stdin is not None and p.stdout is not None
    p.stdin.write((pin + "\n").encode())
    p.stdin.flush()
    time.sleep(0.05)
    p.stdin.write((answer + "\n").encode())
    p.stdin.flush()
    p.stdin.close()
    out = p.stdout.read()
    print(f"\n=== live pin={pin!r} ans={answer!r} exit={p.wait()} ===")
    print(out)


def main() -> None:
    print("=== PIN 3 chiffres ===")
    pins3 = [f"{n}" for n in range(100, 1000) if pin_ok(f"{n}")]
    print(pins3)
    print("777?" , "777" in pins3)

    print("\n=== PIN 4 chiffres ===")
    pins4 = [f"{n}" for n in range(1000, 10000) if pin_ok(f"{n}")]
    print(len(pins4), "hits, first 40:", pins4[:40])
    print("1509?", "1509" in pins4)
    print("1337?", "1337" in pins4)

    for p in ("777", "1509", "1059", "1337"):
        pin_trace(p)

    print("\n=== FNV-1 candidats ===")
    for c in (b"+HCU", b"HCU+", b"+ORC", b"seek", b"lore", b"HCU\n"):
        print(f"{c!r:16} {fnv1_32(c):08x}  {fnv1_32(c) == TARGET}")

    fnv1_trace(b"+HCU")

    print("\n=== brute imprimable (dernier octet inversé) ===")
    hits = brute_fnv_printable()
    print("hits:", hits)

    run_binary("777", "+HCU")
    run_binary("1509", "+HCU")


if __name__ == "__main__":
    main()
