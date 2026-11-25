#!/usr/bin/env python3
"""prolokmn2 FiggerC (crackme.exe) — keygen. Pas de user : clé = f(time()//30).

  python3 -I tools/figgerc-solve.py [-q] [--t N] [--check]
"""
import argparse, hashlib, os, struct, subprocess, sys, time

SEED = b"FSX::crackme::v1::9f3a-rotating"  # 31 octets


def keygen(t: int) -> str:
    """16 premiers caractères hex (MAJ) de sha256(SEED || be64(t))."""
    return hashlib.sha256(SEED + struct.pack(">Q", t)).hexdigest()[:16].upper()


def run(exe, key):
    return subprocess.run(["xvfb-run", "-a", "wine", exe], input=key + "\n",
                          capture_output=True, text=True, timeout=90).stdout


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--t", type=int, default=None, help="fenêtre (time//30)")
    ap.add_argument("--check", action="store_true", help="teste sous Wine")
    a = ap.parse_args()
    t = a.t if a.t is not None else int(time.time()) // 30
    key = keygen(t)
    if a.q:
        print(key)
    else:
        print(f"t = {t}\nKey = {key}  (aussi valide : t-1 -> {keygen(t-1)})")
    if a.check:
        exe = os.path.join(os.path.dirname(os.path.abspath(__file__)), "..", "original", "crackme.exe")
        t0 = int(time.time()) // 30
        cases = ((keygen(t0), "granted"), (keygen(t0 - 1), "granted"),
                 (keygen(t0 - 1).lower(), "granted"), ("0123456789ABCDEF", "denied"))
        for k, exp in cases:
            if k == keygen(t0) and int(time.time()) // 30 != t0:
                pass
            out = run(exe, k)
            ok = exp in out
            print(f"[{'OK' if ok else 'KO'}] {k!r} -> {out.strip().splitlines()[-1] if out.strip() else ''}")
            if not ok:
                sys.exit(1)


main()
