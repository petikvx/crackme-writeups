#!/usr/bin/env python3
"""Keygen S.N.A.P. (DonCris) : username -> Elf ID Code (u32 décimal).

  python3 tools/snap-solve.py            # user par défaut : petik
  python3 tools/snap-solve.py -q bob     # serial seul
  python3 tools/snap-solve.py --check    # preuve contre original/elf_portal.exe (wine)
"""
import argparse, os, subprocess, sys

M = 0xFFFFFFFF
EXE = os.path.join(os.path.dirname(os.path.abspath(__file__)), "..", "original", "elf_portal.exe")


def ror(v, n):
    n &= 31
    return ((v >> n) | (v << (32 - n))) & M


def elf_id(name: str) -> int:
    if not name:
        return 0
    h = 0xCAFEBABE
    for c in name.encode():
        h ^= c
        h = ror(h, (c % 7) + 1)
        h = (h + 0x5AA55AA5) & M
        h ^= (h << 4) & M
    return h ^ 0xDEADBEEF


def check(name):
    sn = elf_id(name)
    for label, serial in (("OK", sn), ("KO", (sn + 1) & M)):
        out = subprocess.run(["xvfb-run", "-a", "wine", EXE], input=f"{name}\n{serial}\n",
                             capture_output=True, text=True, timeout=120).stdout
        print(f"[{label}] serial={serial} ->", "GRANTED" if "ACCESS GRANTED" in out
              else "DENIED" if "ACCESS DENIED" in out else "?")
        if label == "OK" and "ACCESS GRANTED" not in out:
            return 1
        if label == "KO" and "ACCESS DENIED" not in out:
            return 1
    return 0


if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("user", nargs="?", default="petik")
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true")
    a = ap.parse_args()
    if len(a.user) < 3:
        sys.exit("username >= 3 caractères")
    if a.check:
        sys.exit(check(a.user))
    print(elf_id(a.user) if a.q else f"{a.user} -> {elf_id(a.user)}")
