#!/usr/bin/env python3
"""prolokmn2 lock.exe ("FSX lock") — keygen. Pas de user : clé = f(time()//30).

  python3 -I tools/lock-solve.py [-q] [--t N] [--check]
"""
import argparse, os, subprocess, sys, time


def keygen(t: int) -> int:
    h = 0x57984997
    for i in range(8):
        v = (t // (i + 1)) % 0xFB
        h = (h * 0x83 + v + i * 7) % 0x7FFFFFFF
    return h


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--t", type=int, default=None, help="fenêtre (time//30)")
    ap.add_argument("--check", action="store_true", help="teste sous Wine")
    a = ap.parse_args()
    t = a.t if a.t is not None else int(time.time()) // 30
    key = str(keygen(t))
    if a.q:
        print(key)
    else:
        print(f"t = {t}\nKey = {key}  (aussi valide : t-1 -> {keygen(t-1)})")
    if a.check:
        exe = os.path.join(os.path.dirname(os.path.abspath(__file__)), "..", "original", "lock.exe")
        for k, exp in ((key, "granted"), ("12345", "denied")):
            out = subprocess.run(["xvfb-run", "-a", "wine", exe], input=k + "\n",
                                 capture_output=True, text=True, timeout=60).stdout
            ok = exp in out
            print(f"[{'OK' if ok else 'KO'}] {k!r} -> {out.strip().splitlines()[-1] if out.strip() else ''}")
            if not ok:
                sys.exit(1)


main()
