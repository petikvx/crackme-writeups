#!/usr/bin/env python3
"""crackmes.de Crackme08 (attilhaz, VB6 natif) — patch des 3 niveaux

Le crackme n'a aucun serial : chaque « niveau » est un contrôle désactivé dans
la ressource de la Form1 (VB5! form binaire, dans .text). Les handlers de clic
affichent juste « LevelXX complete!!! ». Résoudre = « enable all levels ».

Patchs (offsets fichier dans Crackme08.exe) :
  0x1322 : 0x00 -> 0x01  (Command1 « Enable Me - Level01 » : propriété Enabled=False -> True)
  0x138e : 0x05 -> 0x07  (menu Level02 : bit Enabled)
  0x13c5 : 0x05 -> 0x07  (sous-menu « Enable me03 » : bit Enabled)

Usage : crackme08-solve.py [-e Crackme08.exe] [-o crackme08-patched.exe] [-q]
        [--check]
  --check : lance l'exe patché sous Xvfb+Wine, clique Level01 / Level02 /
            Level03>Enable me03 et vérifie les titres des MsgBox ; vérifie
            aussi que l'exe d'origine laisse tout désactivé (cas KO).
Le binaire d'origine n'est jamais modifié (le patch est écrit dans -o).
"""
import argparse, hashlib, os, shutil, subprocess, sys, tempfile, time

HERE = os.path.dirname(os.path.abspath(__file__))
DEF_EXE = os.path.join(HERE, "..", "analysis", "x", "Crackme08.exe")
PATCHES = [(0x1322, 0x00, 0x01), (0x138E, 0x05, 0x07), (0x13C5, 0x05, 0x07)]
SHA_ORIG = None  # affiché seulement


def patch(data):
    d = bytearray(data)
    for off, old, new in PATCHES:
        assert d[off] == old, f"octet inattendu @0x{off:x}: {d[off]:02x}"
        d[off] = new
    return bytes(d)


def session(exe, actions):
    """lance exe sous Xvfb, applique les clics, renvoie les titres de fenêtres vus"""
    d = tempfile.mkdtemp(prefix="c08-")
    shutil.copy(exe, os.path.join(d, "c.exe"))
    env = dict(os.environ, DISPLAY=":96", WINEDEBUG="-all")
    xd = lambda *a: subprocess.run(["xdotool", *a], env=env, capture_output=True, text=True).stdout
    xvfb = subprocess.Popen(["Xvfb", ":96", "-screen", "0", "800x600x24"],
                            stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
    time.sleep(2)
    seen = []
    try:
        wine = subprocess.Popen(["wine", os.path.join(d, "c.exe")], env=env, cwd=d)
        time.sleep(10)
        for name, clicks in actions:
            for x, y in clicks:
                xd("mousemove", str(x), str(y), "click", "1")
                time.sleep(1)
            titles = set()
            for w in xd("search", "--onlyvisible", "--name", ".").split():
                titles.add(xd("getwindowname", w).strip())
            seen.append((name, titles))
            xd("key", "Return"); time.sleep(0.7)       # ferme la MsgBox
            xd("key", "Escape"); time.sleep(0.3)
        wine.kill()
    finally:
        subprocess.run(["wineserver", "-k"], env=env)
        xvfb.kill(); xvfb.wait()
        time.sleep(2)
        for f in ('/tmp/.X96-lock', '/tmp/.X11-unix/X96'):
            if os.path.exists(f): os.remove(f)
        shutil.rmtree(d, ignore_errors=True)
    return seen


ACTIONS = [("Level01", [(398, 308)]),
           ("Level02", [(348, 272)]),
           ("Level03", [(400, 272), (425, 292)])]


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("-e", "--exe", default=DEF_EXE)
    ap.add_argument("-o", "--out", default=os.path.join(HERE, "..", "analysis", "crackme08-patched.exe"))
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true")
    a = ap.parse_args()
    data = open(a.exe, "rb").read()
    out = patch(data)
    os.makedirs(os.path.dirname(os.path.abspath(a.out)), exist_ok=True)
    open(a.out, "wb").write(out)
    if a.q:
        print(a.out)
    else:
        print(f"patché -> {a.out} (sha256 {hashlib.sha256(out).hexdigest()})")
        for off, old, new in PATCHES:
            print(f"  0x{off:04x}: {old:02x} -> {new:02x}")
    if a.check:
        ok = True
        for label, exe, want in (("patché", a.out, True), ("origine", a.exe, False)):
            for name, titles in session(exe, ACTIONS):
                hit = name in titles
                print(f"[{label}] {name}: MsgBox {'OUI' if hit else 'non'} {sorted(titles)}")
                ok &= (hit == want and "Crackme08" in titles)
        print("CHECK", "OK" if ok else "FAIL")
        sys.exit(0 if ok else 1)


if __name__ == "__main__":
    main()
