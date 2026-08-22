#!/usr/bin/env python3
"""Solveur — macabre frogger lvl2

user any; key « 62-<str> » with len(str)>5 and
  (sum(user)^2 XOR (-sum(str))) & 0xff == 0x1c
Self-modifying .text needs mprotect (gdb/LD_PRELOAD).

Example: frog / 62-qqqqqs
"""
from __future__ import annotations
import argparse, subprocess, tempfile, textwrap
from pathlib import Path
BIN = Path(__file__).resolve().parents[1] / "original" / "frogger"

def key_for(user: str) -> str:
    S = sum(user.encode())
    sq = S * S
    need = (sq & 0xFF) ^ 0x1C
    t_mod = (-need) & 0xFF
    total = t_mod + 512
    chars = [113] * 6
    chars[-1] += total - sum(chars)
    assert 32 <= chars[-1] < 127
    return "62-" + bytes(chars).decode("latin1")

def check(user: str = "frog") -> bool:
    key = key_for(user)
    script = textwrap.dedent(f"""\
    set pagination off
    set confirm off
    set debuginfod enabled off
    set args {user} {key}
    file {BIN}
    break *0x080483fc
    commands
      silent
      call (int)mprotect((void*)0x8048000, 0x2000, 7)
      continue
    end
    break *0x08048437
    commands
      silent
      printf "SUCCESS\\n"
      continue
    end
    run
    quit
    """)
    with tempfile.NamedTemporaryFile("w", delete=False) as f:
        f.write(script); path=f.name
    out = subprocess.run(["gdb","-x",path], capture_output=True, text=True, timeout=15)
    return "SUCCESS" in out.stdout

def main():
    ap=argparse.ArgumentParser(); ap.add_argument("-q",action="store_true")
    ap.add_argument("--user",default="petik"); ap.add_argument("--check",action="store_true")
    a=ap.parse_args(); key=key_for(a.user)
    if a.q: print(f"{a.user} {key}"); return 0
    if a.check:
        ok=check(a.user); print(f"{a.user} {key}"); print("OK" if ok else "FAIL"); return 0 if ok else 1
    print("user",a.user); print("key ",key); return 0
if __name__=="__main__": raise SystemExit(main())
