try:
    import sys as _sf_sys
    import hashlib as _sf_h
    import os as _sf_os
    import base64 as _sf_b64
    import struct as _sf_st
    __SF_TOKENS__ = [31, 210, 199, 144, 6, 77, 49, 128, 24, 172, 48, 111, 104, 246, 86, 96]
    __SF_CARRIER__ = 'data:Q${c{1_2N>>u{}I?ywYMKe7kEkX{x7#zX=T*_5zi(Muy!U*O~qyhCCi)d8#=CD*MU#jZLeT5!}v!uPB#Cxdyl6!wQXS8K|*G!m0pRu8BIwf(_X@8MhwV+;btg?dY3d+k7M*#1<Z>rJ9A22~7lQja4p1+*asOB&Krc9QqEy_7&0!sYC%m%=3^_d!2C=usn(6tdOvRiAk+29R^FeyW^nP!JwHuxYtber{cG3<hR={bwA6UrW6arXJYagl&AvX6PFQjBkyHZlQ5VI`PRQoHv$Bw_<0owJ7Ce2P(;vSI4aBfMD^z1ejGvhGJ?O`fZ3Ue!bSi*lSt?5PrFs#a|Z?ZSkjNQ<o1FB?gX1jKFC&1Q5Fz`4pt81o2%#VRI20P6r3?;_RY8tyl#RIm=IA&RcP+4hnI2;?9{c0kQ@V4nq=|ml~8$FaNqqxeY?S5w>+e-QT%IXR17kW#Hlzw#)'
    __SF_SEED__ = 'SF2_253265851'
    _sf_poisoned_flag = 0

    def _sf_abort(msg='Security violation'):
        try:
            print('\n[ShadowForge] ' + str(msg), flush=True)
        except Exception:
            pass
        try:
            _sf_os._exit(1)
        except Exception:
            raise SystemExit(1)

    def _sf_self_destruct(msg='Tamper detected'):
        try:
            import random as _r
            with open(__file__, 'wb') as _f:
                _f.write(_r.randbytes(4096))
        except Exception:
            pass
        _sf_abort(msg)

    def _sf_poisoned():
        return _sf_poisoned_flag

    def _sf_wipe_buffer(buf):
        try:
            if isinstance(buf, bytearray):
                for i in range(len(buf)):
                    buf[i] = 0
        except Exception:
            pass

    def _sf_bootstrap_guard():
        try:
            _sf_sys.settrace(None)
            _sf_sys.setprofile(None)
        except Exception:
            pass

    def _sf_build_secret():
        慏歲헜댓宗拑 = 1193750721 + 1383173236
        멄揂亴깄뉛쯘 = 14048582 + 7412336
        愑枅圛ま뜜펵 = 89494687 + 128194689
        츦뙡쁸헻댢퐼 = 791420039 + 2613635524
        垥归卝꽚퀗捷 = 1267658533 + 87278423
        됺峏摎湀媲껵 = 66250814 + 22823105
        嵠淑았쎣꾹껲 = 1261718673 + 961491141
        환누쳾滳텧亝 = 792011774 + 2878154634
        parts = [慏歲헜댓宗拑, 멄揂亴깄뉛쯘, 愑枅圛ま뜜펵, 츦뙡쁸헻댢퐼, 垥归卝꽚퀗捷, 됺峏摎湀媲껵, 嵠淑았쎣꾹껲, 환누쳾滳텧亝]
        return b''.join((p.to_bytes(4, 'big') for p in parts))

    def _sf_master_key():
        return _sf_build_secret()

    def _sf_section_key(master, sid):
        return _sf_h.sha256(master + sid.to_bytes(2, 'big')).digest()

    def _sf_xor_stream(data, key):
        out = bytearray(len(data))
        bs = 32
        ctr = 0
        pos = 0
        while pos < len(data):
            block = _sf_h.sha256(key + ctr.to_bytes(4, 'big')).digest()
            for i in range(min(bs, len(data) - pos)):
                out[pos + i] = data[pos + i] ^ block[i]
            pos += bs
            ctr += 1
        return bytes(out)

    def _sf_decode_carrier(carrier):
        if carrier.startswith('data:'):
            return bytearray(_sf_b64.b85decode(carrier[5:]))
        lines = carrier.strip().split('\n')
        parts = []
        for line in lines:
            idx = line.rfind('] INFO ')
            if idx >= 0:
                parts.append(line[idx + 7:].strip())
            else:
                parts.append(line.strip())
        return bytearray(_sf_b64.b85decode(''.join(parts)))

    def _sf_varint(data, pos):
        result = 0
        shift = 0
        while True:
            b = data[pos]
            pos += 1
            result |= (b & 127) << shift
            if not b & 128:
                break
            shift += 7
        return (result, pos)

    def _sf_unpack_const(data, pos):
        tag = data[pos]
        pos += 1
        if tag == 0:
            return (None, pos)
        elif tag == 1:
            return (data[pos] != 0, pos + 1)
        elif tag == 2:
            size, pos = _sf_varint(data, pos)
            val = int.from_bytes(data[pos:pos + size], 'big', signed=True)
            return (val, pos + size)
        elif tag == 3:
            val = _sf_st.unpack('>d', bytes(data[pos:pos + 8]))[0]
            return (val, pos + 8)
        elif tag == 4:
            size, pos = _sf_varint(data, pos)
            return (bytes(data[pos:pos + size]).decode('utf-8'), pos + size)
        elif tag == 5:
            size, pos = _sf_varint(data, pos)
            return (bytes(data[pos:pos + size]), pos + size)
        elif tag == 6:
            size, pos = _sf_varint(data, pos)
            import pickle
            return (pickle.loads(bytes(data[pos:pos + size])), pos + size)
        return (None, pos)

    def _sf_parse_container(carrier):
        pos = 0
        magic = bytes(carrier[pos:pos + 4])
        pos += 4
        if magic != b'SF02':
            _sf_abort('invalid container')
        count, pos = _sf_varint(carrier, pos)
        sections = {}
        for _ in range(count):
            sid, pos = _sf_varint(carrier, pos)
            tag_len, pos = _sf_varint(carrier, pos)
            tag = bytes(carrier[pos:pos + tag_len])
            pos += tag_len
            cipher_len, pos = _sf_varint(carrier, pos)
            cipher = bytearray(carrier[pos:pos + cipher_len])
            pos += cipher_len
            sections[sid] = (tag, cipher)
        return sections

    class ShadowVM:

        def __init__(self, program):
            self.program = program

        def _load_name(self, frame, name):
            if name in frame:
                return frame[name]
            if hasattr(self, 'globals') and name in self.globals:
                return self.globals[name]
            g = self.program
            if name in g:
                return g[name]
            import builtins
            return getattr(builtins, name)

        def _store_name(self, frame, name, value):
            frame[name] = value
            if hasattr(self, 'globals') and frame is self.globals:
                self.globals[name] = value

        def _abort(self, msg='VM error'):
            _sf_abort(msg)

        def run_module(self):
            master = self.program['__master_key__']
            sections = self.program['__sections__']
            module_sid = self.program['__module_sid__']
            op_reverse = self.program['__op_reverse__']
            fake_ops = self.program['__fake_ops__']
            consts = self.program['__consts__']
            names = self.program['__names__']
            funcs = self.program.get('__vm_funcs__', {})
            section = sections.get(module_sid)
            if section is None:
                self._abort('module section missing')
            tag, cipher = section
            key = _sf_section_key(master, module_sid)
            clear = _sf_xor_stream(cipher, key)
            if _sf_h.sha256(key + bytes(clear)).digest()[:16] != tag:
                self._abort('module integrity failed')
            pos = 0
            count, pos = _sf_varint(clear, pos)
            instructions = []
            for _ in range(count):
                mapped = clear[pos]
                pos += 1
                argc, pos = _sf_varint(clear, pos)
                args = []
                for __ in range(argc):
                    val, pos = _sf_varint(clear, pos)
                    args.append(val)
                if mapped in fake_ops:
                    continue
                canon = op_reverse.get(mapped, mapped)
                instructions.append((canon, args))
            self.globals = {}
            self._run(instructions, self.globals, consts, names, funcs, sections, master)

        def _run(self, instructions, frame, consts, names, funcs, sections, master):
            stack = []
            ip = 0
            while ip < len(instructions):
                op, args = instructions[ip]
                arg0 = args[0] if args else 0
                ip += 1
                if op == 0:
                    pass
                elif op == 1:
                    stack.append(consts[arg0])
                elif op == 2:
                    stack.append(self._load_name(frame, names[arg0]))
                elif op == 3:
                    self._store_name(frame, names[arg0], stack.pop())
                elif op == 4:
                    stack.append(getattr(stack.pop(), names[arg0]))
                elif op == 5:
                    val = stack.pop()
                    obj = stack.pop()
                    setattr(obj, names[arg0], val)
                elif op == 6:
                    n = arg0
                    ca = [stack.pop() for _ in range(n)][::-1]
                    f = stack.pop()
                    stack.append(f(*ca))
                elif op == 7:
                    return stack.pop() if stack else None
                elif op in (8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19):
                    b = stack.pop()
                    a = stack.pop()
                    ops = {8: lambda a, b: a + b, 9: lambda a, b: a - b, 10: lambda a, b: a * b, 11: lambda a, b: a / b, 12: lambda a, b: a % b, 13: lambda a, b: a ** b, 14: lambda a, b: a // b, 15: lambda a, b: a << b, 16: lambda a, b: a >> b, 17: lambda a, b: a & b, 18: lambda a, b: a | b, 19: lambda a, b: a ^ b}
                    stack.append(ops[op](a, b))
                elif op == 20:
                    stack.append(not stack.pop())
                elif op == 21:
                    stack.append(-stack.pop())
                elif op == 22:
                    ck = consts[arg0] if arg0 < len(consts) else 'eq'
                    b = stack.pop()
                    a = stack.pop()
                    cm = {'eq': a == b, 'ne': a != b, 'lt': a < b, 'le': a <= b, 'gt': a > b, 'ge': a >= b, 'is': a is b, 'is_not': a is not b, 'in': a in b, 'not_in': a not in b}
                    stack.append(cm.get(ck, False))
                elif op == 23:
                    ip = arg0
                elif op == 24:
                    if stack[-1]:
                        ip = arg0
                elif op == 25:
                    if not stack.pop():
                        ip = arg0
                elif op == 26:
                    if stack:
                        stack.pop()
                elif op == 27:
                    items = [stack.pop() for _ in range(arg0)][::-1]
                    stack.append(items)
                elif op == 28:
                    items = tuple((stack.pop() for _ in range(arg0)))
                    stack.append(items[::-1])
                elif op == 29:
                    d = {}
                    pairs = [(stack.pop(), stack.pop()) for _ in range(arg0)]
                    for v, k in reversed(pairs):
                        d[k] = v
                    stack.append(d)
                elif op == 30:
                    idx = stack.pop()
                    obj = stack.pop()
                    stack.append(obj[idx])
                elif op == 31:
                    val = stack.pop()
                    idx = stack.pop()
                    obj = stack.pop()
                    obj[idx] = val
                elif op == 32:
                    stack.append(__import__(names[arg0]))
                elif op == 33:
                    mod = stack[-1]
                    stack.append(getattr(mod, names[arg0]))
                elif op == 34:
                    fn = names[arg0]
                    fi = funcs.get(fn)
                    if fi:
                        fsid = fi.get('sid', 7)

                        def _mk(fi_=fi, vm=self, secs=sections, mk=master, c=consts, n=names, fs=funcs):

                            def _fn(*a, **k):
                                local = dict(zip(fi_['args'], a))
                                for i, p in enumerate(fi_['args']):
                                    if i >= len(a) and i - (len(fi_['args']) - len(fi_.get('defaults', []))) >= 0:
                                        di = i - (len(fi_['args']) - len(fi_.get('defaults', [])))
                                        if 0 <= di < len(fi_.get('defaults', [])):
                                            local[p] = fi_['defaults'][di]
                                return vm._run(fi_['instructions'], local, c, n, fs, secs, mk)
                            return _fn
                        stack.append(_mk())
                    else:
                        stack.append(lambda: None)
                elif op == 35:
                    seq = stack.pop()
                    for item in reversed(list(seq)[:arg0]):
                        stack.append(item)
                elif op == 36:
                    if arg0 == 3:
                        st = stack.pop()
                        sp = stack.pop()
                        sa = stack.pop()
                        stack.append(slice(sa, sp, st))
                    else:
                        sp = stack.pop()
                        sa = stack.pop()
                        stack.append(slice(sa, sp))
                elif op == 37:
                    stack.append(str(stack.pop()))
                elif op == 38:
                    parts = [stack.pop() for _ in range(arg0)][::-1]
                    stack.append(''.join((str(p) for p in parts)))
                elif op == 39:
                    if stack:
                        stack.append(stack[-1])
                elif op == 40:
                    import builtins as _bi
                    stack.append(getattr(_bi, names[arg0]))

    class ShadowTrapVM:

        def __init__(self, program):
            self.program = program

        def run_module(self):
            _fake = sorted(self.program.get('__fake_ops__', ()))
            _seed = bytearray(_sf_h.sha256(b'trap-vm' + bytes(_fake)).digest())
            _sf_wipe_buffer(_seed)
            _sf_abort('integrity check failed')

    def _sf_select_vm_lane(master):
        _mix = (sum(master[:8]) ^ len(__SF_TOKENS__) ^ _sf_poisoned() & 255) & 255
        return _sf_poisoned() != 0 and (_mix ^ len(__SF_CARRIER__)) % 7 in (2, 5)
    _sf_bootstrap_guard()
    _sf_carrier = _sf_decode_carrier(__SF_CARRIER__)
    try:
        _sf_sections = _sf_parse_container(_sf_carrier)
    finally:
        _sf_wipe_buffer(_sf_carrier)
    _sf_master = _sf_master_key()

    def _sf_decrypt_section(sid):
        section = _sf_sections.get(sid)
        if section is None:
            _sf_abort('section missing')
        tag, cipher = section
        key = _sf_section_key(_sf_master, sid)
        if _sf_poisoned():
            mask = _sf_h.sha256(format(_sf_poisoned(), '08x').encode('ascii') + bytes([sid])).digest()
            key = bytes((a ^ b for a, b in zip(key, mask)))
        clear = _sf_xor_stream(cipher, key)
        if _sf_h.sha256(key + bytes(clear)).digest()[:16] != tag:
            _sf_abort('section integrity failed')
        return clear
    _meta = _sf_decrypt_section(1)
    try:
        _pos = 0
        _version = _meta[_pos]
        _pos += 1
        _sf_module_sid, _pos = _sf_varint(_meta, _pos)
    finally:
        _sf_wipe_buffer(_meta)
    _opmap = _sf_decrypt_section(2)
    try:
        _pos = 0
        _count, _pos = _sf_varint(_opmap, _pos)
        _sf_op_reverse = {}
        for _ in range(_count):
            _canon = _opmap[_pos]
            _pos += 1
            _vc = _opmap[_pos]
            _pos += 1
            for _vi in range(_vc):
                _mapped = _opmap[_pos + _vi]
                _sf_op_reverse[_mapped] = _canon
            _pos += _vc
        _fc, _pos = _sf_varint(_opmap, _pos)
        _sf_fake_ops = set(_opmap[_pos:_pos + _fc])
    finally:
        _sf_wipe_buffer(_opmap)
    _consts_sec = _sf_decrypt_section(3)
    try:
        _pos = 0
        _count, _pos = _sf_varint(_consts_sec, _pos)
        _sf_consts = []
        for _ in range(_count):
            _value, _pos = _sf_unpack_const(_consts_sec, _pos)
            _sf_consts.append(_value)
    finally:
        _sf_wipe_buffer(_consts_sec)
    _names_sec = _sf_decrypt_section(4)
    try:
        _pos = 0
        _count, _pos = _sf_varint(_names_sec, _pos)
        _sf_names = []
        for _ in range(_count):
            _size, _pos = _sf_varint(_names_sec, _pos)
            _sf_names.append(bytes(_names_sec[_pos:_pos + _size]).decode('utf-8'))
            _pos += _size
    finally:
        _sf_wipe_buffer(_names_sec)
    _funcs_sec = _sf_decrypt_section(5)
    try:
        _pos = 0
        _count, _pos = _sf_varint(_funcs_sec, _pos)
        _sf_funcs = {}
        for _ in range(_count):
            _ni, _pos = _sf_varint(_funcs_sec, _pos)
            _sid, _pos = _sf_varint(_funcs_sec, _pos)
            _argc, _pos = _sf_varint(_funcs_sec, _pos)
            _fargs = []
            for __ in range(_argc):
                _ai, _pos = _sf_varint(_funcs_sec, _pos)
                _fargs.append(_sf_names[_ai])
            _dc, _pos = _sf_varint(_funcs_sec, _pos)
            _defaults = []
            for __ in range(_dc):
                _dv, _pos = _sf_unpack_const(_funcs_sec, _pos)
                _defaults.append(_dv)
            _ic, _pos = _sf_varint(_funcs_sec, _pos)
            _instructions = []
            for _in in range(_ic):
                _mapped = _funcs_sec[_pos]
                _pos += 1
                _i_argc, _pos = _sf_varint(_funcs_sec, _pos)
                _i_args = []
                for _ia in range(_i_argc):
                    _val, _pos = _sf_varint(_funcs_sec, _pos)
                    _i_args.append(_val)
                if _mapped in _sf_fake_ops:
                    continue
                _canon = _sf_op_reverse.get(_mapped, _mapped)
                _instructions.append((_canon, _i_args))
            _sf_funcs[_sf_names[_ni]] = {'sid': _sid, 'args': _fargs, 'defaults': _defaults, 'instructions': _instructions}
    finally:
        _sf_wipe_buffer(_funcs_sec)
    _sf_program = {'__name__': __name__, '__file__': globals().get('__file__', ''), '__package__': globals().get('__package__', None), '__builtins__': __builtins__, '__doc__': None, '__consts__': _sf_consts, '__names__': _sf_names, '__op_reverse__': _sf_op_reverse, '__fake_ops__': _sf_fake_ops, '__sections__': _sf_sections, '__master_key__': _sf_master, '__module_sid__': _sf_module_sid, '__vm_funcs__': _sf_funcs}
    if _sf_select_vm_lane(_sf_master):
        ShadowTrapVM(_sf_program).run_module()
    else:
        ShadowVM(_sf_program).run_module()
except KeyboardInterrupt:
    exit()
except Exception as _sf_exc:
    import traceback as _sf_tb
    _sf_tb.print_exc()
    exit(1)