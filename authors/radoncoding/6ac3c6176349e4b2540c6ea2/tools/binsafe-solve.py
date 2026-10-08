#!/usr/bin/env python3
"""Solveur — RadonCoding's binsafe (crack-me.protected.exe)

Serial = argument de create() dans examples/cpp/crack-me/main.cpp
(obfuscateur open-source https://github.com/RadonCoding/binsafe) :

    constexpr auto constraints = create("0xP4553D17501P455");

32 templates validate<0>…<31> (Add+Xor sur chaque paire adjacente).
Le tableau n'est pas en clair dans le PE (VM binsafe).

Usage:
  python3 tools/binsafe-solve.py -q
  python3 tools/binsafe-solve.py --check
"""
from __future__ import annotations

import argparse
import os
import shutil
import subprocess
import sys
import tempfile
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
BIN = ROOT / "original" / "crack-me.protected.exe"
SERIAL = "0xP4553D17501P455"
FLAG = f"CMO{{{SERIAL}}}"
WIN = "Access granted."
LOSE = "Access denied."
USAGE = "Usage: crack-me <serial>"

# preuves dans le PE (noms Itanium encore présents)
MANGLED_V0 = b"_Z8validateILy0ETnRDaL_ZL11constraintsEEbPKc"
MANGLED_V31 = b"_Z8validateILy31ETnRDaL_ZL11constraintsEEbPKc"


def check_serial(s: str) -> bool:
    """Miroir de validate() + validate<i> (Add/Xor adjacents)."""
    key = SERIAL.encode("ascii")
    b = s.encode("latin1", "replace")
    if len(b) != len(key) or b'\0' in b:
        return False
    for i in range(len(key) - 1):
        a, c = b[i], b[i + 1]
        ea, eb = key[i], key[i + 1]
        if ((a + c) & 0xFF) != ((ea + eb) & 0xFF):
            return False
        if (a ^ c) != (ea ^ eb):
            return False
    return True


def _mingw_bindir() -> Path | None:
    roots = [
        Path("/usr/lib/gcc/x86_64-w64-mingw32/13-win32"),
        Path("/usr/lib/gcc/x86_64-w64-mingw32/13-posix"),
        Path("/usr/lib/gcc/x86_64-w64-mingw32/14-win32"),
    ]
    for r in roots:
        if (r / "libstdc++-6.dll").is_file():
            return r
    return None


def _wine_run(serial: str | None) -> str:
    wine = shutil.which("wine64") or shutil.which("wine")
    if not wine:
        raise FileNotFoundError("wine introuvable")
    mingw = _mingw_bindir()
    pthread = Path("/usr/x86_64-w64-mingw32/lib/libwinpthread-1.dll")
    with tempfile.TemporaryDirectory(prefix="binsafe-") as td:
        tdp = Path(td)
        exe = tdp / BIN.name
        shutil.copy2(BIN, exe)
        if mingw:
            for name in ("libstdc++-6.dll", "libgcc_s_seh-1.dll"):
                src = mingw / name
                if src.is_file():
                    shutil.copy2(src, tdp / name)
        if pthread.is_file():
            shutil.copy2(pthread, tdp / pthread.name)
        cmd = [wine, str(exe)]
        if serial is not None:
            cmd.append(serial)
        env = os.environ.copy()
        env["WINEDEBUG"] = "-all"
        r = subprocess.run(
            cmd,
            capture_output=True,
            text=True,
            timeout=30,
            cwd=td,
            env=env,
            check=False,
        )
        return (r.stdout or "") + (r.stderr or "")


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true")
    args = ap.parse_args()

    if args.check:
        blob = BIN.read_bytes()
        if MANGLED_V0 not in blob or MANGLED_V31 not in blob:
            print("FAIL: templates validate<> introuvables", file=sys.stderr)
            return 1
        if not check_serial(SERIAL) or check_serial("wrong") or check_serial(SERIAL + "x"):
            print("FAIL: simulateur", file=sys.stderr)
            return 1
        try:
            out_ok = _wine_run(SERIAL)
            out_ko = _wine_run("wrong")
            out_usage = _wine_run(None)
        except FileNotFoundError as e:
            print(f"FAIL: {e}", file=sys.stderr)
            return 1
        print(out_ok.strip())
        ok = WIN in out_ok and LOSE in out_ko and USAGE in out_usage
        print("OK" if ok else "FAIL")
        if not ok:
            print(out_ko, out_usage, file=sys.stderr)
            return 1
        return 0

    if args.q:
        print(SERIAL)
    else:
        print(f"{SERIAL}  # create() key, 17 octets, 32 contraintes Add/Xor")
        print(FLAG)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
