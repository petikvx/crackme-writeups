# Reconstruit depuis le marshal déchiffré (fichier "<crypto>").
# Texte affiché en RGB : "noname"
import sys
import os
import time
import math

sys.settrace(lambda *a: None)
sys.setprofile(lambda *a: None)
_bad_proxies = ["http_proxy", "https_proxy", "all_proxy", "HTTP_PROXY", "HTTPS_PROXY"]
for _p in _bad_proxies:
    if _p in os.environ:
        del os.environ[_p]

os.system("")


def smooth_rgb_normal_text():
    text = "noname"
    spacing = 1
    speed = 0.1
    wave_width = 0.5
    sys.stdout.write("\x1b[?25l")
    t = 0.0
    try:
        while True:
            output = ""
            for i, char in enumerate(text):
                freq = t + i * wave_width
                r = int(math.sin(freq) * 127 + 128)
                g = int(math.sin(freq + 2) * 127 + 128)
                b = int(math.sin(freq + 4) * 127 + 128)
                output += f"\x1b[38;2;{r};{g};{b}m{char}"
                output += " " * int(spacing)
            sys.stdout.write(f"\r{output}\x1b[0m   ")
            sys.stdout.flush()
            t += speed
            time.sleep(0.016)
    except KeyboardInterrupt:
        sys.stdout.write("\n\x1b[?25h")


if __name__ == "__main__":
    os.system("cls" if os.name == "nt" else "clear")
    smooth_rgb_normal_text()
