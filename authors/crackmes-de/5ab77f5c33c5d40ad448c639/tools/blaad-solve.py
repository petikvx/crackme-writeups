#!/usr/bin/env python3
"""blaad / blaadme2 (blAAd) — id 5ab77f5c33c5d40ad448c639. ELF32 Qt 1.44 (libqt.so.1 absente ici).

Controllo::decodifica @0x804a3fc : ser[15] <- QLineEdit::text() ; ref[15] @0x804ab3c =
  cf dc df ce 05 cc cb 8a 8f 9a a9 ad bb b9 ce.   Pour i = 0..14, j = 14-i :
      ser[j] = ((ser[j] ^ ser[i]) ^ c_i) + (i + 1)       avec c_i = (0xffc8 - 10*i) & 0xff
      si ser[j] != ref[j] -> « No No No Try Again! » ; sinon (15 fois) « YEAAHHH! U WIN » / « tOo Much blAAd! 2 »
  Inversion : o[j] = ((ref[j]-(i+1)) ^ c_i ^ ref[i]) pour i = 8..14 ; o[14-i] = ... ^ o[i] pour i = 0..6 ;
  o[7] libre (ser[7]^ser[7] = 0).      Serial : 2195765?1436587 (? = n'importe quel caractère non nul).

--check : émulation unicorn de `decodifica` (QLineEdit::text / qstrcpy / QMessageBox::information hookés).

  blaad-solve.py [-q] [--check]
"""
import argparse, struct, sys
from pathlib import Path

BIN = Path(__file__).resolve().parent.parent / "analysis" / "blaadme2"
REF = bytes.fromhex("cfdcdfce05cccb8a8f9aa9adbbb9ce")
C = [(0xC8 - ((10 * i) & 0xFF)) & 0xFF for i in range(15)]


def forward(ser: bytes) -> bool:
    s = list(ser)
    ok = True
    for i in range(15):
        j = 14 - i
        s[j] = (((s[j] ^ s[i]) ^ C[i]) + i + 1) & 0xFF
        ok &= s[j] == REF[j]
    return ok


def keygen(mid: int = ord("0")) -> bytes:
    o = [0] * 15
    for i in range(8, 15):
        j = 14 - i
        o[j] = ((REF[j] - (i + 1)) & 0xFF) ^ C[i] ^ REF[i]
    for i in range(0, 7):
        o[14 - i] = ((((REF[14 - i] - (i + 1)) & 0xFF) ^ C[i])) ^ o[i]
    o[7] = mid
    return bytes(o)


def emu(text: bytes) -> str:
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_32, UC_HOOK_CODE
    from unicorn.x86_const import UC_X86_REG_ESP, UC_X86_REG_EAX, UC_X86_REG_EIP, UC_X86_REG_EBP
    d = BIN.read_bytes()
    mu = Uc(UC_ARCH_X86, UC_MODE_32)
    mu.mem_map(0x8048000, 0x10000)
    mu.mem_write(0x8048000, d[:0x2D00])
    mu.mem_write(0x804BD00, d[0x2D00:0x2D00 + 0x5F8])
    mu.mem_map(0x7000000, 0x20000)
    this, line, buf = 0x7001000, 0x7002000, 0x7003000
    mu.mem_write(this + 0x74, struct.pack("<I", line))
    mu.mem_write(buf, text + b"\0")
    res = {}
    stubs = {}
    import subprocess
    out = subprocess.run(["objdump", "-d", "-M", "intel", "--no-show-raw-insn", str(BIN)], capture_output=True, text=True).stdout
    for l in out.splitlines():
        if l.endswith(">:") and "@plt" in l:
            a, n = l.split()[0], l.split("<")[1][:-2]
            stubs[int(a, 16)] = n

    def hook(uc, addr, size, _):
        n = stubs.get(addr)
        if n is None:
            return
        esp = uc.reg_read(UC_X86_REG_ESP)
        arg = lambda k: struct.unpack("<I", uc.mem_read(esp + 4 * k, 4))[0]
        ret = struct.unpack("<I", uc.mem_read(esp, 4))[0]
        eax = 0
        if n.startswith("text__"):
            eax = buf
        elif n.startswith("qstrcpy") or n.startswith("strcpy"):
            s = bytes(uc.mem_read(arg(2), 64)).split(b"\0")[0]
            uc.mem_write(arg(1), s + b"\0"); eax = arg(1)
        elif n.startswith("information__"):
            # pile : parent, titre, texte, … ; res["msgs"] = [texte, titre]
            res["msgs"] = [bytes(uc.mem_read(arg(k), 40)).split(b"\0")[0].decode("latin1") for k in (3, 2)]
            uc.emu_stop(); return
        uc.reg_write(UC_X86_REG_EAX, eax)
        uc.reg_write(UC_X86_REG_ESP, esp + 4)
        uc.reg_write(UC_X86_REG_EIP, ret)
    mu.hook_add(UC_HOOK_CODE, hook, begin=0x8049800, end=0x804a000)
    sp = 0x7010000
    mu.mem_write(sp, struct.pack("<II", 0xDEADBEEF, this))
    mu.reg_write(UC_X86_REG_ESP, sp)
    mu.reg_write(UC_X86_REG_EBP, sp + 0x200)
    try:
        mu.emu_start(0x804A3FC, 0xDEADBEEF, count=200000)
    except Exception as e:
        res["err"] = str(e) + " eip=%#x" % mu.reg_read(UC_X86_REG_EIP)
    return res.get("msgs", [res.get("err", "?")])[0]


def main():
    ap = argparse.ArgumentParser(); ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true")
    a = ap.parse_args()
    k = keygen()
    print(k.decode() if a.q else f"serial : {k.decode()}   (le 8e caractère est libre)")
    if a.check:
        ok_model = forward(k) and forward(keygen(ord("z"))) and not forward(b"A" * 15)
        e1, e2 = emu(k), emu(b"A" * 15)
        good = ok_model and "WIN" in e1 and "WIN" not in e2
        print("check:", "OK" if good else "KO", f"(modèle={ok_model}, émulation: {e1!r} / {e2!r})")
        sys.exit(0 if good else 1)


if __name__ == "__main__":
    main()
