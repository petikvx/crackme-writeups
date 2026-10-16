'If you can read this, you have decompressed at all my CrackMe, ZOMFG!!!

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

MsgBox "Hi! I'm skjobax and I made it with some problematics methods...." & vbCrlf & "Rules: Write a keygen!!!", 64, "SKJOBAX's WTF Keygen Protected - ROUND #1"
user = InputBox("Enter username!!", "WKP #1")
pass = InputBox("Enter serial!!", "WKP #1")

If pass = crypt( user ) Then
   MsgBox "Congratulations!!!" & vbCrlf & "Now write a keygen!", 48, "WKP #1 - Really nice job!"
Else
   MsgBox "Uhm... It seems this CrackMe is a little hard?", 16, "WKP #1 - No way!"
End If
