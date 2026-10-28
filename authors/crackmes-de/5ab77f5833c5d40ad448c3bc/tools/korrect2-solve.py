#!/usr/bin/env python3
"""Korrect2 (servitute, crackmes.de) — mot de passe `tschichold` (pas de user : petik non utilisé).

Le crackme ne teste en fait que input[5] == 'c' (et input != 'brunelleschi', leurre) ;
le mot « voulu » par l'auteur est `tschichold` (10 comparaisons char par char).

  korrect2-solve.py [-q] [--check] [exe]
  --check : lance l'exe (Wine/xvfb) avec le mot de passe, un faux et le leurre ; vérifie les messages
"""
import argparse, os, shutil, subprocess, sys, tempfile, zipfile

HERE = os.path.dirname(os.path.abspath(__file__))
ZIP = os.path.join(HERE, "..", "original", "Korrect2_updated.zip")
PASSWORD = "tschichold"
# index -> caractère attendu (offset ebp-0x78+i dans main @0x4012b0)
EXPECTED = {0: "t", 1: "s", 2: "c", 3: "h", 4: "i", 5: "c", 6: "h", 7: "o", 8: "l", 9: "d"}
assert "".join(EXPECTED[i] for i in range(10)) == PASSWORD


def run(exe, word):
    cmd = ["wine", exe]
    if shutil.which("xvfb-run"):
        cmd = ["xvfb-run", "-a"] + cmd
    out = subprocess.run(cmd, input=word + "\n", capture_output=True, text=True, timeout=60).stdout
    return out


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("exe", nargs="?")
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true")
    a = ap.parse_args()
    if not a.check:
        print(PASSWORD if a.q else f"Mot de passe : {PASSWORD}")
        return
    exe = a.exe
    if not exe:  # extraction hors de original/
        tmp = tempfile.mkdtemp()
        with zipfile.ZipFile(ZIP) as z:
            z.extract("Korrect2.exe", tmp, pwd=b"crackmes.one")
        exe = os.path.join(tmp, "Korrect2.exe")
    cases = [(PASSWORD, "Yes!"), ("abcde", "Nein!"), ("brunelleschi", "Ahahah!"), ("xxxxxcyy", "Yes!")]
    ok = True
    for w, exp in cases:
        r = exp in run(exe, w)
        ok &= r
        print(f"{w!r:16} attendu {exp:8} -> {'OK' if r else 'KO'}")
    print("check:", "OK" if ok else "KO")
    sys.exit(0 if ok else 1)


if __name__ == "__main__":
    main()
