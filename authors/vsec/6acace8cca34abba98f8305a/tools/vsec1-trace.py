#!/usr/bin/env python3
"""Windows debug-API tracer for VSEC Challenger No.1 (Python ctypes, no deps).

Pose des int3 sur les helpers partagés du « mini-interpréteur » Go
(binop / cmp / truthiness / VM_Garble blob0-blob1) et journalise
registres + valeurs déréférencées (int64 / string) à l'entrée et au retour.

  python vsec1-trace.py [--exe path] <username> <serial> > trace.txt

Usage lab uniquement : lance le crackme d'origine sous debug API (aucun patch
du fichier).
"""
from __future__ import annotations

import argparse
import ctypes
import ctypes.wintypes as wt
import struct
import sys
from pathlib import Path

K = ctypes.WinDLL("kernel32", use_last_error=True)
K.CreateProcessW.argtypes = [wt.LPCWSTR, wt.LPWSTR, ctypes.c_void_p, ctypes.c_void_p, wt.BOOL, wt.DWORD,
                             ctypes.c_void_p, wt.LPCWSTR, ctypes.c_void_p, ctypes.c_void_p]
K.WaitForDebugEvent.argtypes = [ctypes.c_void_p, wt.DWORD]
K.ContinueDebugEvent.argtypes = [wt.DWORD, wt.DWORD, wt.DWORD]
K.ReadProcessMemory.argtypes = [wt.HANDLE, ctypes.c_void_p, ctypes.c_void_p, ctypes.c_size_t, ctypes.c_void_p]
K.WriteProcessMemory.argtypes = [wt.HANDLE, ctypes.c_void_p, ctypes.c_void_p, ctypes.c_size_t, ctypes.c_void_p]
K.OpenThread.argtypes = [wt.DWORD, wt.BOOL, wt.DWORD]
K.OpenThread.restype = wt.HANDLE
K.GetThreadContext.argtypes = [wt.HANDLE, ctypes.c_void_p]
K.SetThreadContext.argtypes = [wt.HANDLE, ctypes.c_void_p]
K.FlushInstructionCache.argtypes = [wt.HANDLE, ctypes.c_void_p, ctypes.c_size_t]
K.CloseHandle.argtypes = [wt.HANDLE]

IMG = 0x140000000
CTX_FULL = 0x10001F  # CONTEXT_AMD64 | CONTROL|INTEGER|SEGMENTS|FLOATING|DEBUG
OFF = {"flags": 0x30, "eflags": 0x44, "rax": 0x78, "rcx": 0x80, "rdx": 0x88, "rbx": 0x90, "rsp": 0x98,
       "rbp": 0xA0, "rsi": 0xA8, "rdi": 0xB0, "r8": 0xB8, "r9": 0xC0, "r10": 0xC8, "r11": 0xD0,
       "r12": 0xD8, "r13": 0xE0, "r14": 0xE8, "r15": 0xF0, "rip": 0xF8}
REGS = ["rax", "rbx", "rcx", "rdx", "rsi", "rdi", "r8", "r9", "r10", "r11"]

# nom -> (VA, nb de registres à logguer)
HOOKS = {
    0x140391460: "binop",    # eax=op, (rbx,rcx)=A, (rdi,rsi)=B  -> (rax,rbx)
    0x140391A80: "cmp",      #
    0x1403921A0: "truthy",   # rax=type rbx=ptr
    0x1403EC440: "vm_norm",  # blob0 (any->int64)
    0x1403EC600: "vm_cmp",   # blob1 (op,a,b)
    # crypto/sha256 : block() (generic, AVX2, SHA-NI) — rax=dig rbx=p.ptr rcx=p.len
    0x1403F2200: "sha256_blockGeneric",
    0x1403F27E0: "sha256_block2",
    0x1403F38E0: "sha256_block3",
}
BLOCK = {"sha256_blockGeneric", "sha256_block2", "sha256_block3"}
# helpers des sous-opérations du mini-interpréteur (case 15..31 de sub_1403BFCE0)
for _va in (0x140395960, 0x140393BA0, 0x140393FA0, 0x140394780, 0x1403947E0, 0x140395360, 0x140392DE0,
            0x140393060, 0x1403924A0, 0x1403927E0, 0x140393460, 0x140394A40, 0x140395520):
    HOOKS[_va] = "op_%X" % _va
GENERIC = {n for n in HOOKS.values() if n.startswith("op_")}
# autres primitives crypto liées (sha512, keccak) : détecte lesquelles sont réellement appelées
for _va, _n in ((0x1403FA5A0, "sha512_blockA"), (0x1403FAB80, "sha512_blockB"), (0x1401AF120, "sha512_blockC"),
                (0x1403F4FA0, "keccakF"), (0x1403F3EC0, "sha3_A"), (0x1403F4000, "sha3_B"), (0x1403F4200, "sha3_C"),
                (0x1403F1A80, "sha256_init_H0")):
    HOOKS[_va] = _n
    GENERIC.add(_n)
# Types connus (VA)
TYPES = {0x1405DF290: "int64", 0x1405DF050: "string", 0x1405DF450: "bool", 0x1405DF210: "int?",
         0x1406133A8: "reflect.Value?", 0x1405BCA68: "BCA68", 0x1405B1698: "B1698", 0x1405C82B0: "C82B0"}


FIND = None  # --find HEX : motif à localiser dans le tas après chaque évènement
STEP_EVENT = 0  # --step N : single-step à partir de l'évènement N jusqu'au retour
FUNCS = set()   # --funcs FILE : débuts de fonctions IDA (hex, une par ligne)


class Dbg:
    def __init__(self, out):
        self.out = out
        self.found = False
        self.step_tid = None
        self.step_ret = None
        self.base = None
        self.hproc = None
        self.orig = {}
        self.pending = {}      # tid -> bp address à ré-armer après single-step
        self.ret_bp = {}       # addr -> (name, tid, args-snapshot)
        self.hthreads = {}
        self.delta = 0

    # --- mémoire ---------------------------------------------------------
    def rd(self, addr, n):
        buf = ctypes.create_string_buffer(n)
        got = ctypes.c_size_t(0)
        if not K.ReadProcessMemory(self.hproc, ctypes.c_void_p(addr), buf, n, ctypes.byref(got)):
            return None
        return buf.raw[:got.value]

    def wr(self, addr, data):
        got = ctypes.c_size_t(0)
        K.WriteProcessMemory(self.hproc, ctypes.c_void_p(addr), data, len(data), ctypes.byref(got))
        K.FlushInstructionCache(self.hproc, ctypes.c_void_p(addr), len(data))

    def q(self, addr):
        b = self.rd(addr, 8)
        return struct.unpack("<Q", b)[0] if b and len(b) == 8 else None

    def va(self, real):
        """adresse réelle -> VA IDA"""
        return real - self.delta

    # --- breakpoints -----------------------------------------------------
    def arm(self, real):
        if real not in self.orig:
            self.orig[real] = self.rd(real, 1)
        self.wr(real, b"\xCC")

    def disarm(self, real):
        self.wr(real, self.orig[real])

    # --- contexte --------------------------------------------------------
    def thread(self, tid):
        h = self.hthreads.get(tid)
        if h is None:
            h = K.OpenThread(0x1FFFFF, False, tid)
            self.hthreads[tid] = h
        return h

    def getctx(self, tid):
        raw = ctypes.create_string_buffer(0x4D0 + 32)
        addr = (ctypes.addressof(raw) + 15) & ~15
        ctypes.memset(addr, 0, 0x4D0)
        struct.pack_into("<I", (ctypes.c_char * 0x4D0).from_address(addr), OFF["flags"], CTX_FULL)
        if not K.GetThreadContext(self.thread(tid), ctypes.c_void_p(addr)):
            raise OSError(ctypes.get_last_error())
        return raw, addr

    def reg(self, addr, name):
        return struct.unpack("<Q", ctypes.string_at(addr + OFF[name], 8))[0]

    def setreg(self, addr, name, val):
        ctypes.memmove(addr + OFF[name], struct.pack("<Q", val), 8)

    def putctx(self, tid, addr):
        K.SetThreadContext(self.thread(tid), ctypes.c_void_p(addr))

    # --- pretty ----------------------------------------------------------
    def val(self, t, p):
        if t == 0:
            return "nil"
        tv = self.va(t)
        name = TYPES.get(tv, "T%x" % tv)
        s = f"<{name}"
        if p:
            if name in ("int64", "int?"):
                v = self.q(p)
                if v is not None:
                    s += " %d (0x%x)" % (v - (1 << 64) if v >> 63 else v, v)
            elif name == "string":
                a = self.q(p)
                n = self.q(p + 8)
                if a and n is not None and n < 4096:
                    sb = self.rd(a, n) or b""
                    s += " %r" % sb.decode("latin1")
            elif name == "bool":
                b = self.rd(p, 1)
                s += " %d" % (b[0] if b else -1)
            else:
                d = self.rd(p, 24)
                if d:
                    s += " [%s]" % " ".join("%x" % (struct.unpack_from("<Q", d, i)[0]) for i in range(0, len(d), 8))
                    q0, q1, q2 = struct.unpack("<QQQ", d)
                    if 0x10000 < q0 < 0x7FFFFFFFFFFF and 0 < q1 <= 0x100 and q1 <= q2 <= 0x10000:
                        dd = self.rd(q0, min(q1, 64))
                        if dd:
                            s += " data=%s" % dd.hex()
        else:
            s += " p=0"
        return s + ">"

    def log(self, s):
        self.out.write(s + "\n")

    def bigstr(self, p, depth=0):
        """interprète p comme *big.Int {neg bool; abs []Word} (ou struct qui le commence)"""
        if not (0x10000 < p < 0x7FFFFFFFFFFF):
            return None
        h = self.rd(p, 32)
        if not h or len(h) < 32:
            return None
        neg = h[0]
        ptr, ln, cap = struct.unpack_from("<QQQ", h, 8)
        if neg in (0, 1) and h[1:8] == b"\0" * 7 and 0 < ln <= 40 and ln <= cap <= 1 << 16 and 0x10000 < ptr < 0x7FFFFFFFFFFF:
            w = self.rd(ptr, 8 * ln)
            if w and len(w) == 8 * ln:
                v = int.from_bytes(w, "little")
                return ("-" if neg else "") + "0x%x" % v
        return None

    def scan(self, pat):
        """cherche pat dans toutes les régions RW privées ; renvoie la liste d'adresses"""
        class MBI(ctypes.Structure):
            _fields_ = [("BaseAddress", ctypes.c_void_p), ("AllocationBase", ctypes.c_void_p),
                        ("AllocationProtect", wt.DWORD), ("PartitionId", wt.WORD), ("RegionSize", ctypes.c_size_t),
                        ("State", wt.DWORD), ("Protect", wt.DWORD), ("Type", wt.DWORD)]
        K.VirtualQueryEx.argtypes = [wt.HANDLE, ctypes.c_void_p, ctypes.c_void_p, ctypes.c_size_t]
        hits = []
        addr = 0
        mbi = MBI()
        while addr < 0x7FFFFFFF0000:
            if not K.VirtualQueryEx(self.hproc, ctypes.c_void_p(addr), ctypes.byref(mbi), ctypes.sizeof(mbi)):
                break
            base, size = mbi.BaseAddress or 0, mbi.RegionSize
            if mbi.State == 0x1000 and mbi.Protect in (0x04, 0x40) and size <= 0x4000000 and mbi.Type == 0x20000:
                data = self.rd(base, size)
                if data:
                    i = data.find(pat)
                    while i >= 0:
                        hits.append(base + i)
                        i = data.find(pat, i + 1)
            addr = base + size
        return hits


def run(exe, args, out):
    d = Dbg(out)
    si = ctypes.create_string_buffer(104)
    struct.pack_into("<I", si, 0, 104)
    pi = ctypes.create_string_buffer(24)
    cmd = '"%s" %s' % (exe, " ".join(args))
    cmdbuf = ctypes.create_unicode_buffer(cmd)
    ok = K.CreateProcessW(None, cmdbuf, None, None, False, 0x1, None, None, si, pi)  # DEBUG_ONLY_THIS_PROCESS
    if not ok:
        raise OSError(ctypes.get_last_error())
    ev = ctypes.create_string_buffer(176)
    nhit = 0
    while True:
        if not K.WaitForDebugEvent(ev, 0xFFFFFFFF):
            break
        code, pid, tid = struct.unpack_from("<III", ev, 0)
        status = 0x00010002  # DBG_CONTINUE
        if code == 3:  # CREATE_PROCESS
            hfile, hproc, hthread, base = struct.unpack_from("<QQQQ", ev, 16)
            d.hproc = hproc
            d.base = base
            d.delta = base - IMG
            d.log("# base 0x%x delta 0x%x" % (base, d.delta))
            for va in HOOKS:
                d.arm(va + d.delta)
        elif code == 1:  # EXCEPTION
            ecode, eflags = struct.unpack_from("<II", ev, 16)
            eaddr = struct.unpack_from("<Q", ev, 16 + 16)[0]
            if ecode == 0x80000003:
                if eaddr in d.orig:
                    raw, c = d.getctx(tid)
                    d.setreg(c, "rip", eaddr)
                    if eaddr in d.ret_bp:
                        name, rtid, snap = d.ret_bp.pop(eaddr)
                        rax, rbx = d.reg(c, "rax"), d.reg(c, "rbx")
                        if name in BLOCK:
                            st = d.rd(snap, 32) or b""
                            h = struct.unpack("<8I", st) if len(st) == 32 else ()
                            d.log("   <- %s digest=%s" % (name, b"".join(struct.pack(">I", x) for x in h).hex()))
                        else:
                            d.log("   <- %s ret rax,rbx = %s" % (name, d.val(rax, rbx)))
                        d.disarm(eaddr)
                        del d.orig[eaddr]
                        d.putctx(tid, c)
                        K.ContinueDebugEvent(pid, tid, status)
                        continue
                    else:
                        name = HOOKS[eaddr - d.delta]
                        r = {n: d.reg(c, n) for n in REGS}
                        nhit += 1
                        parts = ["#%d %s eax=%x" % (nhit, name, r["rax"] & 0xFFFFFFFF)]
                        if name == "binop":
                            parts.append("A=%s B=%s" % (d.val(r["rbx"], r["rcx"]), d.val(r["rdi"], r["rsi"])))
                        elif name == "truthy":
                            parts.append("v=%s" % d.val(r["rax"], r["rbx"]))
                        elif name in GENERIC:
                            if name == "op_140393FA0" and 0 < (r["rdi"] & 0xFFFF) < 40:
                                nb = d.rd(r["rcx"], r["rdi"] & 0xFFFF) or b""
                                parts.append("METHOD=%r" % nb.decode("latin1"))
                            parts.append(" ".join("%s=%s" % (n, d.val(r[n], 0) if False else "%x" % r[n]) for n in REGS[:6]))
                            for n in REGS[:6]:
                                p = r[n]
                                bs = d.bigstr(p)
                                if bs:
                                    parts.append("BIG(%s)=%s" % (n, bs))
                                if 0x10000 < p < 0x7FFFFFFFFFFF:
                                    mb = d.rd(p, 48)
                                    if mb:
                                        parts.append("[%s:%s]" % (n, mb.hex()))
                                        for qi in range(0, 48, 8):
                                            qv = struct.unpack_from("<Q", mb, qi)[0]
                                            b2 = d.bigstr(qv)
                                            if b2:
                                                parts.append("BIG(%s.%d)=%s" % (n, qi // 8, b2))
                                            elif 0x10000 < qv < 0x7FFFFFFFFFFF:
                                                m2 = d.rd(qv, 48)
                                                if m2 and len(m2) == 48:
                                                    for qj in range(0, 48, 8):
                                                        b3 = d.bigstr(struct.unpack_from("<Q", m2, qj)[0])
                                                        if b3:
                                                            parts.append("BIG(%s.%d.%d)=%s" % (n, qi // 8, qj // 8, b3))
                                        q0, q1 = struct.unpack_from("<QQ", mb, 0)
                                        if 0x10000 < q0 < 0x7FFFFFFFFFFF and 0 < q1 <= 0x100:
                                            dd = d.rd(q0, min(q1, 64))
                                            if dd:
                                                parts.append("{%s->%s}" % (n, dd.hex()))
                        elif name in BLOCK:
                            ln = r["rcx"]
                            blk = d.rd(r["rbx"], min(ln, 192) if ln < 100000 else 64) or b""
                            st = d.rd(r["rax"], 32) or b""
                            parts.append("len=%d p=%s state=%s" % (ln, blk.hex(), st.hex()))
                        elif name == "vm_norm":
                            parts.append("v=%s" % d.val(r["rax"], r["rbx"]))
                        else:
                            parts.append(" ".join("%s=%x" % (n, r[n]) for n in REGS))
                            parts.append("A=%s B=%s" % (d.val(r["rbx"], r["rcx"]), d.val(r["rdi"], r["rsi"])))
                            parts.append("C=%s" % d.val(r["rsi"], r["r8"]))
                        d.log(" ".join(parts))
                        if FIND and not d.found:
                            h = d.scan(FIND)
                            if h:
                                d.found = True
                                d.log("   !! pattern found at %s (event #%d, before this call)" % (
                                    ",".join("%x" % x for x in h[:6]), nhit))
                                for x in h[:3]:
                                    ctxb = d.rd(x - 64, 192) or b""
                                    d.log("      ctx@%x-64: %s" % (x, ctxb.hex()))
                        # point de retour
                        rsp = d.reg(c, "rsp")
                        ret = d.q(rsp)
                        if STEP_EVENT and nhit == STEP_EVENT and d.step_tid is None:
                            d.step_tid = tid
                            d.step_ret = ret
                            d.log("   >> single-step jusqu'à ret=%x" % d.va(ret))
                            nargs = r["rdi"] & 0xFF
                            raw_args = d.rd(r["rbx"], 24 * max(nargs, 1) + 24) or b""
                            for k in range(0, len(raw_args) - 23, 24):
                                q0, q1, q2 = struct.unpack_from("<QQQ", raw_args, k)
                                info = ""
                                if 0x10000 < q0 < 0x7FFFFFFFFFFF and 0 < q1 <= 0x400:
                                    dd = d.rd(q0, min(q1, 64))
                                    info = dd.hex() if dd else ""
                                d.log("      arg[%d] %x %x %x %s" % (k // 24, q0, q1, q2, info))
                        if ret and ret not in d.ret_bp and ret not in d.orig:
                            d.ret_bp[ret] = (name, tid, r["rax"])
                            d.arm(ret)
                    d.disarm(eaddr)
                    # trap flag pour ré-armer
                    ef = struct.unpack("<I", ctypes.string_at(c + OFF["eflags"], 4))[0]
                    ctypes.memmove(c + OFF["eflags"], struct.pack("<I", ef | 0x100), 4)
                    d.putctx(tid, c)
                    d.pending[tid] = eaddr
                # sinon : breakpoint système initial -> continue
            elif ecode == 0x80000004:
                if tid in d.pending:
                    d.arm(d.pending.pop(tid))
                if d.step_tid is not None and tid == d.step_tid:
                    raw, c = d.getctx(tid)
                    rip = d.reg(c, "rip")
                    if rip == d.step_ret:
                        d.log("   >> fin single-step")
                        d.step_tid = None
                    else:
                        if d.va(rip) in FUNCS:
                            rax_, rbx_ = d.reg(c, "rax"), d.reg(c, "rbx")
                            d.log("      call %x rax=%x rbx=%x rcx=%x rdi=%x rsi=%x" % (
                                d.va(rip), rax_, rbx_, d.reg(c, "rcx"), d.reg(c, "rdi"), d.reg(c, "rsi")))
                        ef = struct.unpack("<I", ctypes.string_at(c + OFF["eflags"], 4))[0]
                        ctypes.memmove(c + OFF["eflags"], struct.pack("<I", ef | 0x100), 4)
                        d.putctx(tid, c)
            else:
                status = 0x80010001  # DBG_EXCEPTION_NOT_HANDLED
        elif code == 5:  # EXIT_PROCESS
            ec = struct.unpack_from("<I", ev, 16)[0]
            d.log("# exit code %d" % ec)
            K.ContinueDebugEvent(pid, tid, status)
            break
        K.ContinueDebugEvent(pid, tid, status)
    out.flush()


def main():
    ap = argparse.ArgumentParser()
    here = Path(__file__).resolve().parents[1]
    ap.add_argument("--exe", default=str(here / "original" / "VSEC_Challenger_No.1.exe"))
    ap.add_argument("--find", help="hex : motif à chercher dans le tas à chaque évènement")
    ap.add_argument("--step", type=int, default=0, help="n° d'évènement à single-stepper")
    ap.add_argument("--funcs", help="fichier des débuts de fonctions (hex VA IDA)")
    ap.add_argument("args", nargs="+")
    a = ap.parse_args()
    global FIND, STEP_EVENT, FUNCS
    if a.find:
        FIND = bytes.fromhex(a.find)
    STEP_EVENT = a.step
    if a.funcs:
        FUNCS = {int(x, 16) for x in open(a.funcs).read().split()}
    run(a.exe, a.args, sys.stdout)


if __name__ == "__main__":
    main()
