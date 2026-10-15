import angr, logging, sys
logging.getLogger('angr').setLevel(logging.CRITICAL)

proj = angr.Project("original/sumhex.exe", auto_load_libs=False)
VERIFY = 0x44A76C
RET_SENTINEL = 0x1337000

def run_len(L, max_steps=4000):
    state = proj.factory.blank_state(addr=VERIFY)
    sol = state.solver
    pw_bytes = [sol.BVS(f"pw_{i}", 8) for i in range(L)]
    PW_ADDR = 0x20000000
    OUT_ADDR = 0x20001000
    for i, b in enumerate(pw_bytes):
        state.memory.store(PW_ADDR + i, b)
    for b in pw_bytes:
        sol.add(b >= 0x20); sol.add(b <= 0x7e)
    state.regs.rcx = PW_ADDR
    state.regs.rdx = L
    state.regs.r8 = OUT_ADDR
    state.regs.r9 = 0x100
    state.memory.store(state.regs.rsp, RET_SENTINEL, size=8, endness=proj.arch.memory_endness)
    simgr = proj.factory.simgr(state)
    forks = 0
    steps = 0
    found = None
    while simgr.active and steps < max_steps:
        nbefore = len(simgr.active)
        simgr.step()
        steps += 1
        if len(simgr.active) > nbefore:
            forks += 1
        for s in simgr.active:
            if s.addr == RET_SENTINEL:
                found = s
        if found:
            break
    symbolic_rax = found.regs.rax.symbolic if found else None
    rax_concrete = found.solver.eval(found.regs.rax) if (found and not symbolic_rax) else None
    sat_nonzero = None
    if found and symbolic_rax:
        sat_nonzero = found.solver.satisfiable(extra_constraints=[found.regs.rax != 0])
    return dict(L=L, steps=steps, forks=forks, found=bool(found),
                symbolic_rax=symbolic_rax, rax_concrete=rax_concrete, sat_nonzero=sat_nonzero,
                state=found, pw_bytes=pw_bytes if found else None)

results = []
for L in range(1, 25):
    r = run_len(L)
    print(L, "steps", r["steps"], "forks", r["forks"], "found", r["found"],
          "sym_rax", r["symbolic_rax"], "rax_conc", r["rax_concrete"], "sat_nz", r["sat_nonzero"])
    sys.stdout.flush()
    results.append(r)
