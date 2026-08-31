#!/usr/bin/env python3
"""gregland CrackMe 3 — password from VDS @_J(cerqsqQSD,1456).

After UPX + SCRIPT decompress/nibble-decrypt:
  :okbutton
  _G @_L(@_I(EDIT1), @_J(cerqsqQSD,1456), EXACT)

@_J (protect token) transforms the cipher with key 1456 into 9 bytes.
Live (Wine): those bytes → Password Ok. Button caption OK (name=ok).

Anti-debug: TIMER calls IsDebuggerPresent / IDA·SoftICE window checks
and may overwrite the edit with « debugger found ;-( ».
"""
from __future__ import annotations

import argparse
import sys

# Result of @_J(cerqsqQSD,1456) — verified Wine Password Ok
PASSWORD = bytes((0xBB, 0xE6, 0xE2, 0xBE, 0x99, 0x91, 0xA1, 0x9B, 0xD2))
BUTTON = "OK"


def main(argv: list[str] | None = None) -> int:
    p = argparse.ArgumentParser(description="gregland CrackMe 3 solver")
    p.add_argument("-q", action="store_true", help="password hex only")
    p.add_argument("--check", metavar="HEX", help="verify hex password (e.g. bbe6e2...)")
    p.add_argument("--raw", action="store_true", help="write raw bytes to stdout")
    args = p.parse_args(argv)

    if args.check is not None:
        hx = args.check.replace(" ", "").replace("-", "")
        try:
            got = bytes.fromhex(hx)
        except ValueError:
            print("invalid hex", file=sys.stderr)
            return 2
        ok = got == PASSWORD
        print("OK" if ok else "NOK")
        return 0 if ok else 1

    if args.raw:
        sys.stdout.buffer.write(PASSWORD)
        return 0

    if args.q:
        print(PASSWORD.hex())
    else:
        print(f"password : {PASSWORD.hex()}  ({PASSWORD!r})")
        print(f"cp1251   : {PASSWORD.decode('cp1251', errors='replace')}")
        print(f"button   : {BUTTON}")
        print("note     : enter the raw 9 bytes (high-bit ANSI), not ASCII «cerqsqQSD»")
    return 0


if __name__ == "__main__":
    sys.exit(main())
