#!/usr/bin/env python3
"""immortal_one Crackme2 — name → serial 4 chars (alphabet 123456789ABCDEFG).

sum16 = (Σ name + 0x324) & 0xFFFF
mix   = (sum16 + (sum16<<2) + (sum16<<10)) & 0xFFFF
ebx   = mix * 25
serial[0] = ALPHA[(bh>>4)&0xF]
serial[1] = ALPHA[bh&0xF]
serial[2] = ALPHA[(bl>>7)&0xF]   # seulement '1' ou '2'
serial[3] = ALPHA[bl&0xF]
"""
from __future__ import annotations

import argparse
import subprocess
import sys
import time
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
EXE_ORIG = ROOT / "original" / "Crackme2.exe"
EXE_UNPACKED = ROOT / "analysis" / "Crackme2.unpacked.exe"

ALPHA = "123456789ABCDEFG"
IDC_NAME = 0x3E9  # 1001
IDC_SERIAL = 0x3EA  # 1002
IDC_STATUS = 0x3ED  # 1005
IDC_CHECK = 0x3EE  # 1006
GOOD = "Very good now code a keygen"
BAD = "Try Again"
NEED4 = "?"


def keygen(name: str = "petik") -> str:
    if not name:
        raise SystemExit("name: vide refusé (buffer GetDlgItemTextA 0x19)")
    if len(name) >= 0x19:
        raise SystemExit("name: longueur max 24 (cchMax=0x19)")
    # l’edit 1001 a ES_UPPERCASE : petik → PETIK avant GetDlgItemTextA
    name = name.upper()
    s = 0
    for ch in name.encode("latin1"):
        s = (s + ch) & 0xFFFF
    s = (s + 0x324) & 0xFFFF
    ax = (s << 10) & 0xFFFF
    bx = (s << 2) & 0xFFFF
    bx = (bx + ax) & 0xFFFF
    bx = (bx + s) & 0xFFFF
    ebx = (bx * 0x19) & 0xFFFFFFFF
    bh = (ebx >> 8) & 0xFF
    bl = ebx & 0xFF
    return (
        ALPHA[(bh >> 4) & 0xF]
        + ALPHA[bh & 0xF]
        + ALPHA[(bl >> 7) & 0xF]
        + ALPHA[bl & 0xF]
    )


def verify(name: str, serial: str) -> bool:
    return serial == keygen(name)


def gui_check(name: str, serial: str, timeout: float = 8.0, exe: Path = EXE_UNPACKED) -> str:
    """Lance le PE (unpacké), remplit name/serial, lit le static STATUS.

    SetDlgItemTextA/W depuis un Python 64-bit ne met pas à jour le buffer ANSI
    vu par GetDlgItemTextA dans le PE32 : on envoie WM_CHAR.
    """
    import ctypes
    from ctypes import wintypes

    user32 = ctypes.WinDLL("user32", use_last_error=True)

    FindWindowW = user32.FindWindowW
    FindWindowW.argtypes = [wintypes.LPCWSTR, wintypes.LPCWSTR]
    FindWindowW.restype = wintypes.HWND
    SendMessageW = user32.SendMessageW
    SendMessageW.argtypes = [wintypes.HWND, wintypes.UINT, wintypes.WPARAM, wintypes.LPARAM]
    SendMessageW.restype = wintypes.LPARAM
    PostMessageW = user32.PostMessageW
    PostMessageW.argtypes = [wintypes.HWND, wintypes.UINT, wintypes.WPARAM, wintypes.LPARAM]
    PostMessageW.restype = wintypes.BOOL
    GetDlgItem = user32.GetDlgItem
    GetDlgItem.argtypes = [wintypes.HWND, ctypes.c_int]
    GetDlgItem.restype = wintypes.HWND
    SetForegroundWindow = user32.SetForegroundWindow
    SetForegroundWindow.argtypes = [wintypes.HWND]
    SetForegroundWindow.restype = wintypes.BOOL
    GetWindowTextW = user32.GetWindowTextW
    GetWindowTextW.argtypes = [wintypes.HWND, wintypes.LPWSTR, ctypes.c_int]
    GetWindowTextW.restype = ctypes.c_int

    WM_CHAR = 0x0102
    WM_CLEAR = 0x0303
    WM_CLOSE = 0x0010
    EM_SETSEL = 0x00B1
    BM_CLICK = 0x00F5
    TITLE = "[CRACKME2] (c) Immortal_One"
    CLASS = "DLGCLASS"

    def fill_edit(hwnd_edit: int, text: str) -> None:
        SendMessageW(hwnd_edit, EM_SETSEL, 0, -1)
        SendMessageW(hwnd_edit, WM_CLEAR, 0, 0)
        for ch in text.encode("latin1"):
            SendMessageW(hwnd_edit, WM_CHAR, ch, 0)

    def status_text(hwnd: int) -> str:
        st = GetDlgItem(hwnd, IDC_STATUS)
        if not st:
            return ""
        buf = ctypes.create_unicode_buffer(256)
        GetWindowTextW(st, buf, 256)
        return buf.value.strip()

    if not exe.is_file():
        raise SystemExit(f"exe introuvable: {exe}")

    proc = subprocess.Popen([str(exe)], cwd=str(exe.parent))
    try:
        hwnd = 0
        deadline = time.time() + timeout
        while time.time() < deadline:
            hwnd = FindWindowW(CLASS, TITLE)
            if hwnd:
                break
            time.sleep(0.05)
        if not hwnd:
            raise SystemExit(f"fenêtre {TITLE} introuvable")

        SetForegroundWindow(hwnd)
        fill_edit(GetDlgItem(hwnd, IDC_NAME), name)
        fill_edit(GetDlgItem(hwnd, IDC_SERIAL), serial)
        PostMessageW(GetDlgItem(hwnd, IDC_CHECK), BM_CLICK, 0, 0)

        got = ""
        deadline = time.time() + timeout
        while time.time() < deadline:
            got = status_text(hwnd)
            if got in (GOOD, BAD, NEED4):
                break
            time.sleep(0.05)
        PostMessageW(hwnd, WM_CLOSE, 0, 0)
        return got
    finally:
        try:
            proc.wait(timeout=2)
        except Exception:
            proc.kill()


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--user", "--name", default="petik", dest="user")
    ap.add_argument("--check", action="store_true", help="rejoue le prédicat + GUI Windows (unpacké)")
    ap.add_argument("--no-gui", action="store_true")
    ap.add_argument(
        "--packed",
        action="store_true",
        help="GUI sur original/Crackme2.exe (échoue sur Win moderne : kernel32 XP)",
    )
    args = ap.parse_args()
    serial = keygen(args.user)
    ok_pred = verify(args.user, serial)
    if args.check:
        if not ok_pred:
            print("check: FAIL predicte")
            return 1
        print(f"predicat: OK  {args.user} → {serial}")
        if args.no_gui:
            print("check: OK")
            return 0
        if sys.platform != "win32":
            print("gui: skip (pas Windows)")
            print("check: OK")
            return 0
        exe = EXE_ORIG if args.packed else EXE_UNPACKED
        caption = gui_check(args.user, serial, exe=exe)
        print(f"gui: {caption or '(pas de statut)'}")
        ok = caption == GOOD
        print("check:", "OK" if ok else "FAIL")
        return 0 if ok else 1
    if args.q:
        print(serial)
    else:
        print(f"{args.user} → {serial}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
