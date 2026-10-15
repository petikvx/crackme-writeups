import angr, logging
logging.getLogger('angr').setLevel(logging.ERROR)

proj = angr.Project("original/sumhex.exe", auto_load_libs=False)
print("base", hex(proj.loader.main_object.mapped_base))

VERIFY = 0x44A76C
MAXLEN = 16

state = proj.factory.blank_state(addr=VERIFY)
sol = state.solver

pw_bytes = [sol.BVS(f"pw_{i}", 8) for i in range(MAXLEN)]
PW_ADDR = 0x20000000
OUT_ADDR = 0x20001000
for i, b in enumerate(pw_bytes):
    state.memory.store(PW_ADDR + i, b)

for b in pw_bytes:
    sol.add(b >= 0x20)
    sol.add(b <= 0x7e)

state.regs.rcx = PW_ADDR
state.regs.rdx = MAXLEN
state.regs.r8 = OUT_ADDR
state.regs.r9 = 0x100
RET_SENTINEL = 0x1337000
state.memory.store(state.regs.rsp, RET_SENTINEL, size=8, endness=proj.arch.memory_endness)

simgr = proj.factory.simgr(state)
found = None
steps = 0
while simgr.active and steps < 6000:
    simgr.step()
    steps += 1
    for s in simgr.active:
        if s.addr == RET_SENTINEL:
            found = s
            break
    if found:
        break
    if steps % 200 == 0:
        print("steps", steps, "active", len(simgr.active), [hex(s.addr) for s in simgr.active[:3]])

print("steps total", steps)
if not found:
    print("NOT FOUND, active states:", len(simgr.active))
    for s in simgr.active[:10]:
        print(hex(s.addr))
    print("deadended:", len(simgr.deadended))
    print("errored:", len(simgr.errored))
    for e in simgr.errored[:5]:
        print(e)
else:
    raxv = found.solver.eval(found.regs.rax)
    print("reached sentinel, RAX =", hex(raxv))
    if found.solver.satisfiable(extra_constraints=[found.regs.rax != 0]):
        found.solver.add(found.regs.rax != 0)
        vals = [found.solver.eval(b) for b in pw_bytes]
        print("password bytes:", vals)
        print("password:", bytes(vals))
    else:
        print("rax != 0 unsatisfiable on this path")
