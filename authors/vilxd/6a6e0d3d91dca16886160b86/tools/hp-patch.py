#!/usr/bin/env python3
"""Patcher — vilxd's CRACK ME DLL (Loader.exe + MyDLL.dll).

Objectif : changer la variable hp (affichée « Your hp is:N ») pour N > 100.
Le DllMain écrit 0x64 (100) via plusieurs `mov dword …, 0x64`.
On remplace ces immédiats par --hp (défaut 101).

Usage :
  python3 hp-patch.py
  python3 hp-patch.py --hp 150 --check
"""

from __future__ import annotations

import argparse
import shutil
import subprocess
import sys
import tempfile
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
SRC_DLL = ROOT / "analysis" / "extracted" / "MyDLL.dll"
SRC_LOADER = ROOT / "analysis" / "extracted" / "Loader.exe"
OUT_DLL = ROOT / "analysis" / "MyDLL-patched.dll"


def patch(hp: int) -> Path:
    if not 1 <= hp <= 255:
        raise SystemExit("--hp must be 1..255")
    data = bytearray(SRC_DLL.read_bytes())
    n = 0
    i = 0
    while True:
        j = data.find(bytes.fromhex("c70264000000"), i)
        if j < 0:
            break
        data[j + 2] = hp
        n += 1
        i = j + 1
    i = 0
    while True:
        j = data.find(bytes.fromhex("c705"), i)
        if j < 0 or j + 10 > len(data):
            break
        if data[j + 6 : j + 10] == bytes.fromhex("64000000"):
            data[j + 6] = hp
            n += 1
        i = j + 1
    if n == 0:
        raise SystemExit("no 0x64 stores found")
    OUT_DLL.write_bytes(data)
    return OUT_DLL


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("--hp", type=int, default=101)
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true")
    args = ap.parse_args()

    out = patch(args.hp)
    if args.q:
        print(out)
        return 0
    print(f"patched={out} hp={args.hp}")

    if args.check:
        import os

        with tempfile.TemporaryDirectory() as td:
            t = Path(td)
            shutil.copy(SRC_LOADER, t / "Loader.exe")
            shutil.copy(out, t / "MyDLL.dll")
            env = {**os.environ, "WINEDEBUG": "-all"}
            r = subprocess.run(
                ["wine", str(t / "Loader.exe")],
                capture_output=True,
                text=True,
                timeout=15,
                env=env,
            )
            out_s = r.stdout.replace("\r", "")
            print(out_s)
            ok = f"Your hp is:{args.hp}" in out_s
            print("OK" if ok else "FAIL")
            return 0 if ok else 1
    return 0


if __name__ == "__main__":
    sys.exit(main())
