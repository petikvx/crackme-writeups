import ctypes, struct
import ctypes.wintypes as W
k = ctypes.WinDLL('kernel32', use_last_error=True)
k.GetThreadContext.argtypes = [W.HANDLE, ctypes.c_void_p]
k.SetThreadContext.argtypes = [W.HANDLE, ctypes.c_void_p]
CTX_ALL = 0x10001F
REGS = {'rax': 0x78, 'rcx': 0x80, 'rdx': 0x88, 'rbx': 0x90, 'rsp': 0x98, 'rbp': 0xA0, 'rsi': 0xA8, 'rdi': 0xB0,
        'r8': 0xB8, 'r9': 0xC0, 'r10': 0xC8, 'r11': 0xD0, 'r12': 0xD8, 'r13': 0xE0, 'r14': 0xE8, 'r15': 0xF0, 'rip': 0xF8}


class Ctx:
    def __init__(self):
        self.raw = ctypes.create_string_buffer(1232 + 16)
        a = ctypes.addressof(self.raw); self.addr = (a + 15) & ~15; self.off = self.addr - a

    def get(self, h, flags=CTX_ALL):
        struct.pack_into('<I', self.raw, self.off + 0x30, flags)
        assert k.GetThreadContext(h, self.addr), ctypes.get_last_error()

    def set(self, h): assert k.SetThreadContext(h, self.addr), ctypes.get_last_error()
    def q(self, o): return struct.unpack_from('<Q', self.raw, self.off + o)[0]
    def w(self, o, v): struct.pack_into('<Q', self.raw, self.off + o, v)
