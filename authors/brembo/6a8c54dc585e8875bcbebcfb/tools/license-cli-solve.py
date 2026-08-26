#!/usr/bin/env python3
"""Solveur partiel — brembo license-cli (PARKED)

Préimage SHA-256 inconnue. Une fois la clé trouvée :

  python3 license-cli-solve.py --key 'THE_KEY'
  python3 license-cli-solve.py --check-key 'THE_KEY'

Constante :
  hex(SHA256(key)) == 112c2addd0d1ce1638bf9fb4b9377af3577066ee19e2f508b3fdffd5655a0465

Payload : 29 octets XOR key[i % len(key)].
"""
from __future__ import annotations

import argparse
import hashlib
import sys

EXPECTED = "112c2addd0d1ce1638bf9fb4b9377af3577066ee19e2f508b3fdffd5655a0465"
CT = bytes.fromhex(
    "2f263520213749223c282933242a455b452521252621242247232f263d"
)


def valid_key(key: bytes) -> bool:
    return hashlib.sha256(key).hexdigest() == EXPECTED


def decrypt(key: bytes) -> bytes:
    return bytes(CT[i] ^ key[i % len(key)] for i in range(len(CT)))


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("--key", help="license key (utf-8)")
    ap.add_argument("--check-key", help="vérifie sha256 seulement")
    ap.add_argument("-q", action="store_true", help="payload seul si --key ok")
    args = ap.parse_args()

    if args.check_key is not None:
        k = args.check_key.encode()
        ok = valid_key(k)
        print(EXPECTED if ok else hashlib.sha256(k).hexdigest())
        print("OK" if ok else "FAIL")
        return 0 if ok else 1

    if args.key is not None:
        k = args.key.encode()
        if not valid_key(k):
            print("clé invalide (sha256 mismatch)", file=sys.stderr)
            return 1
        pt = decrypt(k)
        if args.q:
            sys.stdout.buffer.write(pt + b"\n")
        else:
            print(f"key     : {args.key}")
            print(f"payload : {pt!r}")
            try:
                print(f"ascii   : {pt.decode('utf-8')}")
            except UnicodeDecodeError:
                pass
        return 0

    print("=== brembo license-cli (PARKED) ===")
    print(f"expected sha256 hex : {EXPECTED}")
    print(f"ciphertext ({len(CT)} B)  : {CT.hex()}")
    print("usage : python3 tools/license-cli-solve.py --key '…'")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
