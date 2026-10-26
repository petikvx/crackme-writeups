#!/usr/bin/env python3
"""Keygen Crackme#2 (VB5, Magenta[GD]).

serial = concaténation, pour chaque position i du nom (nom circulaire),
de (nxt - cur) en décimal quand nxt > cur (cur = Asc(name[i]),
nxt = Asc(name[(i+1) % n])).  Ex. petik -> 1525.

Usage : magenta2-solve.py [--user petik] [-q] [--check [--serial S] [--shot f.png]]
  --check : lance Crackme#2.exe sous Wine/Xvfb, pilote l'UI avec xdotool et
            détecte la MessageBox « Congratulations » (nécessite xdotool, Pillow).
"""
import argparse, os, subprocess, sys, time


def serial(name: str) -> str:
    n = len(name)
    out = ""
    for i in range(n):
        a, b = ord(name[i]), ord(name[(i + 1) % n])
        if b > a:
            out += str(b - a)
    return out


def check(exe, user, ser, shot):
    env = dict(os.environ, DISPLAY=":79", WINEDEBUG="-all")
    xv = subprocess.Popen(["Xvfb", ":79", "-screen", "0", "800x600x24"],
                          stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
    time.sleep(2)
    w = subprocess.Popen(["wine", exe], env=env,
                         stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
    try:
        time.sleep(8)
        x = lambda *a: subprocess.run(["xdotool", *a], env=env)
        x("mousemove", "60", "53", "click", "1"); x("type", "--delay", "60", user)
        x("mousemove", "60", "93", "click", "1"); x("type", "--delay", "60", ser)
        x("mousemove", "60", "133", "click", "1")
        time.sleep(3)
        from PIL import ImageGrab
        ImageGrab.grab(xdisplay=":79").save(shot)
        r = subprocess.run(["xdotool", "search", "--name", "Congratulations"],
                           env=env, capture_output=True, text=True)
        ok = bool(r.stdout.strip())
        print("screenshot ->", shot)
        print("VERDICT:", "OK (Congratulations)" if ok else "KO")
        return ok
    finally:
        w.kill(); subprocess.run(["wineserver", "-k"], env=env); xv.kill()


if __name__ == "__main__":
    p = argparse.ArgumentParser()
    p.add_argument("--user", default="petik")
    p.add_argument("-q", action="store_true")
    p.add_argument("--check", action="store_true")
    p.add_argument("--serial")
    p.add_argument("--exe", default=os.path.join(os.path.dirname(os.path.abspath(__file__)), "..", "analysis", "x", "Crackme#2.exe"))
    p.add_argument("--shot", default="/tmp/magenta2.png")
    a = p.parse_args()
    s = serial(a.user)
    print(s if a.q else f"user={a.user!r} serial={s!r}")
    if a.check:
        sys.exit(0 if check(a.exe, a.user, a.serial if a.serial is not None else s, a.shot) else 1)
