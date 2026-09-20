#!/usr/bin/env python3
"""Solveur / keygen — victormeloasm's Simple Frog

HWID éphémère (souris X11 ~1.5 s + horloge + moniteur sous le curseur)
+ FNV/splitmix sur le name → blob → SHA-256 → serial hex 64.

Le serial n'est valide que pour *cette* capture HWID. Contre le binaire
d'origine, `--check` utilise un oracle GDB (break après SHA256, injecte
le digest) — pas de patch du binaire.

Usage:
  python3 tools/simplefrog-solve.py -q              # keygen live (DISPLAY)
  python3 tools/simplefrog-solve.py -q --name petik
  python3 tools/simplefrog-solve.py --check
  python3 tools/simplefrog-solve.py --check --name petik
"""
from __future__ import annotations

import argparse
import hashlib
import os
import struct
import subprocess
import sys
import tempfile
import threading
import time
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
BIN = ROOT / "original" / "simplefrog"

MASK64 = (1 << 64) - 1
C1 = 0xBF58476D1CE4E5B9
C2 = 0x94D049BB133111EB
GOLDEN = 0x9E3779B97F4A7C15
SIMPLEFR = 0x53494D504C454652  # "SIMPLEFR"
SIMPLE_FR = 0x53696D706C654672  # "SimpleFr"


def rol64(x: int, n: int) -> int:
    n &= 63
    x &= MASK64
    return ((x << n) | (x >> (64 - n))) & MASK64


def splitmix_mix(x: int) -> int:
    x &= MASK64
    x ^= x >> 30
    x = (C1 * x) & MASK64
    x ^= x >> 27
    x = (C2 * x) & MASK64
    x ^= x >> 31
    return x


def fnv_name(name: bytes) -> int:
    v = 0x14650FB0739D0383
    for b in name:
        if b == 0:
            break
        v = (0x100000001B3 * (b ^ v)) & MASK64
    return splitmix_mix(v)


def mix_extras(v26: int, tv_sec: int, width: int, height: int, v44: int) -> tuple[int, int]:
    v56 = (
        rol64(tv_sec, 17)
        ^ ((width & 0xFFFFFFFF) << 32)
        ^ (height & 0xFFFFFFFF)
        ^ v26
        ^ rol64(v44, 31)
    ) & MASK64
    v57 = (rol64(v26, 29) + rol64(tv_sec, 43) + v44 + SIMPLE_FR) & MASK64
    v58, v59, v60 = 5, 9, 0
    v64 = 0
    while v58 != 117:
        v61 = (v56 + rol64(v57, v58)) & MASK64
        v62 = ((0xD1342543DE82EF95 * v61) ^ v57) & MASK64
        v56 = splitmix_mix(v60 ^ v61)
        v64 = rol64(v62, v59)
        v57 = v64
        v58 += 7
        v59 += 11
        v60 = (v60 - 0x61C8864680B583EB) & MASK64
    return v56, v64


def build_blob(name: bytes, v26: int, tv_sec: int, width: int, height: int) -> bytes:
    if b"\x00" in name:
        name = name.split(b"\x00", 1)[0]
    if len(name) > 0x7F:
        name = name[:0x7F]
    v44 = fnv_name(name)
    a, c = mix_extras(v26, tv_sec, width, height, v44)
    return name + b"\x00" + struct.pack("<QQIIQQ", v26, tv_sec, width, height, a, c)


def serial_from_blob(blob: bytes) -> str:
    return hashlib.sha256(blob).hexdigest()


def sample_hwid() -> tuple[int, int, int, int]:
    """Réplique la boucle souris (~1.5 s) + moniteur + CLOCK_REALTIME."""
    import ctypes
    import ctypes.util

    x11 = ctypes.CDLL(ctypes.util.find_library("X11"))
    xrandr = ctypes.CDLL(ctypes.util.find_library("Xrandr"))

    class Timespec(ctypes.Structure):
        _fields_ = [("tv_sec", ctypes.c_int64), ("tv_nsec", ctypes.c_int64)]

    class XRRMonitorInfo(ctypes.Structure):
        _fields_ = [
            ("name", ctypes.c_ulong),
            ("primary", ctypes.c_int),
            ("automatic", ctypes.c_int),
            ("noutput", ctypes.c_int),
            ("x", ctypes.c_int),
            ("y", ctypes.c_int),
            ("width", ctypes.c_int),
            ("height", ctypes.c_int),
            ("mwidth", ctypes.c_int),
            ("mheight", ctypes.c_int),
            ("outputs", ctypes.c_void_p),
        ]

    x11.XOpenDisplay.restype = ctypes.c_void_p
    x11.XDefaultRootWindow.argtypes = [ctypes.c_void_p]
    x11.XDefaultRootWindow.restype = ctypes.c_ulong
    x11.XQueryPointer.argtypes = [
        ctypes.c_void_p,
        ctypes.c_ulong,
        ctypes.POINTER(ctypes.c_ulong),
        ctypes.POINTER(ctypes.c_ulong),
        ctypes.POINTER(ctypes.c_int),
        ctypes.POINTER(ctypes.c_int),
        ctypes.POINTER(ctypes.c_int),
        ctypes.POINTER(ctypes.c_int),
        ctypes.POINTER(ctypes.c_uint),
    ]
    x11.XCloseDisplay.argtypes = [ctypes.c_void_p]
    xrandr.XRRGetMonitors.argtypes = [
        ctypes.c_void_p,
        ctypes.c_ulong,
        ctypes.c_bool,
        ctypes.POINTER(ctypes.c_int),
    ]
    xrandr.XRRGetMonitors.restype = ctypes.POINTER(XRRMonitorInfo)
    xrandr.XRRFreeMonitors.argtypes = [ctypes.c_void_p]

    libc = ctypes.CDLL(ctypes.util.find_library("c"), use_errno=True)
    CLOCK_MONOTONIC = 1
    CLOCK_REALTIME = 0

    def clock_gettime(clk: int) -> Timespec:
        ts = Timespec()
        if libc.clock_gettime(clk, ctypes.byref(ts)) != 0:
            raise OSError("clock_gettime")
        return ts

    dpy = x11.XOpenDisplay(None)
    if not dpy:
        raise SystemExit("XOpenDisplay failed (DISPLAY ?)")

    root = x11.XDefaultRootWindow(dpy)
    try:
        t0 = clock_gettime(CLOCK_MONOTONIC)
    except OSError:
        x11.XCloseDisplay(dpy)
        return 0xEE18D70B34696718, int(time.time()), 0, 0

    state = SIMPLEFR
    root_x = 0
    root_y = 0
    last_pack = 0
    count = 0
    sleep_ts = Timespec(0, 10_000_000)  # 10 ms

    while True:
        root_ret = ctypes.c_ulong()
        child_ret = ctypes.c_ulong()
        rx = ctypes.c_int()
        ry = ctypes.c_int()
        wx = ctypes.c_int()
        wy = ctypes.c_int()
        mask = ctypes.c_uint()
        ok = x11.XQueryPointer(
            dpy,
            root,
            ctypes.byref(root_ret),
            ctypes.byref(child_ret),
            ctypes.byref(rx),
            ctypes.byref(ry),
            ctypes.byref(wx),
            ctypes.byref(wy),
            ctypes.byref(mask),
        )
        t1 = clock_gettime(CLOCK_MONOTONIC)
        elapsed = (t1.tv_sec - t0.tv_sec) * 1_000_000_000 + (t1.tv_nsec - t0.tv_nsec)

        pack = ((rx.value & 0xFFFFFFFF) << 32) | (ry.value & 0xFFFFFFFF)
        r9 = rol64(pack ^ last_pack, 7 * (count & 0xFF) + 3)
        r10 = rol64(elapsed & MASK64, 11 * (count & 0xFF) + 5)
        r11 = (
            ((mask.value & 0xFFFFFFFF) << 17)
            ^ ((GOLDEN * (count & 0xFFFFFFFF)) & MASK64)
            ^ r9
            ^ pack
            ^ r10
        ) & MASK64
        rcx = (rol64(state, 19) + r11) & MASK64
        t = rcx ^ (rcx >> 30)
        t = (C1 * t) & MASK64
        t = t ^ (t >> 27)
        t = (C2 * t) & MASK64
        state = (state ^ t) & MASK64
        t2 = (t >> 31) ^ state
        state = (rol64(t2, 23) * 0xD6E8FEB86659FD93) & MASK64

        if ok:
            root_x = rx.value
            root_y = ry.value
            last_pack = pack

        count = (count + 1) & 0xFFFFFFFF
        if elapsed > 1_499_999_999:
            break
        rem = Timespec(0, 0)
        libc.nanosleep(ctypes.byref(sleep_ts), ctypes.byref(rem))
        while True:
            # EINTR == -4 on this binary's raw syscall convention; libc uses errno
            if rem.tv_sec == 0 and rem.tv_nsec == 0:
                break
            if libc.nanosleep(ctypes.byref(rem), ctypes.byref(rem)) == 0:
                break

    v = (state ^ last_pack ^ ((count & 0xFFFFFFFF) << 32)) & MASK64
    v26 = splitmix_mix(v)

    # monitor under cursor
    nmon = ctypes.c_int()
    mons = xrandr.XRRGetMonitors(dpy, root, True, ctypes.byref(nmon))
    width = height = 0
    if mons and nmon.value > 0:
        found = False
        for i in range(nmon.value):
            m = mons[i]
            if (
                m.x <= root_x < m.x + m.width
                and m.y <= root_y < m.y + m.height
            ):
                width, height = m.width, m.height
                found = True
                break
        xrandr.XRRFreeMonitors(mons)
        if not found:
            # fallback Screen width/height — approx via root attributes
            width = height = 0
    x11.XCloseDisplay(dpy)

    tv = clock_gettime(CLOCK_REALTIME).tv_sec
    if width == 0 and height == 0:
        # fallback: XDisplayWidth/Height
        dpy2 = x11.XOpenDisplay(None)
        if dpy2:
            x11.XDisplayWidth.argtypes = [ctypes.c_void_p, ctypes.c_int]
            x11.XDisplayHeight.argtypes = [ctypes.c_void_p, ctypes.c_int]
            screen = x11.XDefaultScreen(dpy2)
            width = x11.XDisplayWidth(dpy2, screen)
            height = x11.XDisplayHeight(dpy2, screen)
            x11.XCloseDisplay(dpy2)

    return v26, int(tv), int(width), int(height)


def generate(name: str) -> str:
    name_b = name.encode("utf-8")
    v26, tv, w, h = sample_hwid()
    blob = build_blob(name_b, v26, tv, w, h)
    return serial_from_blob(blob)


def gdb_check(name: str) -> bool:
    """Oracle GDB : break après SHA256, lit le digest, le renvoie comme serial."""
    import pty

    gdb_script = f"""set pagination off
set confirm off
set debuginfod enabled off
break *0x201f8b
commands
  silent
  set $shaout=$rdx
  continue
end
break *0x201f90
commands
  silent
  python
addr=int(gdb.parse_and_eval("$shaout"))
mem=bytes(gdb.selected_inferior().read_memory(addr,32))
open("/tmp/simplefrog-serial.txt","w").write(mem.hex())
print("SERIAL_HEX "+mem.hex())
  end
  continue
end
run
"""
    with tempfile.NamedTemporaryFile("w", suffix=".gdb", delete=False) as f:
        f.write(gdb_script)
        gdb_path = f.name

    serial_file = Path("/tmp/simplefrog-serial.txt")
    if serial_file.exists():
        serial_file.unlink()

    master, slave = pty.openpty()
    p = subprocess.Popen(
        ["gdb", "-q", "-x", gdb_path, str(BIN)],
        stdin=slave,
        stdout=subprocess.PIPE,
        stderr=subprocess.STDOUT,
    )
    os.close(slave)
    out_chunks: list[bytes] = []

    def reader() -> None:
        assert p.stdout is not None
        while True:
            line = p.stdout.readline()
            if not line:
                break
            out_chunks.append(line)
            sys.stdout.buffer.write(line)
            sys.stdout.flush()

    t = threading.Thread(target=reader, daemon=True)
    t.start()
    time.sleep(0.4)
    os.write(master, name.encode() + b"\n")
    # sampling ~1.5 s + marge
    deadline = time.time() + 8
    ser = None
    while time.time() < deadline:
        if serial_file.exists():
            ser = serial_file.read_text().strip()
            if len(ser) == 64:
                break
        time.sleep(0.05)
    if not ser:
        os.write(master, b"0" * 64 + b"\n")
        time.sleep(1)
        try:
            p.kill()
        except OSError:
            pass
        print("FAIL (no digest)", file=sys.stderr)
        return False
    time.sleep(0.1)
    os.write(master, ser.encode() + b"\n")
    try:
        p.wait(timeout=6)
    except subprocess.TimeoutExpired:
        p.kill()
    text = b"".join(out_chunks).decode("utf-8", "replace")
    ok = "Croak! Correct serial." in text
    print("OK" if ok else "FAIL")
    try:
        os.unlink(gdb_path)
    except OSError:
        pass
    return ok


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("-q", action="store_true", help="serial seul")
    ap.add_argument("--name", default="petik", help="login (défaut petik)")
    ap.add_argument("--check", action="store_true", help="preuve live via GDB oracle")
    args = ap.parse_args()

    if args.check:
        return 0 if gdb_check(args.name) else 1

    if not os.environ.get("DISPLAY"):
        print("DISPLAY requis pour le keygen live", file=sys.stderr)
        return 1
    ser = generate(args.name)
    if args.q:
        print(ser)
    else:
        print(ser)
        print(f"# name={args.name!r}  # HWID live — coller dès le prompt Serial:")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
