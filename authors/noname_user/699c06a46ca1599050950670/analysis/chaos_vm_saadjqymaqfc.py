# Thread daemon décodé depuis qxkejcfffako (base64) dans layer1.
# Dérive key_container[0] = sha256(str(acc)) via Chaos VM + fingerprint HWID.


def saadjqymaqfc(key_container, target_fp):
    import os, sys, time, uuid, hashlib, subprocess

    def chaos(val):
        for _ in range(50):
            val = 3.99 * val * (1.0 - val)
        return val

    def run(ops):
        acc = 0.5
        idx = 0
        state = ops[idx] if len(ops) > 0 else -1
        while state != -1:
            if state == 357:
                acc = 0.123456789
                idx = (idx ^ 1) + ((idx & 1) << 1)
                state = ops[idx] if idx < len(ops) else -1
            elif state == 70:
                mac_hex = hex(uuid.getnode())[2:].zfill(12)
                is_vm = any(
                    mac_hex.startswith(vm)
                    for vm in ["080027", "000569", "000c29", "001c14", "005056"]
                )
                if os.path.exists("/data/data/com.termux/files/usr"):
                    acc += 0.222222
                elif sys.platform == "win32":
                    try:
                        h = (
                            subprocess.check_output(
                                "wmic diskdrive get serialnumber", shell=True
                            )
                            .decode()
                            .split()[-1]
                            .strip()
                        )
                        b = (
                            subprocess.check_output(
                                "wmic bios get serialnumber", shell=True
                            )
                            .decode()
                            .split()[-1]
                            .strip()
                        )
                        c = (
                            subprocess.check_output(
                                "wmic cpu get processorid", shell=True
                            )
                            .decode()
                            .split()[-1]
                            .strip()
                        )
                        curr = hashlib.sha256(
                            f"{h}::{b}::{c}::{uuid.getnode()}".encode()
                        ).hexdigest()
                    except Exception:
                        curr = "ERR"
                    if curr == target_fp and not is_vm:
                        acc += 0.222222
                    else:
                        acc += 0.555555
                else:
                    acc += 0.777
                idx = (idx ^ 1) + ((idx & 1) << 1)
                state = ops[idx] if idx < len(ops) else -1
            elif state == 480:
                b_val = b"burn"
                for _ in range(500000):
                    b_val = hashlib.md5(b_val).digest()
                acc += b_val[0] / 255000000.0
                idx = (idx ^ 1) + ((idx & 1) << 1)
                state = ops[idx] if idx < len(ops) else -1
            elif state == 274:
                acc = chaos(acc)
                idx = (idx ^ 1) + ((idx & 1) << 1)
                state = ops[idx] if idx < len(ops) else -1
            elif state == 11:
                key_container[0] = int(
                    hashlib.sha256(str(acc).encode()).hexdigest(), 16
                )
                state = -1
            else:
                state = -1

    while True:
        try:
            run([357, 70, 480, 274, 11])
            time.sleep(2.0)
        except Exception:
            pass


# Fingerprint auteur (WMI disk::bios::cpu::uuid.getnode) :
TARGET_FP = "90178d2d1e81e3cc1373ae36327277909ea0a904108c26fb80fec88755553bbd"
# Branche succès → master key :
MASTER_KEY = 64322080736143896125652295414509504119508758357723799657495947910577489034260
