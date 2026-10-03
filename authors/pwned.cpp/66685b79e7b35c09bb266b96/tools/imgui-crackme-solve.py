#!/usr/bin/env python3
"""Solveur — Pwned.cpp ImGUI-CrackME (CrackME.exe PE32 MSVC + ImGui/DX9)

Password statique 51 octets, XOR ``buf[i] ^= i + 0x31`` sur un blob
assemblé à la volée (3 xmmwords + ``TTW``). Comparé à ``Src`` (InputText)
quand le bouton ImGui « Submit » est cliqué.

Usage :
  python tools/imgui-crackme-solve.py
  python tools/imgui-crackme-solve.py -q
  python tools/imgui-crackme-solve.py --check
  python tools/imgui-crackme-solve.py --check --live
"""
from __future__ import annotations

import argparse
import struct
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
BIN = ROOT / "original" / "CrackME.exe"
PATCHED = ROOT / "analysis" / "CrackME.patched.exe"

VA_A = 0x435C80  # 16 octets
VA_B = 0x435DB0  # 16 octets
VA_C = 0x435C30  # 16 octets
TAIL = b"TTW"  # dword 0x00575454 @ [ebp-4Ch]
XOR_LEN = 0x33  # 51
XOR_ADD = 0x31

EXPECTED = b"cqt+r?9_)*lv0)+ex4rn2fpbh*?w0*50x?b1u?j*bjqv8bem564"


def pe_map(data: bytes) -> tuple[int, list[tuple[int, int, int, int]]]:
    e_lfanew = struct.unpack_from("<I", data, 0x3C)[0]
    coff = e_lfanew + 4
    nsec = struct.unpack_from("<H", data, coff + 2)[0]
    opt_size = struct.unpack_from("<H", data, coff + 16)[0]
    magic = struct.unpack_from("<H", data, coff + 20)[0]
    if magic == 0x10B:
        image_base = struct.unpack_from("<I", data, coff + 20 + 28)[0]
    elif magic == 0x20B:
        image_base = struct.unpack_from("<Q", data, coff + 20 + 24)[0]
    else:
        raise SystemExit(f"PE magic {magic:#x}")
    sec_off = coff + 20 + opt_size
    secs = []
    for i in range(nsec):
        o = sec_off + i * 40
        vsz, va, rsz, raw = struct.unpack_from("<IIII", data, o + 8)
        secs.append((va, vsz, raw, rsz))
    return image_base, secs


def va_to_off(va: int, image_base: int, secs) -> int:
    rva = va - image_base
    for sva, vsz, raw, rsz in secs:
        if sva <= rva < sva + max(vsz, rsz):
            return raw + (rva - sva)
    raise SystemExit(f"VA non mappée: {va:#x}")


def decrypt_key(blob: bytes) -> bytes:
    image_base, secs = pe_map(blob)
    off = lambda va: va_to_off(va, image_base, secs)
    raw = blob[off(VA_A) : off(VA_A) + 16]
    raw += blob[off(VA_B) : off(VA_B) + 16]
    raw += blob[off(VA_C) : off(VA_C) + 16]
    raw += TAIL
    if len(raw) != XOR_LEN:
        raise SystemExit(f"blob {len(raw)} != {XOR_LEN}")
    return bytes(b ^ ((i + XOR_ADD) & 0xFF) for i, b in enumerate(raw))


def live_check(password: str) -> None:
    import ctypes
    import importlib.util
    import subprocess
    import time

    spec = importlib.util.spec_from_file_location(
        "imgui_crackme_patch", Path(__file__).with_name("imgui-crackme-patch.py")
    )
    if spec is None or spec.loader is None:
        raise SystemExit("patcher introuvable")
    patch_mod = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(patch_mod)
    patch = patch_mod.patch

    wow = Path(r"C:\Windows\SysWOW64")
    missing = [n for n in ("VCRUNTIME140.dll", "MSVCP140.dll") if not (wow / n).is_file()]
    if missing:
        raise SystemExit(
            "live: CRT x86 absent ("
            + ", ".join(missing)
            + ") — CrackME.exe est PE32, exit 0xC0000135 sans VC++ 2015-2022 x86"
        )

    user32 = ctypes.windll.user32

    FindWindowW = user32.FindWindowW
    FindWindowW.argtypes = [ctypes.c_wchar_p, ctypes.c_wchar_p]
    FindWindowW.restype = ctypes.c_void_p
    FindWindowExW = user32.FindWindowExW
    FindWindowExW.argtypes = [
        ctypes.c_void_p,
        ctypes.c_void_p,
        ctypes.c_wchar_p,
        ctypes.c_wchar_p,
    ]
    FindWindowExW.restype = ctypes.c_void_p
    GetWindowTextW = user32.GetWindowTextW
    GetWindowTextLengthW = user32.GetWindowTextLengthW
    IsWindowVisible = user32.IsWindowVisible
    SetForegroundWindow = user32.SetForegroundWindow
    GetWindowRect = user32.GetWindowRect
    SetCursorPos = user32.SetCursorPos
    mouse_event = user32.mouse_event
    SendInput = user32.SendInput

    class RECT(ctypes.Structure):
        _fields_ = [
            ("left", ctypes.c_long),
            ("top", ctypes.c_long),
            ("right", ctypes.c_long),
            ("bottom", ctypes.c_long),
        ]

    PUL = ctypes.POINTER(ctypes.c_ulong)

    class KEYBDINPUT(ctypes.Structure):
        _fields_ = [
            ("wVk", ctypes.c_ushort),
            ("wScan", ctypes.c_ushort),
            ("dwFlags", ctypes.c_ulong),
            ("time", ctypes.c_ulong),
            ("dwExtraInfo", PUL),
        ]

    class INPUT_I(ctypes.Union):
        _fields_ = [("ki", KEYBDINPUT)]

    class INPUT(ctypes.Structure):
        _fields_ = [("type", ctypes.c_ulong), ("ii", INPUT_I)]

    KEYEVENTF_UNICODE = 0x0004
    KEYEVENTF_KEYUP = 0x0002
    INPUT_KEYBOARD = 1
    MOUSEEVENTF_LEFTDOWN = 0x0002
    MOUSEEVENTF_LEFTUP = 0x0004

    def send_unicode(text: str) -> None:
        extra = ctypes.c_ulong(0)
        for ch in text:
            inp = INPUT()
            inp.type = INPUT_KEYBOARD
            inp.ii.ki = KEYBDINPUT(0, ord(ch), KEYEVENTF_UNICODE, 0, ctypes.pointer(extra))
            SendInput(1, ctypes.byref(inp), ctypes.sizeof(INPUT))
            inp.ii.ki.dwFlags = KEYEVENTF_UNICODE | KEYEVENTF_KEYUP
            SendInput(1, ctypes.byref(inp), ctypes.sizeof(INPUT))

    def click(x: int, y: int) -> None:
        SetCursorPos(x, y)
        time.sleep(0.05)
        mouse_event(MOUSEEVENTF_LEFTDOWN, 0, 0, 0, 0)
        mouse_event(MOUSEEVENTF_LEFTUP, 0, 0, 0, 0)

    def enum_messageboxes() -> list[str]:
        texts: list[str] = []

        @ctypes.WINFUNCTYPE(ctypes.c_bool, ctypes.c_void_p, ctypes.c_void_p)
        def cb(hwnd, _lparam):
            if not IsWindowVisible(hwnd):
                return True
            n = GetWindowTextLengthW(hwnd)
            buf = ctypes.create_unicode_buffer(n + 1)
            GetWindowTextW(hwnd, buf, n + 1)
            title = buf.value
            if title != "CrackME ALPHA":
                return True
            cls = ctypes.create_unicode_buffer(64)
            user32.GetClassNameW(hwnd, cls, 64)
            if cls.value == "#32770":
                # Static child holds the body
                child = FindWindowExW(hwnd, None, "Static", None)
                if child:
                    n2 = GetWindowTextLengthW(child)
                    b2 = ctypes.create_unicode_buffer(n2 + 1)
                    GetWindowTextW(child, b2, n2 + 1)
                    texts.append(b2.value)
                else:
                    texts.append(title)
            return True

        user32.EnumWindows(cb, 0)
        return texts

    patch(BIN, PATCHED)
    proc = subprocess.Popen([str(PATCHED)], cwd=str(PATCHED.parent))
    try:
        hwnd = None
        for _ in range(50):
            time.sleep(0.1)
            hwnd = FindWindowW("class001", "CrackME ALPHA")
            if hwnd:
                break
        if not hwnd:
            raise SystemExit("fenêtre CrackME ALPHA introuvable (D3D / runtime ?)")
        SetForegroundWindow(hwnd)
        time.sleep(0.3)
        send_unicode(password)
        time.sleep(0.2)
        rc = RECT()
        GetWindowRect(hwnd, ctypes.byref(rc))
        # Bouton Submit : bandeau bas de la fenêtre 162×120.
        cx = (rc.left + rc.right) // 2
        cy = rc.top + int((rc.bottom - rc.top) * 0.72)
        click(cx, cy)
        time.sleep(0.15)
        click(cx, cy)
        body = ""
        for _ in range(40):
            time.sleep(0.1)
            boxes = enum_messageboxes()
            if boxes:
                body = boxes[0]
                break
        if "Cracked" not in body:
            raise SystemExit(f"MessageBox inattendue: {body!r}")
        print("live: MessageBox Cracked")
    finally:
        if proc.poll() is None:
            proc.kill()
            try:
                proc.wait(timeout=5)
            except subprocess.TimeoutExpired:
                pass


def main() -> int:
    ap = argparse.ArgumentParser(description="Solveur ImGUI-CrackME")
    ap.add_argument("-q", "--quiet", action="store_true")
    ap.add_argument("--check", action="store_true")
    ap.add_argument("--live", action="store_true", help="preuve GUI (copie patchée)")
    args = ap.parse_args()
    key = decrypt_key(BIN.read_bytes())
    if key != EXPECTED:
        print(f"mismatch: {key!r}", file=sys.stderr)
        return 1
    if args.quiet:
        print(key.decode("ascii"))
    else:
        print(f"password: {key.decode('ascii')}")
        print(f"len: {len(key)}")
    if args.check:
        print("check: XOR 51 octets == expected")
        if args.live:
            if sys.platform != "win32":
                raise SystemExit("--live seulement sous Windows")
            live_check(key.decode("ascii"))
    return 0


if __name__ == "__main__":
    sys.exit(main())
