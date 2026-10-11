#!/usr/bin/env python3
"""NTS Crackme3 (Cyclops) : serial de 8 caractères contraints un par un (0x4013d0).
s0*2=0x64, s1+10=0x44, s2+10=0x33, s3='.', s4='+', s5='-', s6='M', s7 = n'importe quel caractère."""
import sys
last = sys.argv[1] if len(sys.argv) > 1 else "X"
print(chr(0x64 // 2) + chr(0x44 - 10) + chr(0x33 - 10) + ".+-M" + last[0])
