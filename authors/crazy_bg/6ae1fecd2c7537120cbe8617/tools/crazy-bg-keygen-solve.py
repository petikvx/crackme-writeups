#!/usr/bin/env python3
"""Keygen pour crazy_bg's Keygen Me! (Keygen.exe).

Le « nom » n'est pas saisi : le binaire lit la variable d'environnement
USER (sinon USERNAME). Défaut --user : petik.

  python3 tools/crazy-bg-keygen-solve.py [-q] [--user petik] [--check path/Keygen.exe]
"""
import argparse, os, subprocess, sys


def s32(x):
    x &= 0xFFFFFFFF
    return x - (1 << 32) if x & 0x80000000 else x


def serial(user: str) -> int:
    ecx = 0
    for b in user.encode():
        c = b - 256 if b > 127 else b          # movsx
        ecx = (ecx + c + 0x539) & 0xFFFFFFFF   # lea ecx,[rcx+rdx+0x539]
    ecx = (ecx * 0x1E) & 0xFFFFFFFF            # imul ecx,ecx,0x1e
    eax = ecx ^ 0x37
    ecx = (ecx - eax) & 0xFFFFFFFF
    return s32(ecx << 3)                       # shl ecx,3 ; cin >> int (signé)


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--user", default="petik")
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", metavar="EXE", help="vérifie via wine (xvfb-run)")
    a = ap.parse_args()
    s = serial(a.user)
    if a.q:
        print(s)
    else:
        print(f"USER={a.user} -> serial = {s}")
    if a.check:
        env = dict(os.environ, USER=a.user, WINEDEBUG="-all")
        r = subprocess.run(["xvfb-run", "-a", "wine", a.check], input=f"{s}\n",
                           capture_output=True, text=True, env=env, timeout=60)
        print(r.stdout)
        sys.exit(0 if "You WIN" in r.stdout else 1)


if __name__ == "__main__":
    main()
