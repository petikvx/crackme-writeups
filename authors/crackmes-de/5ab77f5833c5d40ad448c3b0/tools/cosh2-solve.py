#!/usr/bin/env python3
"""crackme_2 by cosh (crackmes.de) — keygen.

Prédicat (handler du bouton CHECK, VA 0x4014B0) :
  len(Name)   > 5          (cmp eax,5 ; jle -> ERROR)
  len(Serial) > 5
  Serial[0:6] == "6287-A"  (6 cmp BYTE PTR [eax+i] : 36 32 38 37 2d 41)
Le serial ne dépend PAS du nom ; la suite après "6287-A" est libre.

Usage:
  cosh2-solve.py [-q] [--name petik123] [--check] [--live] [cosh2.zip|crackme2.exe]
  --check : relit les immediates du cmp dans le binaire et valide le couple
  --live  : preuve Wine (xvfb-run + xdotool), cherche la fenêtre « YOU DID IT »
Note : « petik » (5 car.) est refusé (len > 5 exigé) -> nom par défaut « petik123 ».
Ne modifie jamais original/.
"""
import argparse, io, os, subprocess, sys, tempfile, zipfile

HERE = os.path.dirname(os.path.abspath(__file__))
ROOT = os.path.dirname(HERE)
PREFIX = "6287-A"


def load(path):
    if zipfile.is_zipfile(path):
        with zipfile.ZipFile(path) as z:
            return z.read("crackme2.exe")
    return open(path, "rb").read()


def serial_for(name):
    return PREFIX + "-" + name


def valid(name, serial):
    return len(name) > 5 and len(serial) > 5 and serial.startswith(PREFIX)


def prefix_from_binary(exe):
    """Récupère le préfixe depuis les 6 `cmp BYTE PTR [eax(+i)],imm8` (VA 0x401513..)."""
    base = 0x1513
    out, p = b"", base
    for i in range(6):
        if i == 0:
            assert exe[p:p + 3] == b"\x80\x38" + exe[p + 2:p + 3], "cmp [eax],imm8 attendu"
            out += exe[p + 2:p + 3]; p += 5      # 80 38 ib ; 75 xx
        else:
            assert exe[p:p + 2] == b"\x80\x78", "cmp [eax+d],imm8 attendu"
            out += exe[p + 3:p + 4]; p += 6      # 80 78 d ib ; 75 xx
    return out.decode()


def live(name, serial, exe):
    d = tempfile.mkdtemp(prefix="cosh2-")
    p = os.path.join(d, "crackme2.exe")
    open(p, "wb").write(exe)
    script = f"""set -e
export WINEDEBUG=-all
wine '{p}' >/dev/null 2>&1 &
sleep 6
W=$(xdotool search --name Crackme2 | head -1)
xdotool windowfocus $W
xdotool mousemove --window $W 80 45 click 1; sleep .3; xdotool type --delay 50 '{name}'
xdotool mousemove --window $W 80 100 click 1; sleep .3; xdotool type --delay 50 '{serial}'
xdotool key Tab; sleep .2; xdotool key Return; sleep 2
xdotool search --name . getwindowname %@ 2>/dev/null | sort -u
"""
    r = subprocess.run(["xvfb-run", "-a", "-s", "-screen 0 1024x768x24", "bash", "-c", script],
                       capture_output=True, text=True, timeout=120)
    return "YOU DID IT" in r.stdout, r.stdout


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("binary", nargs="?", default=os.path.join(ROOT, "original", "cosh2.zip"))
    ap.add_argument("--name", default="petik123")
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true")
    ap.add_argument("--live", action="store_true")
    a = ap.parse_args()
    s = serial_for(a.name)
    if a.check or a.live:
        exe = load(a.binary)
        pre = prefix_from_binary(exe)
        assert pre == PREFIX, pre
        assert valid(a.name, s)
        assert not valid("petik", serial_for("petik"))
        if a.live:
            ok, out = live(a.name, s, exe)
            if not ok:
                print(out); sys.exit("live: KO")
            ko, _ = live(a.name, "6287-B-" + a.name, exe)
            assert not ko, "mauvais serial accepté ?!"
        if not a.q:
            print("check OK (préfixe lu dans le binaire =", pre + ")")
    if a.q:
        print(s)
    else:
        print(f"Name   : {a.name}\nSerial : {s}")


if __name__ == "__main__":
    main()
