#!/usr/bin/env python3
"""Keygen Babylon Keygenme (haiklr, crackmes.de).

main @ 0x401310 (MinGW console) :
  4 <= len(name) <= 14
  spaced = name[0]+' '+name[1]+' '+...
  key0 = bytes at 0x401230 (34 octets) ; key[i]++
  key[i] ^= spaced[i]  pour i < len(spaced)
  rev = key[:strlen(key)][::-1]
  out[2i]=rev[i] ; out[2i+1]=key[i]
  si out[j]<=0x1f ou >0x7a : out[j]='6'
  serial = out[:len(name)]
usage : babylon-solve.py [name] [--check]
"""
import os, subprocess, sys

HERE = os.path.dirname(os.path.abspath(__file__))
EXE = os.path.join(HERE, "..", "original", "Babylon.exe")
KEY0 = bytes.fromhex("2d5b235d5d3d7d2626262b283d242a2c2c29262e2a2f2b2b2b5b5d5b3b2f2e2ea730")

def keygen(name: str) -> str:
    L = len(name)
    if not 4 <= L <= 14:
        raise SystemExit("nom : 4..14 caractères")
    spaced = "".join(c + " " for c in name)  # len 2L
    key = bytearray(KEY0)
    for i in range(len(key)):
        key[i] = (key[i] + 1) & 0xff
    for i in range(len(spaced)):
        key[i] ^= ord(spaced[i])
    # strlen after xor
    n = 0
    while n < len(key) and key[n] != 0:
        n += 1
    buf = bytes(key[:n])
    rev = buf[::-1]
    out = bytearray()
    for i in range(len(rev)):
        out.append(rev[i])
        out.append(buf[i])
    for i in range(len(out)):
        if out[i] <= 0x1f or out[i] > 0x7a:
            out[i] = 0x36  # '6'
    return bytes(out[:L]).decode("latin1")

def run(name, serial):
    env = dict(os.environ, WINEDEBUG="-all")
    try:
        out = subprocess.run(
            ["wine", EXE],
            input=f"{name}\n{serial}\n",
            capture_output=True, text=True, env=env, timeout=8,
        ).stdout
    except subprocess.TimeoutExpired as e:
        out = (e.stdout or b"").decode(errors="replace") if isinstance(getattr(e,"stdout",None),(bytes,bytearray)) else (e.stdout or "")
    return out

if __name__ == "__main__":
    a = [x for x in sys.argv[1:] if not x.startswith("--")]
    name = a[0] if a else "petik"
    s = keygen(name)
    print(f"{name} -> {s!r}")
    if "--check" in sys.argv:
        out = run(name, s)
        print(out.replace("\r", ""))
        bad = run(name, "x"*len(s))
        print("BAD:", [ln for ln in bad.replace("\r","").splitlines() if "Mauvais" in ln or "Yeah" in ln])
