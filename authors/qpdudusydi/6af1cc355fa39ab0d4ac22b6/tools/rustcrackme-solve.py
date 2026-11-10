#!/usr/bin/env python3
"""Solveur rustcrackme.exe : extrait la réponse hardcodée (12 octets en .rdata, VA 0x14001b9b6).

  python3 tools/rustcrackme-solve.py          # affiche la réponse
  python3 tools/rustcrackme-solve.py -q       # réponse seule
  python3 tools/rustcrackme-solve.py --check  # vérifie via wine (xvfb-run)
"""
import argparse, os, struct, subprocess, sys

HERE = os.path.dirname(os.path.abspath(__file__))
EXE = os.path.join(HERE, "..", "original", "rustcrackme.exe")
VA, LEN = 0x14001B9B6, 12


def extract():
    d = open(EXE, "rb").read()
    pe = struct.unpack_from("<I", d, 0x3C)[0]
    nsec = struct.unpack_from("<H", d, pe + 6)[0]
    opt = struct.unpack_from("<H", d, pe + 20)[0]
    base = struct.unpack_from("<Q", d, pe + 24 + 24)[0]
    sec = pe + 24 + opt
    for i in range(nsec):
        _, vsz, rva, rsz, raw = struct.unpack_from("<8sIIII", d, sec + 40 * i)
        if base + rva <= VA < base + rva + max(vsz, rsz):
            off = raw + VA - base - rva
            return d[off:off + LEN].decode()
    raise SystemExit("section introuvable")


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true")
    a = ap.parse_args()
    ans = extract()
    if a.q:
        print(ans)
    else:
        print("Réponse :", ans)
    if a.check:
        for s, exp in ((ans, "Correct!"), ("petik", "Wrong!")):
            out = subprocess.run(["xvfb-run", "-a", "wine", EXE], input=s + "\n",
                                 capture_output=True, text=True, timeout=60).stdout
            ok = exp in out
            print(f"{s!r}: {'OK' if ok else 'KO'} ({exp})")
            if not ok:
                sys.exit(1)


main()
