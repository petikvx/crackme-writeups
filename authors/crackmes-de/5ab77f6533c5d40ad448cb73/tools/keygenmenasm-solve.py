#!/usr/bin/env python3
"""Solveur / keygen — crackmes.de KeygenmeNasm (rezk2ll)

Username 4..14 octets (avec \\n → corps 3..13). Password même longueur.
Cipher (sur le corps, al initial = 5) :

  for each byte c:
      out = c | al
      al = c

Password == cipher(username).

Usage:
  python3 keygenmenasm-solve.py -q
  python3 keygenmenasm-solve.py -q --user alice
  python3 keygenmenasm-solve.py --check --user khaled
"""
from __future__ import annotations

import argparse
import os
import sys
import time
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
BIN = ROOT / "original" / "keygenme"
DEFAULT_USER = "khaled"


def cipher(user: str) -> str:
    al = 5
    out = []
    for ch in user.encode("latin1"):
        out.append(ch | al)
        al = ch
    return bytes(out).decode("latin1")


def live_check(user: str, password: str) -> str:
    r, w = os.pipe()
    pid = os.fork()
    if pid == 0:
        os.close(w)
        os.dup2(r, 0)
        os.close(r)
        os.execv(str(BIN), [str(BIN)])
    os.close(r)
    os.write(w, user.encode("latin1") + b"\n")
    time.sleep(0.05)
    os.write(w, password.encode("latin1") + b"\n")
    os.close(w)
    # drain stdout via inherited — reopen by waiting only; capture with pipe2
    # simpler: parent doesn't capture; re-run with pty-less duplicate using subprocess + sleep script
    _, status = os.waitpid(pid, 0)
    return "ok" if status == 0 else "fail"


def live_check_capture(user: str, password: str) -> tuple[str, bool]:
    import subprocess, tempfile, textwrap

    script = textwrap.dedent(
        f"""\
        import os,time
        r,w=os.pipe(); pid=os.fork()
        if pid==0:
            os.close(w); os.dup2(r,0); os.close(r)
            os.execv({str(BIN)!r}, [{str(BIN)!r}])
        os.close(r)
        os.write(w, {user.encode('latin1')!r}+b'\\n'); time.sleep(0.05)
        os.write(w, {password.encode('latin1')!r}+b'\\n'); os.close(w)
        os.waitpid(pid,0)
        """
    )
    # Actually capture binary stdout: fork with stdout pipe
    out_r, out_w = os.pipe()
    r, w = os.pipe()
    pid = os.fork()
    if pid == 0:
        os.close(w)
        os.close(out_r)
        os.dup2(r, 0)
        os.dup2(out_w, 1)
        os.close(r)
        os.close(out_w)
        os.execv(str(BIN), [str(BIN)])
    os.close(r)
    os.close(out_w)
    os.write(w, user.encode("latin1") + b"\n")
    time.sleep(0.05)
    os.write(w, password.encode("latin1") + b"\n")
    os.close(w)
    chunks = []
    while True:
        data = os.read(out_r, 4096)
        if not data:
            break
        chunks.append(data)
    os.close(out_r)
    os.waitpid(pid, 0)
    text = b"".join(chunks).decode(errors="replace")
    return text, "good work" in text


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--user", default=DEFAULT_USER)
    ap.add_argument("--check", action="store_true")
    args = ap.parse_args()
    user = args.user
    if not (3 <= len(user) <= 13):
        print("username corps length must be 3..13", file=sys.stderr)
        return 1
    pw = cipher(user)
    if args.check:
        if not BIN.is_file():
            print(f"missing {BIN}", file=sys.stderr)
            return 1
        text, ok = live_check_capture(user, pw)
        print(text.strip().splitlines()[-1] if text.strip() else text)
        print("OK" if ok else "FAIL")
        return 0 if ok else 1
    if args.q:
        print(f"{user}:{pw}")
        return 0
    print("=== KeygenmeNasm ===")
    print(f"username : {user}")
    print(f"password : {pw}")
    print("cipher   : out[i] = user[i] | prev  (prev0=5)")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
