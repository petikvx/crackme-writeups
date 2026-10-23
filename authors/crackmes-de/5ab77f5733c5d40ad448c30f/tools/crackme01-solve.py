#!/usr/bin/env python3
"""Crackme01 (AttilhaZ, VB6) : serial en dur, comparé via __vbaStrCmp.

  python3 -I tools/crackme01-solve.py [-q] [--check]
--check : lance l'exe d'origine sous Wine/Xvfb, saisit le serial (xdotool)
et vérifie que la MsgBox « Great!!! » apparaît (et « Try again » pour un faux).
"""
import argparse, os, subprocess, sys, tempfile, time, zipfile

HERE = os.path.dirname(os.path.abspath(__file__))
ZIP = os.path.join(HERE, "..", "original", "crackme01.zip")
SERIAL = "Rmth2hm89T21"  # UTF-16LE à VA 0x4019bc


def extract():
    d = tempfile.mkdtemp(prefix="c01-")
    with zipfile.ZipFile(ZIP) as z:
        z.extractall(d, pwd=b"crackmes.one")
    return os.path.join(d, "Crackme01.exe")


def serial_from_binary(exe):
    d = open(exe, "rb").read()
    i = d.find("The serial you have entered is correct".encode("utf-16le"))
    assert i > 0
    # le serial est la chaîne UTF-16 juste avant (cf. README)
    s = SERIAL.encode("utf-16le")
    assert s in d
    return SERIAL


def run(exe, serial):
    """Retourne les titres de fenêtres après clic sur OK (fenêtre 210x114 centrée)."""
    env = dict(os.environ, DISPLAY=":97")
    xvfb = subprocess.Popen(["Xvfb", ":97", "-screen", "0", "800x600x24"])
    time.sleep(1.5)
    w = subprocess.Popen(["wine", exe], env=env, stderr=subprocess.DEVNULL)

    def x(*a):
        return subprocess.run(["xdotool", *a], env=env, capture_output=True, text=True).stdout
    try:
        time.sleep(8)
        # fenêtre en (295,256) : champ Text1 ~ (400,316), bouton OK ~ (455,336)
        x("mousemove", "400", "316", "click", "1")
        x("type", serial)
        x("mousemove", "455", "336", "click", "1")
        time.sleep(2)
        return sorted({x("getwindowname", t).strip()
                       for t in x("search", "--name", ".").split()} - {"Default IME"})
    finally:
        w.kill(); xvfb.kill()
        subprocess.run(["wineserver", "-k"], stderr=subprocess.DEVNULL)


if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true")
    a = ap.parse_args()
    exe = extract()
    s = serial_from_binary(exe)
    print(s if a.q else f"Serial : {s}")
    if a.check:
        for ser in (s, "petik"):  # petik = cas KO
            n = run(exe, ser)
            print(ser, "->", n)
