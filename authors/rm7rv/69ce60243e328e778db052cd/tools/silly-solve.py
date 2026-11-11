#!/usr/bin/env python3
"""SillyCrackMe (rm7rv) : le login est vérifié par MD5 == 73acd9a5972130b75066c82595a1fae3.
Le solveur retrouve le login par dictionnaire/variantes de casse + brute force court.
  silly-solve.py        -> affiche le login
  silly-solve.py -q     -> login seul
  silly-solve.py --check ../analysis/x/SillyCrackMe.exe   -> rejoue le binaire sous Unicorn (emu-verify.py)
"""
import hashlib, itertools, string, sys, os

TARGET = "73acd9a5972130b75066c82595a1fae3"  # VA 0x14002cae8 (.rdata, 32 hex)
WORDS = ["admin", "root", "user", "password", "crackme", "silly", "test", "guest", "petik"]

def md5(s): return hashlib.md5(s.encode()).hexdigest()

def solve():
    for w in WORDS:
        for v in (w, w.upper(), w.capitalize(), w.lower()):
            if md5(v) == TARGET: return v
    for n in range(1, 6):
        for p in itertools.product(string.ascii_uppercase + string.digits, repeat=n):
            s = "".join(p)
            if md5(s) == TARGET: return s

if __name__ == "__main__":
    pw = solve()
    if "-q" in sys.argv: print(pw)
    else: print("login =", pw, "(md5 =", md5(pw) + ")")
    if "--check" in sys.argv:
        sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
        import importlib.util
        spec = importlib.util.spec_from_file_location("emu", os.path.join(os.path.dirname(os.path.abspath(__file__)), "emu-verify.py"))
        m = importlib.util.module_from_spec(spec); spec.loader.exec_module(m)
        exe = sys.argv[sys.argv.index("--check") + 1]
        for cand, exp in ((pw, b"correct\r\n"), ("petik", b"not correct")):
            out = m.run(exe, cand)
            ok = exp.rstrip() in out and (b"not correct" in out) == (exp.startswith(b"not"))
            print(cand, "->", out.decode().split("\n")[1].strip(), "OK" if ok else "KO")
