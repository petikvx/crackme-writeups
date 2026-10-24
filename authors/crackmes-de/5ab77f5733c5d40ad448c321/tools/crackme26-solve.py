#!/usr/bin/env python3
"""crackmes.de Crackme26 (attilhaz, VB6 natif) — serial fixe (pas de nom)

Menu « ? » > Register : Check_Click @ VA 0x4106a0 :
  1) Text1.Text <> ""  puis garde anti-debug : Timer(1) puis Timer(2) comparés (__vbaVarTstNe) ;
     différents -> MsgBox « Error. A debugger is loading... »
  2) Val(Text1.Text) <> 360119036.0  (double @ 0x401138 : 00 00 00 fc fa 76 b5 41)
     -> MsgBox titre « Try again », texte « Wrong serial. » ; sinon « Good / Correct serial ».
Serial = 360119036 (toute saisie dont Val() vaut 360119036 passe, ex. « 360119036abc »).

Usage : crackme26-solve.py [-q] [--check [--exe Crackme26.exe]]
  --check : Xvfb + Wine + xdotool : menu ? > Register, tape le serial, Check ;
            bon serial -> MsgBox « Good », serial+"1" -> MsgBox « Try again ».
"""
import argparse, os, shutil, struct, subprocess, sys, tempfile, time

HERE = os.path.dirname(os.path.abspath(__file__))
DEF_EXE = os.path.join(HERE, "..", "analysis", "x", "Crackme26.exe")
CONST_OFF = 0x1138  # offset fichier du double comparé à Val(Text1.Text) (VA 0x401138)


def keygen(exe=DEF_EXE):
    """Lit la constante directement dans le binaire (fallback : 360119036)."""
    try:
        with open(exe, "rb") as f:
            f.seek(CONST_OFF)
            return str(int(struct.unpack("<d", f.read(8))[0]))
    except OSError:
        return "360119036"


def live(exe, serial):
    """Titres des fenêtres visibles après clic sur Check."""
    d = tempfile.mkdtemp(prefix="c26-")
    shutil.copy(exe, os.path.join(d, "c.exe"))
    env = dict(os.environ, DISPLAY=":95", WINEDEBUG="-all")
    xd = lambda *a: subprocess.run(["xdotool", *a], env=env, capture_output=True, text=True).stdout
    xvfb = subprocess.Popen(["Xvfb", ":95", "-screen", "0", "800x600x24"],
                            stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
    time.sleep(2)
    try:
        wine = subprocess.Popen(["wine", os.path.join(d, "c.exe")], env=env, cwd=d)
        time.sleep(8)
        main = [w for w in xd("search", "--onlyvisible", "--name", "^Crackme26$").split()
                if "399x194" in xd("getwindowgeometry", w)][0]
        xd("windowfocus", main)
        xd("mousemove", "238", "226", "click", "1"); time.sleep(1)   # menu « ? »
        xd("mousemove", "262", "264", "click", "1"); time.sleep(3)   # « Register »
        reg = xd("search", "--onlyvisible", "--name", "^Register$").split()[0]
        xd("windowfocus", reg)
        xd("mousemove", "400", "300", "click", "1")                  # champ « Insert serial »
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
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true")
    ap.add_argument("--exe", default=DEF_EXE)
    a = ap.parse_args()
    s = keygen(a.exe)
    print(s if a.q else f"serial={s}")
    if a.check:
        ok = True
        for label, ser, want in (("OK", s, "Good"), ("KO", s + "1", "Try again")):
            t = live(a.exe, ser)
            got = want in t
            print(f"[{label}] serial={ser} fenêtres={sorted(t)} -> {'ok' if got else 'ECHEC'}")
            ok &= got
        print("CHECK", "OK" if ok else "FAIL")
        sys.exit(0 if ok else 1)


if __name__ == "__main__":
    main()
