#!/usr/bin/env python3
"""Unicorn harness for sub_140001030 (matryoshka9_cmo.exe).

Maps the PE at its preferred base (0x140000000, no relocation needed),
runs the real function, and stubs out the handful of CRT/WinAPI calls it
needs (cin.getline, cout flush, printf, VirtualAlloc, _security_check_cookie)
so we never need real stdio or kernel32 -- everything else (the sanitize
loop, the Speck-like decrypt loop, and the decrypted shellcode itself) runs
as real emulated x86-64 code.
"""
import sys
import pefile
from unicorn import *
from unicorn.x86_const import *

EXE = "/home/petik/Documents/crackme-writeups/authors/sacredgravel44/6ad44c6c5fa39ab0d4ac1c16/original/matryoshka9_cmo.exe"
IMAGE_BASE = 0x140000000
FUNC_ENTRY = 0x140001030
FAKE_RET = 0x7000000000
STACK_TOP = 0x00007FF000000000
STACK_SIZE = 4 * 1024 * 1024
HEAP_BASE = 0x0000050000000000
HEAP_SIZE = 64 * 1024 * 1024

ADDR_PRINTF = 0x140001057
ADDR_FLUSH = 0x140001069
ADDR_GETLINE = 0x140001085
ADDR_VALLOC = 0x140001161
ADDR_SHELLCODE_CALL = 0x1400012bb
ADDR_PRINTF2 = 0x1400012d5
ADDR_PRINTF3 = 0x1400012ed
ADDR_COOKIE_CHECK = 0x140001302
VAR78_OFF = 0x108 - 0x78  # relative to rsp right after prologue (sub rsp,0x100; push rbx already done)


def page_align(n, up=True):
    if up:
        return (n + 0xFFF) & ~0xFFF
    return n & ~0xFFF


class Emu:
    def __init__(self, verbose=False):
        self.verbose = verbose
        self.pe = pefile.PE(EXE, fast_load=True)
        self.uc = Uc(UC_ARCH_X86, UC_MODE_64)
        self._map_pe()
        self._map_stack()
        self.heap_next = HEAP_BASE
        self.uc.mem_map(HEAP_BASE, HEAP_SIZE, UC_PROT_ALL)
        self._hooks()
        self.trace = []

    def _map_pe(self):
        uc = self.uc
        with open(EXE, "rb") as f:
            raw = f.read()
        # header
        hdr_size = page_align(self.pe.OPTIONAL_HEADER.SizeOfHeaders)
        uc.mem_map(IMAGE_BASE, hdr_size, UC_PROT_READ)
        uc.mem_write(IMAGE_BASE, raw[:self.pe.OPTIONAL_HEADER.SizeOfHeaders])
        for s in self.pe.sections:
            va = IMAGE_BASE + s.VirtualAddress
            vsize = page_align(max(s.Misc_VirtualSize, s.SizeOfRawData))
            uc.mem_map(va & ~0xFFF, page_align((va & 0xFFF) + vsize), UC_PROT_ALL)
            data = raw[s.PointerToRawData: s.PointerToRawData + s.SizeOfRawData]
            uc.mem_write(va, data)

    def _map_stack(self):
        self.uc.mem_map(STACK_TOP - STACK_SIZE, STACK_SIZE, UC_PROT_ALL)
        self.rsp0 = STACK_TOP - 0x1000

    def alloc(self, size):
        size = page_align(size)
        addr = self.heap_next
        self.heap_next += size
        self.uc.mem_write(addr, b"\x00" * size)
        return addr

    def _hooks(self):
        uc = self.uc

        def skip_call(addr_name):
            def _cb(u, address, size, user_data):
                # pretend the call returned: pop nothing extra needed,
                # we just jump past the 5-byte call instruction.
                u.reg_write(UC_X86_REG_RIP, address + size)
            return _cb

        uc.hook_add(UC_HOOK_CODE, skip_call("printf1"), begin=ADDR_PRINTF, end=ADDR_PRINTF + 1)
        uc.hook_add(UC_HOOK_CODE, skip_call("flush"), begin=ADDR_FLUSH, end=ADDR_FLUSH + 1)
        uc.hook_add(UC_HOOK_CODE, skip_call("printf2"), begin=ADDR_PRINTF2, end=ADDR_PRINTF2 + 1)
        uc.hook_add(UC_HOOK_CODE, skip_call("printf3"), begin=ADDR_PRINTF3, end=ADDR_PRINTF3 + 1)
        uc.hook_add(UC_HOOK_CODE, skip_call("cookie"), begin=ADDR_COOKIE_CHECK, end=ADDR_COOKIE_CHECK + 1)

        def on_getline(u, address, size, user_data):
            rcx = u.reg_read(UC_X86_REG_RCX)  # dest buffer (var_78), from lea at 0x140001078
            buf = self.serial.ljust(92, b"\x00")[:92]
            u.mem_write(rcx, buf)
            u.reg_write(UC_X86_REG_RAX, 1)
            u.reg_write(UC_X86_REG_RIP, address + size)

        uc.hook_add(UC_HOOK_CODE, on_getline, begin=ADDR_GETLINE, end=ADDR_GETLINE + 1)

        def on_valloc(u, address, size, user_data):
            rdx = u.reg_read(UC_X86_REG_RDX)  # dwSize
            ptr = self.alloc(rdx)
            u.reg_write(UC_X86_REG_RAX, ptr)
            u.reg_write(UC_X86_REG_RIP, address + size)

        uc.hook_add(UC_HOOK_CODE, on_valloc, begin=ADDR_VALLOC, end=ADDR_VALLOC + 1)

        # function-pointer target used *inside* the decrypted shellcode
        # (sub_140001010: `return VirtualAlloc(NULL, a1, 0x3000, 0x40);`)
        def on_fnptr_alloc(u, address, size, user_data):
            rcx = u.reg_read(UC_X86_REG_RCX)
            ptr = self.alloc(rcx)
            u.reg_write(UC_X86_REG_RAX, ptr)
            ret = int.from_bytes(u.mem_read(u.reg_read(UC_X86_REG_RSP), 8), "little")
            u.reg_write(UC_X86_REG_RSP, u.reg_read(UC_X86_REG_RSP) + 8)
            u.reg_write(UC_X86_REG_RIP, ret)

        uc.hook_add(UC_HOOK_CODE, on_fnptr_alloc, begin=0x140001010, end=0x140001011)

        if self.verbose:
            def trace_cb(u, address, size, user_data):
                self.trace.append(address)
            uc.hook_add(UC_HOOK_CODE, trace_cb)

        def on_unmapped(u, access, address, size, value, user_data):
            print(f"[!] unmapped access type={access} addr={hex(address)} size={size} rip={hex(u.reg_read(UC_X86_REG_RIP))}")
            return False

        uc.hook_add(UC_HOOK_MEM_UNMAPPED, on_unmapped)

    def run(self, serial: bytes, timeout_ms=15000, max_instr=0):
        self.serial = serial
        uc = self.uc
        uc.reg_write(UC_X86_REG_RSP, self.rsp0)
        uc.mem_write(self.rsp0, (FAKE_RET).to_bytes(8, "little"))
        uc.hook_add(UC_HOOK_CODE, lambda u, a, s, d: u.emu_stop() if a == FAKE_RET else None,
                    begin=FAKE_RET, end=FAKE_RET + 1)
        try:
            uc.emu_start(FUNC_ENTRY, FAKE_RET, timeout=timeout_ms * UC_SECOND_SCALE // 1000, count=max_instr)
        except UcError as e:
            print("UC error:", e, "rip=", hex(uc.reg_read(UC_X86_REG_RIP)))
            raise
        # var_E0 (the result flag written by the shellcode through the
        # context struct) sits at [entry_rsp - 0xE0]; entry_rsp == self.rsp0
        # (the return address we pushed is what RSP pointed at on entry).
        # The epilogue only adjusts RSP back, it never clobbers that stack
        # slot, so it's still readable after the call completes.
        flag = int.from_bytes(uc.mem_read(self.rsp0 - 0xE0, 8), "little")
        return uc.reg_read(UC_X86_REG_RAX), flag


if __name__ == "__main__":
    serial = sys.argv[1].encode() if len(sys.argv) > 1 else b"A" * 76
    e = Emu(verbose=False)
    rax, flag = e.run(serial)
    print("RAX at end:", hex(rax), "flag:", hex(flag), "CORRECT" if flag else "incorrect")
