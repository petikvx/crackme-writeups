#!/usr/bin/env python3
"""Vérification : émule SillyCrackMe.exe (PE64) sous Unicorn, stdin/stdout fournis,
API Win32 stubbées (pas de Wine dispo). Usage: emu-verify.py <exe> <ligne stdin>"""
import struct, sys
from unicorn import *
from unicorn.x86_const import *

MAIN = 0x140007850  # fn Rust `main` (user), évite le CRT/lang_start

def run(path, line, verbose=False):
    d = open(path, 'rb').read()
    pe = struct.unpack_from('<I', d, 0x3c)[0]
    nsec = struct.unpack_from('<H', d, pe + 6)[0]
    optsz = struct.unpack_from('<H', d, pe + 20)[0]
    opt = pe + 24
    base = struct.unpack_from('<Q', d, opt + 24)[0]
    entry = base + struct.unpack_from('<I', d, opt + 16)[0]
    imgsz = struct.unpack_from('<I', d, opt + 56)[0]
    hsz = struct.unpack_from('<I', d, opt + 60)[0]
    mu = Uc(UC_ARCH_X86, UC_MODE_64)
    mu.mem_map(base, (imgsz + 0xfff) & ~0xfff)
    mu.mem_write(base, d[:hsz])
    for i in range(nsec):
        s = opt + optsz + 40 * i
        vs, va, rs, ro = struct.unpack_from('<IIII', d, s + 8)
        mu.mem_write(base + va, d[ro:ro + min(rs, vs)])
    # imports -> stubs
    STUB = 0x7f000000
    mu.mem_map(STUB, 0x10000)
    mu.mem_write(STUB, b'\xc3' * 0x10000)
    stubs = {}
    impdir = struct.unpack_from('<I', d, opt + 120)[0]
    def rva(r):
        return bytes(mu.mem_read(base + r, 256)).split(b'\0')[0]
    p = impdir
    while True:
        oft, _, _, nm, ft = struct.unpack_from('<IIIII', bytes(mu.mem_read(base + p, 20)))
        if not nm: break
        i = 0
        while True:
            e = struct.unpack_from('<Q', bytes(mu.mem_read(base + (oft or ft) + 8 * i, 8)))[0]
            if not e: break
            name = rva(e + 2).decode()
            a = STUB + 16 * len(stubs)
            stubs[a] = name
            mu.mem_write(base + ft + 8 * i, struct.pack('<Q', a))
            i += 1
        p += 20
    STACK = 0x200000
    mu.mem_map(STACK, 0x400000)
    mu.mem_map(0x10000000, 0x4000000)  # heap
    mu.mem_map(0x30000, 0x10000)       # TEB/PEB
    teb = 0x30000
    mu.mem_write(teb + 0x30, struct.pack('<Q', teb + 0x1000))
    mu.mem_write(teb + 0x08, struct.pack('<Q', STACK + 0x400000))
    mu.mem_write(teb + 0x10, struct.pack('<Q', STACK))
    mu.reg_write(UC_X86_REG_GS_BASE, teb)
    from unicorn.x86_const import UC_X86_REG_MSR
    mu.msr_write(0xC0000101, teb)
    mu.mem_write(teb + 0x58, struct.pack('<Q', teb + 0x2000))  # ThreadLocalStoragePointer
    mu.mem_write(teb + 0x2000, struct.pack('<Q', teb + 0x3000))  # TLS bloc 0 (zéro)
    heap = [0x10000000]
    inp = bytearray(line.encode() + b'\r\n')
    out = bytearray()
    state = {'ctr': 0, 'done': False}
    def ret(v):
        mu.reg_write(UC_X86_REG_RAX, v & (2**64 - 1))
    def hook(uc, addr, size, ud):
        if not (STUB <= addr < STUB + 0x10000): return
        name = stubs.get(addr)
        a = [uc.reg_read(r) for r in (UC_X86_REG_RCX, UC_X86_REG_RDX, UC_X86_REG_R8, UC_X86_REG_R9)]
        if name in ('HeapAlloc',):
            n = (a[2] + 15) & ~15; r = heap[0]; heap[0] += n + 16; ret(r)
        elif name == 'HeapReAlloc':
            n = (a[3] + 15) & ~15
            r = heap[0]; heap[0] += n + 16
            uc.mem_write(r, bytes(uc.mem_read(a[2], min(n, 0x4000)))) ; ret(r)
        elif name == 'GetProcessHeap': ret(0x1234)
        elif name == 'GetStdHandle': ret(0x100 + (a[0] & 0xf))
        elif name in ('GetConsoleMode', 'GetConsoleOutputCP'): ret(0)
        elif name == 'NtReadFile':
            rsp = uc.reg_read(UC_X86_REG_RSP)
            iosb, buf, ln = [struct.unpack('<Q', uc.mem_read(rsp + o, 8))[0] for o in (0x28, 0x30, 0x38)]
            n = min(ln & 0xffffffff, len(inp)); uc.mem_write(buf, bytes(inp[:n])); del inp[:n]
            uc.mem_write(iosb, struct.pack('<QQ', 0, n))
            ret(0 if n else 0xC0000011)
        elif name == 'NtWriteFile':
            rsp = uc.reg_read(UC_X86_REG_RSP)
            iosb, buf, ln = [struct.unpack('<Q', uc.mem_read(rsp + o, 8))[0] for o in (0x28, 0x30, 0x38)]
            out.extend(uc.mem_read(buf, ln & 0xffffffff))
            uc.mem_write(iosb, struct.pack('<QQ', 0, ln & 0xffffffff)); ret(0)
        elif name == 'memcpy' or name == 'memmove':
            uc.mem_write(a[0], bytes(uc.mem_read(a[1], a[2]))); ret(a[0])
        elif name == 'memset': uc.mem_write(a[0], bytes([a[1] & 255]) * a[2]); ret(a[0])
        elif name == 'memcmp':
            x, y = bytes(uc.mem_read(a[0], a[2])), bytes(uc.mem_read(a[1], a[2]))
            ret((x > y) - (x < y))
        elif name in ('QueryPerformanceCounter',): uc.mem_write(a[0], struct.pack('<Q', 1000)); ret(1)
        elif name in ('IsDebuggerPresent',): ret(0)
        elif name in ('_cexit', '_c_exit', 'terminate', 'ExitProcess'):
            state['done'] = True; uc.emu_stop()
        elif name == 'GetModuleHandleW' or name == 'GetModuleHandleA': ret(base)
        elif name == 'GetProcAddress': ret(0)
        elif name == 'GetCurrentThreadId': ret(1)
        elif name == 'GetEnvironmentVariableW': ret(0)
        elif name == '__p___argc': uc.mem_write(0x10000000 + 0x3f00000, struct.pack('<I', 1)); ret(0x10000000 + 0x3f00000)
        elif name == '__p___argv':
            uc.mem_write(0x10000000 + 0x3f00100, struct.pack('<QQ', 0x10000000 + 0x3f00200, 0)); uc.mem_write(0x10000000 + 0x3f00200, b'a.exe\0'); ret(0x10000000 + 0x3f00100)
        elif name in ('_initterm', '_initterm_e', 'SetThreadStackGuarantee', 'AddVectoredExceptionHandler'): ret(0 if name != 'AddVectoredExceptionHandler' else 1)
        elif name in ('GetLastError',): ret(0)
        else:
            if verbose: print('stub', name, file=sys.stderr)
            ret(0)
    mu.hook_add(UC_HOOK_CODE, hook, begin=STUB, end=STUB + 0x10000)
    rsp = STACK + 0x400000 - 0x1000
    mu.mem_write(rsp, struct.pack('<Q', STUB + 0xfff0))  # return addr -> ret
    mu.reg_write(UC_X86_REG_RSP, rsp)
    mu.reg_write(UC_X86_REG_RCX, teb)
    try:
        mu.emu_start(MAIN, STUB + 0xfff0, timeout=60 * UC_SECOND_SCALE)
    except UcError as e:
        rip = mu.reg_read(UC_X86_REG_RIP); print('UcError', e, hex(rip), stubs.get(rip), hex(mu.reg_read(UC_X86_REG_RSP)), file=sys.stderr)
    return bytes(out)

if __name__ == '__main__':
    o = run(sys.argv[1], sys.argv[2], verbose='-v' in sys.argv)
    print(o.decode('utf-8', 'replace'))
