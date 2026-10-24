#!/usr/bin/env python3
"""crackmes.de Crackme22 (attilhaz, VB6 natif) — keygen name -> serial

EncryptPassword(Byte=10, ByRef name) @ VA 0x402450 :
  pour i = 1..Len(name) :  c = Asc(Mid(name, i, 1))
      i impair : v = (c + 10) xor (10 - 10)      = c + 10
      i pair   : v = (c - 10) xor (10 - 10)      = c - 10
      serial &= CStr(v)            (concaténation décimale, sans séparateur)
Le Byte 10 est passé par le handler du bouton Check (0x402760, __vbaUI1I2(10)).

Usage : crackme22-solve.py [name] [-q] [--check [--exe Crackme22.exe]]
  défaut name = petik -> 1229112695117 ; max 13 caractères (label « Name (max 13) »).
  --check : Xvfb + Wine + xdotool : tape name/serial, clique Check, lit le titre de la
            MsgBox ("Congrats!!!" = bon, "Error" = mauvais). Cas OK et KO.
"""
import argparse, os, shutil, subprocess, sys, tempfile, time

HERE = os.path.dirname(os.path.abspath(__file__))
DEF_EXE = os.path.join(HERE, "..", "analysis", "x", "Crackme22.exe")
X = 10


def keygen(name):
    out = ""
    for i, ch in enumerate(name, 1):
        c = ord(ch)
        v = (c + X) if i & 1 else (c - X)
        out += str(v ^ (10 - X))
    return out


def live(exe, name, serial):
    """Retourne les titres des fenêtres visibles après clic sur Check."""
    d = tempfile.mkdtemp(prefix="c22-")
    shutil.copy(exe, os.path.join(d, "c.exe"))
    env = dict(os.environ, DISPLAY=":95", WINEDEBUG="-all")
    xd = lambda *a: subprocess.run(["xdotool", *a], env=env, capture_output=True, text=True).stdout
    xvfb = subprocess.Popen(["Xvfb", ":95", "-screen", "0", "800x600x24"],
                            stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
    time.sleep(2)
    try:
        wine = subprocess.Popen(["wine", os.path.join(d, "c.exe")], env=env, cwd=d)
        time.sleep(8)
        main = [w for w in xd("search", "--onlyvisible", "--name", "^Crackme22$").split()
                if "250x149" in xd("getwindowgeometry", w)][0]
        xd("windowfocus", main)
        # ordre de tabulation : Text1 (name) -> Text2 (serial) -> Command1 (Check)
        xd("type", "--delay", "80", name); xd("key", "Tab")
        xd("type", "--delay", "80", serial); xd("key", "Tab"); xd("key", "space")
        time.sleep(2)
        t = [xd("getwindowname", w).strip() for w in xd("search", "--onlyvisible", "--name", ".").split()]
        wine.kill()
    finally:
        subprocess.run(["wineserver", "-k"], env=env)
        xvfb.kill(); xvfb.wait(); time.sleep(2)
        for f in ('/tmp/.X95-lock', '/tmp/.X11-unix/X95'):
            if os.path.exists(f): os.remove(f)
        shutil.rmtree(d, ignore_errors=True)
    return t


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("name", nargs="?", default="petik")
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true")
    ap.add_argument("--exe", default=DEF_EXE)
    a = ap.parse_args()
    if len(a.name) > 13:
        sys.exit("name > 13 caractères")
    s = keygen(a.name)
    print(s if a.q else f"name={a.name} -> serial={s}")
    if a.check:
        ok = True
        for label, ser, want in (("OK", s, "Congrats!!!"), ("KO", s + "1", "Error")):
            t = live(a.exe, a.name, ser)
            got = want in t
            print(f"[{label}] serial={ser} fenêtres={sorted(t)} -> {'ok' if got else 'ECHEC'}")
            ok &= got
        print("CHECK", "OK" if ok else "FAIL")
        sys.exit(0 if ok else 1)


if __name__ == "__main__":
    main()
