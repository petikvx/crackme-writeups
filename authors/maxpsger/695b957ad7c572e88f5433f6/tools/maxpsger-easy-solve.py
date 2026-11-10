#!/usr/bin/env python3
"""Solveur — maxpsger's Easy crackme (PE64 C++, crackmes.one 695b957a…).

Le check @ 0x140001290 compare (memcmp) deux std::string lues sur cin :
  username == "crackme" (7 octets, rdata 0x140003410)
  password == "Rickroll" (8 octets, rdata 0x140003418)
Pas de keygen : valeurs fixes (aucune dépendance au nom → pas de `petik`).

Usage:
  python3 maxpsger-easy-solve.py -q
  python3 maxpsger-easy-solve.py --check          # émulation Unicorn du binaire d'origine
  python3 maxpsger-easy-solve.py --check --wine   # xvfb-run wine (si Wine dispo)
"""
import argparse, io, struct, subprocess, sys, zipfile
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
ZIP = ROOT / "original" / "download.bin"
USER, PASSWD = "crackme", "Rickroll"
BASE = 0x140000000

def load_exe() -> bytes:
    z = zipfile.ZipFile(ZIP)
    return z.read("crackme.exe", pwd=b"crackmes.one")

def extract_from_binary(d: bytes):
    """Relit les deux littéraux comparés dans la fonction check (lea rdx,[rip+x] avant memcmp)."""
    pe = struct.unpack_from("<I", d, 0x3C)[0]
    n, so = struct.unpack_from("<H", d, pe + 6)[0], struct.unpack_from("<H", d, pe + 20)[0]
    secs = []
    for i in range(n):
        o = pe + 24 + so + i * 40
        vs, va, rs, rp = struct.unpack_from("<IIII", d, o + 8)
        secs.append((va, max(vs, rs), rp, rs))
    def rva2off(r):
        for va, vs, rp, rs in secs:
            if va <= r < va + vs: return rp + r - va
    def cstr(r):
        o = rva2off(r); return d[o:d.index(b"\0", o)].decode()
    out = []
    for site in (0x14000134f, 0x140001377):  # lea rdx,[rip+disp32]
        o = rva2off(site - BASE)
        disp = struct.unpack_from("<i", d, o + 3)[0]
        out.append(cstr(site + 7 + disp - BASE))
    return out

def emu_check(user: str, pw: str) -> str:
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
    from unicorn.x86_const import UC_X86_REG_RSP, UC_X86_REG_RIP, UC_X86_REG_RAX, UC_X86_REG_RCX, UC_X86_REG_RDX, UC_X86_REG_R8
    d = load_exe()
    pe = struct.unpack_from("<I", d, 0x3C)[0]
    n, so = struct.unpack_from("<H", d, pe + 6)[0], struct.unpack_from("<H", d, pe + 20)[0]
    mu = Uc(UC_ARCH_X86, UC_MODE_64)
    mu.mem_map(BASE, 0x10000)
    mu.mem_write(BASE, d[:0x400])
    for i in range(n):
        o = pe + 24 + so + i * 40
        vs, va, rs, rp = struct.unpack_from("<IIII", d, o + 8)
        mu.mem_write(BASE + va, d[rp:rp + rs])
    mu.mem_map(0x200000, 0x20000); sp = 0x210000
    mu.mem_write(sp, struct.pack("<Q", 0xdead0000))
    inputs = [user, pw]; log = []
    mu.mem_write(0x1400030d8, struct.pack("<Q", 0xA0000)); mu.mem_write(0x1400030c8, struct.pack("<Q", 0xB0000))
    def cs(p):
        s = b""
        while True:
            c = mu.mem_read(p, 1)
            if c == b"\0": return s
            s += bytes(c); p += 1
    def ret(rax=None):
        r = struct.unpack("<Q", mu.mem_read(mu.reg_read(UC_X86_REG_RSP), 8))[0]
        mu.reg_write(UC_X86_REG_RSP, mu.reg_read(UC_X86_REG_RSP) + 8)
        if rax is not None: mu.reg_write(UC_X86_REG_RAX, rax)
        mu.reg_write(UC_X86_REG_RIP, r)
    def hook(uc, addr, size, _):
        if addr == 0x1400015a0:   # operator<<(ostream&, const char*)
            log.append(cs(uc.reg_read(UC_X86_REG_RDX)).decode()); ret(uc.reg_read(UC_X86_REG_RCX))
        elif addr == 0x140001770:  # operator>>(istream&, std::string&)
            s = inputs.pop(0).encode(); p = uc.reg_read(UC_X86_REG_RDX)
            assert len(s) < 16
            uc.mem_write(p, s + b"\0"); uc.mem_write(p + 0x10, struct.pack("<Q", len(s))); ret(uc.reg_read(UC_X86_REG_RCX))
        elif addr == 0x1400028f3:  # memcmp thunk
            a, b, l = uc.reg_read(UC_X86_REG_RCX), uc.reg_read(UC_X86_REG_RDX), uc.reg_read(UC_X86_REG_R8)
            x, y = bytes(uc.mem_read(a, l)), bytes(uc.mem_read(b, l)); ret((x > y) - (x < y))
        elif addr == 0x140003098:  # endl / manipulator call
            ret(uc.reg_read(UC_X86_REG_RCX))
        elif addr == 0x1400031b8:  # system()
            log.append("system:" + cs(uc.reg_read(UC_X86_REG_RCX)).decode()); ret(0)
        elif addr == 0xdead0000:
            uc.emu_stop()
    # slots d'import 0x140003098 (endl) / 0x1400031b8 (system) → stubs hookés hors image
    mu.mem_map(BASE + 0x20000, 0x1000)
    mu.mem_write(0x140003098, struct.pack("<Q", BASE + 0x20000))
    mu.mem_write(0x1400031b8, struct.pack("<Q", BASE + 0x20010))
    mu.mem_write(BASE + 0x20000, b"\x90" * 0x20)
    mu.hook_add(UC_HOOK_CODE, lambda uc, a, s, u: hook(uc, {BASE+0x20000: 0x140003098, BASE+0x20010: 0x1400031b8}.get(a, a), s, u))
    mu.reg_write(UC_X86_REG_RSP, sp)
    mu.emu_start(0x140001290, 0xdead0000, count=100000)
    return "|".join(log)

def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true")
    ap.add_argument("--wine", action="store_true")
    a = ap.parse_args()
    u, p = extract_from_binary(load_exe())
    assert (u, p) == (USER, PASSWD)
    print(f"{u}:{p}" if a.q else f"username = {u}\npassword = {p}")
    if a.check:
        if a.wine:
            exe = ROOT / "analysis" / "x" / "crackme.exe"
            r = subprocess.run(["xvfb-run", "-a", "wine", str(exe)], input=f"{u}\n{p}\n", text=True, capture_output=True, timeout=30)
            print(r.stdout)
            return 0 if "congrats" in r.stdout else 1
        ok = emu_check(u, p); ko = emu_check(USER, "wrong"); ko2 = emu_check("petik", PASSWD)
        print("OK  :", ok); print("KO  :", ko); print("KO2 :", ko2)
        return 0 if "congrats ??" in ok and "congrats" not in ko + ko2 else 1
    return 0

if __name__ == "__main__":
    sys.exit(main())
