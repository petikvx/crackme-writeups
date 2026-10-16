Private Function crypt( nm )
        cod = ""
        i = 65
        key = Len(nm) * 20
        key = key & (((key * 9) + 10) Mod Len(nm) + 20) + 20
        Do While i = 90
                cod = cod & Chr(i * 2 - i)
                i = i + i
        Loop
        crypt = cod & key & Chr(Len(nm) * 20)
End Function
WScript.Echo crypt("petik")
WScript.Echo crypt("abc")
WScript.Echo crypt("abcdef")
