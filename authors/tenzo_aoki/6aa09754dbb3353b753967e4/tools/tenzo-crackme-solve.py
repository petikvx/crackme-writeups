#!/usr/bin/env python3
"""tenzo_aoki — Tenzo Crack ME Beta (6aa09754dbb3353b753967e4).

License key under heavy CFF / state-machine obfuscation (author's early
obfuscator). The accepted key is a fixed 32-char leetspeak string.

  python3 tenzo-crackme-solve.py -q
  python3 tenzo-crackme-solve.py --check
"""
from __future__ import annotations

import argparse
import subprocess
import sys
from pathlib import Path

KEY = "T3nz0-VM-2026-V1rtu4l-Unl0ck3d!!"
HERE = Path(__file__).resolve().parent
BIN = HERE.parent / "original" / "Crackme_Tenzo.exe"


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("-q", "--quiet", action="store_true", help="print key only")
    ap.add_argument(
        "--check",
        action="store_true",
        help="feed key to Wine binary and expect Access Granted",
    )
    args = ap.parse_args()

    if args.quiet:
        print(KEY)
    else:
        print(f"license: {KEY}")
        print(f"len:     {len(KEY)}")

    if args.check:
        if not BIN.is_file():
            print(f"missing binary: {BIN}", file=sys.stderr)
            return 2
        import os

        env = os.environ.copy()
        env["WINEDEBUG"] = "-all"
        try:
            r = subprocess.run(
                ["wine", str(BIN)],
                input=(KEY + "\n").encode(),
                capture_output=True,
                timeout=15,
                env=env,
            )
        except FileNotFoundError:
            print("wine not found", file=sys.stderr)
            return 2
        except subprocess.TimeoutExpired:
            print("wine timeout", file=sys.stderr)
            return 1
        out = (r.stdout or b"") + (r.stderr or b"")
        text = out.decode("utf-8", errors="replace").replace("\r", "")
        # strip NULs if any
        text = text.replace("\x00", "")
        ok = "Access Granted" in text or "Correct Key" in text
        if not args.quiet:
            print("--- wine ---")
            print(text.strip())
            print("---", "OK" if ok else "FAIL", f"(exit {r.returncode}) ---")
        return 0 if ok else 1

    return 0


if __name__ == "__main__":
    sys.exit(main())
