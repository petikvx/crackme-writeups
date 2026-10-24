#!/usr/bin/env python3
"""crackmes.de Crackme02 (attilhaz, VB6 natif) — supprimer le NAG screen

Pas de serial : au démarrage, un handler d'événement VB (VA 0x4022e0) affiche
MsgBox("Remove Me", vbCritical, "NAG") avant la fenêtre principale.

Patch (offset fichier = VA - 0x400000, 3 octets) :
  0x22e0 : 55 8b ec  ->  c2 04 00      (prologue `push ebp; mov ebp,esp` -> `ret 4`)
Le handler est un stdcall à 1 argument (Me) : `ret 4` le court-circuite.

Usage : crackme02-solve.py [-e Crackme02.exe] [-o crackme02-patched.exe] [-q] [--check]
  --check : Xvfb+Wine ; l'exe patché ne doit montrer aucune fenêtre « NAG »,
            l'exe d'origine doit en montrer une (cas KO).
Le binaire d'origine n'est jamais modifié (le patch est écrit dans -o).
"""
import argparse, hashlib, os, subprocess, sys, tempfile, time, shutil

HERE = os.path.dirname(os.path.abspath(__file__))
DEF_EXE = os.path.join(HERE, "..", "analysis", "x", "Crackme02.exe")
OFF, OLD, NEW = 0x22E0, bytes.fromhex("558bec"), bytes.fromhex("c20400")


def patch(data):
    d = bytearray(data)
    assert d[OFF:OFF + 3] == OLD, f"octets inattendus @0x{OFF:x}: {d[OFF:OFF+3].hex()}"
    d[OFF:OFF + 3] = NEW
    return bytes(d)


def titles_after_start(exe):
    d = tempfile.mkdtemp(prefix="c02-")
    shutil.copy(exe, os.path.join(d, "c.exe"))
    env = dict(os.environ, DISPLAY=":97", WINEDEBUG="-all")
    xd = lambda *a: subprocess.run(["xdotool", *a], env=env, capture_output=True, text=True).stdout
    xvfb = subprocess.Popen(["Xvfb", ":97", "-screen", "0", "800x600x24"],
                            stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
    time.sleep(2)
    try:
        wine = subprocess.Popen(["wine", os.path.join(d, "c.exe")], env=env, cwd=d)
        time.sleep(9)
        t = [xd("getwindowname", w).strip() for w in xd("search", "--onlyvisible", "--name", ".").split()]
        wine.kill()
    finally:
        subprocess.run(["wineserver", "-k"], env=env)
        xvfb.kill(); xvfb.wait(); time.sleep(2)
        for f in ('/tmp/.X97-lock', '/tmp/.X11-unix/X97'):
            if os.path.exists(f): os.remove(f)
        shutil.rmtree(d, ignore_errors=True)
    return t


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("-e", "--exe", default=DEF_EXE)
    ap.add_argument("-o", "--out", default=os.path.join(HERE, "..", "analysis", "crackme02-patched.exe"))
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true")
    a = ap.parse_args()
    out = patch(open(a.exe, "rb").read())
    os.makedirs(os.path.dirname(os.path.abspath(a.out)), exist_ok=True)
    open(a.out, "wb").write(out)
    if a.q:
        print(a.out)
    else:
        print(f"patché -> {a.out} (sha256 {hashlib.sha256(out).hexdigest()})")
        print(f"  0x{OFF:04x}: {OLD.hex()} -> {NEW.hex()}")
    if a.check:
        ok = True
        for label, exe, want_nag in (("patché", a.out, False), ("origine", a.exe, True)):
            t = titles_after_start(exe)
            nag = "NAG" in t
            print(f"[{label}] fenêtres: {sorted(t)} -> NAG {'OUI' if nag else 'non'}")
            ok &= (nag == want_nag)
            if label == "patché":
                ok &= t.count("Crackme02") >= 2
        print("CHECK", "OK" if ok else "FAIL")
        sys.exit(0 if ok else 1)


if __name__ == "__main__":
    main()
