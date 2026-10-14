#!/usr/bin/env python3
"""arm_crack1 (blankwall) — id 5ab77f5a33c5d40ad448c52b. ELF32 ARM EABI5 (Thumb-2), dynamique.

main @0x88d4 :
  d = "`TU_KU_KRXMS" (12 octets)       s = fgets(.., 13)   ; strlen(s) == 12 sinon exit(1)
  cmp(d, s) == 1  -> leurre : « YOU Sol... OOOPS YOU DIDNT » + system("yes FAIL")
  d[i] = d[i] + 20  (sub_877C : a1 > 10 -> a1 + 20)
  sub_8874 : v10 = cmp(d, s) ; v8 = cmp(littéral, d) = 9 ; tant que v10 <= 7 : v10 += cmp(d, s) ;
             retourne v8 - v10  ==  1  <=>  s == d + 20  (v10 monte de 1 à 8)  -> « WAY TO GO SOLVED IT! »
=> mot de passe = chaque octet de "`TU_KU_KRXMS" + 20 = "this_is_flag"

Pas de qemu-user : --check émule main avec unicorn (PLT hookée : malloc/memcpy/fgets/puts/ptrace/…).

  arm-crack1-solve.py [-q] [--check]
"""
import argparse, struct, sys
from pathlib import Path

BIN = Path(__file__).resolve().parent.parent / "analysis" / "Arm_crackme" / "arm_crack1"
LIT = b"`TU_KU_KRXMS"
ANSWER = bytes((c + 20) & 0xFF for c in LIT).decode()


def emu(line: bytes):
    from unicorn import Uc, UC_ARCH_ARM, UC_MODE_THUMB, UC_HOOK_CODE
    from unicorn.arm_const import (UC_ARM_REG_R0, UC_ARM_REG_R1, UC_ARM_REG_R2, UC_ARM_REG_SP,
                                   UC_ARM_REG_LR, UC_ARM_REG_PC)
    d = BIN.read_bytes()
    mu = Uc(UC_ARCH_ARM, UC_MODE_THUMB)
    mu.mem_map(0x8000, 0x10000); mu.mem_write(0x8000, d[:0xB58])
    mu.mem_write(0x10F04, d[0xF04:0xF04 + 0x150])
    mu.mem_map(0x100000, 0x100000)          # tas
    mu.mem_map(0x300000, 0x10000)           # pile
    mu.mem_map(0x400000, 0x1000)            # adresse de retour
    state = {"heap": 0x100000, "out": [], "ret": None, "sys": []}
    PLT = {0x8560: "malloc", 0x853C: "memcpy", 0x8578: "puts", 0x8554: "printf", 0x8524: "fgets",
           0x8518: "ptrace", 0x8548: "alarm", 0x84FC: "signal", 0x8530: "system", 0x8584: "exit",
           0x856C: "stack_chk"}
    rd = lambda a, n: bytes(mu.mem_read(a, n))
    cstr = lambda a: rd(a, 64).split(b"\0")[0]

    def hook(uc, addr, size, _):
        n = PLT.get(addr)
        if n is None:
            return
        r0, r1, r2 = (uc.reg_read(r) for r in (UC_ARM_REG_R0, UC_ARM_REG_R1, UC_ARM_REG_R2))
        ret = 0
        if n == "malloc":
            ret = state["heap"]; state["heap"] += (r0 + 15) & ~15
            uc.mem_write(ret, b"\0" * r0)
        elif n == "memcpy":
            uc.mem_write(r0, rd(r1, r2)); ret = r0
        elif n in ("puts", "printf"):
            state["out"].append(cstr(r0).decode("latin1"))
        elif n == "fgets":
            data = line[: r1 - 1]
            uc.mem_write(r0, data + b"\0"); ret = r0
        elif n == "system":
            state["sys"].append(cstr(r0).decode())
        elif n == "exit":
            state["ret"] = ("exit", r0); uc.emu_stop(); return
        uc.reg_write(UC_ARM_REG_R0, ret)
        uc.reg_write(UC_ARM_REG_PC, uc.reg_read(UC_ARM_REG_LR))   # bit0 = retour en Thumb
    mu.hook_add(UC_HOOK_CODE, hook, begin=0x84E0, end=0x8590)
    mu.reg_write(UC_ARM_REG_SP, 0x30F000)
    mu.reg_write(UC_ARM_REG_LR, 0x400001)
    try:
        mu.emu_start(0x88D4 | 1, 0x400000, count=2_000_000)
    except Exception as e:                      # fin sur 0x400000 : OK
        state["err"] = str(e) + " pc=%#x lr=%#x" % (mu.reg_read(UC_ARM_REG_PC), mu.reg_read(UC_ARM_REG_LR))
    if state["ret"] is None:
        state["ret"] = ("main", mu.reg_read(UC_ARM_REG_R0))
    return state


def main():
    ap = argparse.ArgumentParser(); ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true")
    a = ap.parse_args()
    print(ANSWER if a.q else f"mot de passe : {ANSWER}   (12 caractères)")
    if a.check:
        ok = emu(ANSWER.encode())
        raw = emu(LIT)
        bad = emu(b"petik1234567")
        good = ("WAY TO GO SOLVED IT!" in ok["out"] and ok["ret"] == ("main", 1)
                and "WAY TO GO SOLVED IT!" not in raw["out"] and raw["sys"] == ["yes FAIL"]
                and "WAY TO GO SOLVED IT!" not in bad["out"])
        print("check:", "OK" if good else "KO",
              f"(clé→{ok['out'][-1] if ok['out'] else None}; littéral→{raw['sys']} ; 'petik1234567'→{bad['out'][-1:]})")
        sys.exit(0 if good else 1)


if __name__ == "__main__":
    main()
