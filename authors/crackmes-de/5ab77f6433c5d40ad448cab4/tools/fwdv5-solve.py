#!/usr/bin/env python3
"""fishing_with_dila_v0.5 — numeric dialog code.

gadget add ah,0x20; neg; xor ax,0xDEAD; rol 16; cmp 0x3ADAFFCF.
"""
from __future__ import annotations

import argparse
import subprocess
import sys
import time
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
EXE = next((ROOT / "original" / "_u").glob("v*.exe"))
CODE = 3210123


def wine_check(code: int) -> bool:
    """Launch GUI under Wine, PostMessage BM_CLICK, read MessageBox."""
    helper = Path(__file__).resolve().parent / "dila_gui_check.exe"
    if not helper.is_file():
        print("missing tools/dila_gui_check.exe", file=sys.stderr)
        return False
    subprocess.run(["killall", "-9", "wine", "wine64"], capture_output=True)
    time.sleep(0.3)
    p = subprocess.Popen(
        ["wine", str(EXE)],
        env={**dict(**__import__("os").environ), "WINEDEBUG": "-all"},
        stdout=subprocess.DEVNULL,
        stderr=subprocess.DEVNULL,
    )
    try:
        time.sleep(1.4)
        r = subprocess.run(
            ["wine", str(helper), "DiLA", str(code)],
            capture_output=True,
            env={**dict(**__import__("os").environ), "WINEDEBUG": "-all"},
            timeout=20,
        )
        out = r.stdout.decode("latin1", "replace")
        print(out.strip())
        return "Success" in out
    finally:
        subprocess.run(["killall", "-9", "wine", "wine64"], capture_output=True)
        try:
            p.wait(timeout=2)
        except Exception:
            p.kill()


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true", help="Wine GUI smoke-test")
    args = ap.parse_args()
    if args.check:
        ok = wine_check(CODE)
        print("check:", "OK" if ok else "FAIL")
        return 0 if ok else 1
    print(CODE if args.q else f"code = {CODE} (0x{CODE:X})")
    return 0


if __name__ == "__main__":
    sys.exit(main())
