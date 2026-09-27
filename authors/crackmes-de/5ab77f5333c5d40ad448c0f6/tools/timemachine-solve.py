#!/usr/bin/env python3
"""Password for crackmes.de timemachine (qnix), id 5ab77f5333c5d40ad448c0f6.

Fixed 12-byte password. The ELF is a gzip (`original/qvm32.gz`). `--check`
decompresses it and checks that the process prints WIN.
"""

from __future__ import annotations

import argparse
import gzip
import subprocess
import sys
import tempfile
from pathlib import Path

HERE = Path(__file__).resolve().parent
GZ = HERE.parent / "original" / "qvm32.gz"
PASSWORD = b"iWasteMyTime"


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("-q", action="store_true", help="print only the password")
    parser.add_argument("--check", action="store_true", help="run the ELF and require WIN")
    args = parser.parse_args()
    text = PASSWORD.decode()
    if args.q:
        print(text)
    else:
        print(f"password: {text}")
    if not args.check:
        return 0
    blob = gzip.decompress(GZ.read_bytes())
    with tempfile.TemporaryDirectory() as tmp:
        path = Path(tmp) / "qvm32"
        path.write_bytes(blob)
        path.chmod(0o755)
        proc = subprocess.run([str(path)], input=PASSWORD, capture_output=True)
    out = proc.stdout
    if b"WIN" not in out or b"FAILED" in out:
        print(out, file=sys.stderr)
        return 1
    if not args.q:
        print(f"check: WIN (exit {proc.returncode})")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
