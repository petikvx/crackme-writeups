#!/usr/bin/env python3
"""ASMboy — segfault (a.out) : keygen username -> serial.

main @0x1289 : 8 <= len(user) <= 12 ; t[i] = lower(u[i]) si i pair, upper(u[i]) si i impair ;
serial == (double) atoi(t[:8]).   scanf("%lf") -> compare ucomisd.
Usage : segfault-solve.py [--user petikpetik] [-q] [--check]
"""
import argparse, re, subprocess, sys
from pathlib import Path

EXE = Path(__file__).resolve().parent.parent / "original" / "a.out"


def atoi(s: str) -> int:
    m = re.match(r"[ \t\n\v\f\r]*([+-]?\d+)", s)
    return int(m.group(1)) if m else 0


def serial(user: str) -> int:
    if not 8 <= len(user) <= 12:
        raise SystemExit("username must be between 8 and 12!")
    t = "".join(c.lower() if i % 2 == 0 else c.upper() for i, c in enumerate(user))
    return atoi(t[:8])


ap = argparse.ArgumentParser()
ap.add_argument("--user", default="petikpetik")   # 'petik' seul est trop court (min 8)
ap.add_argument("-q", action="store_true")
ap.add_argument("--check", action="store_true")
a = ap.parse_args()
s = serial(a.user)
if a.q:
    print(s); sys.exit(0)
print(f"user={a.user} serial={s}")
if a.check:
    run = lambda u, n: subprocess.run([str(EXE)], input=f"{u}\n{n}\n", capture_output=True, text=True).stdout
    ok, ko = run(a.user, s), run(a.user, s + 1)
    print("OK:", "s/n OK!" in ok, "| KO:", "s/n WRONG!" in ko)
    sys.exit(0 if "s/n OK!" in ok and "s/n WRONG!" in ko else 1)
