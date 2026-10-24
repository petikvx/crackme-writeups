#!/usr/bin/env python3
"""Crackme21 (AttilhaZ, VB6 natif) : keygen name -> serial.

  python3 -I tools/crackme21-solve.py [-q] [--user petik] [--check]
--check : lance l'exe d'origine sous Wine/Xvfb (xdotool), saisit nom + serial,
vérifie la MsgBox « Right serial » (et « Wrong serial » pour un serial faux).

EncryptPassword(nom, clé=10) @0x402580 :
  pour i = 1..len : a = Asc(nom[i]) + 10 (i impair) ou - 10 (i pair) ; a ^= (10-clé)=0 ;
  normalisation dans 'A'..'Z' (boucle +0x21 / -0x20) ; un '-' est ajouté toutes
  les 3 itérations (compteur caché Text3) avant le caractère courant.
"""
import argparse, os, subprocess, tempfile, time, zipfile

HERE = os.path.dirname(os.path.abspath(__file__))
ZIP = os.path.join(HERE, "..", "original", "crackme21.zip")
KEY = 10


def keygen(name, key=KEY):
    acc, cnt = "", 0
    for i, ch in enumerate(name, 1):
        cnt += 1
        if cnt == 3:               # Text3 == "3" -> reset + '-'
            cnt = 0
            acc += "-"
        a = ord(ch) + key if i & 1 else ord(ch) - key
        a ^= 10 - key
        while True:                # 0x40284a..0x40286a
            if a < 0x41:
                a += 0x21
            if a <= 0x5A:
                break
            a -= 0x20
        acc += chr(a)
    return acc


def extract():
    d = tempfile.mkdtemp(prefix="c21-")
    with zipfile.ZipFile(ZIP) as z:
        z.extractall(d, pwd=b"crackmes.one")
    return os.path.join(d, "Crackme21.exe")


def run(exe, name, serial, shot=None):
    env = dict(os.environ, DISPLAY=":97")
    xvfb = subprocess.Popen(["Xvfb", ":97", "-screen", "0", "800x600x24"])
    time.sleep(1.5)
    w = subprocess.Popen(["wine", exe], env=env, stderr=subprocess.DEVNULL)

    def x(*a):
        return subprocess.run(["xdotool", *a], env=env, capture_output=True, text=True).stdout
    try:
        time.sleep(8)
        for (px, py), txt in ((("400", "290"), name), (("400", "330"), serial)):
            x("mousemove", px, py, "click", "1", "key", "End")
            for _ in range(30):
                x("key", "BackSpace")
            x("type", txt)
        x("mousemove", "467", "361", "click", "1")
        time.sleep(2)
        if shot:
            subprocess.run(["ffmpeg", "-loglevel", "error", "-y", "-f", "x11grab",
                            "-video_size", "800x600", "-i", ":97", "-frames:v", "1", shot], env=env)
        return sorted({x("getwindowname", t).strip()
                       for t in x("search", "--name", ".").split()} - {"Default IME"})
    finally:
        w.kill(); xvfb.kill()
        subprocess.run(["wineserver", "-k"], stderr=subprocess.DEVNULL)


if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--user", default="petik")
    ap.add_argument("--check", action="store_true")
    a = ap.parse_args()
    s = keygen(a.user)
    print(s if a.q else f"{a.user} -> {s}")
    if a.check:
        exe = extract()
        shots = os.path.join(HERE, "..", "analysis")
        print("OK  :", run(exe, a.user, s, os.path.join(shots, "screenshot-ok.png")))
        print("KO  :", run(exe, a.user, s[::-1] + "Q", os.path.join(shots, "screenshot-ko.png")))
