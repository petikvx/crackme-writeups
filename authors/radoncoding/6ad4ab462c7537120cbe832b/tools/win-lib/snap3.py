"""Fige le jeu (threads suspendus) pendant qu'il attend une entrée, et sauvegarde mémoire + contextes.
usage: snap.py <exe> <scratch> <nb_presses_before>"""
import sys, ctypes, ctypes.wintypes as W, time, struct, pickle
sys.path.insert(0, sys.argv[2])
from oracle import *
k.OpenThread.restype = W.HANDLE
k.GetThreadContext.argtypes = [W.HANDLE, ctypes.c_void_p]
k.SuspendThread.argtypes = [W.HANDLE]
nt = ctypes.WinDLL('ntdll')
from dbg_ctx import Ctx, REGS, CTX_ALL  # noqa

g = Game(sys.argv[1]); A = g.addrs[0]
for _ in range(int(sys.argv[3])): g.press(0, 0.4)
g.key(0x52, 'r'); time.sleep(0.8)
pid = g.p.pid


def host_tsc():
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_PROT_ALL
    from unicorn.x86_const import UC_X86_REG_RAX, UC_X86_REG_RDX
    u = Uc(UC_ARCH_X86, UC_MODE_64); u.mem_map(0x1000, 0x1000, UC_PROT_ALL); u.mem_write(0x1000, b'\x0f\x31\x90')
    u.emu_start(0x1000, 0x1002); return (u.reg_read(UC_X86_REG_RDX) << 32) | u.reg_read(UC_X86_REG_RAX)


TSC_SNAP = host_tsc()


class TE(ctypes.Structure): _fields_ = [('sz', W.DWORD), ('u', W.DWORD), ('tid', W.DWORD), ('owner', W.DWORD), ('bp', ctypes.c_long), ('dp', ctypes.c_long), ('fl', W.DWORD)]
snap = k.CreateToolhelp32Snapshot(4, 0); te = TE(); te.sz = ctypes.sizeof(te); tids = []
ok = k.Thread32First(snap, ctypes.byref(te))
while ok:
    if te.owner == pid: tids.append(te.tid)
    ok = k.Thread32Next(snap, ctypes.byref(te))
hs = {t: k.OpenThread(0x1FFFFF, False, t) for t in tids}
for t, h in hs.items(): k.SuspendThread(h)
ctxs = {}
for t, h in hs.items():
    c = Ctx(); c.get(h)
    # TEB
    tbi = (ctypes.c_ulonglong * 6)(); rl = W.ULONG()
    nt.NtQueryInformationThread(h, 0, tbi, 48, ctypes.byref(rl))
    ctxs[t] = {'regs': {n: c.q(o) for n, o in REGS.items()}, 'teb': tbi[1], 'eflags': struct.unpack_from('<I', c.raw, c.off + 0x44)[0],
               'raw': bytes(c.raw[c.off:c.off + 1232])}
    print(t, 'rip', hex(ctxs[t]['regs']['rip']), 'rsp', hex(ctxs[t]['regs']['rsp']), 'teb', hex(tbi[1]))
# régions
a = 0; mbi = MBI(); regs = []
while a < 0x7FFFFFFF0000:
    if not k.VirtualQueryEx(g.hp, a, ctypes.byref(mbi), ctypes.sizeof(mbi)): break
    base = mbi.Base or 0
    regs.append((base, mbi.Size, mbi.State, mbi.Prot, mbi.Type, mbi.AllocBase or 0))
    a = base + mbi.Size
mem = []
for base, size, state, prot, typ, ab in regs:
    if state != 0x1000 or (prot & 0x101) or size > (1 << 26): continue
    buf = ctypes.create_string_buffer(size); n = ctypes.c_size_t()
    if k.ReadProcessMemory(g.hp, base, buf, size, ctypes.byref(n)) and n.value == size:
        mem.append((base, buf.raw, prot, typ, ab))
# modules (nom par AllocBase)
mods = {}
psapi = ctypes.WinDLL('psapi')
for base, size, state, prot, typ, ab in regs:
    if typ == 0x1000000 and base == ab and state == 0x1000:
        nm = ctypes.create_unicode_buffer(260); psapi.GetMappedFileNameW(g.hp, ctypes.c_void_p(base), nm, 260); mods[base] = nm.value
pickle.dump({'ctx': ctxs, 'mem': mem, 'regs': regs, 'mods': mods, 'board': A, 'tsc': TSC_SNAP}, open(sys.argv[2] + '/snapH.pkl', 'wb'))
print('regions', len(mem), 'bytes', sum(len(m[1]) for m in mem), 'board', hex(A))
print({hex(b): n.split('\\')[-1] for b, n in mods.items()})
for t, h in hs.items(): k.ResumeThread(h)
g.close()


