#!/usr/bin/env python3
"""crackmes.de Crackme07 (attilhaz, VB6 natif) — serial fixe (pas de nom)

Command1_Click @ VA 0x4023e0 :
  1) Check1.Value = 1 (sinon MsgBox « Error »)
  2) Text1.Text = "MnKt" & "Rkmoop" & "gHmKif"  (BSTR UTF-16 @ 0x401f60 / 0x401f70 / 0x401f84),
     comparé par __vbaStrCmp ; égal -> « Great!!! », sinon -> « Error ».
  (__vbaStrCat(a, b) : arg au sommet de pile = opérande droit ; l'ordre est donc MnKt+Rkmoop+gHmKif.)
Serial = MnKtRkmoopgHmKif.

Les contrôles (Check1, Text1, OK) sont désactivés dans les données de formulaire :
la preuve live utilise tools/enable-controls.c (EnableWindow, sans patch) compilé en
analysis/enable-controls.exe (i686-w64-mingw32-gcc).

Usage : crackme07-solve.py [-q] [--check [--exe Crackme07.exe]]
  --check : Xvfb + Wine (msvbvm60 natif requis, WINEPREFIX par défaut) + xdotool :
            bon serial -> MsgBox « Great!!! », mauvais -> MsgBox « Error ».
"""
import argparse, os, shutil, struct, subprocess, sys, tempfile, time

HERE = os.path.dirname(os.path.abspath(__file__))
DEF_EXE = os.path.join(HERE, "..", "analysis", "x", "Crackme07.exe")
ENABLER = os.path.join(HERE, "..", "analysis", "enable-controls.exe")
IMG, SEC = 0x401000, 0x1000       # VA 0x401000 <-> offset fichier 0x1000
PARTS = (0x401f60, 0x401f70, 0x401f84)   # opérandes dans l'ordre de concaténation


def bstr(d, va):
    o = va - IMG + SEC
    n = struct.unpack_from("<I", d, o - 4)[0]
    return d[o:o + n].decode("utf-16-le")


def keygen(exe=DEF_EXE):
    """Lit les 3 BSTR dans le binaire (fallback : MnKtRkmoopgHmKif)."""
    try:
        with open(exe, "rb") as f:
            d = f.read()
        return "".join(bstr(d, va) for va in PARTS)
    except OSError:
        return "MnKtRkmoopgHmKif"


def live(exe, serial, disp=":97"):
    """Titres des fenêtres visibles après clic sur OK."""
    d = tempfile.mkdtemp(prefix="c07-")
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
        subprocess.run(["wine", ENABLER], env=env, capture_output=True)   # active Check1/Text1/OK
        xd("mousemove", "314", "328", "click", "1")                       # coche « Check me »
        xd("mousemove", "400", "297", "click", "1")                       # Text1
        xd("key", "End", "shift+Home")                                    # (pas de Ctrl+A en VB6)
        xd("type", "--delay", "60", serial)
        xd("mousemove", "440", "327", "click", "1")                       # OK
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
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true")
    ap.add_argument("--exe", default=DEF_EXE)
    a = ap.parse_args()
    s = keygen(a.exe)
    print(s if a.q else f"serial={s}")
    if a.check:
        ok = True
        for label, ser, want in (("OK", s, "Great!!!"), ("KO", s[::-1], "Error")):
            t = live(a.exe, ser)
            got = want in t
            print(f"[{label}] serial={ser} fenêtres={sorted(t)} -> {'ok' if got else 'ECHEC'}")
            ok &= got
        print("CHECK", "OK" if ok else "FAIL")
        sys.exit(0 if ok else 1)


if __name__ == "__main__":
    main()
