#!/usr/bin/env python3
"""HydraVault: dump expected KEY from hv*.exe and type it immediately.

Run as Administrator on Windows, vault already on KEY prompt (fail=0):

  set HYDRA_VAULT_NO_SELFDBG=1
  HydraVault.exe
  python hydra_dump_type.py F29C2293D35CAFBF

Do NOT attach x64dbg. Do NOT submit a wrong key first.
"""
from __future__ import annotations

import ctypes
import sys
import time
from ctypes import wintypes

if sys.platform != "win32":
    sys.exit("Windows only")

k32 = ctypes.WinDLL("kernel32", use_last_error=True)
u32 = ctypes.WinDLL("user32", use_last_error=True)
psapi = ctypes.WinDLL("psapi", use_last_error=True)

PROCESS_VM_READ = 0x10
PROCESS_QUERY_INFORMATION = 0x400
TH32CS_SNAPPROCESS = 0x2
MEM_COMMIT = 0x1000
RW_OK = {0x04, 0x20, 0x40}
# RVA of expected block from skalvin writeup (inner image)
EXPECTED_RVA = 0x2F1F0

# --- minimal AES-128 ECB (for variant C) ---
_S=[0x63,0x7c,0x77,0x7b,0xf2,0x6b,0x6f,0xc5,0x30,0x01,0x67,0x2b,0xfe,0xd7,0xab,0x76,0xca,0x82,0xc9,0x7d,0xfa,0x59,0x47,0xf0,0xad,0xd4,0xa2,0xaf,0x9c,0xa4,0x72,0xc0,0xb7,0xfd,0x93,0x26,0x36,0x3f,0xf7,0xcc,0x34,0xa5,0xe5,0xf1,0x71,0xd8,0x31,0x15,0x04,0xc7,0x23,0xc3,0x18,0x96,0x05,0x9a,0x07,0x12,0x80,0xe2,0xeb,0x27,0xb2,0x75,0x09,0x83,0x2c,0x1a,0x1b,0x6e,0x5a,0xa0,0x52,0x3b,0xd6,0xb3,0x29,0xe3,0x2f,0x84,0x53,0xd1,0x00,0xed,0x20,0xfc,0xb1,0x5b,0x6a,0xcb,0xbe,0x39,0x4a,0x4c,0x58,0xcf,0xd0,0xef,0xaa,0xfb,0x43,0x4d,0x33,0x85,0x45,0xf9,0x02,0x7f,0x50,0x3c,0x9f,0xa8,0x51,0xa3,0x40,0x8f,0x92,0x9d,0x38,0xf5,0xbc,0xb6,0xda,0x21,0x10,0xff,0xf3,0xd2,0xcd,0x0c,0x13,0xec,0x5f,0x97,0x44,0x17,0xc4,0xa7,0x7e,0x3d,0x64,0x5d,0x19,0x73,0x60,0x81,0x4f,0xdc,0x22,0x2a,0x90,0x88,0x46,0xee,0xb8,0x14,0xde,0x5e,0x0b,0xdb,0xe0,0x32,0x3a,0x0a,0x49,0x06,0x24,0x5c,0xc2,0xd3,0xac,0x62,0x91,0x95,0xe4,0x79,0xe7,0xc8,0x37,0x6d,0x8d,0xd5,0x4e,0xa9,0x6c,0x56,0xf4,0xea,0x65,0x7a,0xae,0x08,0xba,0x78,0x25,0x2e,0x1c,0xa6,0xb4,0xc6,0xe8,0xdd,0x74,0x1f,0x4b,0xbd,0x8b,0x8a,0x70,0x3e,0xb5,0x66,0x48,0x03,0xf6,0x0e,0x61,0x35,0x57,0xb9,0x86,0xc1,0x1d,0x9e,0xe1,0xf8,0x98,0x11,0x69,0xd9,0x8e,0x94,0x9b,0x1e,0x87,0xe9,0xce,0x55,0x28,0xdf,0x8c,0xa1,0x89,0x0d,0xbf,0xe6,0x42,0x68,0x41,0x99,0x2d,0x0f,0xb0,0x54,0xbb,0x16]
_INV=[0]*256
for _i,_v in enumerate(_S): _INV[_v]=_i
_Rcon=[0,1,2,4,8,0x10,0x20,0x40,0x80,0x1B,0x36]
def _xt(a): return ((a<<1)^0x1b)&0xff if a&0x80 else (a<<1)&0xff
def _mul(a,b):
  r=0
  for _ in range(8):
    if b&1: r^=a
    a=_xt(a); b>>=1
  return r
def _expand(key):
  w=[list(key[i:i+4]) for i in range(0,16,4)]
  for i in range(4,44):
    t=w[i-1][:]
    if i%4==0:
      t=t[1:]+t[:1]; t=[_S[x] for x in t]; t[0]^=_Rcon[i//4]
    w.append([w[i-4][j]^t[j] for j in range(4)])
  return w
def aes_dec(ct, key):
  w=_expand(key); s=[[ct[r+4*c] for c in range(4)] for r in range(4)]
  def add(rr):
    for c in range(4):
      for r0 in range(4): s[r0][c]^=w[rr*4+c][r0]
  def invshift():
    s[1]=s[1][3:]+s[1][:3]; s[2]=s[2][2:]+s[2][:2]; s[3]=s[3][1:]+s[3][:1]
  def invsub():
    for r in range(4):
      for c in range(4): s[r][c]=_INV[s[r][c]]
  def invmix():
    for c in range(4):
      a=[s[r][c] for r in range(4)]
      s[0][c]=_mul(a[0],14)^_mul(a[1],11)^_mul(a[2],13)^_mul(a[3],9)
      s[1][c]=_mul(a[0],9)^_mul(a[1],14)^_mul(a[2],11)^_mul(a[3],13)
      s[2][c]=_mul(a[0],13)^_mul(a[1],9)^_mul(a[2],14)^_mul(a[3],11)
      s[3][c]=_mul(a[0],11)^_mul(a[1],13)^_mul(a[2],9)^_mul(a[3],14)
  add(10)
  for r in range(9,0,-1):
    invshift(); invsub(); add(r); invmix()
  invshift(); invsub(); add(0)
  return bytes(s[r][c] for c in range(4) for r in range(4))
AES_CONST_KEY=bytes.fromhex("a7c4d05ca056c5ae76b34061c1a141f5")



class PE32(ctypes.Structure):
    _fields_ = [
        ("dwSize", wintypes.DWORD),
        ("cntUsage", wintypes.DWORD),
        ("pid", wintypes.DWORD),
        ("heap", ctypes.c_void_p),
        ("modid", wintypes.DWORD),
        ("threads", wintypes.DWORD),
        ("ppid", wintypes.DWORD),
        ("pri", ctypes.c_long),
        ("flags", wintypes.DWORD),
        ("exe", ctypes.c_wchar * 260),
    ]


class MBI(ctypes.Structure):
    _fields_ = [
        ("BaseAddress", ctypes.c_uint64),
        ("AllocBase", ctypes.c_uint64),
        ("AllocProt", wintypes.DWORD),
        ("_p", wintypes.DWORD),
        ("RegionSize", ctypes.c_uint64),
        ("State", wintypes.DWORD),
        ("Protect", wintypes.DWORD),
        ("Type", wintypes.DWORD),
    ]


def enable_debug():
    adv = ctypes.WinDLL("advapi32")

    class LUID(ctypes.Structure):
        _fields_ = [("Lo", wintypes.DWORD), ("Hi", wintypes.LONG)]

    class LA(ctypes.Structure):
        _fields_ = [("Luid", LUID), ("Attr", wintypes.DWORD)]

    class TKP(ctypes.Structure):
        _fields_ = [("Count", wintypes.DWORD), ("Privs", LA * 1)]

    h = wintypes.HANDLE()
    adv.OpenProcessToken(k32.GetCurrentProcess(), 0x28, ctypes.byref(h))
    luid = LUID()
    adv.LookupPrivilegeValueW(None, "SeDebugPrivilege", ctypes.byref(luid))
    tkp = TKP()
    tkp.Count = 1
    tkp.Privs[0].Luid = luid
    tkp.Privs[0].Attr = 2
    adv.AdjustTokenPrivileges(h, False, ctypes.byref(tkp), 0, None, None)
    k32.CloseHandle(h)


def find_hv():
    snap = k32.CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0)
    pe = PE32()
    pe.dwSize = ctypes.sizeof(pe)
    out = []
    ok = k32.Process32FirstW(snap, ctypes.byref(pe))
    while ok:
        low = pe.exe.lower()
        if low.startswith("hv") and low.endswith(".exe") and "hydravault" not in low:
            out.append((pe.pid, pe.exe))
        ok = k32.Process32NextW(snap, ctypes.byref(pe))
    k32.CloseHandle(snap)
    return out


def rpm(h, a, s):
    b = ctypes.create_string_buffer(s)
    g = ctypes.c_size_t()
    if not k32.ReadProcessMemory(h, ctypes.c_void_p(a), b, s, ctypes.byref(g)):
        return None
    return b.raw[: g.value]


def module_bases(h):
    arr = (ctypes.c_uint64 * 1024)()
    needed = wintypes.DWORD()
    if not psapi.EnumProcessModulesEx(
        h, ctypes.byref(arr), ctypes.sizeof(arr), ctypes.byref(needed), 0x03
    ):
        return []
    n = needed.value // 8
    return [arr[i] for i in range(n)]


def escore(b: bytes) -> int:
    return sum(1 for x in b if x) * 16 + len(set(b))


def scan(h, marker: bytes):
    out = []
    a = 0x10000
    mbi = MBI()
    while a < 0x7FFFFFFF0000:
        r = k32.VirtualQueryEx(h, ctypes.c_void_p(a), ctypes.byref(mbi), ctypes.sizeof(mbi))
        if not r:
            break
        rs = mbi.RegionSize
        if mbi.State == MEM_COMMIT and mbi.Protect in RW_OK and 0 < rs <= 0x8000000:
            d = rpm(h, mbi.BaseAddress, min(rs, 0x8000000))
            if d:
                i = d.find(marker)
                while i >= 0 and i + 40 <= len(d):
                    aa = mbi.BaseAddress + i
                    ctx = d[max(0, i - 8) : i + 40]
                    for off in (8, 16, 4, 12, 20, 24):
                        if i + off + 16 <= len(d):
                            key = d[i + off : i + off + 16]
                            # also first12 + dword at +24
                            variants = [(off, key)]
                            if off == 8 and i + 28 <= len(d):
                                v = d[i + 8 : i + 20] + d[i + 24 : i + 28]
                                variants.append((804, v))  # tag 804 = 8||24
                                v2 = d[i + 8 : i + 20] + d[i + 20 : i + 24][::-1]
                                variants.append((820, v2))  # bswap last4 of +8..+24
                            for tag, kb in variants:
                                if escore(kb) >= 100:
                                    out.append((escore(kb), tag, aa, kb, ctx))
                    i = d.find(marker, i + 1)
        a += rs
    return out


INPUT_KB = 1
KF_UNI = 4
KF_UP = 2


class KI(ctypes.Structure):
    _fields_ = [
        ("wVk", wintypes.WORD),
        ("wScan", wintypes.WORD),
        ("dwFlags", wintypes.DWORD),
        ("time", wintypes.DWORD),
        ("dwExtra", ctypes.c_void_p),
    ]


class INPU(ctypes.Union):
    _fields_ = [("ki", KI), ("pad", ctypes.c_ubyte * 40)]


class INPT(ctypes.Structure):
    _anonymous_ = ("u",)
    _fields_ = [("type", wintypes.DWORD), ("u", INPU)]


def send_text(txt: str):
    seq = []
    for c in txt:
        seq.append((ord(c), KF_UNI))
        seq.append((ord(c), KF_UNI | KF_UP))
    arr = (INPT * len(seq))()
    for i, (sc, fl) in enumerate(seq):
        arr[i].type = INPUT_KB
        arr[i].u.ki.wScan = sc
        arr[i].u.ki.dwFlags = fl
    u32.SendInput(len(seq), arr, ctypes.sizeof(INPT))


def send_enter():
    arr = (INPT * 2)()
    arr[0].type = arr[1].type = INPUT_KB
    arr[0].u.ki.wVk = 13
    arr[1].u.ki.wVk = 13
    arr[1].u.ki.dwFlags = KF_UP
    u32.SendInput(2, arr, ctypes.sizeof(INPT))


def main():
    if len(sys.argv) < 2:
        print("Usage: python hydra_dump_type.py <CHALLENGE16hex>")
        return 2
    chal = sys.argv[1].strip().replace(" ", "").upper()
    if len(chal) != 16:
        print("CHALLENGE must be 16 hex chars")
        return 2
    marker = bytes.fromhex(chal)
    enable_debug()
    vps = find_hv()
    if not vps:
        print("!! no hv*.exe - start vault first")
        return 1
    pid, name = vps[0]
    print(f"[*] {name} pid={pid}")
    h = k32.OpenProcess(PROCESS_VM_READ | PROCESS_QUERY_INFORMATION, False, pid)
    if not h:
        print(f"!! OpenProcess failed {k32.GetLastError()} - Admin?")
        return 1

    # Global expected: prefer main image (usually first module)
    global_exp = None
    bases = module_bases(h)
    for base in bases[:8]:
        blob = rpm(h, base + EXPECTED_RVA, 16)
        if not blob or escore(blob) < 180:
            continue
        print(f"[*] module+0x2F1F0 @ {base+EXPECTED_RVA:X}: {blob.hex().upper()}")
        if global_exp is None:
            global_exp = blob  # first high-entropy = main hv.exe typically

    print("[*] scanning (tight) ...")
    ranked = []
    for _ in range(3):
        ranked = sorted(scan(h, marker), key=lambda t: t[0], reverse=True)
        time.sleep(0.05)
    k32.CloseHandle(h)

    if not ranked:
        print("!! no candidates")
        return 1

    print(f"[*] {len(ranked)} candidates:")
    shown = set()
    for sc, tag, aa, kb, ctx in ranked[:10]:
        hx = kb.hex().upper()
        if hx in shown:
            continue
        shown.add(hx)
        print(f"    score={sc} off={tag} @{aa:X}: {hx}")
        print(f"      ctx={ctx.hex().upper()}")

    raw8 = None
    for sc, tag, aa, kb, ctx in ranked:
        if tag == 8:
            raw8 = kb
            break
    if raw8 is None:
        raw8 = ranked[0][3]

    bswap4 = raw8[:12] + raw8[12:16][::-1]
    variants = {
        "A": raw8,
        "B": bswap4,
    }
    if global_exp is not None:
        variants["C"] = aes_dec(global_exp, AES_CONST_KEY)
        variants["D"] = raw8[:12] + global_exp[12:]  # graft last4 from global expected

    print()
    print("=" * 50)
    for k, v in variants.items():
        note = {
            "A": "stack+8 raw (skalvin)",
            "B": "stack+8 last4-bswap (So close hint)",
            "C": "AES_dec(global expected) with const key",
            "D": "first12(stack)+last4(global)",
        }.get(k, "")
        print(f"{k}: {v.hex().upper()}  ({note})")
    print("=" * 50)

    which = "B"
    if len(sys.argv) >= 3 and sys.argv[2].upper() in variants:
        which = sys.argv[2].upper()
    key = variants[which].hex().upper()
    print(f"Sending variant {which}: {key}")
    print("Click HydraVault console - typing in 1.2s ...")
    time.sleep(1.2)
    send_text(key)
    time.sleep(0.05)
    send_enter()
    print("[*] sent - check for ACCESS GRANTED")
    print("DENIED? taskkill + relaunch FRESH, then try another letter:")
    print("  py -3 hydra_dump_type.py <CHALLENGE> A|B|C|D")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
