#!/usr/bin/env python3
"""karity-crackme-I : flag fixe (pas de username) calculé en inversant la chaîne XOR de 0x140001440.

Usage : karity-I-solve.py [-q] [--check]
  --check : lance une copie à en-tête réparé (analysis/, via tools/fix-header.py) sous wine/xvfb ;
            l'original est refusé par Wine ("Bad EXE format") à cause d'un en-tête PE corrompu.
"""
import argparse, os, shutil, subprocess, sys

HERE = os.path.dirname(os.path.abspath(__file__))
# 24 octets à 0x14000a060 (.rdata)
TABLE = bytes.fromhex("25597e9d9694cccb2d2c076642efc7f581957b656e06ddbb")

def solve():
    prev, out = 0x5A, [0] * 24            # 'Z' = valeur initiale du "chaînage" (état [rsp+0x29])
    for i in range(23, -1, -1):
        k = (i * 27 + 0x2F) & 0xFF        # clé position : edx = 27*i + 0x2f
        out[i] = TABLE[i] ^ k ^ prev      # table[i] = in[i] ^ k_i ^ in[i+1]
        prev = out[i]
    return bytes(out).decode()

def run(s):
    orig = os.path.join(HERE, "..", "original", "karity-crackme-I.exe")
    fixed = os.path.join(HERE, "..", "analysis", "karity-crackme-I.fixed.exe")
    subprocess.run([sys.executable, "-I", os.path.join(HERE, "fix-header.py"), orig, fixed], check=True)
    cmd = ["wine", fixed]
    if shutil.which("xvfb-run"):
        cmd = ["xvfb-run", "-a"] + cmd
    return subprocess.run(cmd, input=s + "\n", capture_output=True, text=True, timeout=60).stdout

if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true")
    a = ap.parse_args()
    s = solve()
    print(s if a.q else f"Flag : {s}")
    if a.check:
        ok = "Correct!" in run(s)
        ko = "Correct!" in run(s[:-2] + "?}")
        print("OK (Correct!)" if ok else "KO : flag refusé")
        print("KO attendu sur flag altéré :", "Invalid!" if not ko else "ERREUR")
        sys.exit(0 if ok and not ko else 1)
