#!/usr/bin/env python3
"""Keygen EViDENCE crackme #2 (GiveMe5, PE32 GUI, asm pur).

total  = sum(c + 47)  sur TOUS les caractères du nom (espaces inclus, nom <= 40 car.)
serial = ((total*total + 2) ^ (total + 0x1a0b)) - 0x308      (mod 2^32, écrit en décimal)

Usage : evd2-solve.py [--user petik] [-q] [--check] [--serial N] [--exe PATH]
  --check : lance evdcm2.exe sous Wine/Xvfb, pilote l'UI avec xdotool, capture l'écran.
"""
import argparse, os, subprocess, sys, time

HERE = os.path.dirname(os.path.abspath(__file__))


def serial(name: str) -> int:
    if len(name) > 40:
        raise SystemExit("nom : 40 caractères max (GetDlgItemText n=0x29)")
    total = sum(c + 47 for c in name.encode("latin1")) & 0xFFFFFFFF
    sq = (total * total) & 0xFFFFFFFF
    return (((sq + 2) ^ (total + 0x1A0B)) - 0x308) & 0xFFFFFFFF


def check(exe, user, ser, shot, disp=":79"):
    env = dict(os.environ, DISPLAY=disp, WINEDEBUG="-all")
    xv = subprocess.Popen(["Xvfb", disp, "-screen", "0", "800x600x24"],
                          stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
    time.sleep(2)
    w = subprocess.Popen(["wine", exe], env=env, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
    try:
        time.sleep(6)
        x = lambda *a: subprocess.run(["xdotool", *a], env=env)
        # champs Name (420,313) / Serial (420,340) ; on vide le champ Name avant de saisir
        x("mousemove", "420", "313", "click", "1")
        x("key", "End"); x("key", "--repeat", "20", "BackSpace")   # vide « GiveMe5 »
        x("type", "--delay", "80", user)
        x("mousemove", "420", "340", "click", "1")
        x("type", "--delay", "80", str(ser))
        from PIL import ImageGrab
        ImageGrab.grab(xdisplay=disp).save(shot + ".before.png")
        x("mousemove", "383", "365", "click", "1")      # bouton check
        time.sleep(3)
        ImageGrab.grab(xdisplay=disp).save(shot)
        print("screenshot ->", shot)
    finally:
        w.kill(); subprocess.run(["wineserver", "-k"], env=env); xv.kill()


if __name__ == "__main__":
    p = argparse.ArgumentParser()
    p.add_argument("--user", "--name", dest="user", default="petik")
    p.add_argument("-q", action="store_true")
    p.add_argument("--check", action="store_true")
    p.add_argument("--serial", help="serial à tester avec --check (défaut : le bon)")
    p.add_argument("--exe", default=os.path.join(HERE, "..", "analysis", "x", "evdcm2.exe"))
    p.add_argument("--shot", default="/tmp/evd2.png")
    a = p.parse_args()
    s = serial(a.user)
    print(s if a.q else f"name={a.user!r} serial={s}")
    if a.check:
        check(a.exe, a.user, a.serial if a.serial is not None else s, a.shot)
