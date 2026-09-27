import struct, pathlib
from unicorn import *
from unicorn.x86_const import *

PATH = r"C:\Users\petik\Desktop\crackme_hardcoded\keycheck.exe"
b = pathlib.Path(PATH).read_bytes()
e = struct.unpack_from("<I", b, 0x3C)[0]
nsect = struct.unpack_from("<H", b, e + 6)[0]
optsz = struct.unpack_from("<H", b, e + 20)[0]
img = struct.unpack_from("<I", b, e + 80)[0]
sec = e + 24 + optsz
BASE = 0x140000000
MASK = (1 << 64) - 1

mu = Uc(UC_ARCH_X86, UC_MODE_64)
mu.mem_map(BASE, (img + 0xFFF) & ~0xFFF)
hdr = struct.unpack_from("<I", b, e + 84)[0]
mu.mem_write(BASE, b[:hdr])
text = None
for i in range(nsect):
    o = sec + i * 40
    vsz, va, rsz, raw = struct.unpack_from("<IIII", b, o + 8)
    if raw and rsz:
        mu.mem_write(BASE + va, b[raw:raw + rsz])
    if va == 0x1000:
        text = (va, min(vsz, rsz))
mu.mem_map(0x70000000, 0x400000)
mu.mem_map(0x60000000, 0x200000)
STOP = 0x140070000
mu.mem_map(STOP, 0x1000)
mu.mem_write(STOP, b"\x90")

def name_of_slot(slot_ea):
    q = struct.unpack("<Q", mu.mem_read(slot_ea, 8))[0]
    if q < img:
        raw = bytes(mu.mem_read(BASE + q + 2, 80))
        return raw.split(b"\x00", 1)[0].decode("ascii", "replace")
    return hex(q)

STUB = 0x140080000
mu.mem_map(STUB, 0x1000)
thunks = {}
slot = BASE + 0x2B84C
stub = STUB
while slot < BASE + 0x2BA54:
    q = struct.unpack("<Q", mu.mem_read(slot, 8))[0]
    if 0 < q < 0x100000:
        nm = name_of_slot(slot)
        mu.mem_write(slot, struct.pack("<Q", stub))
        mu.mem_write(stub, b"\xC3")
        thunks[stub] = nm
        stub += 1
    slot += 8

HEAP_PTR = 0x60080000

def thunk_cb(mu, address, size, user):
    global HEAP_PTR
    name = thunks.get(address, hex(address))
    rcx = mu.reg_read(UC_X86_REG_RCX)
    rdx = mu.reg_read(UC_X86_REG_RDX)
    r8 = mu.reg_read(UC_X86_REG_R8)
    if name == "memcpy" and r8:
        mu.mem_write(rcx, bytes(mu.mem_read(rdx, r8)))
        mu.reg_write(UC_X86_REG_RAX, rcx)
    elif name == "memset":
        if r8:
            mu.mem_write(rcx, bytes([rdx & 0xFF]) * r8)
        mu.reg_write(UC_X86_REG_RAX, rcx)
    elif name == "GetModuleHandleExW":
        if r8:
            mu.mem_write(r8, struct.pack("<Q", BASE))
        mu.reg_write(UC_X86_REG_RAX, 1)
    elif name == "GetModuleHandleW":
        mu.reg_write(UC_X86_REG_RAX, BASE)
    elif name in ("malloc", "calloc"):
        n = (rcx * rdx) if name == "calloc" else rcx
        n = (n + 15) & ~15
        ptr = HEAP_PTR
        HEAP_PTR += n + 16
        if n:
            mu.mem_write(ptr, b"\x00" * min(n, 0x20000))
        mu.reg_write(UC_X86_REG_RAX, ptr)
    elif name in ("free", "EnterCriticalSection", "LeaveCriticalSection", "InitializeCriticalSection", "InitOnceExecuteOnce",
                  "FlsSetValue", "FlsFree", "SetUnhandledExceptionFilter"):
        mu.reg_write(UC_X86_REG_RAX, 1)
    elif name == "FlsAlloc":
        mu.reg_write(UC_X86_REG_RAX, 1)
    elif name == "VirtualProtect":
        mu.reg_write(UC_X86_REG_RAX, 1)
    elif name == "fgets":
        mu.mem_write(rcx, b"test\n\x00")
        mu.reg_write(UC_X86_REG_RAX, rcx)
        print("FGETS")
    elif name == "__stdio_common_vfprintf":
        raw = bytes(mu.mem_read(r8, 120)).split(b"\x00", 1)[0]
        print("PRINTF", raw)
        mu.reg_write(UC_X86_REG_RAX, len(raw))
    elif name in ("__acrt_iob_func",):
        mu.reg_write(UC_X86_REG_RAX, 0x61000000)
    elif name == "_crt_atexit":
        mu.reg_write(UC_X86_REG_RAX, 0)
    elif name == "qsort":
        base, num, sz = rcx, rdx, r8
        if 0 < num < 10000 and 0 < sz <= 32:
            items = [bytes(mu.mem_read(base + i * sz, sz)) for i in range(num)]
            items.sort(key=lambda it: struct.unpack_from("<II", it, 0) if sz >= 8 else it)
            for i, it in enumerate(items):
                mu.mem_write(base + i * sz, it)
        mu.reg_write(UC_X86_REG_RAX, 0)
    elif name == "GetSystemInfo":
        mu.mem_write(rcx, b"\x00" * 64)
        mu.mem_write(rcx + 4, struct.pack("<I", 0x1000))
        mu.reg_write(UC_X86_REG_RAX, 0)
    else:
        print("UNHANDLED", name)
        mu.emu_stop()

for ea in thunks:
    mu.hook_add(UC_HOOK_CODE, thunk_cb, None, ea, ea + 1)

def call(func, regs, stack_args=()):
    rsp = 0x70200000 - 8
    mu.mem_write(rsp, struct.pack("<Q", STOP))
    for i, a in enumerate(stack_args):
        mu.mem_write(rsp + 0x28 + 8 * i, struct.pack("<Q", a & MASK))
    mu.reg_write(UC_X86_REG_RSP, rsp)
    mu.reg_write(UC_X86_REG_RCX, regs[0] & MASK)
    mu.reg_write(UC_X86_REG_RDX, regs[1] & MASK)
    mu.reg_write(UC_X86_REG_R8, regs[2] & MASK)
    mu.reg_write(UC_X86_REG_R9, regs[3] & MASK)
    try:
        mu.emu_start(func, STOP, count=80_000_000)
    except UcError as ex:
        rip = mu.reg_read(UC_X86_REG_RIP)
        print("EMU", ex, "rip", hex(rip))
        if BASE <= rip < BASE + 0x60000:
            print(bytes(mu.mem_read(rip, 8)).hex())
        raise
    return mu.reg_read(UC_X86_REG_RAX)

TEB = 0x50000000
mu.mem_map(TEB, 0x10000)
TLS = 0x50010000
mu.mem_map(TLS, 0x10000)
mu.mem_write(TEB + 0x30, struct.pack("<Q", TEB))
mu.mem_write(TEB + 0x58, struct.pack("<Q", TLS))
mu.mem_write(TLS, struct.pack("<Q", TLS + 0x100))
mu.reg_write(UC_X86_REG_GS_BASE, TEB)

print("vault", hex(call(0x1400076F0, (0, 0, 0, 0))))
print("f128", hex(struct.unpack("<Q", mu.mem_read(0x14003F128, 8))[0]))
print("f2a0", hex(struct.unpack("<Q", mu.mem_read(0x14003F2A0, 8))[0]))
node = struct.unpack("<Q", mu.mem_read(0x14003F3E8, 8))[0]
print("node", hex(node))
if node:
    rec = struct.unpack("<Q", mu.mem_read(node, 8))[0]
    cnt = struct.unpack("<I", mu.mem_read(node + 8, 4))[0]
    print("recs", hex(rec), "count", cnt)
    if rec and cnt < 20:
        blob = bytes(mu.mem_read(rec, 32 * cnt))
        for i in range(cnt):
            print(i, blob[i*32:(i+1)*32].hex())
queries = [
    (0x0BDD0F79, 0x9C79B20CFECB7C6B),
    (0xDE4A4AB5, 0x1C9EEEC4719F1A7A),
    (0xF164718D, 0x7E96A1688FD57380),
    (0x233B6937, 0x361DCF8D72FFD0E5),
]
ids = [0xF44A64A1, 0xCBB564DF, 0xB9170251, 0xFB285D2E, 0xBFB96DDB]
tweaks = [a for _, a in queries]
cache = struct.unpack("<Q", mu.mem_read(node + 0x18, 8))[0]
print("cache", hex(cache))
orig = bytes.fromhex("6528d9970dcf889e3867383a0d0a94f2df803ec8d3937d3bae252247b865743b1fc366bed6b24a9f54bff9d3c7df0440f1")
mu.mem_write(0x14002D160, orig)
for ident, a2, nbyte in (
    (0xF44A64A1, 0, 6),
    (0xF44A64A1, 0x9C79B20CFECB7C6B, 6),
    (0xCBB564DF, 0, 3),
    (0xB9170251, 0, 22),
    (0xFB285D2E, 0, 9),
    (0xBFB96DDB, 0, 9),
):
    if cache:
        for i in range(8):
            mu.mem_write(cache + i * 16 + 12, b"\x00\x00\x00\x00")
    p = call(0x140009DA0, (ident, a2, 0, 0))
    raw = bytes(mu.mem_read(p, nbyte))
    asc = "".join(chr(c) if 32 <= c < 127 else "." for c in raw)
    print(hex(ident), hex(a2), raw.hex(), asc)
for fn in (0x140007750, 0x140007D90, 0x140007E30, 0x14000B4C0, 0x1400076D0):
    try:
        print(hex(fn), hex(call(fn, (0, 0, 0, 0))))
    except Exception as ex:
        print(hex(fn), "fail", ex)
        break
print("f150", hex(struct.unpack("<Q", mu.mem_read(0x14003F150, 8))[0]))
print("base", hex(call(0x1400085C0, (2592437778, 0, 0, 0))))
print("main", hex(call(0x140002A90, (0, 0, 0, 0))))
import sys
sys.exit(0)

a4 = 0x316D13DB96479267
h = call(0x140014510, (a4, 0, 0xA04F5761, 0))
print("014510", hex(h))
out = 0x60001000
n = 614 * 16
rax = call(0x140011FF0, (0x140028760, 9854, out, n), (a4, h, 0x930D208709DDC47C))
print("011FF0", hex(rax))
data = bytes(mu.mem_read(out, n))
pathlib.Path(r"C:\Users\petik\AppData\Local\Temp\kc_tab2.bin").write_bytes(data)
print("wrote", len(data), "first", data[:32].hex())
# pairs
want = {
0x6938D4C03BCB3917, 0x25061C292E7500EF, 0xD8C158404C0F7E71, 0x90FD7A2A36652CB9,
0x4EFB627CF125F769, 0x9A447FA339D45F60, 0xC5F90A0D9EB8E4F8, 0x6F5FA03D9B6BCB60,
0xD4CAD4469FC71268, 0xA7178DF9CD9E1C53, 0xE49EEEAA8B222455, 0x60B1F31BE5B43F13,
0x2411C00D3684ECAA, 0x50FEEDF17856A2A1, 0x5AE2552B2C2924FD, 0xA49F3E190665C1C6,
0x7A74CA7311C89B04, 0x2FB808641BC7FD23, 0xCE42959665AD325C, 0x0CC820BAF69F9FC8,
0x0B8F7FDD1A5A81E9, 0x21842812D55D6365, 0x2480259D18360F5B, 0xC7AFB9CBBE8AD594,
0x975CCB9587AD4FC4, 0xD472B31D55A4288E,
}
hits = 0
texts = []
for i in range(614):
    k, v = struct.unpack_from("<QQ", data, i * 16)
    if k in want:
        print("HIT", hex(k), hex(v))
        hits += 1
    raw = struct.pack("<Q", v)
    if sum(32 <= c < 127 for c in raw) >= 6:
        texts.append((i, k, raw))
print("hits", hits, "textish", len(texts))
call(0x14000F790, (0, 0, 0, 0))
mu.mem_write(0x14003F140, struct.pack("<Q", 0x140008430))
mu.mem_write(0x14003F148, struct.pack("<I", 1))
f2a0 = call(0x1400082C0, (0x140008430 ^ 0x423F202A4DAF4DBF, 0, 0, 0))
print("f2a0", hex(f2a0))
a4 = 0x316D13DB96479267
pairs = {}
for i in range(614):
    k, v = struct.unpack_from("<QQ", data, i * 16)
    pairs[k] = v

def decode(k):
    v = pairs[k]
    d1 = call(0x140014510, (a4, k, 0x10000002, 0))
    d2 = call(0x140014510, (f2a0, k, 0x25C66DFD, 0))
    return v ^ d1 ^ d2

order = [
0x0B8F7FDD1A5A81E9, 0x21842812D55D6365, 0x6938D4C03BCB3917, 0x25061C292E7500EF,
0xCE42959665AD325C, 0x0CC820BAF69F9FC8, 0x975CCB9587AD4FC4, 0xD472B31D55A4288E,
0x2480259D18360F5B, 0xC7AFB9CBBE8AD594, 0x7A74CA7311C89B04, 0x2FB808641BC7FD23,
0xD4CAD4469FC71268, 0xA7178DF9CD9E1C53, 0xE49EEEAA8B222455, 0x60B1F31BE5B43F13,
0x2411C00D3684ECAA, 0x50FEEDF17856A2A1, 0x4EFB627CF125F769, 0x9A447FA339D45F60,
0xD8C158404C0F7E71, 0x90FD7A2A36652CB9, 0xC5F90A0D9EB8E4F8, 0x6F5FA03D9B6BCB60,
0x5AE2552B2C2924FD, 0xA49F3E190665C1C6,
]
print("build", hex(call(0x140007D60, (0, 0, 0, 0))))
head = struct.unpack("<Q", mu.mem_read(0x14003F260, 8))[0]
print("list", hex(head))
live = call(0x140007ED0, (0x25061C292E7500EF, 0, 0, 0))
print("live", hex(live), "formula", hex(decode(0x25061C292E7500EF)))
print("string vault", hex(call(0x1400076F0, (0, 0, 0, 0))))
queries = [
    (0x0BDD0F79, 0x9C79B20CFECB7C6B),
    (0xDE4A4AB5, 0x1C9EEEC4719F1A7A),
    (0xF164718D, 0x7E96A1688FD57380),
    (0x233B6937, 0x361DCF8D72FFD0E5),
]
for ident, a2 in queries:
    p = call(0x140009DA0, (ident, a2, 0, 0))
    raw = bytes(mu.mem_read(p, 80)).split(b"\x00", 1)[0]
    print("STR", hex(ident), hex(p), raw)
