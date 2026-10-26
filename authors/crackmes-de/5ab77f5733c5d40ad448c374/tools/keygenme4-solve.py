#!/usr/bin/env python3
"""Keygen pour KeyGenMe#4 (newhitman, Delphi 7 + skin SUIPack).

Trois « algorithmes » successifs (suiButton1Click @ 0x4834e4), flags radio à
l'état par défaut (non cochés) :
  1. serial1 = n[-1] n[1] n[-2] n[2] n[-3]          (5 caractères)
  2. serial2 = hex(n[0]) hex(n[-3]) hex(n[1])      (6 hex digits ; hex(n[-2]) en tête
               seulement si le flag Algorithm2 est coché et len(serial)==8)
  3. serial3 = (0 + 0x999) * 0x1111 = 10734633      (indépendant du nom)

Usage :
  keygenme4-solve.py [--name petik] [-q] [--check]
--check : lance le binaire d'origine sous Wine + Xvfb + xdotool et vérifie que
          le titre passe à {REGISTERED} (screenshot -> analysis/screenshot-ok.png).
"""
import argparse, os, subprocess, sys, time, shutil

HERE = os.path.dirname(os.path.abspath(__file__))
ROOT = os.path.dirname(HERE)


def serials(name: str):
    if len(name) < 3:
        raise SystemExit("name: 3 caractères minimum")
    n = name.encode("latin-1")
    s1 = bytes([n[-1], n[1], n[-2], n[2], n[-3]]).decode("latin-1")
    s2 = "".join("%X" % b for b in (n[0], n[-3], n[1]))
    s3 = str((0 + 0x999) * 0x1111 & 0xFFFFFFFF)
    return s1, s2, s3


def check(name, shot=None):
    import tempfile
    exe = os.path.join(ROOT, "analysis", "extracted", "KeyGenMe#4.exe")
    if not os.path.exists(exe):
        import zipfile
        os.makedirs(os.path.dirname(exe), exist_ok=True)
        with zipfile.ZipFile(os.path.join(ROOT, "original", "KeyGenMe#4.zip")) as z:
            z.extract("KeyGenMe#4.exe", os.path.dirname(exe))
    disp = ":79"
    env = dict(os.environ, DISPLAY=disp, WINEDEBUG="-all")
    xvfb = subprocess.Popen(["Xvfb", disp, "-screen", "0", "1024x768x24"],
                            stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
    time.sleep(2)
    x = lambda *a: subprocess.run(["xdotool", *a], env=env, capture_output=True, text=True).stdout.strip()
    wine = subprocess.Popen(["wine", exe], env=env, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
    try:
        win = ""
        for _ in range(40):
            time.sleep(1)
            win = x("search", "--name", "KeyGenMe#4")
            if win:
                win = win.split()[-1]
                break
        time.sleep(2)
        g = x("getwindowgeometry", "--shell", win)
        geo = dict(l.split("=") for l in g.splitlines())
        ox, oy = int(geo["X"]), int(geo["Y"])
        fill = lambda dx, dy, txt: (x("mousemove", str(ox + dx), str(oy + dy), "click", "1"),
                                    x("key", "End"), x("key", "--repeat", "30", "BackSpace"),
                                    x("type", "--delay", "30", txt))
        ok = True
        for s in serials(name):
            fill(220, 72, name)
            fill(220, 105, s)
            x("mousemove", str(ox + 307), str(oy + 142), "click", "1")
            time.sleep(1)
        title = x("getwindowname", win)
        print("titre fenêtre :", title)
        if shot:
            from PIL import ImageGrab
            ImageGrab.grab(xdisplay=disp).crop((ox - 10, oy - 10, ox + 390, oy + 255)).save(shot)
        return "{REGISTERED}" in title
    finally:
        wine.kill(); subprocess.run(["wineserver", "-k"], env=env)
        xvfb.kill()


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--name", default="petik")
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true")
    a = ap.parse_args()
    s = serials(a.name)
    if a.q:
        print(s[2])
    else:
        print(f"name   : {a.name}")
        for i, v in enumerate(s, 1):
            print(f"serial{i}: {v}")
    if a.check:
        shot = os.path.join(ROOT, "analysis", "screenshot-ok.png")
        r = check(a.name, shot)
        print("CHECK:", "OK" if r else "KO")
        sys.exit(0 if r else 1)


if __name__ == "__main__":
    main()
