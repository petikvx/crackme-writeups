#!/usr/bin/env python3
"""UTW Crackme v2 (otromasf) -- user/key FIXES (pas de keygen name->serial).

Le crackme compare Text1 / Text2 a deux chaines reconstruites a partir de
codes ASCII poses un par un puis concatenes avec __vbaVarCat.

  python3 utw-crackme-solve.py            # affiche user / key
  python3 utw-crackme-solve.py -q         # "user key"
  python3 utw-crackme-solve.py --check ZIP_OU_EXE   # preuve Wine/Xvfb (xdotool)
"""
import argparse, os, subprocess, sys, tempfile, zipfile

# codes pousses (dans l'ordre d'execution) avant chaque VarCat :
USER_CODES = [0x55, 0x54, 0x57]                          # 'U','T','W'
KEY_CODES  = [0x55, 0x38, 0x35, 0x54, 0x38, 0x34, 0x57, 0x38, 0x37]


def build(codes):
    # concatenation dans l'ordre des codes (confirme par la preuve Wine --check)
    return "".join(chr(c) for c in codes)


def solve(user_name=None):
    return build(USER_CODES), build(KEY_CODES)


def check(path):
    here = os.path.dirname(os.path.abspath(__file__))
    user, key = solve()
    with tempfile.TemporaryDirectory() as d:
        exe = path
        if path.lower().endswith(".zip"):
            zipfile.ZipFile(path).extract("Crackme.exe", d)
            exe = os.path.join(d, "Crackme.exe")
        env = dict(os.environ, CRACKME=exe)
        for u, k in ((user, key), ("petik", "abc")):
            out = subprocess.run(["bash", os.path.join(here, "wine-drive.sh"), u, k,
                                  os.path.join(d, "s.png")], env=env, capture_output=True,
                                 text=True, timeout=120).stdout
            ok = out.count("UTW Crackme|") >= 1 and out.split("|").count("UTW Crackme") >= 2
            print(f"{u!r} {k!r} -> {'MessageBox Congratulations' if ok else 'rien'}")


if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", metavar="ZIP|EXE")
    a = ap.parse_args()
    u, k = solve()
    if a.check:
        check(a.check)
    elif a.q:
        print(u, k)
    else:
        print(f"User: {u}\nKey : {k}")
