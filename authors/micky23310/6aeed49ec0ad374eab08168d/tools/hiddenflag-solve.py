#!/usr/bin/env python3
"""HiddenFlag (micky23310) : inverse de enc[i] = ((c ^ 0x5a) + 3*i) & 0xff.

  python3 hiddenflag-solve.py            # affiche le flag
  python3 hiddenflag-solve.py --check    # le passe au binaire via xvfb-run wine
"""
import subprocess, sys, pathlib

# table de 28 octets en .rdata, VA 0x1400ce050
TAB = bytes.fromhex("191a1b2a0e7b801a1a852626" "8f502f483550a0a37a444b73b6737c78")


def solve(tab=TAB):
    return bytes(((t - 3 * i) & 0xFF) ^ 0x5A for i, t in enumerate(tab)).decode()


if __name__ == "__main__":
    flag = solve()
    print(flag)
    if "--check" in sys.argv:
        exe = pathlib.Path(__file__).resolve().parent.parent / "original" / "HiddenFlag.exe"
        out = subprocess.run(["xvfb-run", "-a", "wine", str(exe)], input=flag + "\n",
                             capture_output=True, text=True, timeout=60).stdout
        print(out.strip().splitlines()[-1])
        sys.exit(0 if "Correct" in out else 1)
