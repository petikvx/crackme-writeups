#!/usr/bin/env python3
"""KeyGenMe #2 (ank83) : serial = (2*id+1)^2 - 190, id dans 0..999.

  keygenme2-solve.py [ID]       -> serial (défaut ID=5 ; pas de nom : petik non applicable)
  keygenme2-solve.py -q ID      -> serial seul
  keygenme2-solve.py --check [ID] -> teste contre l'exe d'origine (wine/xvfb)
"""
import argparse, subprocess, sys, zipfile, tempfile, os

HERE = os.path.dirname(os.path.abspath(__file__))
ZIP = os.path.join(HERE, "..", "original", "keygenme2byank83.zip")

def serial(i):
    x = (i + 1) * 2 - 1          # (id+1)+(id+1)-1
    x = x * x                    # imul
    return x - sum(range(1, 20)) # boucle for i=1..19 : -190

def check(i):
    with tempfile.TemporaryDirectory() as t:
        with zipfile.ZipFile(ZIP) as z:
            z.extractall(t, pwd=b"crackmes.one")
        exe = os.path.join(t, "KeyGenMe #2.exe")
        for s, exp in ((serial(i), True), (serial(i) + 1, False)):
            out = subprocess.run(["xvfb-run", "-a", "wine", exe], input=f"{i}\n{s}\n",
                                 capture_output=True, text=True, timeout=60).stdout
            ok = "Congratulation" in out
            print(f"id={i} serial={s} -> {'OK' if ok else 'KO'} (attendu {'OK' if exp else 'KO'})")
            if ok != exp:
                sys.exit(1)

if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("id", nargs="?", type=int, default=5)
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true")
    a = ap.parse_args()
    if a.check:
        check(a.id)
    elif a.q:
        print(serial(a.id))
    else:
        print(f"ID={a.id} serial={serial(a.id)}")
