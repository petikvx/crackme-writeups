#!/usr/bin/env python3
"""Keygen Crackme#1 (VB5, Magenta[GD]) : serial = chaque caractère du nom + 1.

Usage : magenta1-solve.py [--user petik] [-q] [--check]
  --check : lance le binaire sous Wine (xvfb) et pilote l'UI avec xdotool
            (arg --exe pour le chemin de Crackme#1.exe extrait du zip).
"""
import argparse, os, subprocess, sys, time


def serial(name: str) -> str:
    return "".join(chr(ord(c) + 1) for c in name)


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
        x("mousemove", "140", "40", "click", "1"); x("type", "--delay", "60", user)
        x("mousemove", "140", "63", "click", "1"); x("type", "--delay", "60", ser)
        x("mousemove", "140", "90", "click", "1")
        time.sleep(3)
        from PIL import ImageGrab
        ImageGrab.grab(xdisplay=":79").save(shot)
        print("screenshot ->", shot)
    finally:
        w.kill(); subprocess.run(["wineserver", "-k"], env=env); xv.kill()


if __name__ == "__main__":
    p = argparse.ArgumentParser()
    p.add_argument("--user", default="petik")
    p.add_argument("-q", action="store_true")
    p.add_argument("--check", action="store_true")
    p.add_argument("--serial", help="serial à tester avec --check (défaut : le bon)")
    p.add_argument("--exe", default=os.path.join(os.path.dirname(__file__), "..", "analysis", "x", "Crackme#1.exe"))
    p.add_argument("--shot", default="/tmp/magenta1.png")
    a = p.parse_args()
    s = serial(a.user)
    print(s if a.q else f"user={a.user!r} serial={s!r}")
    if a.check:
        check(a.exe, a.user, a.serial if a.serial is not None else s, a.shot)
