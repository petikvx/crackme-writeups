#!/usr/bin/env python3
"""Keygen pour KeygenMe (bikers80, crackmes.de) — .NET / VB, name -> serial.

Le serial dépend de Environment.Version du CLR qui exécute le crackme
(--clr, défaut = wine-mono : 4.0.30319.1 ; CLR 2.0 d'époque : 2.0.50727.xxxx).

  python3 keygenme-bikers80-solve.py            # petik
  python3 keygenme-bikers80-solve.py -q --user petik
  python3 keygenme-bikers80-solve.py --check    # lance le vrai binaire sous wine (harness)
"""
import argparse, base64, hashlib, re, shutil, subprocess, sys
from pathlib import Path

def var1(s):
    h = "".join("%X" % ord(c) for c in s)
    d = "".join(c for c in h if c in "123456789")
    return d[:12] if len(d) > 12 else d

def val(s):
    m = re.match(r"\d*", s)
    return int(m.group()) if m.group() else 0

def serial(name, clr="4.0.30319.1"):
    e = var1(name)
    nb1 = int(e) if e else 0
    nb2 = int(var1(clr))
    # varc : Val(Mid(e,1,4)) + Val(Mid(e,5,4)) + Val(Mid(e,7,4)) (chevauchement 5-8 / 7-10)
    c = str(val(e[0:4]) + val(e[4:8]) + val(e[6:10]))
    varc = int(c[:4])
    t = str(nb1 + nb2) + str(varc)
    esp1 = "-".join([t[0:4], t[4:8], t[8:12], t[12:16]])
    b64 = base64.b64encode(hashlib.sha256(esp1.encode("utf-16le")).digest()).decode().upper()
    f = "".join(ch for ch in b64 if "1" <= ch <= "Z")[:16]   # Like "[1-Z]" : '1'..'Z' (inclut '=')
    esp2 = "-".join(f[i:i+4] for i in range(0, 16, 4))
    return esp1[0:4] + "-" + esp2[5:9] + "-" + esp1[10:14] + "-" + esp2[15:19]

def check(name, ser, ctx=Path(__file__).resolve().parent):
    exe = ctx.parent / "analysis" / "extract" / "KeygenMe.exe"
    h = ctx / "keygenme-harness.exe"
    out = subprocess.run(["xvfb-run", "-a", "wine", str(h), str(exe), name, ser, name, ser[:-1] + ("0" if ser[-1] != "0" else "1")],
                         capture_output=True, text=True).stdout
    print("\n".join(l for l in out.splitlines() if "->" in l or l.startswith("CLR")))
    clr = re.search(r"CLR (\S+)", out)
    return clr, out.count("-> True") == 1

if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("--user", "--name", default="petik")
    ap.add_argument("--clr", default="4.0.30319.1")
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true")
    a = ap.parse_args()
    s = serial(a.user, a.clr)
    print(s if a.q else f"name={a.user}  clr={a.clr}  serial={s}")
    if a.check:
        clr, ok = check(a.user, s)
        print("OK (True puis False sur serial altéré)" if ok else "ECHEC"); sys.exit(0 if ok else 1)
