#!/usr/bin/env python3
"""Solveur CFB8 (CrackNotMe — Concurrently Yours / 4 worker threads).

Le token n'est PAS fixe : 32 hex chars = 16 octets, chaque bloc de 4 octets
est XOR-é avec le low-byte d'une clé éphémère dérivée du runtime :

  worker 0 : key = GetCurrentProcessId() & 0xFF
  worker 1 : key = TID[0] & 0xFF
  worker 2 : key = TID[1] & 0xFF
  worker 3 : key = TID[2] & 0xFF

Cible (clair après XOR) en .rdata @ 0x140023440 :

  deadbeef cafebabe 13371337 42424242

Les 4 workers stockent leurs GetCurrentThreadId() @ 0x140036358+i*4
AVANT d'attendre le condition_variable — donc lisibles dès le prompt.
Un watchdog anti-stepping tue la session si on reste trop longtemps en pause.

Usage :
  python3 cfb8-solve.py --run          # wine + lecture mémoire + preuve live
  python3 cfb8-solve.py --run -q       # token hex seul (session courante)
  python3 cfb8-solve.py --check        # vérifie la table attendue dans le PE
  python3 cfb8-solve.py --pid 0x20 --tids 0xe8,0xec,0xf0,0xf4
"""

from __future__ import annotations

import argparse
import os
import pathlib
import re
import select
import struct
import subprocess
import sys
import time
from pathlib import Path

IMAGE_BASE = 0x140000000
EXPECTED_VA = 0x140023440
TID_VA = 0x140036358
EXPECTED = bytes.fromhex("deadbeefcafebabe1337133742424242")
RDATA_VA = 0x23000
RDATA_RAW = 0x21C00

HERE = Path(__file__).resolve().parent
EXE = HERE.parent / "original" / "CFB8.exe"


def va_to_fo_rdata(va: int) -> int:
    return RDATA_RAW + (va - IMAGE_BASE - RDATA_VA)


def read_expected(data: bytes) -> bytes:
    fo = va_to_fo_rdata(EXPECTED_VA)
    return bytes(data[fo : fo + 16])


def keys_from(pid: int, tids: list[int]) -> list[int]:
    if len(tids) < 3:
        raise ValueError("need at least TID[0..2]")
    return [pid & 0xFF, tids[0] & 0xFF, tids[1] & 0xFF, tids[2] & 0xFF]


def build_token(pid: int, tids: list[int], expected: bytes = EXPECTED) -> str:
    keys = keys_from(pid, tids)
    out = bytearray(16)
    for i, k in enumerate(keys):
        for j in range(4):
            out[i * 4 + j] = expected[i * 4 + j] ^ k
    return out.hex()


def parse_int(s: str) -> int:
    return int(s, 0)


def parse_tids(s: str) -> list[int]:
    parts = [p.strip() for p in s.replace(";", ",").split(",") if p.strip()]
    return [parse_int(p) for p in parts]


def find_cfb8_unix_pids() -> list[int]:
    out: list[int] = []
    for p in pathlib.Path("/proc").iterdir():
        if not p.name.isdigit():
            continue
        try:
            cmd = (p / "cmdline").read_bytes().replace(b"\0", b" ").decode(
                "utf-8", "replace"
            )
        except OSError:
            continue
        if "CFB8.exe" in cmd:
            out.append(int(p.name))
    return out


def read_tids_from_mem(unix_pid: int, base: int = IMAGE_BASE) -> list[int]:
    with open(f"/proc/{unix_pid}/mem", "rb") as mem:
        mem.seek(base + (TID_VA - IMAGE_BASE))
        return list(struct.unpack("<IIII", mem.read(16)))


def wine_pid_of_cfb8(env: dict[str, str]) -> int:
    """Windows PID via `winedbg --command 'info proc'`."""
    r = subprocess.run(
        ["winedbg", "--command", "info proc"],
        capture_output=True,
        text=True,
        env=env,
        timeout=15,
    )
    text = r.stdout + "\n" + r.stderr
    for line in text.splitlines():
        if "CFB8" in line:
            m = re.match(r"\s*([0-9a-fA-F]+)\s+", line)
            if m:
                return int(m.group(1), 16)
    raise RuntimeError(f"CFB8.exe not found in winedbg info proc:\n{text[:800]}")


def run_live(quiet: bool = False) -> tuple[str, str]:
    if not EXE.is_file():
        raise SystemExit(f"missing {EXE}")
    env = os.environ.copy()
    env["WINEDEBUG"] = "-all"
    proc = subprocess.Popen(
        ["wine64", str(EXE)],
        stdin=subprocess.PIPE,
        stdout=subprocess.PIPE,
        stderr=subprocess.STDOUT,
        env=env,
    )
    assert proc.stdin and proc.stdout
    buf = b""
    deadline = time.time() + 45
    try:
        while time.time() < deadline:
            r, _, _ = select.select([proc.stdout], [], [], 0.2)
            if not r:
                if proc.poll() is not None:
                    break
                continue
            chunk = os.read(proc.stdout.fileno(), 4096)
            if not chunk:
                break
            buf += chunk
            if b"Enter dynamic session token" in buf:
                break
        else:
            raise RuntimeError("timeout waiting for token prompt")

        time.sleep(0.15)
        upids = find_cfb8_unix_pids()
        if not upids:
            raise RuntimeError("cannot find CFB8.exe unix pid in /proc")
        upid = max(upids)
        tids = read_tids_from_mem(upid)
        win_pid = wine_pid_of_cfb8(env)
        token = build_token(win_pid, tids)

        if not quiet:
            print(
                f"# win_pid={win_pid:#x} tids={[hex(t) for t in tids]} "
                f"keys={[hex(k) for k in keys_from(win_pid, tids)]}",
                file=sys.stderr,
            )

        proc.stdin.write(token.encode() + b"\n\n")
        proc.stdin.flush()
        end = time.time() + 10
        while time.time() < end:
            r, _, _ = select.select([proc.stdout], [], [], 0.3)
            if r:
                chunk = os.read(proc.stdout.fileno(), 4096)
                if not chunk:
                    break
                buf += chunk
                if b"ACCESS GRANTED" in buf or b"ACCESS DENIED" in buf:
                    # drain Press Enter
                    try:
                        proc.stdin.write(b"\n")
                        proc.stdin.flush()
                    except BrokenPipeError:
                        pass
                    time.sleep(0.2)
                    while select.select([proc.stdout], [], [], 0.2)[0]:
                        chunk = os.read(proc.stdout.fileno(), 4096)
                        if not chunk:
                            break
                        buf += chunk
                    break
            if proc.poll() is not None:
                break
        try:
            proc.wait(timeout=5)
        except subprocess.TimeoutExpired:
            proc.kill()
            proc.wait(timeout=3)
    finally:
        if proc.poll() is None:
            proc.kill()

    text = buf.decode("utf-8", "replace").replace("\r", "")
    return token, text


def main() -> int:
    ap = argparse.ArgumentParser(description="CFB8 Concurrently Yours solver")
    ap.add_argument("-q", "--quiet", action="store_true", help="token hex only")
    ap.add_argument(
        "--check",
        action="store_true",
        help="verify expected XOR table in original/CFB8.exe",
    )
    ap.add_argument(
        "--run",
        action="store_true",
        help="wine live: scrape PID/TIDs, submit token, expect ACCESS GRANTED",
    )
    ap.add_argument("--pid", type=parse_int, help="Windows PID (GetCurrentProcessId)")
    ap.add_argument(
        "--tids",
        type=parse_tids,
        help="four TIDs (or at least first 3), comma-separated (hex ok)",
    )
    args = ap.parse_args()

    data = EXE.read_bytes() if EXE.is_file() else b""
    if args.check:
        if not data:
            print(f"missing {EXE}", file=sys.stderr)
            return 1
        got = read_expected(data)
        ok = got == EXPECTED
        if args.quiet:
            print(got.hex())
        else:
            print(f"expected @ {EXPECTED_VA:#x}: {got.hex()}  {'OK' if ok else 'FAIL'}")
        if not ok:
            return 1
        if not args.run and args.pid is None:
            return 0

    if args.run:
        token, text = run_live(quiet=args.quiet)
        if "ACCESS GRANTED" not in text:
            print(text, file=sys.stderr)
            print("live FAIL: no ACCESS GRANTED", file=sys.stderr)
            return 1
        if args.quiet:
            print(token)
        else:
            print(token)
            print(text)
        return 0

    if args.pid is not None:
        tids = args.tids or []
        if len(tids) < 3:
            print("need --tids with at least 3 values (TID0,TID1,TID2)", file=sys.stderr)
            return 1
        token = build_token(args.pid, tids)
        print(token)
        if not args.quiet:
            print(
                f"# keys={[hex(k) for k in keys_from(args.pid, tids)]}",
                file=sys.stderr,
            )
        return 0

    if args.quiet:
        print(
            "# token is session-dependent; use --run -q or --pid/--tids",
            file=sys.stderr,
        )
        return 2

    print("CFB8 token is dynamic (PID ⊕ TIDs). Examples:")
    print("  python3 tools/cfb8-solve.py --run")
    print("  python3 tools/cfb8-solve.py --run -q")
    print("  python3 tools/cfb8-solve.py --check")
    print("  python3 tools/cfb8-solve.py --pid 0x20 --tids 0xe8,0xec,0xf0,0xf4")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
