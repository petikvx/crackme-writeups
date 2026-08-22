#!/usr/bin/env python3
"""Solveur — crackmes.de j444 (josamont). Password « 247356 » (PTY fd1)."""
import argparse, os, pty, time, select
from pathlib import Path
BIN = Path(__file__).resolve().parents[1] / "original" / "j444"
PASSWORD = "247356"

def check():
    pid, fd = pty.fork()
    if pid == 0:
        os.execv(str(BIN), [str(BIN)])
    data = b""
    while b"Password" not in data:
        data += os.read(fd, 1024)
    os.write(fd, (PASSWORD + "\n").encode())
    time.sleep(0.3)
    try:
        while True:
            r, _, _ = select.select([fd], [], [], 0.3)
            if not r: break
            data += os.read(fd, 1024)
    except OSError:
        pass
    try:
        os.kill(pid, 9); os.waitpid(pid, 0)
    except Exception:
        pass
    return data

def main():
    ap = argparse.ArgumentParser(); ap.add_argument("-q", action="store_true"); ap.add_argument("--check", action="store_true")
    a = ap.parse_args()
    if a.q: print(PASSWORD); return 0
    if a.check:
        out = check().decode(errors="replace")
        ok = "Well done" in out
        print(out.replace("\r","").replace("\x00","").strip()); print("OK" if ok else "FAIL"); return 0 if ok else 1
    print("password:", PASSWORD); return 0
if __name__ == "__main__":
    raise SystemExit(main())
