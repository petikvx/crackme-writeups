import sys, json, time; sys.path.insert(0, sys.argv[2])
from hij import *
h = Hij(sys.argv[1]); g = h.g
g.press(0, 0.6)                      # échauffement (init de la VM)
g.key(0x52, 'r')                     # reset -> plateau initial
cell = int(sys.argv[3]); maxops = int(sys.argv[4])
h.wrb(h.D, SPIN); h.wrb(h.RET, SPIN)
e = REC(); e.type = 2; e.e.m.pos = COORD(9 + 2 * (cell % 8), 32 + cell // 8); e.e.m.btn = 1; g.send([e])
e2 = REC(); e2.type = 2; e2.e.m.pos = COORD(9 + 2 * (cell % 8), 32 + cell // 8); e2.e.m.btn = 0; g.send([e2])
log = []; state = 'D'; t0 = time.time(); ops = 0
while time.time() - t0 < 30 and ops < maxops:
    k.SuspendThread(h.th); c = Ctx(); c.get(h.th); rip = c.q(0xF8)
    if rip == h.RET:
        k.ResumeThread(h.th); log.append(('RET', c.q(0x78), c.q(0xD0))); break
    want = h.D if state == 'D' else h.R
    if rip != want:
        k.ResumeThread(h.th); time.sleep(0.0003); continue
    regs = {n: c.q(o_) for n, o_ in REGS.items()}
    log.append((state, regs, h.rdb(regs['r12'], 0x130).hex()))
    if state == 'D': h.wrb(h.D, h.orig[h.D]); h.wrb(h.R, SPIN); state = 'R'; ops += 1
    else: h.wrb(h.R, h.orig[h.R]); h.wrb(h.D, SPIN); state = 'D'
    k.ResumeThread(h.th)
for ad in (h.D, h.R, h.RET): h.wrb(ad, h.orig[ad])
print('events', len(log), 'last', log[-1][0], [hex(x) for x in log[-1][1:3]] if log[-1][0] == 'RET' else '')
json.dump(log, open(sys.argv[2] + '/realtrace_nohij.json', 'w'), default=str)
time.sleep(0.5); print('board', hex(g.rd(h.A)), 'expected d7f8aed832c7c2e0 for A1')
h.close()
