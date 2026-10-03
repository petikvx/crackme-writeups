#!/usr/bin/env python3
"""
Solver / verifier for crackmes.de "crackme_2.0_find_the_secret_text" by Devoney
(crackmes.one 5ab77f5333c5d40ad448c109).

How the crackme works
---------------------
A dialog reads your input (edit control id 0x65) into 0x403000 via
GetDlgItemTextA, then the GO handler scatters a per-index byte transform of the
input into:
  * a 19-byte buffer at 0x403009 (initially "1234567890123456789"), and
  * the five '0's of the "The Secret Text is: 00000" string (0x403039..0x40303d).
The 19-byte buffer is then copied over a NOP sled at 0x401351 with
WriteProcessMemory and executed as code (self-modifying).

For the right password those 19 bytes assemble into a MessageBoxA call that
pops up the secret text. The transform maps each output byte to one input byte
with a fixed offset, and forces several output bytes equal, which pins the
password exactly:

  password    = "[_Crack_]"
  secret text = "greed"      -> MessageBox "The Secret Text is: greed"

This script (1) reproduces the transform in pure Python and (2) optionally
emulates the real binary with Unicorn to capture the MessageBoxA call, proving
the result without needing a GUI/Wine.

Usage:
    ./solve.py [--pw "[_Crack_]"] [--emulate] [--exe PATH]
"""
import argparse, os, struct, sys

PW = b"[_Crack_]"
BUF = 0x403000


def transform(pw):
    """Reproduce the dialog-proc scatter transform (input indices 0..8)."""
    mem = bytearray(0x200)
    def W(va, v): mem[va - BUF] = v & 0xff
    for i, ch in enumerate(pw):
        cl = ch
        if i == 0:
            cl = (cl - 0x5b) & 0xff
            for a in (0x40300a, 0x40300f, 0x403014, 0x403016,
                      0x403019, 0x40301a, 0x40301b): W(a, cl)
            cl = (cl + 0x72) & 0xff; W(0x40303a, cl)
        elif i == 1:
            cl = (cl + 0x0b) & 0xff; W(0x403009, cl); W(0x403015, cl)
            cl = (cl - 0x03) & 0xff; W(0x403039, cl)
        elif i == 2:
            cl = (cl + 0x25) & 0xff; W(0x40300b, cl); W(0x403010, cl)
            cl = (cl - 0x03) & 0xff; W(0x40303b, cl)
        elif i == 3:
            cl = (cl - 0x42) & 0xff; W(0x40300d, cl); W(0x403012, cl)
            cl = (cl + 0x35) & 0xff; W(0x40303c, cl)
        elif i == 4:
            cl = (cl - 0x21) & 0xff; W(0x40300e, cl); W(0x403013, cl)
        elif i == 5:
            cl = (cl + 0x85) & 0xff; W(0x403017, cl)
        elif i == 6:
            cl = (cl - 0x2c) & 0xff; W(0x40300c, cl)
        elif i == 7:
            cl = (cl - 0x3a) & 0xff; W(0x403011, cl)
            cl = (cl + 0x3f) & 0xff; W(0x40303d, cl)
        elif i == 8:
            cl = (cl - 0x2b) & 0xff; W(0x403018, cl)
        else:
            break
    code = bytes(mem[0x009:0x009 + 19])
    secret = bytes(mem[0x039:0x039 + 5])
    return code, secret


def static_solve(pw):
    code, secret = transform(pw)
    print(f"[*] password      : {pw.decode('latin1')}")
    print(f"[*] 19-byte stub  : {code.hex()}")
    print(f"[+] secret text   : {secret.decode('latin1')!r}")
    try:
        from capstone import Cs, CS_ARCH_X86, CS_MODE_32
        print("[*] stub @0x401351:")
        for ins in Cs(CS_ARCH_X86, CS_MODE_32).disasm(code, 0x401351):
            print(f"      {ins.address:08x}  {ins.mnemonic} {ins.op_str}")
    except ImportError:
        print("[*] (install capstone to see the stub disassembly)")
    return code, secret


# ---- optional ground-truth emulation of the real binary ----
def emulate(exe, pw):
    from unicorn import (Uc, UC_ARCH_X86, UC_MODE_32, UC_HOOK_CODE,
                         UC_PROT_ALL)
    from unicorn.x86_const import (UC_X86_REG_ESP, UC_X86_REG_EIP,
                                   UC_X86_REG_EAX)
    d = open(exe, "rb").read()
    pe = struct.unpack('<I', d[0x3c:0x40])[0]
    nsec = struct.unpack('<H', d[pe + 6:pe + 8])[0]
    sh = pe + 24 + struct.unpack('<H', d[pe + 20:pe + 22])[0]
    IMG = 0x400000
    uc = Uc(UC_ARCH_X86, UC_MODE_32)
    uc.mem_map(IMG, 0x10000)
    for i in range(nsec):
        o = sh + i * 40
        _, va, rsz, ro = struct.unpack('<IIII', d[o + 8:o + 24])
        uc.mem_write(IMG + va, d[ro:ro + rsz])
    STACK = 0x200000
    uc.mem_map(STACK, 0x10000)
    esp = STACK + 0x8000

    captured = {}
    MSGBOX = 0x401396          # MessageBoxA import jmp thunk
    GETTXT = 0x40138a          # GetDlgItemTextA import jmp thunk
    WPM    = 0x4013c6          # WriteProcessMemory import jmp thunk

    def rd_str(addr):
        out = b""
        while True:
            c = uc.mem_read(addr, 1)
            if c == b"\x00": break
            out += c; addr += 1
        return out

    def hook(uc, address, size, _):
        esp = uc.reg_read(UC_X86_REG_ESP)
        if address == GETTXT:
            # GetDlgItemTextA(hDlg, id, lpStr, cch) -> write pw, ret len
            args = struct.unpack('<5I', uc.mem_read(esp, 20))
            _ret, _hdlg, _id, lp, cch = args
            s = pw[:cch - 1] + b"\x00"
            uc.mem_write(lp, s)
            uc.reg_write(UC_X86_REG_EAX, len(pw))
            uc.reg_write(UC_X86_REG_ESP, esp + 4 + 16)  # ret + 4 stdcall args
            uc.reg_write(UC_X86_REG_EIP, struct.unpack('<I', uc.mem_read(esp, 4))[0])
        elif address == WPM:
            # WriteProcessMemory(hProc, base, buf, n, written) -> emulate the copy
            args = struct.unpack('<6I', uc.mem_read(esp, 24))
            _ret, _h, base, buf, n, _w = args
            uc.mem_write(base, bytes(uc.mem_read(buf, n)))
            uc.reg_write(UC_X86_REG_EAX, 1)
            uc.reg_write(UC_X86_REG_ESP, esp + 4 + 20)
            uc.reg_write(UC_X86_REG_EIP, struct.unpack('<I', uc.mem_read(esp, 4))[0])
        elif address == MSGBOX:
            # MessageBoxA(hWnd, lpText, lpCaption, uType) -> capture + return
            args = struct.unpack('<5I', uc.mem_read(esp, 20))
            _ret, _hwnd, text, caption, _type = args
            captured["text"] = rd_str(text)
            captured["caption"] = rd_str(caption)
            uc.reg_write(UC_X86_REG_EAX, 1)
            uc.reg_write(UC_X86_REG_ESP, esp + 4 + 16)
            uc.reg_write(UC_X86_REG_EIP, struct.unpack('<I', uc.mem_read(esp, 4))[0])

    uc.hook_add(UC_HOOK_CODE, hook)

    # Call DlgProc(hDlg=0x1234, msg=WM_COMMAND(0x111), wParam=1, lParam=0)
    for v in (0, 1, 0x111, 0x1234):      # lParam, wParam, msg, hDlg
        esp -= 4; uc.mem_write(esp, struct.pack('<I', v))
    esp -= 4; uc.mem_write(esp, struct.pack('<I', 0xdeadbeef))  # fake return
    uc.reg_write(UC_X86_REG_ESP, esp)
    try:
        uc.emu_start(0x4011a2, 0xdeadbeef)
    except Exception:
        pass  # execution ends when it returns to the fake address

    if captured:
        print("\n[+] EMULATED MessageBoxA:")
        print(f"      caption : {captured['caption'].decode('latin1')!r}")
        print(f"      text    : {captured['text'].decode('latin1')!r}")
    else:
        print("\n[!] MessageBoxA was not reached (wrong password?)")
    return captured


def main():
    here = os.path.dirname(os.path.abspath(__file__))
    ap = argparse.ArgumentParser()
    ap.add_argument("--pw", default=PW.decode())
    ap.add_argument("--emulate", action="store_true",
                    help="emulate the real binary with Unicorn for ground truth")
    ap.add_argument("--exe", default=None,
                    help="path to CrackMe2.exe (default: extracted next to zip)")
    args = ap.parse_args()
    pw = args.pw.encode("latin1")

    static_solve(pw)

    if args.emulate:
        exe = args.exe
        if not exe:
            exe = os.path.join(here, "..", "analysis", "CrackMe2.exe")
        if not os.path.exists(exe):
            print(f"[!] exe not found: {exe}  (extract CrackMe2.zip first)",
                  file=sys.stderr)
            sys.exit(2)
        emulate(exe, pw)


if __name__ == "__main__":
    main()
