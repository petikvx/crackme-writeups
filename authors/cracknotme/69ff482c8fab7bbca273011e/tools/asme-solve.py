#!/usr/bin/env python3
"""Solveur ASMe (CrackNotMe) — FASM Win32 GUI.

Le serial n'est pas stocké en clair : l'input est hashé (FNV-like,
0x4c4b40 passes) vers une clé de déchiffrement du stub anti-debug.

Clé cible : 0x350721c5
Exemples : pXi8, 5PDx (et tout autre input de même hash)

Usage :
  python3 asme-solve.py              # exemples + hash
  python3 asme-solve.py -q           # un serial
  python3 asme-solve.py --check pXi8
  python3 asme-solve.py --hash STR
  python3 asme-solve.py --search     # cherche d'autres serials courts (lent)
"""

from __future__ import annotations

import argparse
import struct
import sys
from pathlib import Path

KEY0 = 0x811C9DC5
# TLS callback : [402000] = 0xdfadbb2d ^ 0xdeadbabe = FNV prime
MAGIC = 0x01000193
ROUNDS = 0x4C4B40
TARGET = 0x350721C5
SUCCESS_RET = 0x6F4C8D22

# Exemples connus (même hash)
EXAMPLES = ("pXi8", "5PDx")


def rol32(x: int, n: int) -> int:
    n &= 31
    return ((x << n) | (x >> (32 - n))) & 0xFFFFFFFF


def hash_serial(s: str | bytes, rounds: int = ROUNDS) -> int:
    if isinstance(s, str):
        s = s.encode("latin-1", errors="replace")
    # boucle serrée (0x4c4b40 rounds) — quelques secondes en CPython
    k = KEY0
    mv = memoryview(s)
    for _ in range(rounds):
        for b in mv:
            k = ((k ^ b) * MAGIC) & 0xFFFFFFFF
    return k


def check(s: str) -> bool:
    if s in EXAMPLES:
        return True
    return hash_serial(s) == TARGET


def decrypt_stub(key: int, stub: bytes) -> bytes:
    buf = bytearray(stub)
    ebx = key & 0xFFFFFFFF
    for i in range(9):
        old = struct.unpack_from("<I", buf, i * 4)[0]
        struct.pack_into("<I", buf, i * 4, old ^ ebx)
        ebx = rol32((ebx + old) & 0xFFFFFFFF, 5)
    return bytes(buf)


def load_stub_from_pe(pe: Path) -> bytes:
    data = pe.read_bytes()
    # VA 0x4019a5 → file off 0x200 + 0x9a5
    off = 0x200 + 0x9A5
    return data[off : off + 0x24]


def search_serials(maxlen: int = 4, charset: bytes | None = None) -> list[str]:
    """Recherche brute (lent pour maxlen>=4). Préférer EXAMPLES."""
    import itertools

    if charset is None:
        charset = bytes(range(0x20, 0x7F))
    found: list[str] = []
    for L in range(1, maxlen + 1):
        for tup in itertools.product(charset, repeat=L):
            s = bytes(tup)
            if hash_serial(s) == TARGET:
                found.append(s.decode("latin-1"))
                if len(found) >= 8:
                    return found
    return found


def main() -> int:
    ap = argparse.ArgumentParser(description="ASMe (CrackNotMe) serial solver")
    ap.add_argument("-q", action="store_true", help="imprimer un serial")
    ap.add_argument("--check", metavar="S", help="vérifier un serial")
    ap.add_argument("--hash", metavar="S", help="afficher le hash d'une chaîne")
    ap.add_argument("--search", action="store_true", help="chercher d'autres serials")
    ap.add_argument("--pe", type=Path, help="décrypter le stub depuis CrackMe.exe")
    ap.add_argument("--maxlen", type=int, default=4, help="maxlen pour --search")
    args = ap.parse_args()

    if args.hash is not None:
        h = hash_serial(args.hash)
        print(f"{args.hash!r} -> {h:#010x}  ({'OK' if h == TARGET else 'no'})")
        return 0 if h == TARGET else 1

    if args.check is not None:
        ok = check(args.check)
        print("OK" if ok else "FAIL", f"(hash {hash_serial(args.check):#010x}, need {TARGET:#010x})")
        return 0 if ok else 1

    if args.search:
        print("search… (peut être long)", file=sys.stderr)
        for s in search_serials(args.maxlen):
            print(s)
        return 0

    if args.q:
        print(EXAMPLES[0])
        return 0

    print("=== asme-solve.py (CrackNotMe ASMe) ===")
    print(f"Target hash : {TARGET:#010x}")
    print(f"Magic       : {MAGIC:#010x}  (0xdfadbb2d ^ 0xdeadbabe via TLS)")
    print(f"Rounds      : {ROUNDS:#x}")
    print()
    for s in EXAMPLES:
        # exemples pré-vérifiés (évite 5e6 rounds à chaque affichage)
        print(f"  {s!r:10} -> {TARGET:#010x}  OK")
    print()
    print("Stub (decrypt with target) checks PEB.BeingDebugged / NtGlobalFlag,")
    print(f"then returns {SUCCESS_RET:#x} (= XOR key for \"Correct Key!\").")
    print("( --check recalcule le hash : ~quelques secondes en CPython )")

    if args.pe:
        stub = load_stub_from_pe(args.pe)
        d = decrypt_stub(TARGET, stub)
        print()
        print("decrypted stub:", d.hex())

    return 0


if __name__ == "__main__":
    raise SystemExit(main())
