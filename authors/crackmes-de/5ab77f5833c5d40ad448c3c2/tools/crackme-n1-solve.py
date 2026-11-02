#!/usr/bin/env python3
"""ByteL0rd Crackme_n1 (mp2k) — keygen name -> (serial, key).

Usage: crackme-n1-solve.py [--name petik] [--regkey 111-111-111-A] [-q]
                           [--check [path/to/crackme_1.exe]]
Le crackme a 3 champs : Name (>=5), RegKey (DDD-DDD-DDD-L), Serial (5 chiffres 1-9).
"""
import argparse, os, shutil, subprocess, sys, time

W = (10, 9, 8, 7, 6, 5, 4, 3, 2)   # poids des 9 chiffres du serial


def popcount_name(name):           # 0x40566c : nb de '1' dans bin(sum(name))
    return bin(sum(map(ord, name)))[2:].count("1") if sum(map(ord, name)) else 0


def serial_value(serial):          # 0x405670
    if len(serial) != 13 or serial[3] != "-" or serial[7] != "-" or serial[11] != "-":
        raise ValueError("serial: DDD-DDD-DDD-L")
    digs = serial[0:3] + serial[4:7] + serial[8:11]
    if any(c not in "123456789" for c in digs) or not "A" <= serial[12] <= "Z":
        raise ValueError("digits 1-9, last char A-Z")
    return sum(int(d) * w for d, w in zip(digs, W)) + (ord(serial[12]) & 1)


def fpow(v, n):
    """v^n comme fmul x87 (mantisse 64 bits, round-nearest-even) puis fistp int64."""
    from fractions import Fraction
    x = Fraction(1)
    for _ in range(n):
        x *= v
        if x:                       # arrondi mantisse 64 bits
            e = x.numerator.bit_length() - x.denominator.bit_length()
            sh = 63 - e
            m = x * (Fraction(2) ** sh)
            while m >= 2 ** 64: sh -= 1; m = x * (Fraction(2) ** sh)
            while m < 2 ** 63: sh += 1; m = x * (Fraction(2) ** sh)
            fl = m.numerator // m.denominator
            r = m - fl
            fl += 1 if (r > Fraction(1, 2) or (r == Fraction(1, 2) and fl & 1)) else 0
            x = Fraction(fl) / (Fraction(2) ** sh)
    i = x.numerator // x.denominator
    r = x - i
    i += 1 if (r > Fraction(1, 2) or (r == Fraction(1, 2) and i & 1)) else 0
    # CW Delphi 0x1332 : #IA non masquee -> fistp leve EInvalidOp (attrape -> echec)
    return i if i < 2 ** 63 else None


def is_ok(n):                      # 0x403754 (n = eax 32 bits signé)
    if n == 1: return False
    for d in range(2, n // 2 + 1):
        if n % d == 0: return False
    return True


def key_for(name, serial):
    v, n = serial_value(serial), popcount_name(name)
    val = fpow(v, n)
    if val is None:
        raise ValueError(f"V^n = {v}^{n} >= 2^63 : fistp overflow -> le crackme refuse toujours ; changer name/regkey")
    for k in range(11111, 100000):
        if "0" in str(k): continue
        r = abs(val) % k * (1 if val >= 0 else -1)   # _llmod : signe du dividende
        r = ((r & 0xFFFFFFFF) ^ 0x80000000) - 0x80000000
        if is_ok(r): return str(k)
    raise RuntimeError("no key")


def check(exe, name, serial, key, shot=None):
    """Pilote le vrai crackme sous Wine/Xvfb (xdotool) ; OK si la MessageBox 'Succeed!' apparait."""
    env = dict(os.environ, WINEDEBUG="-all")
    script = f'''
wine "{exe}" & sleep 6
click() {{ xdotool mousemove $1 $2 click 1; }}
click 530 363; xdotool type --delay 60 "{name}"
click 530 385; xdotool type --delay 60 "{serial}"
click 530 407; xdotool type --delay 60 "{key}"
click 449 433; sleep 2
xdotool search --name "Succeed" >/dev/null && echo RESULT_OK || echo RESULT_KO

wineserver -k
'''
    os.makedirs("/tmp/fb-n1", exist_ok=True)
    out = subprocess.run(["xvfb-run", "-a", "-s", "-screen 0 1024x768x24 -fbdir /tmp/fb-n1", "sh", "-c", script],
                         capture_output=True, text=True, env=env, timeout=120).stdout
    print(out.strip())
    return "RESULT_OK" in out


if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("--name", default="petik")
    ap.add_argument("--regkey", default="111-111-111-A")
    ap.add_argument("--serial")
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", nargs="?", const="analysis/x/crackme_1.exe")
    a = ap.parse_args()
    k = a.serial or key_for(a.name, a.regkey)
    print(f"{a.regkey} {k}" if a.q else f"name={a.name} regkey={a.regkey} serial={k}")
    if a.check:
        print("CHECK:", "OK" if check(a.check, a.name, a.regkey, k) else "KO")
