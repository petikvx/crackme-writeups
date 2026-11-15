#!/usr/bin/env python3
"""atoc superEZcrackME : génère in.txt (réponse 420) et, avec --check, le fait valider par bvessel.exe (Wine).

  python3 -I tools/superez-solve.py -q          # affiche la réponse
  python3 -I tools/superez-solve.py --check     # dézippe l'original dans un tmp, lance Wine, attend 'you winner'
"""
import argparse, os, shutil, subprocess, sys, tempfile, zipfile

HERE = os.path.dirname(os.path.abspath(__file__))
ORIG = os.path.join(HERE, "..", "original", "download.bin")
ANSWER = "420"


def check():
    tmp = tempfile.mkdtemp()
    try:
        outer = zipfile.ZipFile(ORIG)
        outer.extractall(tmp, pwd=b"crackmes.one")
        zipfile.ZipFile(os.path.join(tmp, "crackme1.zip")).extractall(tmp)
        with open(os.path.join(tmp, "in.txt"), "w") as f:
            f.write(ANSWER)
        for bad in ("421", ""):  # cas KO
            with open(os.path.join(tmp, "in.txt"), "w") as f:
                f.write(bad)
            out = run(tmp)
            assert "you failure" in out.split("Var[0]")[0], (bad, out)
        with open(os.path.join(tmp, "in.txt"), "w") as f:
            f.write(ANSWER)
        out = run(tmp)
        ok = out.split("Var[0]")[0].strip() == "you winner"
        print(out.split("Var[0]")[0].strip())
        return ok
    finally:
        shutil.rmtree(tmp)


def run(cwd):
    cmd = ["xvfb-run", "-a", "wine", "bvessel.exe", "cm.bvs"]
    r = subprocess.run(cmd, cwd=cwd, capture_output=True, text=True, timeout=60)
    return "\n".join(l for l in r.stdout.splitlines() if "fixme" not in l)


if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true")
    a = ap.parse_args()
    if a.check:
        sys.exit(0 if check() else 1)
    print(ANSWER if a.q else f"Contenu de in.txt (à côté de cm.bvs) : {ANSWER}")
