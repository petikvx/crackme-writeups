"""GDB python helper for level 4 of saltedMacaroni841's Upgraded Levels Keygen.

Run as:  gdb -q -batch -x _level4_patch.gdb.py <binary>
Stdin of the inferior must drive the menu to level 4 and supply ANY 6-char
password guess (it gets overwritten in memory before the real comparison).

How it works (see README "Comment on trouve" for the full reverse):
  - sub_1DDF (file offset 0x1ddf) is the final 6-byte comparison:
        a1 (rdi) = the correct answer for this run (fully computed already,
                    from this run's rand() picks, before the password prompt)
        a2 (rsi) = the user's typed guess
  - We break at its very first instruction (before any byte is compared),
    read the 6 "correct" bytes from rdi, and overwrite the 6 bytes at rsi
    with them -- a DATA patch (not a jump/nop patch, allowed by the
    challenge's own rules), then let execution continue normally.
"""
import re
import gdb

OFFSET = 0x1DDF


def find_base(binary_path):
    out = gdb.execute("info proc mappings", to_string=True)
    for line in out.splitlines():
        if binary_path in line and "r--p" in line:
            return int(line.split()[0], 16)
    raise RuntimeError("could not find the executable's load base")


def on_stop(event):
    rdi = int(gdb.parse_and_eval("$rdi"))
    rsi = int(gdb.parse_and_eval("$rsi"))
    inferior = gdb.selected_inferior()
    answer = inferior.read_memory(rdi, 6)
    print("LEVEL4_ANSWER", answer.tobytes().hex())
    inferior.write_memory(rsi, answer)
    gdb.events.stop.disconnect(on_stop)
    gdb.execute("continue")


gdb.execute("set pagination off")
gdb.execute("set disable-randomization on")
gdb.execute("starti")
binary = gdb.selected_inferior().progspace.filename
base = find_base(binary)
bp_addr = base + OFFSET
gdb.execute(f"break *{hex(bp_addr)}")
gdb.events.stop.connect(on_stop)
gdb.execute("continue")
