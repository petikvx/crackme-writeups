#!/usr/bin/env python3
# rif_crackme_1 (Dr. rED mEAT) : serial fixe = wsprintf("%lX", (6*0x6FD) ^ 0x6FD)
eax = 0
for _ in range(6):
    eax += 0x6FD
eax ^= 0x6FD
print("%lX" % eax)  # 2F13 (comparaison lstrcmpiA, casse ignorée)
