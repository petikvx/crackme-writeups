#!/usr/bin/env python3
"""crackmes.de Crackme20 (attilhaz, VB6 natif) — keygen name -> serial

Command1_Click @ VA 0x402780 : serial = EncryptPassword(Text1.Text, key=10) comparé à Text2.Text.
EncryptPassword @ VA 0x402430 : pour i = 1..Len(name) (i = compteur Byte) :
    c = Asc(Mid(name, i, 1))
    c = c + key  (i impair)  |  c - key  (i pair)
    c = c Xor (10 - key)          # key=10 -> Xor 0
    si c < 0x65 : c += 0x21
    c += 0x0a                     # (le test « = 0x5b » est toujours vrai : -1|0x7f, 0x7f -> non nul)
    si c > 0x7a : c -= 0x21
    out &= Chr(c)

Usage : crackme20-solve.py [--name petik] [-q] [--check [--exe Crackme20.exe]]
  --check : Xvfb + Wine + xdotool : bon serial -> MsgBox « Congrats!!! », mauvais -> « Error ».
"""
import argparse, os, shutil, subprocess, sys, tempfile, time

HERE = os.path.dirname(os.path.abspath(__file__))
DEF_EXE = os.path.join(HERE, "..", "analysis", "x", "Crackme20.exe")
KEY = 10


def keygen(name, key=KEY):
    out = []
    for i, ch in enumerate(name, 1):
        c = ord(ch)
        c = c + key if i & 1 else c - key
        c ^= 10 - key
        if c < 0x65:
            c += 0x21
        c += 0x0a
        if c > 0x7a:
            c -= 0x21
        out.append(chr(c))
    return "".join(out)


def live(exe, name, serial, disp=":97"):
    """Titres des fenêtres visibles après clic sur Check."""
    d = tempfile.mkdtemp(prefix="c20-")
    shutil.copy(exe, os.path.join(d, "c.exe"))
    env = dict(os.environ, DISPLAY=disp, WINEDEBUG="-all")
    xd = lambda *a: subprocess.run(["xdotool", *a], env=env, capture_output=True, text=True).stdout
    xvfb = subprocess.Popen(["Xvfb", disp, "-screen", "0", "800x600x24"],
                            stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
    time.sleep(2)
    try:
        wine = subprocess.Popen(["wine", os.path.join(d, "c.exe")], env=env, cwd=d,
                                stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
        time.sleep(8)
        xd("mousemove", "327", "290", "click", "1")      # Text1 (Name)
        xd("type", "--delay", "60", name)
        xd("mousemove", "327", "330", "click", "1")      # Text2 (Serial)
        xd("type", "--delay", "60", serial)
        xd("mousemove", "467", "362", "click", "1")      # Check
        time.sleep(2)
        t = [xd("getwindowname", w).strip() for w in xd("search", "--onlyvisible", "--name", ".").split()]
        wine.kill()
    finally:
        subprocess.run(["pkill", "-f", os.path.join(d, "c.exe")])
        xvfb.kill(); xvfb.wait(); time.sleep(1)
        for f in ("/tmp/.X%s-lock" % disp[1:], "/tmp/.X11-unix/X%s" % disp[1:]):
            if os.path.exists(f): os.remove(f)
        shutil.rmtree(d, ignore_errors=True)
    return t


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--name", default="petik")
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true")
    ap.add_argument("--exe", default=DEF_EXE)
    a = ap.parse_args()
    s = keygen(a.name)
    print(s if a.q else f"name={a.name} serial={s}")
    if a.check:
        ok = True
        for label, ser, want in (("OK", s, "Congrats!!!"), ("KO", s[::-1] + "x", "Error")):
            t = live(a.exe, a.name, ser)
            got = want in t
            print(f"[{label}] serial={ser} fenêtres={sorted(t)} -> {'ok' if got else 'ECHEC'}")
            ok &= got
        print("CHECK", "OK" if ok else "FAIL")
        sys.exit(0 if ok else 1)


if __name__ == "__main__":
    main()
