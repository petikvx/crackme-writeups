"""VaultBreaker -- preuve live : appelle MainWindow::CheckPassword(QString)
directement dans le process, sans piloter la GUI Qt.

Prerequis : le binaire original/VaultBreaker exige Qt_6.11 (symbole non
disponible sur une install Qt 6.10) -- sur une copie DE TRAVAIL (hors
original/, p.ex. analysis/vb_patched), remplacer la chaine de version et
son hash ELF (meme recette que pour segfaults/6a0c8b60.../README.md) :

    import re
    d = bytearray(open("original/VaultBreaker","rb").read())
    def h(n):
        x = 0
        for c in n.encode():
            x = (x << 4) + c
            g = x & 0xf0000000
            if g: x ^= g >> 24
            x &= ~g & 0xffffffff
        return x
    old, new = b"Qt_6.11\0", b"Qt_6.10\0"
    i = d.find(old)
    while i != -1:
        d[i:i+8] = new
        i = d.find(old, i+1)
    ho = h("Qt_6.11").to_bytes(4, "little")
    j = d.find(ho)
    while j != -1:
        d[j:j+4] = h("Qt_6.10").to_bytes(4, "little")
        j = d.find(ho, j+1)
    open("vb_patched", "wb").write(d)

(ce binaire a deja un PT_INTERP standard /lib64/ld-linux-x86-64.so.2,
contrairement a segfaults/target_bin -- pas besoin de patcher l'interpreteur.)

Usage :
    gdb -q -batch -ex "source tools/gdb-call-checkpassword.py" ./vb_patched
"""
import gdb

gdb.execute("set pagination off")
gdb.execute("set confirm off")
gdb.execute("set environment QT_QPA_PLATFORM=offscreen")
gdb.execute("break main")
gdb.execute("run", to_string=False)

out = gdb.execute("info proc mappings", to_string=True)
base = None
for l in out.splitlines():
    if l.strip().endswith("/vb_patched"):
        base = int(l.split()[0], 16)
        break
print("PROOF base=%#x" % base)

FROM_UTF8 = base + 0x3180   # stub .plt de QString::fromUtf8(QByteArrayView)
CHECK_PW = base + 0x38a0    # MainWindow::CheckPassword(QString const&)

inf = gdb.selected_inferior()
rsp = int(gdb.parse_and_eval("$rsp"))
scratch = rsp - 0x4000  # zone scratch sous la pile courante, hors frame active


def try_password(pw: str) -> bool:
    data = scratch
    inf.write_memory(data, pw.encode() + b"\0")
    qstr = scratch + 0x200
    # QByteArrayView = { qsizetype size; const char *data; } (cet ordre, pas
    # l'inverse -- confirme empiriquement : l'ordre (data,size) plante
    # CheckPassword avec un std::terminate, (size,data) fonctionne).
    gdb.execute("call ((void(*)(void*,long,const char*))%#x)(%#x,%#x,%d)" %
                (FROM_UTF8, qstr, len(pw), data))
    # CheckPassword ignore son premier argument (this) -> 0 convient.
    r = gdb.parse_and_eval("((int(*)(void*,void*))%#x)(0,%#x)" % (CHECK_PW, qstr))
    return bool(int(r) & 0xff)


for pw in ["petik", "Op3nS3same", "0123456789", "AAAAAAAAAA"]:
    print("PROOF", pw, try_password(pw))

gdb.execute("kill")
