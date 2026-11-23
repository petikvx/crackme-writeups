#!/usr/bin/env python3
"""Solveur id_password.exe (Hossam.Zaid) : ID fixe + mot de passe dérivé (hex)."""
import argparse, glob, os, shutil, subprocess, sys, tempfile

K10, K14, K18 = 0xDEADBEEF, 0x13579BDF, 0xA5A5A5A5
M = 0xFFFFFFFF

def rol(x, n): return ((x << n) | (x >> (32 - n))) & M

def solve():
    hi = 0xB8FA ^ 0xABCD          # (id>>16) ^ 0xabcd == 0xb8fa
    lo = 0xACDB ^ 0x1234          # (id&0xffff) ^ 0x1234 == 0xacdb
    ident = (hi << 16) | lo
    pw = ((rol(K18 ^ ident, 5) + K14) & M) ^ K10
    return ident, pw

def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true", help="sortie 'ID PASSWORD' seule")
    ap.add_argument("--check", action="store_true", help="vérifie via wine sur original/id_password.exe")
    a = ap.parse_args()
    i, p = solve()
    if a.q:
        print(f"{i:08x} {p:08x}")
    else:
        print(f"ID       = {i:08x}\nPassword = {p:08x}")
    if a.check:
        src = os.path.join(os.path.dirname(os.path.abspath(__file__)), "..", "original", "id_password.exe")
        # l'exe importe libstdc++-6.dll (absent de Wine) : copie temporaire + DLL mingw, original/ intact
        tmp = tempfile.mkdtemp()
        shutil.copy(src, tmp)
        for d in glob.glob("/usr/lib/gcc/x86_64-w64-mingw32/*-posix"):
            for n in ("libstdc++-6.dll", "libgcc_s_seh-1.dll"):
                shutil.copy(os.path.join(d, n), tmp)
        shutil.copy("/usr/x86_64-w64-mingw32/lib/libwinpthread-1.dll", tmp)
        exe = os.path.join(tmp, "id_password.exe")
        for inp, exp in ((f"{i:08x}\n{p:08x}\n", True), (f"{i:08x}\n{p ^ 1:08x}\n", False)):
            out = subprocess.run(["xvfb-run", "-a", "wine", exe], input=inp.encode(),
                                 capture_output=True, timeout=120).stdout.decode(errors="replace")
            ok = "Congratulations" in out
            print("check", "OK" if ok == exp else "FAIL", repr(out[-60:]))
            if ok != exp: sys.exit(1)

if __name__ == "__main__":
    main()
