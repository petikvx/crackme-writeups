#!/usr/bin/env python3
"""Solveur — Jasper676767's Red light (UPX ELF64).

Pistes utiles :
  - Phrase piège : « Funny vultures Dance happily past ancient Doors over hills again »
    → clé XOR répétée = premières lettres = fvDhpaDoha
  - Blobs hex dans .rodata (ex. 021c5836… + suite reconstruite) XOR → Base64 → flag
  - Leurres : ages égales, 0x23, key:105, octets « ca db ec … »

Chemin runtime (optionnel) : deux ages *différentes*, puis
  3636373736373637 (== 0xceb433cd3bd85) pour passer curfew().

Usage :
  python3 red-light-solve.py -q
  python3 red-light-solve.py --acrostic
  python3 red-light-solve.py --check
"""

from __future__ import annotations

import argparse
import base64
import sys

SENTENCE = "Funny vultures Dance happily past ancient Doors over hills again"
# premières lettres ; 'Funny' compte comme 'f' (minuscule) → fvDhpaDoha
KEY = "".join(
    (w[0].lower() if w == "Funny" else w[0]) for w in SENTENCE.split()
).encode()


# Ciphertext binaire (44 o) : reconstruction des fragments hex du binaire
# (dont 021c58360710382e350232 au milieu) ; XOR(key) → b64 du flag.
ENC = bytes.fromhex(
    "341d3c2a22523025305124021c58360710382e3502320a3b28500e072536"
    "021a1c122609253b0c0d05187455"
)

MAGIC = 0xCEB433CD3BD85  # 3636373736373637


def xor_rep(data: bytes, key: bytes) -> bytes:
    return bytes(data[i] ^ key[i % len(key)] for i in range(len(data)))


def flag() -> str:
    b64 = xor_rep(ENC, KEY)
    return base64.b64decode(b64).decode("ascii")


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("-q", action="store_true", help="flag only")
    ap.add_argument("--acrostic", action="store_true", help="print XOR key")
    ap.add_argument("--magic", action="store_true", help="print curfew magic decimal")
    ap.add_argument("--check", action="store_true", help="verify decode")
    args = ap.parse_args()

    if args.acrostic:
        print(KEY.decode())
        return 0
    if args.magic:
        print(MAGIC)
        return 0

    fl = flag()
    if args.check:
        ok = fl.startswith("FLAG{") and fl.endswith("}")
        print(fl)
        print("OK" if ok else "FAIL")
        return 0 if ok else 1

    if args.q:
        print(fl)
    else:
        print(f"key={KEY.decode()}")
        print(f"curfew_magic={MAGIC}")
        print(f"flag={fl}")
        print("runtime: printf 'a\\nb\\n3636373736373637\\n' | ./analysis/redLights-unpacked")
    return 0


if __name__ == "__main__":
    sys.exit(main())
