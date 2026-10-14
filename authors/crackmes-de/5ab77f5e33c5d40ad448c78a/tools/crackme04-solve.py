#!/usr/bin/env python3
"""crackme04 (seveb) — id 5ab77f5e33c5d40ad448c78a. ELF32/ELF64 (mêmes tests).

main @0x40093d (64 bits) :
  * getCurTime() -> strftime("%H:%M") doit valoir "13:37"          sinon theOtherEnd() : puts + REMOVE(argv[0]) + exit(1)
  * getpid() doit valoir 0x539 (1337)                                idem
  * serial attendu : pour i = 0..6, c = "7030726e"[i] :
        t = c + 0x5c ; acc ^= pid ; t += acc ; (oil) t ^= 4 ; acc |= 0x2e39f3 ; out += "%d" % t ; acc <<= 7
    avec acc = 0x35478 au départ (int 32 bits)
  * fgets + strcmp(saisie, out)  -> theEnd() « YOU WIN »
=> ATTENTION : un échec SUPPRIME le binaire (remove(argv[0])) ; le solveur travaille sur une copie.

  crackme04-solve.py [-q] [--check]
"""
import argparse, os, shutil, subprocess, sys, tempfile
from pathlib import Path

HERE = Path(__file__).resolve().parent
A = HERE.parent / "analysis"


def i32(x):
    x &= 0xFFFFFFFF
    return x - (1 << 32) if x & 0x80000000 else x


def serial(pid=1337):
    acc, out = 0x35478, ""
    for c in b"7030726e"[:7]:
        t = c + 0x5C
        acc = i32(acc ^ pid)
        t = i32(t + acc)
        t ^= 4
        acc |= 0x2E39F3
        out += "%d" % t
        acc = i32(acc << 7)
    return out


def main():
    ap = argparse.ArgumentParser(); ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true")
    a = ap.parse_args()
    s = serial()
    print(s if a.q else f"serial : {s}   (à 13:37 avec pid 1337 ; --check force pid/heure par LD_PRELOAD)")
    if a.check:
        with tempfile.TemporaryDirectory() as td:
            subprocess.run(["gcc", "-shared", "-fPIC", "-o", f"{td}/shim.so", str(HERE / "shim.c")], check=True)
            exe = f"{td}/crackme04"
            shutil.copy(A / "crackme04_64bit", exe)
            env = dict(os.environ, LD_PRELOAD=f"{td}/shim.so")
            run = lambda ser: subprocess.run([exe], input=ser + "\n", capture_output=True, text=True, env=env, timeout=5).stdout
            ok = "WIN" in run(s)
            bad = "LOSE" in run("0000000")
            nopid = "LOSE" in subprocess.run([exe], input=s + "\n", capture_output=True, text=True, timeout=5).stdout
        good = ok and bad and nopid
        print("check:", "OK" if good else "KO", f"(pid=1337 & 13:37 → WIN={ok}, mauvais serial→LOSE={bad}, sans shim→LOSE={nopid})")
        sys.exit(0 if good else 1)


if __name__ == "__main__":
    main()
