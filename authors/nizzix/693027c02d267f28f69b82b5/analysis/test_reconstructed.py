# C:\Users\Xylera\Desktop\pyc\test.py — extrait via hook marshal.loads


def exitos():
    x = input
    try:
        pwd = x("Enter a password: ")
    except KeyboardInterrupt:
        print("\nKeyboard interrupt detected, exiting.")
        return
    if pwd == "OsBuiltinsPass":
        print("Access granted")
        return
    print("Access denied")
    exitos()


exitos()
