#!/usr/bin/env python3
"""crackme_3 by fireworx : extrait le mot de passe du DFM (TAHMPasswordDlg) et vérifie le champ Scramble."""
import re, sys
exe = sys.argv[1] if len(sys.argv) > 1 else 'Crackme3.exe'
d = open(exe, 'rb').read()
m = re.search(rb'\x08Scramble\x06(.)(.*?)\x08Password\x06(.)', d, re.S)
scr = m.group(2)[:m.group(1)[0]]
n = m.group(3)[0]; pw = d[m.end():m.end() + n].decode()
assert bytes((c + 0x4b) & 0xff for c in pw.encode()) == scr  # SetPassword : Scramble = chr(c+0x4B)
print(pw, '(comparé après UpperCase : la casse est libre)')
