#!/usr/bin/env python3
"""Lacks Level 3 : serial = ((somme des octets signés du user) * 0x539) ^ 0x5a5a (u32, lu en int32)."""
import argparse, subprocess, shutil, os, sys

def serial(user: str) -> int:
    s = sum(b - 256 if b > 127 else b for b in user.encode("latin-1")) & 0xFFFFFFFF
    v = ((s * 0x539) & 0xFFFFFFFF) ^ 0x5A5A
    return v - (1 << 32) if v >= 1 << 31 else v  # cin >> int : signé

def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--user", default="petik")
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true", help="teste contre original/level3.exe via wine")
    a = ap.parse_args()
    k = serial(a.user)
    print(k if a.q else f"user={a.user} serial={k}")
    if a.check:
        exe = os.path.join(os.path.dirname(__file__), "..", "original", "level3.exe")
        cmd = ["wine", exe] if os.environ.get("DISPLAY") else ["xvfb-run", "-a", "wine", exe]
        r = subprocess.run(cmd, input=f"{a.user}\n{k}\n\n", capture_output=True, text=True, timeout=60)
        print(r.stdout)
        sys.exit(0 if "Access Granted" in r.stdout else 1)

main()
