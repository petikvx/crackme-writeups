"""ComputeTheKey -- preuve live : lit la valeur de retour de sub_1312 (le hash
djb2-like de main(), utilise comme octet 0 de la cle XOR) juste a son `ret`.

PIEGE : ne JAMAIS poser de breakpoint a l'interieur de la zone hashee
([0x1342, 0x13e5) = le corps de main()) -- gdb y insere un octet 0xCC (INT3)
des l'appel a `break`, AVANT meme `continue`/`run` ; ce `ret 0x13ce` (le futur
`call memcmp`) se trouve DANS cette zone, donc la casser corrompt le hash
calcule juste apres (observe : 0xe1 au lieu de 0xfd, et le mot de passe
pourtant correct "X_SECRET_KEY_X_1307" echoue alors sous gdb). Casser plutot
sur le `ret` de sub_1312 lui-meme (0x133b), situe AVANT main() et donc hors
zone hashee -- lecture propre, confirmee identique au calcul statique.

Usage :
    gdb -q -batch -ex "source tools/gdb-dump-key-schedule.py" \
        --args ./original/crackme_th X_SECRET_KEY_X_1307
"""
import gdb

gdb.execute("set pagination off")
gdb.execute("set confirm off")
gdb.execute("starti")
out = gdb.execute("info proc mappings", to_string=True)
base = None
for l in out.splitlines():
    if l.strip().endswith("/crackme_th") and " 0x0 " in l:
        base = int(l.split()[0], 16)
        break
print("PROOF base=%#x" % base)

gdb.execute("break *%#x" % (base + 0x133b))  # ret de sub_1312 (djb2), hors [0x1342,0x13e5)
gdb.execute("continue", to_string=False)

rax = int(gdb.parse_and_eval("$rax")) & 0xFFFFFFFFFFFFFFFF
print("PROOF hash=%#x low_byte=%#x" % (rax, rax & 0xff))
gdb.execute("continue", to_string=False)
