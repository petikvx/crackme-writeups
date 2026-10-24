#!/usr/bin/env python3
"""Crackme09 (AttilhaZ, VB6 natif) : keygen serial + cd-key.

Serial = 5 champs : F1, "Arcx0d21", F3, "rNtp4v21", F5   (F1/F3/F5 libres, <= 4 car.)
Cd-Key = "Fc" + F1 + "3d7" + F3 + "jk21" + F5 + "fr1a"

  python3 -I tools/crackme09-solve.py [-q] [--f1 pe --f3 ti --f5 k]
  python3 -I tools/crackme09-solve.py --check [--shot analysis/screenshot-ok.png]
--check : lance l'exe d'origine (extrait du zip) sous Wine + Xvfb, remplit les 6
champs via xdotool et relève le titre de la MsgBox (OK puis un cas KO).
"""
import argparse, os, subprocess, tempfile, time, zipfile

HERE = os.path.dirname(os.path.abspath(__file__))
ZIP = os.path.join(HERE, "..", "original", "crackme09.zip")
F2, F4 = "Arcx0d21", "rNtp4v21"        # BSTR en dur @ 0x401bc4 / 0x401bdc


def keygen(f1="pe", f3="ti", f5="k"):
    cdkey = "Fc" + f1 + "3d7" + f3 + "jk21" + f5 + "fr1a"
    return [f1, F2, f3, F4, f5], cdkey


def extract():
    d = tempfile.mkdtemp(prefix="c09-")
    with zipfile.ZipFile(ZIP) as z:
        z.extractall(d, pwd=b"crackmes.one")
    exe = os.path.join(d, "Crackme09.exe")
    data = open(exe, "rb").read()
    for c in (F2, F4, "Fc", "3d7", "jk21", "fr1a"):   # constantes bien dans l'exe
        assert c.encode("utf-16le") in data, c
    return exe


def run(exe, fields, cdkey, shot=None):
    env = dict(os.environ, DISPLAY=":97")
    xvfb = subprocess.Popen(["Xvfb", ":97", "-screen", "0", "800x600x24"])
    time.sleep(1.5)
    w = subprocess.Popen(["wine", exe], env=env, stderr=subprocess.DEVNULL)

    def x(*a):
        return subprocess.run(["xdotool", *a], env=env, capture_output=True, text=True).stdout
    try:
        time.sleep(9)
        # fenêtre en (247,224) ; champs serial y=276, x = 271/335/399/463/527
        for cx, v in zip((271, 335, 399, 463, 527), fields):
            x("mousemove", str(cx), "276", "click", "1"); x("type", v)
        x("mousemove", "400", "316", "click", "1"); x("type", cdkey)
        x("mousemove", "491", "351", "click", "1")
        time.sleep(2)
        if shot:
            from PIL import ImageGrab
            ImageGrab.grab(xdisplay=":97").crop((247, 224, 553, 401)).save(shot)
        return sorted({x("getwindowname", t).strip()
                       for t in x("search", "--name", ".").split()} - {"Default IME", ""})
    finally:
        w.kill(); xvfb.kill()
        subprocess.run(["wineserver", "-k"], stderr=subprocess.DEVNULL)


if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true")
    ap.add_argument("--f1", default="pe")
    ap.add_argument("--f3", default="ti")
    ap.add_argument("--f5", default="k")
    ap.add_argument("--shot")
    a = ap.parse_args()
    fields, cdkey = keygen(a.f1, a.f3, a.f5)
    if a.q:
        print("-".join(fields), cdkey)
    else:
        print("Serial :", " | ".join(fields))
        print("Cd-Key :", cdkey)
    if a.check:
        exe = extract()
        print("OK ->", run(exe, fields, cdkey, a.shot))
        bad = keygen("pe", "ti", "k")[1][:-1] + "X"
        print("KO cd-key ->", run(exe, fields, bad))
        print("KO serial ->", run(exe, ["pe", "bad", "ti", F4, "k"], cdkey))
