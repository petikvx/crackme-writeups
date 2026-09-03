#!/usr/bin/env python3
"""vazonezs_keygenme_1 — 14-char code from GetUserNameA[0] + VaZoNeZ×2."""
from __future__ import annotations
import argparse, getpass, subprocess, sys, time
from pathlib import Path
ROOT = Path(__file__).resolve().parents[1]
EXE = ROOT / "original" / "_u" / "crackme1.exe"
BUF_VA = 0x4031A4
SEED = b"VaZoNeZVaZoNeZ"

def keygen(user: str = "petik") -> str:
    u0 = ord(user[0]) & 0xFF
    buf = bytearray(SEED)
    for i in range(len(buf)):
        dl = (((buf[i] + u0) & 0xFF) ^ 5)
        dl = (dl + ((BUF_VA + i) & 0xFF) - 0x1E) & 0xFF
        buf[i] = dl
    return bytes(buf).decode("latin1")

def wine_check(code: str) -> bool:
    helper = Path(__file__).resolve().parent / "vazonez_gui_check.exe"
    subprocess.run(["killall", "-9", "wine", "wine64"], capture_output=True)
    time.sleep(0.3)
    p = subprocess.Popen(["wine", str(EXE)], env={**__import__("os").environ, "WINEDEBUG": "-all"},
                         stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
    try:
        time.sleep(1.4)
        r = subprocess.run(["wine", str(helper), code], capture_output=True,
                           env={**__import__("os").environ, "WINEDEBUG": "-all"}, timeout=20)
        out = r.stdout.decode("latin1", "replace"); print(out.strip()); return "Rigth" in out
    finally:
        subprocess.run(["killall", "-9", "wine", "wine64"], capture_output=True)
        try: p.wait(timeout=2)
        except Exception: p.kill()

def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--user", default="petik")
    ap.add_argument("--check", action="store_true")
    args = ap.parse_args()
    code = keygen(args.user)
    if args.check:
        ok = wine_check(code); print("check:", "OK" if ok else "FAIL"); return 0 if ok else 1
    print(code if args.q else f"{args.user!r} → {code!r}")
    return 0
if __name__ == "__main__":
    sys.exit(main())
