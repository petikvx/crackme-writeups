#!/usr/bin/env python3
"""Acid's First Crackme (AcidByte) — mot de passe fixe.

license.exe calcule SHA256(saisie + MachineGuid) et le compare à
SHA256(secret + MachineGuid), où secret = 3 morceaux XOR 0x5a
(")?9", "(?.", "khi"). Donc saisie == secret, quel que soit le MachineGuid.

Usage : acid-first-solve.py [-q] [--check license.exe]
Le binaire d'origine est un ZIP (pw crackmes.one) : download.bin -> license.exe
(extrait sous analysis/extract/).
"""
import argparse, subprocess, sys

CHUNKS = [b")?9", b"(?.", b"khi"]  # .rdata 0x1400f82e4 / e8 / ec
KEY = 0x5A


def solve() -> str:
    return "".join(bytes(b ^ KEY for b in c).decode() for c in CHUNKS)


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true", help="n'affiche que le mot de passe")
    ap.add_argument("--check", metavar="EXE", help="teste contre license.exe via xvfb-run wine")
    a = ap.parse_args()
    pw = solve()
    print(pw if a.q else f"password = {pw}")
    if a.check:
        for p, want in ((pw, "Access granted"), ("petik", "Access denied")):
            out = subprocess.run(["xvfb-run", "-a", "wine", a.check], input=p + "\n",
                                 capture_output=True, text=True, timeout=60).stdout
            ok = want in out
            print(f"[{'OK' if ok else 'KO'}] {p!r} -> {out.strip()!r}")
            if not ok:
                sys.exit(1)


if __name__ == "__main__":
    main()
