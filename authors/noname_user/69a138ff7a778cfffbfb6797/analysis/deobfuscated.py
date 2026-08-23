# Reconstruit depuis marshal (fichier "<Ω>") après b85 + XOR clé + zlib.
import time
import colorsys
import sys
import os


def main():
    os.system("")
    text = "hello"
    hue = 0.0
    print("Press Ctrl + C to stop...\n")
    try:
        while True:
            r, g, b = colorsys.hsv_to_rgb(hue, 1.0, 1.0)
            r, g, b = int(r * 255), int(g * 255), int(b * 255)
            color = f"\x1b[38;2;{r};{g};{b}m"
            sys.stdout.write(f"\r{color}{text}\x1b[0m")
            sys.stdout.flush()
            hue += 0.01
            if hue > 1.0:
                hue = 0.0
            time.sleep(0.03)
    except KeyboardInterrupt:
        print("\n\nThe program has been stopped.....")


if __name__ == "__main__":
    main()
