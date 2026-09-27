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

def rol(x, n):
    n &= 63
    x &= MASK
    return ((x << n) | (x >> (64 - n))) & MASK

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
        text = (va, vsz if vsz < rsz else rsz)

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
print("iat stubs", len(thunks))

hits = []
HEAP_PTR = 0x60020000

def thunk_cb(mu, address, size, user):
    name = thunks.get(address, hex(address))
    hits.append(name)
    rcx = mu.reg_read(UC_X86_REG_RCX)
    rdx = mu.reg_read(UC_X86_REG_RDX)
    r8 = mu.reg_read(UC_X86_REG_R8)
    if name == "memcpy":
        if r8:
            mu.mem_write(rcx, bytes(mu.mem_read(rdx, r8)))
        mu.reg_write(UC_X86_REG_RAX, rcx)
    elif name == "memset":
        if r8:
            mu.mem_write(rcx, bytes([rdx & 0xFF]) * r8)
        mu.reg_write(UC_X86_REG_RAX, rcx)
    elif name in ("GetModuleHandleExW", "GetModuleHandleW"):
        if name == "GetModuleHandleExW" and r8:
            mu.mem_write(r8, struct.pack("<Q", BASE))
        mu.reg_write(UC_X86_REG_RAX, 1 if name == "GetModuleHandleExW" else BASE)
    elif name == "FlsAlloc":
        mu.reg_write(UC_X86_REG_RAX, 1)
    elif name in ("FlsSetValue", "FlsFree", "SetUnhandledExceptionFilter",
                  "EnterCriticalSection", "LeaveCriticalSection",
                  "InitializeCriticalSection", "DeleteCriticalSection",
                  "InitOnceExecuteOnce"):
        mu.reg_write(UC_X86_REG_RAX, 1)
    elif name in ("malloc", "calloc"):
        global HEAP_PTR
        n = r8 if name == "calloc" else rcx
        if name == "calloc":
            n = rcx * rdx
        n = (n + 15) & ~15
        ptr = HEAP_PTR
        HEAP_PTR += n + 16
        mu.mem_write(ptr, b"\x00" * n)
        mu.reg_write(UC_X86_REG_RAX, ptr)
    elif name == "free":
        mu.reg_write(UC_X86_REG_RAX, 0)
    elif name == "strlen":
        s = rcx
        n = 0
        while mu.mem_read(s + n, 1) != b"\x00" and n < 4096:
            n += 1
        mu.reg_write(UC_X86_REG_RAX, n)
    elif name == "strncmp":
        n = r8
        a = bytes(mu.mem_read(rcx, n))
        bts = bytes(mu.mem_read(rdx, n))
        diff = 0
        for i in range(n):
            if a[i] != bts[i] or a[i] == 0:
                diff = a[i] - bts[i]
                break
        mu.reg_write(UC_X86_REG_RAX, diff & MASK)
    elif name == "strcspn":
        s = rcx
        rej = bytes(mu.mem_read(rdx, 64)).split(b"\x00", 1)[0]
        n = 0
        while n < 4096:
            c = mu.mem_read(s + n, 1)
            if c == b"\x00" or c in rej:
                break
            n += 1
        mu.reg_write(UC_X86_REG_RAX, n)
    elif name == "fgets":
        text = b"test\n\x00"
        mu.mem_write(rcx, text)
        mu.reg_write(UC_X86_REG_RAX, rcx)
        print("FGETS")
    elif name in ("__stdio_common_vfprintf", "__acrt_iob_func"):
        if name == "__acrt_iob_func":
            mu.reg_write(UC_X86_REG_RAX, 0x61000000)
        else:
            fmt = r8
            raw = bytes(mu.mem_read(fmt, 200)).split(b"\x00", 1)[0]
            print("PRINTF", raw)
            mu.reg_write(UC_X86_REG_RAX, 0)
    elif name == "setvbuf":
        mu.reg_write(UC_X86_REG_RAX, 0)
    elif name == "qsort":
        base, num, sz = rcx, rdx, r8
        items = [bytes(mu.mem_read(base + i * sz, sz)) for i in range(num)]
        def keyf(it):
            a, b = struct.unpack_from("<II", it, 0)
            return (a, b)
        items.sort(key=keyf)
        for i, it in enumerate(items):
            mu.mem_write(base + i * sz, it)
        mu.reg_write(UC_X86_REG_RAX, 0)
    elif name == "_crt_atexit":
        mu.reg_write(UC_X86_REG_RAX, 0)
    elif name == "VirtualProtect":
        mu.reg_write(UC_X86_REG_RAX, 1)
    elif name == "GetSystemInfo":
        mu.mem_write(rcx, b"\x00" * 64)
        mu.mem_write(rcx + 4, struct.pack("<I", 0x1000))
        mu.reg_write(UC_X86_REG_RAX, 0)
    else:
        print("UNHANDLED", name, "rcx", hex(rcx), "rdx", hex(rdx), "r8", hex(r8))
        mu.reg_write(UC_X86_REG_RAX, 0)

for ea in thunks:
    mu.hook_add(UC_HOOK_CODE, thunk_cb, None, ea, ea + 1)

def call(func, regs, stack_args=()):
    hits.clear()
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
        print("ERR", ex, "rip", hex(mu.reg_read(UC_X86_REG_RIP)), "last", hits[-12:])
        raise
    return mu.reg_read(UC_X86_REG_RAX)

a6 = rol(0x3125F0BE376F78C5, 0x3E) ^ 0x211A057DD86E20C1 ^ 0x51A493F172DC8952
h = call(0x140014510, (a6, 0, 0xFCD5FB91, 0))
print("hash8", hex(h), "imports", hits)
out = 0x60001000
rax = call(0x140011FF0, (0x140028608, 0xBE, out, 160), (a6, h, 0x930D208709DDC47C))
print("rax", hex(rax))
print("imports", hits)
data = bytes(mu.mem_read(out, 160))
print(data.hex())
recs = []
for i in range(5):
    rec = data[i * 32:(i + 1) * 32]
    q = struct.unpack_from("<Q", rec, 0)[0]
    ident, f12, off, ln, a, c = struct.unpack_from("<IIIIII", rec, 8)
    recs.append((q, ident, off, ln))
    print(i, "key", hex(q), "id", hex(ident), "off", off, "len", ln)

# init runtime constants and TLS, then keystream
call(0x14000F790, (0, 0, 0, 0))
f128 = struct.unpack("<Q", mu.mem_read(0x14003F128, 8))[0]
f138 = struct.unpack("<Q", mu.mem_read(0x14003F138, 8))[0]
print("f128", hex(f128), "f138", hex(f138))
mu.mem_write(0x14003F140, struct.pack("<Q", 0x140008430))
mu.mem_write(0x14003F148, struct.pack("<I", 1))
f2a0 = call(0x1400082C0, (0x140008430 ^ 0x423F202A4DAF4DBF, 0, 0, 0))
mu.mem_write(0x14003F2A0, struct.pack("<Q", f2a0))
print("f2a0", hex(f2a0))

TEB = 0x50000000
mu.mem_map(TEB, 0x10000)
TLS = 0x50010000
mu.mem_map(TLS, 0x10000)
mu.mem_write(TEB + 0x30, struct.pack("<Q", TEB))
mu.mem_write(TEB + 0x58, struct.pack("<Q", TLS))
mu.mem_write(TLS, struct.pack("<Q", TLS + 0x100))
mu.reg_write(UC_X86_REG_GS_BASE, TEB)
# TlsIndex is 0 in BSS

cipher = bytes(mu.mem_read(0x14002D160, 0x31))
print("cipher", cipher.hex())
kdf = 0x60002000
call(0x1400147C0, (a6, 0, 0xDDC905D8, kdf), (0x28,))
kd = bytes(mu.mem_read(kdf, 0x28))
print("kdf", kd.hex())
f3a8 = struct.unpack_from("<Q", kd, 32)[0]
print("f3a8", hex(f3a8))
call(0x14000DF70, (0x14003F2B0, kdf, 0x75E925BE9D2BF51B, 0))
call(0x1400160D0, (0x14003F2B0, 0x110, 0, 0))
tw = call(0x1400082C0, (0x7C3A9E15D2486BF1, 0, 0, 0))
print("tweak", hex(tw))
plain = bytearray(len(cipher))
for key, ident, off, ln in recs:
    block = struct.pack("<QQ", f3a8, (key ^ tw) & MASK)
    mu.mem_write(0x60003000, block)
    dest = 0x60005000
    call(0x14000ED40, (0x14003F2B0, 0x60003000, 0x14002D160 + off, dest), (ln,))
    chunk = bytes(mu.mem_read(dest, ln))
    plain[off:off + ln] = chunk
    print("str", ident.to_bytes(4, "little")[::-1].hex() if False else hex(ident), chunk)
print("ALL", bytes(plain))
print("--- constructors ---")
for fn in (0x1400076F0, 0x140007750, 0x140007D60, 0x140007D90, 0x140007E30, 0x14000B4C0, 0x1400076D0):
    try:
        rax = call(fn, (0, 0, 0, 0))
        print(hex(fn), "ok", hex(rax))
    except Exception as ex:
        print(hex(fn), "FAIL", ex, hits[-8:])
        break
else:
    print("blob after init", bytes(mu.mem_read(0x14002D160, 0x31)))
    for ident in (0xF44A64A1, 0xCBB564DF, 0xB9170251, 0xFB285D2E, 0xBFB96DDB):
        p = call(0x140009DA0, (ident, 0, 0, 0))
        raw = bytes(mu.mem_read(p, 64)).split(b"\x00", 1)[0]
        print("lookup", hex(ident), hex(p), raw)
    print("decode", hex(call(0x140007ED0, (0x25061C292E7500EF, 0, 0, 0))))
    print("decode2", hex(call(0x140007F60, (0x6938D4C03BCB3917, 0, 0, 0))))
    print("--- main ---")
    try:
        rax = call(0x140002A90, (0, 0, 0, 0))
        print("main", hex(rax))
    except Exception as ex:
        print("main FAIL", ex, "rip", hex(mu.reg_read(UC_X86_REG_RIP)), hits[-12:])
