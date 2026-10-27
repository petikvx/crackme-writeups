#!/usr/bin/env python3
"""crackme_3 by cosh (crackmes.de) — keygen name->serial.

Prédicat (handler CHECK, VA 0x4014B0), len(Name) > 5 et len(Serial) > 5 :
  A[i] = Name[i]   ^ (1  + i)     (boucle 0x401580, cl part de 1)
  B[j] = Serial[j] ^ (10 + j)     (boucle 0x40159d, cl part de 0xa)
  OK  <=>  A == B sur len(Name) octets  (boucle 0x4015b0 s'arrête à la fin de A)
=> Serial[i] = Name[i] ^ (1+i) ^ (10+i)   (suffixe éventuel libre).

Usage:
  cosh3-solve.py [-q] [--name petik123] [--check] [--live] [cosh3.zip|crackme3.exe]
  --check : relit les constantes (1, 0xa) dans le binaire
  --live  : preuve Wine (xvfb-run + xdotool) : OK et KO
Note : « petik » (5 car.) est refusé (len > 5) -> défaut « petik123 ». Ne modifie jamais original/.
"""
import argparse, os, subprocess, sys, tempfile, zipfile

HERE = os.path.dirname(os.path.abspath(__file__))
ROOT = os.path.dirname(HERE)


def load(path):
    if zipfile.is_zipfile(path):
        with zipfile.ZipFile(path) as z:
            return z.read("crackme3.exe")
    return open(path, "rb").read()


def serial_for(name):
    return "".join(chr(ord(c) ^ (1 + i) ^ (10 + i)) for i, c in enumerate(name))


def valid(name, serial):
    if len(name) <= 5 or len(serial) <= 5:
        return False
    a = [ord(c) ^ (1 + i) for i, c in enumerate(name)]
    b = [ord(c) ^ (10 + i) for i, c in enumerate(serial)]
    return b[:len(a)] == a


def consts_from_binary(exe):
    # 0x401576: mov ecx,1 ; 0x401593: mov ecx,0xa   (b9 imm32)
    assert exe[0x1576:0x157b] == b"\xb9\x01\x00\x00\x00", "mov ecx,1 attendu"
    assert exe[0x1593:0x1598] == b"\xb9\x0a\x00\x00\x00", "mov ecx,0xa attendu"
    return 1, 0xA


def live(name, serial, exe):
    d = tempfile.mkdtemp(prefix="cosh3-")
    p = os.path.join(d, "crackme3.exe")
    open(p, "wb").write(exe)
    # xdotool type : on échappe via un fichier d'args
    script = f"""set -e
export WINEDEBUG=-all
wine "$1" >/dev/null 2>&1 &
sleep 6
W=$(xdotool search --name Crackme3 | head -1)
xdotool windowfocus $W
xdotool mousemove --window $W 80 45 click 1; sleep .3; xdotool type --delay 50 -- "$2"
xdotool mousemove --window $W 80 100 click 1; sleep .3; xdotool type --delay 50 -- "$3"
xdotool key Tab; sleep .2; xdotool key Return; sleep 2
xdotool search --name . getwindowname %@ 2>/dev/null | sort -u
"""
    r = subprocess.run(["xvfb-run", "-a", "-s", "-screen 0 1024x768x24", "bash", "-c", script,
                        "bash", p, name, serial], capture_output=True, text=True, timeout=120)
    return "YOU DID IT" in r.stdout, r.stdout


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("binary", nargs="?", default=os.path.join(ROOT, "original", "cosh3.zip"))
    ap.add_argument("--name", default="petik123")
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true")
    ap.add_argument("--live", action="store_true")
    a = ap.parse_args()
    s = serial_for(a.name)
    if a.check or a.live:
        exe = load(a.binary)
        assert consts_from_binary(exe) == (1, 10)
        assert valid(a.name, s)
        assert not valid("petik", serial_for("petik"))
        if a.live:
            ok, out = live(a.name, s, exe)
            if not ok:
                print(out); sys.exit("live: KO")
            ko, _ = live(a.name, s[:-1] + chr(ord(s[-1]) ^ 1), exe)
            assert not ko, "mauvais serial accepté ?!"
        if not a.q:
            print("check OK")
    print(s if a.q else f"Name   : {a.name}\nSerial : {s}")


if __name__ == "__main__":
    main()
