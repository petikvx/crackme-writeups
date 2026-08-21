#!/usr/bin/env python3
"""Solveur — CrackNotMe's Monster CrackMe 1.0 (MCM).

Password → clé (produits matrice LCG × password) → XOR mask parent⊕child
→ bytecode VM. Succès si la 1ʳᵉ instruction est :

  op=0xF0  imm64=1   puis op=0xFF (halt)

Mask effectif (run « clean » avec injection parent) :
  0xb3e192f8a4d5c6b7 XOR 0x9f2d38b17c6a4e5f

Password canon (plus court printable) : y5

Usage :
  python3 mcm-solve.py              # détail + check
  python3 mcm-solve.py -q           # password
  python3 mcm-solve.py --check y5
  python3 mcm-solve.py --decode y5  # dump bytecode décodé
  python3 mcm-solve.py --brute 2    # brute longueur N (printable)
"""

from __future__ import annotations

import argparse
import itertools
import string
import sys
from pathlib import Path

BLOB = bytes.fromhex(
    "48d9ed8a1dff9a7bb0d1e57c15f7927388e9ddbb2dcfaa4b80e1d5b325c7a243"
)
CHILD_CONST = 0xB3E192F8A4D5C6B7
PARENT_FORCE = 0x9F2D38B17C6A4E5F
MASK = (CHILD_CONST ^ PARENT_FORCE).to_bytes(8, "little")

PASSWORD_CANON = "y5"

# Table .data @ VA 0x140034000 (file off 0x32800) — octets source_byte = DATA[n*4]
_PE = Path(__file__).resolve().parents[1] / "original" / "CrackMe.exe"


def load_data_table(pe: Path | None = None) -> bytes:
    pe = pe or _PE
    data = pe.read_bytes()
    return data[0x32800 : 0x32800 + 256]


def build_high() -> list[int]:
    """Matrice 4096 × uint10, LCG seed 0xDEADBEEF."""
    high = [0] * 4096
    u = 0xDEADBEEF
    idx = 0
    for _ in range(0x40):
        for _ in range(4):
            for _ in range(16):
                u = (u * 0x19660D + 0x3C6EF35F) & 0xFFFFFFFF
                high[idx] = u & 0x3FF
                idx += 1
    return high


_HIGH: list[int] | None = None


def high() -> list[int]:
    global _HIGH
    if _HIGH is None:
        _HIGH = build_high()
    return _HIGH


def gen_key(password: bytes, data_table: bytes | None = None) -> list[int]:
    if data_table is None:
        data_table = load_data_table()
    low = [0] * 64
    for i, b in enumerate(password[:64]):
        low[i] = b
    H = high()
    key: list[int] = []
    for n in range(64):
        edx = 0
        for j in range(4):
            start1 = (n * 4 + j) * 16
            start2 = j * 16
            dot = 0
            for k in range(16):
                dot = (dot + (H[start1 + k] * low[start2 + k])) & 0xFFFFFFFF
            edx = (edx + dot) & 0x3FF
        key.append((data_table[n * 4] - (edx & 0xFF)) & 0xFF)
    return key


def decode_blob(key: list[int], blob: bytes = BLOB) -> bytes:
    return bytes(blob[i] ^ MASK[i & 7] ^ key[i] for i in range(len(blob)))


def parse_first_instrs(decoded: bytes, n: int = 2) -> list[tuple[int, int, int, int]]:
    out = []
    ptr = 0
    while ptr + 11 <= len(decoded) and len(out) < n:
        op = decoded[ptr]
        r1 = decoded[ptr + 1]
        r2 = decoded[ptr + 2]
        imm = int.from_bytes(decoded[ptr + 3 : ptr + 11], "little")
        out.append((op, r1, r2, imm))
        ptr += 11
    return out


def is_success(decoded: bytes) -> bool:
    """VM success : F0 imm=1 puis FF."""
    if len(decoded) < 22:
        return False
    if decoded[0] != 0xF0:
        return False
    if int.from_bytes(decoded[3:11], "little") != 1:
        return False
    if decoded[11] != 0xFF:
        return False
    return True


def check(password: str, pe: Path | None = None) -> bool:
    data = load_data_table(pe)
    key = gen_key(password.encode("latin-1"), data)
    return is_success(decode_blob(key))


def brute(maxlen: int, charset: str | None = None) -> list[str]:
    if charset is None:
        charset = string.ascii_letters + string.digits
    data = load_data_table()
    found: list[str] = []
    for L in range(1, maxlen + 1):
        for tup in itertools.product(charset, repeat=L):
            pw = "".join(tup)
            key = gen_key(pw.encode("ascii"), data)
            if is_success(decode_blob(key)):
                found.append(pw)
                return found  # plus court d'abord
    return found


def main() -> int:
    ap = argparse.ArgumentParser(description="Monster CrackMe 1.0 (MCM) solver")
    ap.add_argument("-q", action="store_true", help="imprimer le password")
    ap.add_argument("--check", metavar="P", help="vérifier un password")
    ap.add_argument("--decode", metavar="P", help="afficher bytecode décodé")
    ap.add_argument("--brute", type=int, metavar="N", help="brute longueur ≤ N")
    ap.add_argument("--pe", type=Path, help="chemin CrackMe.exe")
    args = ap.parse_args()

    if args.check is not None:
        ok = check(args.check, args.pe)
        print("OK" if ok else "FAIL")
        return 0 if ok else 1

    if args.decode is not None:
        data = load_data_table(args.pe)
        key = gen_key(args.decode.encode("latin-1"), data)
        dec = decode_blob(key)
        print("mask   :", MASK.hex())
        print("key    :", bytes(key[:32]).hex(), "...")
        print("decoded:", dec.hex())
        for i, (op, r1, r2, imm) in enumerate(parse_first_instrs(dec)):
            print(f"ins[{i}] op=0x{op:02x} r1=0x{r1:02x} r2=0x{r2:02x} imm=0x{imm:x}")
        print("success:", is_success(dec))
        return 0

    if args.brute is not None:
        hits = brute(args.brute)
        if not hits:
            print("no solution")
            return 1
        for h in hits:
            print(h)
        return 0

    assert check(PASSWORD_CANON, args.pe)

    if args.q:
        print(PASSWORD_CANON)
        return 0

    print("=== Monster CrackMe 1.0 solver ===")
    print(f"password : {PASSWORD_CANON}")
    print(f"mask     : {MASK.hex()}  (child⊕parent)")
    data = load_data_table(args.pe)
    dec = decode_blob(gen_key(PASSWORD_CANON.encode(), data))
    for i, (op, r1, r2, imm) in enumerate(parse_first_instrs(dec)):
        print(f"ins[{i}]   : op=0x{op:02x} imm=0x{imm:x}")
    print("check    : OK  (VM F0/1 + FF)")
    print("note     : sous Wine le debug parent/enfant peut planter ; OK sur Windows natif")
    return 0


if __name__ == "__main__":
    sys.exit(main())
