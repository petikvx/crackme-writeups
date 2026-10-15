import gdb
gdb.execute("set pagination off")
gdb.execute("set confirm off")
gdb.execute("set environment QT_QPA_PLATFORM=offscreen")
gdb.execute("set breakpoint pending on")
gdb.execute("break time")
gdb.execute("run")
# base du PIE (ld.so mappé en premier ; on cherche le mapping de tb_patched)
out = gdb.execute("info proc mappings", to_string=True)
base = None
for l in out.splitlines():
    if "tb_patched" in l:
        base = int(l.split()[0], 16); break
print("base", hex(base))
inf = gdb.selected_inferior()
def call(user):
    b = user.encode()
    inp = int(gdb.parse_and_eval("$rsp")) - 0x400
    out_ = inp + 0x80
    buf = inp + 0x40
    # std::string SSO (<=15) : ptr,size,buf
    inf.write_memory(buf, b + b"\0")
    inf.write_memory(inp, (buf).to_bytes(8, "little") + len(b).to_bytes(8, "little"))
    gdb.execute("set $r = ((long(*)(long,long))%#x)(%#x,%#x)" % (base + 0x7840, out_, inp))
    ptr = int.from_bytes(inf.read_memory(out_, 8), "little")
    n = int.from_bytes(inf.read_memory(out_ + 8, 8), "little")
    return bytes(inf.read_memory(ptr, n)).decode()
for u in ["petik","will_smith","marcus_vane","john_doe","jomes_sandin","sarah_jenkins","franklin_sierra","AA"]:
    print("RESULT", u, call(u))
gdb.execute("kill")
