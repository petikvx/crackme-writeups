#!/usr/bin/env python3
"""ttlhacker jittery — keygen for the JIT / self-modifying password check.

Bytecode table: 1024×u64 in .data @ VA 0x205020 (file off 0x5020).
For each of 50 body chars, four signed 32-bit high-halves are walked with the
LFSR-like step used as the VM program counter; the matching ALU op among
{+, -, *, neg, &, |, ^} yields op_index ∈ [3,9] and char = op_index + d1.
"""
from __future__ import annotations

import argparse
import struct
import subprocess
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
BIN = ROOT / "original" / "jittery"
DATA_BUF = ROOT / "analysis" / "data_buffer"
FLAG = "FLAG{wh4t_1s_a_pr0gr4m_c0unt3r?_jit_eng1n3s_ar3_4wes0m3}"
START_INDEX = 0x3F3


def step_register(index: int) -> int:
    mask = 0b1001000000
    res = (index << 1) & 0x3FF
    if index & mask in (0, mask):
        return res
    return res + 1


def load_data_buffer() -> bytes:
    if DATA_BUF.is_file():
        return DATA_BUF.read_bytes()
    # extract from ELF: VA 0x205020 → file offset 0x5020
    elf = (ROOT / "original" / "jittery").read_bytes()
    buf = elf[0x5020 : 0x5020 + 0x400 * 8]
    DATA_BUF.parent.mkdir(parents=True, exist_ok=True)
    DATA_BUF.write_bytes(buf)
    return buf


def data_block(data: bytes, index: int) -> int:
    return struct.unpack_from("<i", data, 8 * index + 4)[0]


def recover_flag(data: bytes | None = None) -> str:
    data = data if data is not None else load_data_buffer()
    index = START_INDEX
    body = []
    for _ in range(50):
        cd = []
        for _j in range(4):
            cd.append(data_block(data, index))
            index = step_register(index)
        d1, d2, d3, d4 = cd
        if d2 + d3 == d4:
            op = 3
        elif d2 - d3 == d4:
            op = 4
        elif d2 * d3 == d4:
            op = 5
        elif d2 == -d4:
            op = 6
        elif (d2 & d3) == d4:
            op = 7
        elif (d2 | d3) == d4:
            op = 8
        else:
            op = 9  # XOR
        body.append(chr(op + d1))
    return "FLAG{" + "".join(body) + "}"


def live_check(pw: str) -> bytes:
    return subprocess.run(
        [str(BIN)],
        input=(pw + "\n").encode(),
        capture_output=True,
        timeout=5,
    ).stdout


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("-q", action="store_true", help="password only")
    ap.add_argument("--check", action="store_true", help="run binary live")
    args = ap.parse_args()

    pw = recover_flag()
    if pw != FLAG:
        print(f"keygen mismatch: got {pw!r}", file=sys.stderr)
        return 1

    if args.check:
        out = live_check(pw)
        text = out.decode(errors="replace")
        ok = b"Correct! Well done!" in out
        if not args.q:
            print(text.rstrip("\0\n"))
        print("OK" if ok else "FAIL")
        return 0 if ok else 1

    print(pw if args.q else f"{pw}  # len={len(pw)}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
