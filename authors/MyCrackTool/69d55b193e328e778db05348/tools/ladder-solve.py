#!/usr/bin/env python3
"""MyCrackTool - beginner_ladder_pack (easy / mid / hard).

  easy : kali
  mid  : kali  +  777
  hard : kali_secret_<time()//10>_key   (dynamique, régénéré toutes les 10 s)

Usage:
  ladder-solve.py            # affiche les réponses (hard = clé pour l'instant)
  ladder-solve.py -q         # une ligne par niveau, sans décor
  ladder-solve.py --check    # extrait le zip d'origine, lance les 3 binaires et vérifie
"""
import argparse, io, subprocess, sys, tempfile, time, zipfile, os

HERE = os.path.dirname(os.path.abspath(__file__))
BIN = os.path.join(HERE, "..", "original", "download.bin")


def hard_key(now=None):
    return "kali_secret_%d_key" % (int(now if now is not None else time.time()) // 10)


def run(path, inputs, delay=0.0):
    p = subprocess.Popen([path], stdin=subprocess.PIPE, stdout=subprocess.PIPE, text=True)
    for i, s in enumerate(inputs):
        if callable(s):
            s = s()
        p.stdin.write(s + "\n"); p.stdin.flush()
        if delay and i == 0:
            time.sleep(delay)
    p.stdin.close()
    return p.stdout.read()


def check():
    d = tempfile.mkdtemp()
    outer = zipfile.ZipFile(BIN)
    inner = zipfile.ZipFile(io.BytesIO(outer.read("beginner_ladder_pack.zip", pwd=b"crackmes.one")))
    inner.extractall(d)
    for n in ("easy_find_text", "mid_math_xor", "hard_mem_rip"):
        os.chmod(os.path.join(d, n), 0o755)
    ok = True
    cases = [
        ("easy_find_text", ["2", "kali"], "good job", True),
        ("easy_find_text", ["2", "nope"], "no try one more", True),
        ("mid_math_xor", ["2", "kali", "777"], "very good", True),
        ("mid_math_xor", ["2", "kali", "778"], "no you try deeper", True),
        ("hard_mem_rip", ["2", hard_key], "you are god", True),
        ("hard_mem_rip", ["2", "kali_secret_0_key"], "too slow", True),
    ]
    for name, inp, needle, _ in cases:
        out = run(os.path.join(d, name), inp, delay=0.1)
        if needle not in out and name == "hard_mem_rip" and needle == "you are god":
            out = run(os.path.join(d, name), inp, delay=0.1)  # frontière de fenêtre 10 s
        r = needle in out
        ok &= r
        print("%-15s %-28s %s" % (name, inp[1:] if not callable(inp[1]) else "<hard_key>", "OK" if r else "FAIL"))
    return ok


if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true")
    a = ap.parse_args()
    if a.check:
        sys.exit(0 if check() else 1)
    if a.q:
        print("kali"); print("kali 777"); print(hard_key())
    else:
        print("easy : kali\nmid  : kali / 777\nhard : %s  (valide ~10 s)" % hard_key())
