# reconstruit depuis PYTHONSCRIPT (py2exe / Python 2.6)

def inputSerial():
    s = raw_input("Serial: ")
    expected = "".join(map(lambda x: chr(x ^ 0x90), [0xe1, 0xf5, 0xf1, 0xe6, 0xd7, 0xa1, 0xca, 0xc8]))
    if s == expected:
        print "Good!"
    else:
        print "Bad..."

def main():
    try:
        inputSerial()
    except:
        print "Error"
        raise SystemExit
    pause()

def pause():
    raw_input("Press the Enter key to exit...")

if __name__ == "__main__":
    main()
# serial = 'qeavG1ZX'
