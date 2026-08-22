#!/usr/bin/env python3
"""Solveur — yanisto naive_crackme.

Password 8 octets tel que le checksum mémoire (après décode invite)
  hash ^ 0x80483ba == 0xc0ffee.

Le binaire lit le password sur fd 1 et écrit sur fd 0 ; e_entry pointe
hors de _start (anti-run) — le harness corrige l'entrée en copie temporaire.

Usage:
  python3 naive-solve.py -q
  python3 naive-solve.py --check
"""
from __future__ import annotations

import argparse
import os
import select
import struct
import tempfile
import time
from pathlib import Path

BIN = Path(__file__).resolve().parents[1] / "original" / "naive-crk"
PASSWORD = b"V7l$j^F;"
ENTRY = 0x080488BB  # _start


def run_swapped(password: bytes) -> bytes:
    raw = bytearray(BIN.read_bytes())
    struct.pack_into("<I", raw, 0x18, ENTRY)
    tf = tempfile.NamedTemporaryFile(delete=False)
    tf.write(raw)
    tf.close()
    os.chmod(tf.name, 0o755)
    p_r, p_w = os.pipe()
    c_r, c_w = os.pipe()
    pid = os.fork()
    if pid == 0:
        os.close(p_w)
        os.close(c_r)
        os.dup2(c_w, 0)
        os.dup2(p_r, 1)
        os.close(c_w)
        os.close(p_r)
        os.execv(tf.name, [tf.name])
    os.close(p_r)
    os.close(c_w)
    os.write(p_w, password[:8].ljust(8, b"\x00"))
    os.close(p_w)
    out = b""
    deadline = time.time() + 2
    while time.time() < deadline:
        r, _, _ = select.select([c_r], [], [], 0.05)
        if r:
            chunk = os.read(c_r, 4096)
            if not chunk:
                break
            out += chunk
        elif os.waitpid(pid, os.WNOHANG)[0]:
            break
    try:
        os.close(c_r)
    except OSError:
        pass
    try:
        os.waitpid(pid, 0)
    except ChildProcessError:
        pass
    os.unlink(tf.name)
    return out


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true")
    a = ap.parse_args()
    if a.q:
        print(PASSWORD.decode("latin1"))
        return 0
    if a.check:
        out = run_swapped(PASSWORD)
        ok = b"ndisasm" in out or b"Choose ur brain" in out or b"good function" in out
        print(out.decode("latin1", "replace").strip())
        print("OK" if ok else "FAIL")
        return 0 if ok else 1
    print("password:", PASSWORD.decode("latin1"))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
