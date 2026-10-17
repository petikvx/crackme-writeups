#!/usr/bin/env python3
"""Keygen — VSEC Challenger #2 (6acc0cbbace07d1c3fbc4afb).

Serial XXXXX-XXXX-XXXX-XXXX pour un username de 4 à 20 octets.
uhash / ucrc / le mélangeur de W3 sont les trois VM aplaties du binaire ;
on les rejoue (Unicorn) au lieu de lever le bytecode à la main.
W0, W1, W2 et le tour final de W3 sont en Python pur.

Défaut : --user petik
  -q        serial seul
  --check   pipe le couple dans Challenger_2.exe (Wine) et exige ACCESS GRANTED
"""

from __future__ import annotations

import argparse
import glob
import shutil
import struct
import subprocess
import sys
import tempfile
from pathlib import Path

from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_PROT_ALL, UC_HOOK_CODE, UC_HOOK_MEM_UNMAPPED, UC_SECOND_SCALE
from unicorn.x86_const import (
    UC_X86_REG_RAX,
    UC_X86_REG_RCX,
    UC_X86_REG_RDX,
    UC_X86_REG_R8,
    UC_X86_REG_RIP,
    UC_X86_REG_RSP,
)

ROOT = Path(__file__).resolve().parents[1]
BINARY = ROOT / "original" / "Challenger_2.exe"
IMAGE = 0x140000000

UHASH_GIANT = 0x1400EB250
UCRC_GIANT = 0x1400CA860
MIX_GIANT = 0x1400A95D0
UHASH_CB = 0x1400CA520
UCRC_CB = 0x140002140
MIX_CB = 0x140002940
HELPER_UHASH = 0x140001D00
HELPER_UCRC = 0x140001D40
FN_A = 0x14012A9C0
FN_B = 0x14012AA00

MASK64 = 0xFFFFFFFFFFFFFFFF
ALPH = "ABCDEFGHJKLMNPQRSTUVWXYZ23456789"


def xorshift(x: int, sh: int) -> int:
    x &= MASK64
    return ((x >> sh) ^ x) & MASK64


def encode_group(value: int, nchars: int) -> str:
    out = []
    for i in range(nchars - 1, -1, -1):
        out.append(ALPH[(value >> (5 * i)) & 31])
    return "".join(out)


def encode_serial(w0: int, w1: int, w2: int, w3: int) -> str:
    return "-".join(
        (
            encode_group(w0, 5),
            encode_group(w1, 4),
            encode_group(w2, 4),
            encode_group(w3, 4),
        )
    )


def pick_w1() -> int:
    """Plus petit W1 sur 20 bits : popcount == 10 et n % 7 == 3 (ctx+0x38 == 0)."""
    for n in range(1 << 20):
        if n.bit_count() == 10 and n % 7 == 3:
            return n
    raise RuntimeError("aucun W1")


class Vm:
    """Rejoue uhash, ucrc et le mélangeur. chrono::now() est constant : le
    témoin de temps du binaire renvoie quand même 1, comme en vrai (elapsed >= -999).
    """

    def __init__(self, path: Path) -> None:
        blob = path.read_bytes()
        e_lfanew = struct.unpack_from("<I", blob, 0x3C)[0]
        nsec = struct.unpack_from("<H", blob, e_lfanew + 6)[0]
        soh = struct.unpack_from("<H", blob, e_lfanew + 20)[0]
        sec = e_lfanew + 24 + soh
        self.uc = Uc(UC_ARCH_X86, UC_MODE_64)
        self.uc.mem_map(IMAGE, 0x280000, UC_PROT_ALL)
        self._restore = []
        for i in range(nsec):
            off = sec + i * 40
            vsz, va, rsz, raw = struct.unpack_from("<IIII", blob, off + 8)
            if raw and rsz:
                chunk = blob[raw : raw + rsz]
                self.uc.mem_write(IMAGE + va, chunk)
                if va in (0x12B000,):  # .data, réécrit par les VM
                    self._restore.append((IMAGE + va, chunk))
        self.bss = IMAGE + 0x146000
        self.bss_size = 0x129200
        self.uc.mem_map(0x200000000, 0x800000, UC_PROT_ALL)
        self.uc.mem_map(0x300000000, 0x10000, UC_PROT_ALL)
        self.uc.mem_map(0x400000000, 0x3000, UC_PROT_ALL)
        self.ret = 0x400020000
        self.uc.mem_map(self.ret, 0x1000, UC_PROT_ALL)
        self.uc.mem_write(self.ret, b"\xF4")
        self.uc.mem_map(0x500000000, 0x200000, UC_PROT_ALL)
        self.heap = 0x50001000
        stub = 0x400000000
        self.now, self.memset, self.memcpy, self.throw, self.malloc, self.free, self.strlen = (
            stub + 0x100 + i * 0x40 for i in range(7)
        )
        for addr in (self.now, self.memset, self.memcpy, self.throw, self.malloc, self.free, self.strlen):
            self.uc.mem_write(addr, b"\xF4")
        iat = {
            0x1402703C0: self.now,     # system_clock::now
            0x140270380: self.memset,
            0x140270378: self.memcpy,
            0x140270400: self.throw,   # __throw_bad_function_call
            0x140270370: self.malloc,
            0x140270368: self.free,
            0x140270398: self.strlen,
            0x140270440: self.malloc,  # operator new
            0x140270438: self.free,    # operator delete
        }
        for va, dest in iat.items():
            self.uc.mem_write(va, struct.pack("<Q", dest))
        self.uc.hook_add(UC_HOOK_CODE, self._hook, begin=stub, end=stub + 0x3000)
        self.uc.hook_add(UC_HOOK_CODE, self._hook, begin=self.ret, end=self.ret + 1)
        self.uc.hook_add(UC_HOOK_MEM_UNMAPPED, self._unmapped)

    def _popret(self, rax: int | None = None) -> None:
        if rax is not None:
            self.uc.reg_write(UC_X86_REG_RAX, rax & MASK64)
        rsp = self.uc.reg_read(UC_X86_REG_RSP)
        ret = struct.unpack("<Q", self.uc.mem_read(rsp, 8))[0]
        self.uc.reg_write(UC_X86_REG_RSP, rsp + 8)
        self.uc.reg_write(UC_X86_REG_RIP, ret)

    def _hook(self, uc: Uc, addr: int, size: int, user) -> None:
        if addr == self.now:
            # deux appels rapprochés : elapsed 0, setge vrai, la fonction temps renvoie 1
            self._popret(0x100000)
        elif addr == self.memset:
            dst = uc.reg_read(UC_X86_REG_RCX)
            val = uc.reg_read(UC_X86_REG_RDX) & 0xFF
            n = uc.reg_read(UC_X86_REG_R8)
            if n:
                uc.mem_write(dst, bytes([val]) * n)
            self._popret(dst)
        elif addr == self.memcpy:
            dst = uc.reg_read(UC_X86_REG_RCX)
            src = uc.reg_read(UC_X86_REG_RDX)
            n = uc.reg_read(UC_X86_REG_R8)
            if n:
                uc.mem_write(dst, bytes(uc.mem_read(src, n)))
            self._popret(dst)
        elif addr == self.malloc:
            n = uc.reg_read(UC_X86_REG_RCX)
            p = self.heap
            self.heap = (p + max(n, 1) + 32 + 15) & ~15
            self._popret(p)
        elif addr == self.free:
            self._popret(0)
        elif addr == self.strlen:
            rcx = uc.reg_read(UC_X86_REG_RCX)
            buf = bytes(uc.mem_read(rcx, 4096))
            self._popret(buf.index(0))
        elif addr == self.throw:
            raise RuntimeError("bad_function_call dans la VM")
        elif addr == self.ret:
            uc.emu_stop()

    def _unmapped(self, uc: Uc, access: int, addr: int, size: int, value: int, user) -> bool:
        uc.mem_map(addr & ~0xFFF, 0x10000, UC_PROT_ALL)
        return True

    def _wq(self, addr: int, value: int) -> None:
        self.uc.mem_write(addr, struct.pack("<Q", value & MASK64))

    def _reset(self) -> None:
        for addr, chunk in self._restore:
            self.uc.mem_write(addr, chunk)
        self.uc.mem_write(self.bss, b"\x00" * self.bss_size)
        self.uc.mem_write(0x300000000, b"\x00" * 0x1000)

    def _enter(self, entry: int, rcx: int, rdx: int) -> int:
        rsp = (0x200000000 + 0x600000) & ~0xF
        rsp -= 8
        self._wq(rsp, self.ret)
        self.uc.reg_write(UC_X86_REG_RSP, rsp)
        self.uc.reg_write(UC_X86_REG_RCX, rcx)
        self.uc.reg_write(UC_X86_REG_RDX, rdx)
        self.uc.reg_write(UC_X86_REG_R8, 0)
        self.uc.reg_write(UC_X86_REG_RAX, 0)
        self.uc.reg_write(UC_X86_REG_RIP, entry)
        self.uc.emu_start(entry, self.ret, timeout=60 * UC_SECOND_SCALE, count=200_000_000)
        return self.uc.reg_read(UC_X86_REG_RAX)

    def _sso(self, addr: int, raw: bytes) -> None:
        self._wq(addr, addr + 16)
        self._wq(addr + 8, len(raw))
        buf = raw + b"\x00"
        buf = buf + b"\x00" * (16 - len(buf))
        self.uc.mem_write(addr + 16, buf[:16])

    def uhash(self, name: bytes) -> int:
        self._reset()
        string = 0x300000400
        self._sso(string, name)
        state, dummy, obj = 0x300000200, 0x300000300, 0x300000100
        self._wq(obj + 0x00, dummy)
        self._wq(obj + 0x08, string)
        self._wq(obj + 0x10, HELPER_UHASH)
        self._wq(obj + 0x18, UHASH_CB)
        return self._enter(UHASH_GIANT, state, obj)

    def ucrc(self, name: bytes) -> int:
        self._reset()
        string = 0x300000400
        self._sso(string, name)
        state, dummy, obj = 0x300000200, 0x300000300, 0x300000100
        self._wq(obj + 0x00, dummy)
        self._wq(obj + 0x08, string)
        self._wq(obj + 0x10, HELPER_UCRC)
        self._wq(obj + 0x18, UCRC_CB)
        return self._enter(UCRC_GIANT, state, obj) & 0xFFFFFFFF

    def mix(self, value: int, param: int) -> int:
        self._reset()
        obj, obj2 = 0x300000100, 0x300000180
        self._wq(obj + 0x00, value)
        self._wq(obj + 0x08, param)
        self._wq(obj + 0x10, MIX_CB)
        self._wq(obj + 0x18, 0)
        self._wq(obj + 0x20, FN_A)
        self._wq(obj + 0x28, FN_B)
        self._wq(obj2 + 0x00, MIX_CB)
        self._wq(obj2 + 0x08, 0)
        self._wq(obj2 + 0x10, FN_A)
        self._wq(obj2 + 0x18, FN_B)
        return self._enter(MIX_GIANT, obj, obj2)


def words(vm: Vm, name: bytes) -> tuple[int, int, int, int, int, int]:
    """Retourne uhash, ucrc, W0, W1, W2, W3. ctx+0x38 vaut 0 sur ce chemin."""
    h = vm.uhash(name)
    c = vm.ucrc(name)
    w0 = xorshift(xorshift(h, 0x1D) * 0x85EBCA6B, 0x20) & 0x1FFFFFF
    w1 = pick_w1()
    w2 = xorshift(((0x9E3779B1 * w1) ^ w0) + 0x5F3A1, 0x14) & 0xFFFFF
    mixed = vm.mix(((c ^ w0) + w1) & MASK64, 0xB)
    acc = xorshift((mixed ^ w2) * 0x2545F491, 0x11)
    w3 = acc & 0xFFFFF
    return h, c, w0, w1, w2, w3


def serial_for(vm: Vm, name: bytes) -> str:
    _h, _c, w0, w1, w2, w3 = words(vm, name)
    return encode_serial(w0, w1, w2, w3)


def wine_check(user: str, serial: str) -> str:
    dlls = []
    for pat in (
        "/usr/lib/gcc/x86_64-w64-mingw32/*/libstdc++-6.dll",
        "/usr/lib/gcc/x86_64-w64-mingw32/*/libgcc_s_seh-1.dll",
        "/usr/x86_64-w64-mingw32/lib/libwinpthread-1.dll",
    ):
        hits = sorted(glob.glob(pat))
        if not hits:
            raise SystemExit(f"DLL Wine introuvable : {pat}")
        dlls.append(hits[-1])
    with tempfile.TemporaryDirectory(prefix="vsec2-") as tmp:
        exe = Path(tmp) / "Challenger_2.exe"
        shutil.copy(BINARY, exe)
        for dll in dlls:
            shutil.copy(dll, Path(tmp) / Path(dll).name)
        proc = subprocess.run(
            ["wine", str(exe)],
            input=f"{user}\n{serial}\n".encode(),
            cwd=tmp,
            capture_output=True,
            env={"WINEDEBUG": "-all", "PATH": "/usr/bin"},
            timeout=30,
        )
    out = proc.stdout.decode("utf-8", "replace")
    if "ACCESS GRANTED" not in out:
        sys.stderr.write(out + proc.stderr.decode("utf-8", "replace"))
        raise SystemExit("Wine : ACCESS GRANTED absent")
    return out


def main() -> None:
    ap = argparse.ArgumentParser(description="Keygen VSEC Challenger #2")
    ap.add_argument("--user", default="petik", help="username (4..20 octets, défaut petik)")
    ap.add_argument("-q", action="store_true", help="n'imprimer que le serial")
    ap.add_argument("--check", action="store_true", help="vérifier sous Wine")
    args = ap.parse_args()
    name = args.user.encode()
    if not 4 <= len(name) <= 20:
        raise SystemExit("username : longueur 4..20")
    vm = Vm(BINARY)
    h, c, w0, w1, w2, w3 = words(vm, name)
    serial = encode_serial(w0, w1, w2, w3)
    if args.q and not args.check:
        print(serial)
    elif not args.q:
        print(f"user   {args.user}")
        print(f"uhash  0x{h:016x}")
        print(f"ucrc   0x{c:08x}")
        print(f"W0     0x{w0:x}")
        print(f"W1     0x{w1:x}")
        print(f"W2     0x{w2:x}")
        print(f"W3     0x{w3:x}")
        print(f"serial {serial}")
    if args.check:
        out = wine_check(args.user, serial)
        if args.q:
            print(serial)
        flag = next((ln.strip() for ln in out.splitlines() if ln.startswith("CMO{")), "")
        print(out if not args.q else flag or out)
        if "ACCESS GRANTED" not in out:
            raise SystemExit(1)


if __name__ == "__main__":
    main()
