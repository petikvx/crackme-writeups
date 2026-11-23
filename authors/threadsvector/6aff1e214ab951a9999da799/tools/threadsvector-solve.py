#!/usr/bin/env python3
"""Solveur threadsvector's Multi : extrait les 4 std::string globales de .data
et reconstruit le mot de passe (D + C + B + A). --check le teste sous Wine."""
import argparse, struct, subprocess, sys, os, shutil
HERE = os.path.dirname(os.path.abspath(__file__))
EXE = os.path.join(HERE, "..", "original", "crackmebythreadvector.exe")
DATA_VA, DATA_RAW = 0x1400C7000, 0xC5A00  # .data
IB = 0x140000000

def rd(f, va, n):
    f.seek(DATA_RAW + va - DATA_VA); return f.read(n)

def solve():
    with open(EXE, "rb") as f:
        s = {}
        for name, va in zip("ABCD", (0x1400C7000, 0x1400C7020, 0x1400C7040, 0x1400C7060)):
            ptr, ln = struct.unpack("<QQ", rd(f, va, 16))
            s[name] = rd(f, ptr, ln).decode()
    return s["D"] + s["C"] + s["B"] + s["A"]

def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true"); ap.add_argument("--check", action="store_true")
    a = ap.parse_args(); pw = solve()
    print(pw if a.q else f"Password: {pw}")
    if a.check:
        cmd = ["xvfb-run", "-a", "wine", EXE] if shutil.which("xvfb-run") else ["wine", EXE]
        try:  # le binaire reboucle sur EOF stdin : on coupe au timeout
            out = subprocess.run(cmd, input=(pw + "\n\n").encode(), capture_output=True, timeout=20).stdout
        except subprocess.TimeoutExpired as e:
            out = e.stdout or b""
        out = out.decode(errors="replace")
        ok = "Correct Password" in out
        print("check:", "OK" if ok else "KO"); sys.exit(0 if ok else 1)
main()
