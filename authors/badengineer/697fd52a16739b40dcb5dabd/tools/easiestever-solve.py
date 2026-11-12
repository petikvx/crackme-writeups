#!/usr/bin/env python3
"""BadEngineer's EasiestEver — keygen.

Prédicat (PasswordCheck @ 0x140001490) : strlen(pw) <= 16 et le mot de passe contient
au moins un caractère de chacune des 10 classes (premier intervalle qui matche, if/else if) :
  0-4 | H-N | t-y | a-f | !-& | ;-? | j-m | z-} | o-s | \\ ] ^ _ `

  easiestever-solve.py [-q] [--len 10..15] [--seed N] [--check original/download.bin]

--check : émule la vraie PasswordCheck du PE (extrait en mémoire du ZIP d'origine) avec unicorn
          (pas de Wine requis) ; --wine : lance aussi le binaire sous xvfb-run wine.
"""
import argparse, io, random, struct, subprocess, sys, zipfile

CLASSES = ["01234", "HIJKLMN", "tuvwxy", "abcdef", "!\"#$%&", ";<=>?", "jklm", "z{|}", "opqrs", "\\]^_`"]
BASE = 0x140000000


def solve(length=10, seed=None):
    if not 10 <= length <= 15:  # >=10 classes ; <=15 pour ne pas déborder buf[16] du main
        raise SystemExit("--len doit être dans 10..15")
    rng = random.Random(seed)
    chars = [c[0] if seed is None else rng.choice(c) for c in CLASSES]
    while len(chars) < length:
        chars.append(rng.choice(CLASSES[len(chars) % 10]) if seed is not None else CLASSES[len(chars) % 10][-1])
    return "".join(chars)


def valid(pw):
    if len(pw) > 16:
        return False
    rngs = [(0x30, 0x34), (0x48, 0x4E), (0x74, 0x79), (0x61, 0x66), (0x21, 0x26),
            (0x3B, 0x3F), (0x6A, 0x6D), (0x7A, 0x7D), (0x6F, 0x73), (0x5C, 0x60)]
    seen = set()
    for ch in map(ord, pw):
        for i, (lo, hi) in enumerate(rngs):
            if lo <= ch <= hi:
                seen.add(i)
                break
    return len(seen) == 10


def emu_check(zpath, pw):
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
    from unicorn.x86_const import UC_X86_REG_RCX, UC_X86_REG_RSP, UC_X86_REG_RAX, UC_X86_REG_RIP
    if zpath.endswith(".exe"):
        pe = open(zpath, "rb").read()
    else:
        pe = zipfile.ZipFile(zpath).read("simplecrackme.exe", pwd=b"crackmes.one")
    e_lfanew = struct.unpack_from("<I", pe, 0x3C)[0]
    nsec, = struct.unpack_from("<H", pe, e_lfanew + 6)
    optsz, = struct.unpack_from("<H", pe, e_lfanew + 20)
    soh, = struct.unpack_from("<I", pe, e_lfanew + 24 + 56)
    mu = Uc(UC_ARCH_X86, UC_MODE_64)
    mu.mem_map(BASE, (soh + 0xFFF) & ~0xFFF)
    mu.mem_write(BASE, pe[:0x400])
    for i in range(nsec):
        o = e_lfanew + 24 + optsz + 40 * i
        vsz, va, rsz, raw = struct.unpack_from("<IIII", pe, o + 8)
        mu.mem_write(BASE + va, pe[raw:raw + rsz])
    mu.mem_map(0x200000, 0x10000)
    mu.mem_map(0x300000, 0x1000)
    data = pw.encode() + b"\0"
    mu.mem_write(0x300000, data)
    STRLEN, RET = 0x140010FC0, 0x400000
    mu.mem_map(RET, 0x1000)

    def hook(uc, addr, size, _):
        if addr == STRLEN:  # thunk msvcrt!strlen -> émulé
            s = uc.mem_read(uc.reg_read(UC_X86_REG_RCX), 64).split(b"\0")[0]
            uc.reg_write(UC_X86_REG_RAX, len(s))
            sp = uc.reg_read(UC_X86_REG_RSP)
            uc.reg_write(UC_X86_REG_RIP, struct.unpack("<Q", uc.mem_read(sp, 8))[0])
            uc.reg_write(UC_X86_REG_RSP, sp + 8)
    mu.hook_add(UC_HOOK_CODE, hook, begin=STRLEN, end=STRLEN)
    sp = 0x200000 + 0x8000
    mu.mem_write(sp, struct.pack("<Q", RET))
    mu.reg_write(UC_X86_REG_RSP, sp)
    mu.reg_write(UC_X86_REG_RCX, 0x300000)
    mu.emu_start(0x140001490, RET)
    return mu.reg_read(UC_X86_REG_RAX) & 0xFFFFFFFF


if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("--len", type=int, default=10)
    ap.add_argument("--seed", type=int)
    ap.add_argument("--user", "--name", default="petik", help="ignoré : pas de username (accepté par convention)")
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", metavar="ZIP_OR_EXE")
    ap.add_argument("--wine", metavar="EXE", help="exe extrait ; lance xvfb-run wine")
    a = ap.parse_args()
    pw = solve(a.len, a.seed)
    assert valid(pw)
    print(pw if a.q else f"password = {pw!r} (len={len(pw)})")
    ok = True
    if a.check:
        good = emu_check(a.check, pw) == 1
        bad = [emu_check(a.check, x) for x in ("petik", "".join(c for c in pw if c not in CLASSES[9]), pw + "A" * 7)]
        print(f"emu PasswordCheck({pw!r}) = {int(good)} ; KO attendus : {bad}")
        ok = good and bad == [0, 0, 0]
    if a.wine:
        out = subprocess.run(["xvfb-run", "-a", "wine", a.wine], input=pw + "\n",
                             capture_output=True, text=True, timeout=120).stdout
        print(out)
        ok = ok and "Congrats" in out
    sys.exit(0 if ok else 1)
