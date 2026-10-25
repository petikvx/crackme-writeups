#!/usr/bin/env python3
"""CrackMe by cr4ckd0r (VB.NET) : name/serial FIXES (pas de keygen).
Le bouton « Check It! » compare TextBox1 à "cr4ckd0r" puis TextBox2 à
"Crack me if you can!!!" (comparaison exacte, sensible à la casse).

  ./crackme1-cr4ckd0r-solve.py            -> affiche la paire
  ./crackme1-cr4ckd0r-solve.py -q         -> serial seul
  ./crackme1-cr4ckd0r-solve.py --check    -> preuve live (wine + xvfb + xdotool)
"""
import argparse, os, subprocess, sys, tempfile, time, zipfile

NAME, SERIAL = "cr4ckd0r", "Crack me if you can!!!"
HERE = os.path.dirname(os.path.abspath(__file__))
ZIP = os.path.join(HERE, "..", "original", "crackme.zip")

def run_case(exe, name, serial):
    """Lance l'exe sous Xvfb, saisit name/serial, renvoie le titre de la MsgBox."""
    env = dict(os.environ, DISPLAY=":97", WINEDEBUG="-all")
    xvfb = subprocess.Popen(["Xvfb", ":97", "-screen", "0", "1024x768x24"])
    time.sleep(1)
    try:
        p = subprocess.Popen(["wine", exe], env=env,
                             stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
        def xd(*a):
            return subprocess.run(["xdotool", *a], env=env, capture_output=True, text=True).stdout.strip()
        win = ""
        for _ in range(60):
            win = xd("search", "--name", "CrackMe by cr4ckd0r").split("\n")[0]
            if win: break
            time.sleep(1)
        if not win: return "NO-WINDOW"
        time.sleep(2)
        xd("windowfocus", win)
        # Tab order : TextBox1, TextBox2, Check It!
        xd("type", "--delay", "40", name); xd("key", "Tab")
        xd("type", "--delay", "40", serial); xd("key", "Tab"); time.sleep(.3)
        xd("key", "space")
        for _ in range(15):
            time.sleep(1)
            for t in ("good boy...", "bad boy..."):
                if xd("search", "--name", t): return t
        return "NO-MSGBOX"
    finally:
        subprocess.run(["wineserver", "-k"], env=env)
        xvfb.terminate(); time.sleep(1)

def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true")
    a = ap.parse_args()
    if a.q: print(SERIAL); return
    print(f"Name   : {NAME}\nSerial : {SERIAL}")
    if a.check:
        d = tempfile.mkdtemp()
        zipfile.ZipFile(ZIP).extractall(d, pwd=b"crackmes.one")
        exe = os.path.join(d, "crackme", "CrackMe by cr4ckd0r.exe")
        for n, s in ((NAME, SERIAL), ("petik", SERIAL), (NAME, "wrong")):
            print(f"{n!r:12} {s!r:26} -> {run_case(exe, n, s)}")

if __name__ == "__main__":
    main()
