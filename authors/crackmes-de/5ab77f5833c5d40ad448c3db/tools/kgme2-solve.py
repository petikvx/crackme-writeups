#!/usr/bin/env python3
"""Keygen pour kgme2.exe (keygenme_v2 de pxor) — name -> serial.

Usage : kgme2-solve.py [--name petik] [-q] [--check]
Les tables (xlat) sont lues dans le binaire d'origine (ZIP, mot de passe crackmes.one).
"""
import argparse, io, random, sys, zipfile
from pathlib import Path

M = 0xFFFFFFFF
ZIP = Path(__file__).resolve().parent.parent / "original" / "keygenme_v2.zip"


def load_tables():
    z = zipfile.ZipFile(ZIP)
    exe = z.read("kgme2.exe", pwd=b"crackmes.one")
    rd = lambda va, n=256: exe[va - 0x402400: va - 0x402400 + n]   # .data : VA 0x403000 -> off 0xC00
    return rd(0x403388), rd(0x403487), rd(0x403586), rd(0x403685), rd(0x403784)


T1, T0, S4, S2, S3 = load_tables()


def rol(x, n): return ((x << n) | (x >> (32 - n))) & M
def u32(b): return int.from_bytes(bytes(b), "little")


# ---------- côté nom : 8 octets cibles ----------
def name_hash(name: bytes) -> bytes:
    n = len(name)
    assert 3 <= n <= 32
    buf = bytearray(name) + bytearray(32 - n + 64)       # zéros derrière (buffer .data)
    for i in range(n, 32): buf[i] = buf[i - n]           # remplissage cyclique à 32 octets
    ebx = 0x2345
    for i in range(0, 32, 4):                            # chaîne xor/add sur 8 dwords
        eax = u32(buf[i:i+4]) ^ ebx
        ebx = (ebx + eax) & M
        buf[i:i+4] = eax.to_bytes(4, "little")
    for i in range(32): buf[i] = T1[buf[i]]              # substitution
    for _ in range(3):                                   # 3 rondes ; ebx/edx chargés UNE fois par ronde (jne 0x401183)
        ebx = u32(buf[4:8]); edx = u32(buf[5:9])
        for i in range(0, 32, 4):
            eax = u32(buf[i:i+4])
            ebx = (ebx + eax) & M
            edx = (edx + ebx) & M
            edx ^= eax
            eax = (eax + edx) & M
            buf[i:i+4] = eax.to_bytes(4, "little")
    return bytes(buf[:8])


# ---------- côté serial ----------
CANDS = list(range(0x21, 0x7f)) + list(range(1, 0x21)) + list(range(0x7f, 256))


def solve_chars(n, apply, init, target):
    """Trouve n caractères tels que apply(init, [S4[c]...]) == target (chaque étape touche un octet distinct)."""
    chars = [ord('A')] * n
    for k in range(n):
        for c in CANDS:
            trial = chars[:]; trial[k] = c
            r = apply(init, [S4[x] for x in trial])
            # octet touché par l'étape k : on le repère en comparant avec c' différent
            alt = trial[:]; alt[k] = 0x21 if c != 0x21 else 0x22
            r2 = apply(init, [S4[x] for x in alt])
            pos = [i for i in range(4) if (r >> 8*i) & 0xff != (r2 >> 8*i) & 0xff]
            if len(pos) != 1:
                continue
            if (r >> 8*pos[0]) & 0xff == (target >> 8*pos[0]) & 0xff:
                chars[k] = c; break
        else:
            raise RuntimeError("pas de caractère pour l'étape %d" % k)
    return chars


def stage1(e, v):
    for b in v: e = rol(e | b, 8)
    return e
def stage2(e, v):
    for b in v: e = rol(e ^ b, 8)
    return e
def stage3(e, v):
    for b in v:
        lo = (e + ((-b) & 0xff)) & 0xff
        e = rol((e & ~0xff) | lo, 8)
    return e


def head(rng):
    s = bytes(solve_chars(4, stage1, 0, 0x12345678 ^ 0x331ff083))
    s += bytes(solve_chars(4, stage2, 0x331ff083, 0x87654321 ^ 0x0462105f))
    s += bytes(solve_chars(4, stage3, 0x0462105f, (0xaad0863e + 0xbab00000) & M))
    return s


def thirteenth():
    for c in range(0x21, 0x7f):
        al = (c ^ 0x33); al = (-al) & 0xff; ah = al
        ax = (ah << 8) | al                              # mov ah,al
        ax = ((ax << 4) | (ax >> 12)) & 0xffff          # rol ax,4
        ax = (-ax) & 0xffff
        ax = ((ax & 0xff) << 8) | (ax >> 8)             # xchg al,ah
        ax ^= 0x1234; ax = (ax - 0x12) & 0xffff
        eax = rol(ax | (ax << 16), 16) & M               # rol eax,16 ; mov ax,bx
        eax = (eax & 0xffff0000) | ax
        eax = (-eax) & M
        eax ^= 0x87678767
        if eax == 0xb84bb84a:
            return chr(c)
    raise RuntimeError("13e caractère introuvable")


def inv_map(table, y, x):
    """b tel que table[x] ^ table[b] == y (ou None)."""
    for b in range(256):
        if table[x] ^ table[b] == y: return b


def tail(target, rng):
    while True:
        # M[2i] libres, M[2i+1] imposés par S3 pour obtenir target
        m = bytearray(16)
        for i in range(8):
            while True:
                m[2*i] = rng.randrange(256)
                b = inv_map(S3, target[i], m[2*i])
                if b is not None: m[2*i+1] = b; break
        d0, d1, d2, d3 = (u32(m[4*j:4*j+4]) for j in range(4))   # = (d0', d1', d2', d3') après mélange
        # mélange: d1'=a^b^c^d ; d0'=a^c^d ; d2'=a^b ; d3'=b^d  -> inversion
        b_ = d0 ^ d1
        a = d2 ^ b_
        dd = d3 ^ b_
        c = d0 ^ a ^ dd
        r = b"".join(x.to_bytes(4, "little") for x in (a, b_, c, dd))
        # r[i] = S2[h[2i]] ^ S2[h[2i+1]] ; somme(r) mod 256 = h[32]
        h = bytearray(33)
        for i in range(16):
            while True:
                h[2*i] = rng.randrange(256)
                b = inv_map(S2, r[i], h[2*i])
                if b is not None: h[2*i+1] = b; break
        h[32] = sum(r) & 0xff
        return bytes(h).hex().upper()


def keygen(name: str, seed=1) -> str:
    rng = random.Random(seed)
    t = name_hash(name.encode())
    s = head(rng) .decode() + thirteenth() + tail(t, rng)
    assert len(s) == 79
    return s


# ---------- vérification : émulation unicorn du vrai code de kgme2.exe ----------
def check(name: str, serial: str) -> bool:
    """Exécute le dialog-proc réel (0x4010d5) sous unicorn avec les deux edit-box simulées."""
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_32, UcError
    from unicorn.x86_const import UC_X86_REG_EIP, UC_X86_REG_ESP, UC_X86_REG_EAX
    exe = zipfile.ZipFile(ZIP).read("kgme2.exe", pwd=b"crackmes.one")
    mu = Uc(UC_ARCH_X86, UC_MODE_32)
    mu.mem_map(0x400000, 0x10000)
    mu.mem_write(0x400000, exe[:0x400])
    mu.mem_write(0x401000, exe[0x400:0xa00].ljust(0x1000, b"\0"))     # .text
    mu.mem_write(0x403000, exe[0xc00:0x1600])                          # .data
    texts = {0x3e8: name.encode(), 0x3e9: serial.encode()}
    ok = {"v": False}
    SENT, RET = 0x409000, 0x409100
    stk = 0x40f000
    # thunks (jmp [iat]) -> on les intercepte par adresse
    def hook_code(uc, addr, size, _):
        if addr == 0x40148a:                       # SendDlgItemMessageA(h,id,msg,wp,lp)
            esp = uc.reg_read(UC_X86_REG_ESP)
            ret, h, i, msg, wp, lp = (int.from_bytes(uc.mem_read(esp + 4*k, 4), "little") for k in range(6))
            t = texts[i]
            if msg == 0xe: r = len(t)
            else:
                data = t[:max(wp - 1, 0)] + b"\0"; uc.mem_write(lp, data); r = len(data) - 1
            uc.reg_write(UC_X86_REG_EAX, r); uc.reg_write(UC_X86_REG_EIP, ret)
            uc.reg_write(UC_X86_REG_ESP, esp + 4 + 20)
        elif addr == 0x401484:                     # MessageBoxA : titre/texte déjà décodés en mémoire
            esp = uc.reg_read(UC_X86_REG_ESP)
            txt = int.from_bytes(uc.mem_read(esp + 8, 4), "little")
            ok["v"] = True; ok["txt"] = bytes(uc.mem_read(txt, 40)).split(b"\0")[0]
            uc.emu_stop()
    mu.hook_add(1 << 2 if False else 4, hook_code)  # UC_HOOK_CODE
    mu.mem_write(stk - 0x40, (RET).to_bytes(4, "little") + (0x1234).to_bytes(4, "little"))
    mu.reg_write(UC_X86_REG_ESP, stk - 0x80)
    # frame ebp attendu : [ebp+8]=hwnd -> on pousse un faux frame
    mu.reg_write(0x15 if False else 20, stk - 0x40 - 4)    # EBP
    mu.mem_write(stk - 0x40 + 4, (0x1234).to_bytes(4, "little"))
    try:
        mu.emu_start(0x4010d5, RET)
    except UcError:
        pass
    check.msg = ok.get("txt", b"").decode(errors="replace")
    return ok["v"]


if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("--name", default="petik")
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--seed", type=int, default=1)
    ap.add_argument("--check", action="store_true", help="émule le vrai code de kgme2.exe (unicorn)")
    a = ap.parse_args()
    ser = keygen(a.name, a.seed)
    print(ser if a.q else f"name   = {a.name}\nserial = {ser}")
    if a.check:
        good = check(a.name, ser); msg_ok = check.msg
        print("check:", f"OK (MessageBox de succès : {check.msg!r})" if good else "KO")
        bad = serial_ko = check(a.name, ser[:-1] + ("0" if ser[-1] != "0" else "1"))
        print("check (checksum altéré):", "KO attendu -> " + ("ERREUR" if bad else "KO ✔"))
        sys.exit(0 if good else 1)
