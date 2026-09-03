#!/usr/bin/env python3
"""crackme_1_by_sharpe (two.exe / Keygenme #2) — name→16-byte serial."""
from __future__ import annotations
import argparse, subprocess, sys, time
from pathlib import Path
ROOT = Path(__file__).resolve().parents[1]
EXE = ROOT / "original" / "_u" / "two.exe"

def transform(ch: int, ecx: int) -> int:
    eax = (ch + ecx) & 0xFFFFFFFF
    if eax < 0x21:
        eax += 0x21
    if eax > 0x7B:
        eax >>= 1
    return eax & 0xFF

def keygen(name: str = "petik") -> str:
    nb = name.encode("latin1") + b"\x00" * 16
    out = bytearray(16)
    ecx = 0x10
    for i in range(16):
        out[i] = transform(nb[i], ecx)
        ecx -= 1
    return bytes(out).decode("latin1")

def wine_check(name: str, serial: str) -> bool:
    helper = Path(__file__).resolve().parent / "sharpe_gui_check.exe"
    subprocess.run(["killall", "-9", "wine", "wine64"], capture_output=True)
    time.sleep(0.3)
    p = subprocess.Popen(["wine", str(EXE)], env={**__import__("os").environ, "WINEDEBUG": "-all"},
                         stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
    try:
        time.sleep(1.4)
        r = subprocess.run(["wine", str(helper), name, serial], capture_output=True,
                           env={**__import__("os").environ, "WINEDEBUG": "-all"}, timeout=20)
        out = r.stdout.decode("latin1", "replace"); print(out.strip()); return "valid values" in out
    finally:
        subprocess.run(["killall", "-9", "wine", "wine64"], capture_output=True)
        try: p.wait(timeout=2)
        except Exception: p.kill()

def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--user", "--name", default="petik", dest="user")
    ap.add_argument("--check", action="store_true")
    args = ap.parse_args()
    serial = keygen(args.user)
    if args.check:
        ok = wine_check(args.user, serial); print("check:", "OK" if ok else "FAIL"); return 0 if ok else 1
    print(serial if args.q else f"{args.user} → {serial!r}")
    return 0
if __name__ == "__main__":
    sys.exit(main())
