# NTS Crackme1 (cyclops) — single-byte patch
# VA 0x40100d : jne → je  (75 → 74), file offset 0x40d
# (flag ds:0x403040 vaut 0 ; l'inversion du saut affiche Registered!!! )
import sys
src=sys.argv[1] if len(sys.argv)>1 else 'crackme1.exe'
dst=sys.argv[2] if len(sys.argv)>2 else 'crackme1-patched.exe'
d=bytearray(open(src,'rb').read())
assert d[0x40d]==0x75, hex(d[0x40d])
d[0x40d]=0x74
open(dst,'wb').write(d)
print('OK', dst, 'offset 0x40d: 75→74')
