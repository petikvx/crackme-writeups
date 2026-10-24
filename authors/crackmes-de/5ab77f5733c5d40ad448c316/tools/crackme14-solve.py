#!/usr/bin/env python3
"""Crackme14 (AttilhaZ, VB6 natif) : keygen.

Prédicat (handler « Check » @ 0x402210) : Len(Text1.Text) == 15. Aucun autre test.
Le keygen produit donc une chaîne de 15 caractères (défaut : "petik" x3).

  python3 -I tools/crackme14-solve.py [-q] [--name petik]
  python3 -I tools/crackme14-solve.py --check [--shot analysis/screenshot-ok.png]
--check : lance l'exe d'origine (extrait du zip) sous Wine + Xvfb, saisit le serial
via xdotool, relève le titre/texte de la MsgBox (cas OK + 2 cas KO : 14 et 16 car.).
"""
import argparse, os, subprocess, tempfile, time, zipfile

HERE = os.path.dirname(os.path.abspath(__file__))
ZIP = os.path.join(HERE, "..", "original", "crackme14.zip")
LEN = 15   # cmp eax,0xf @ 0x4022b4


def keygen(name="petik"):
    """Répète `name` jusqu'à 15 caractères."""
    return (name * LEN)[:LEN]


def extract():
    d = tempfile.mkdtemp(prefix="c14-")
    with zipfile.ZipFile(ZIP) as z:
        z.extractall(d, pwd=b"crackmes.one")
    exe = os.path.join(d, "Crackme14.exe")
    data = open(exe, "rb").read()
    assert "Correct serial. Good!!!".encode("utf-16le") in data
    return exe


def run(exe, serial, shot=None):
    env = dict(os.environ, DISPLAY=":97")
    xvfb = subprocess.Popen(["Xvfb", ":97", "-screen", "0", "800x600x24"])
    time.sleep(1.5)
    w = subprocess.Popen(["wine", exe], env=env, stderr=subprocess.DEVNULL)

    def x(*a):
        return subprocess.run(["xdotool", *a], env=env, capture_output=True, text=True).stdout
    try:
        time.sleep(9)
        x("mousemove", "400", "300", "click", "1"); x("type", serial)   # TextBox
        x("mousemove", "440", "327", "click", "1")                       # bouton Check
        time.sleep(2)
        if shot:
            from PIL import ImageGrab
            ImageGrab.grab(xdisplay=":97").crop((250, 230, 550, 380)).save(shot)
        # la MsgBox n'a pas de titre exploitable : on lit le texte via la capture
        # -> repère : la fenêtre « Good!!! » (OK) ou « Bad!!! » (KO) existe
        return sorted({x("getwindowname", t).strip()
                       for t in x("search", "--name", ".").split()} - {"Default IME", ""})
    finally:
        w.kill(); xvfb.kill()
        subprocess.run(["wineserver", "-k"], stderr=subprocess.DEVNULL)


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--name", default="petik")
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true")
    ap.add_argument("--shot")
    a = ap.parse_args()
    s = keygen(a.name)
    if a.q:
        print(s); return
    print("Serial :", s, f"({len(s)} car.)")
    if a.check:
        exe = extract()
        print("OK     ->", run(exe, s, a.shot))
        print("KO 14  ->", run(exe, s[:-1]))
        print("KO 16  ->", run(exe, s + "x"))


if __name__ == "__main__":
    main()
