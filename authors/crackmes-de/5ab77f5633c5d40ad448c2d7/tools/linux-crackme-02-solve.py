#!/usr/bin/env python3
"""linux_crackme_02 (Level:3) by cyrex — id 5ab77f5633c5d40ad448c2d7. ELF32 strippé.

main @0x8048520 :
  * ptrace(PTRACE_TRACEME) < 0  -> « Are you trying to Debug me? » (anti-debug)
  * scanf("%s") ; Stage 1 : strcmp(buf, "7gb5fjf8v4bg8fb34f")      @0x80488b6
  * Stage 2 : fopen("/tmp/crackme_89nfnjfiefheufeue", "r") != NULL  @0x8048920
    -> le fichier doit EXISTER (contenu non lu).

  linux-crackme-02-solve.py [-q] [--check]
"""
import argparse, os, subprocess, sys
from pathlib import Path

BIN = Path(__file__).resolve().parent.parent / "analysis" / "crackme"
FLAG_FILE = "/tmp/crackme_89nfnjfiefheufeue"


def cstr(d, vaddr):
    o = vaddr - 0x8048000
    return d[o:d.index(b"\0", o)].decode()


def main():
    ap = argparse.ArgumentParser(); ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true")
    a = ap.parse_args()
    d = BIN.read_bytes()
    pw, path = cstr(d, 0x80488B6), cstr(d, 0x8048920)
    print(pw if a.q else f"password: {pw}\nfichier : {path}  (doit exister, `touch`)")
    if a.check:
        run = lambda s: subprocess.run([str(BIN)], input=s + "\n", capture_output=True, text=True).stdout
        if os.path.exists(path): os.remove(path)
        no_file = "forgot something" in run(pw)
        bad = "Game Over" in run("petik")
        open(path, "w").close()
        try:
            ok = "successfully reversed" in run(pw)
        finally:
            os.remove(path)
        good = no_file and bad and ok
        print("check:", "OK" if good else "KO", f"(sans fichier→forgot={no_file}, mauvais pw→Game Over={bad}, ok={ok})")
        sys.exit(0 if good else 1)


if __name__ == "__main__":
    main()
