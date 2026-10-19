import sys
sys.path.insert(0, '.')
from emu import Emu, HEAP_BASE, HEAP_SIZE
from unicorn import *


def run_count(serial: bytes):
    e = Emu(verbose=False)
    cnt = [0]
    maxaddr = [0]

    def cb(u, a, s, d):
        cnt[0] += 1
        if a > maxaddr[0]:
            maxaddr[0] = a

    e.uc.hook_add(UC_HOOK_CODE, cb, begin=HEAP_BASE, end=HEAP_BASE + HEAP_SIZE)
    rax, flag = e.run(serial)
    return cnt[0], maxaddr[0] - HEAP_BASE, flag


if __name__ == "__main__":
    base = bytearray(b"A" * 76)
    print("baseline(all A):", run_count(bytes(base)))
    for c in "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789":
        s = bytearray(base)
        s[0] = ord(c)
        n, m, flag = run_count(bytes(s))
        print(c, n, hex(m), flag)
