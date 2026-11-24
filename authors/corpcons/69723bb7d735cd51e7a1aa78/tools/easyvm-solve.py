#!/usr/bin/env python3
"""EasyVM (CorpCons) - keygen de licence 10 caracteres.

Le bytecode VM se reduit a :
    k0+k1+k2+k3+k4+k6-k5 == 0x161 (mod 256)      (k7 s'annule, k8/k9 ignores)

Usage:
    easyvm-solve.py [--prefix petik] [-q] [--check ../original/EasyVM.zip]
"""
import argparse, os, subprocess, sys, tempfile, zipfile

TARGET = (0x4B + 0x45 + 0x59 + 0x2D + 0x4B) & 0xFF   # 0x61


def vm_ok(k: bytes) -> bool:
    return (k[0] + k[1] + k[2] + k[3] + k[4] + k[6] - k[5] - TARGET) & 0xFF == 0


def keygen(prefix: str = "petik") -> str:
    p = prefix.encode()[:5].ljust(5, b"A")
    need = (TARGET - sum(p)) & 0xFF            # k6 - k5 == need (mod 256)
    for k5 in range(0x30, 0x7B):
        k6 = (k5 + need) & 0xFF
        if 0x21 <= k6 < 0x7F and chr(k5).isalnum():
            return (p + bytes([k5, k6]) + b"_42").decode()
    raise SystemExit("pas de solution imprimable")


def check(key: str, zpath: str) -> bool:
    with tempfile.TemporaryDirectory() as d:
        zipfile.ZipFile(zpath).extract("EasyVM.exe", d, pwd=b"crackmes.one")
        exe = os.path.join(d, "EasyVM.exe")
        out = subprocess.run(["xvfb-run", "-a", "wine", exe], input=(key + "\n").encode(),
                             capture_output=True, timeout=60).stdout.decode(errors="replace")
    return "CORRECT" in out


if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("--prefix", default="petik")
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", metavar="ZIP")
    a = ap.parse_args()
    key = keygen(a.prefix)
    assert vm_ok(key.encode())
    print(key if a.q else f"key = {key}")
    if a.check:
        ok = check(key, a.check)
        print("wine:", "CORRECT" if ok else "KO")
        sys.exit(0 if ok else 1)
