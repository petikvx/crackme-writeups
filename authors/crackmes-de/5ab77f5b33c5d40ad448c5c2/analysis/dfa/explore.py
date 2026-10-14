import subprocess, os, signal, time, re, sys, json
BIN = os.path.join(os.path.dirname(os.path.abspath(__file__)), "instr")

def run(serial: str):
    p = subprocess.Popen([BIN], stdin=subprocess.PIPE, stdout=subprocess.DEVNULL, stderr=subprocess.PIPE,
                         start_new_session=True)
    p.stdin.write(f"petik\n{serial}\n".encode()); p.stdin.flush()
    time.sleep(0.25)
    try: os.killpg(p.pid, signal.SIGKILL)
    except ProcessLookupError: pass
    err = p.stderr.read().decode()
    return [tuple(map(int, m)) for m in re.findall(r"S(\d+):(\d+)", err)]

def state_after(prefix):
    """processus qui lit le jeton au rang len(prefix) (= état après prefix)"""
    logs = run(prefix + "x")
    d = {c: s for s, c in logs}
    return d.get(len(prefix))

# BFS : état -> préfixe ; delta[(état, car)]
start = state_after("")
rep = {start: ""}
delta = {}
todo = [start]
while todo:
    s = todo.pop(0)
    for ch in "abc":
        t = state_after(rep[s] + ch)
        delta[(s, ch)] = t
        if t is not None and t not in rep:
            rep[t] = rep[s] + ch
            todo.append(t)
print(json.dumps({"start": start, "delta": {f"{k[0]}{k[1]}": v for k, v in delta.items()}, "rep": rep}, indent=1))
