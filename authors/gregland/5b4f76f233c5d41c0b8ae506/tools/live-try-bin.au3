Opt("WinTitleMatchMode", 2)
; password bytes BB E6 E2 BE 99 91 A1 9B D2
Local $pw = Chr(0xBB) & Chr(0xE6) & Chr(0xE2) & Chr(0xBE) & Chr(0x99) & Chr(0x91) & Chr(0xA1) & Chr(0x9B) & Chr(0xD2)
Local $out = @ScriptDir & "\try-result.txt"
FileDelete($out)
If Not WinWait("CrackMe 3", "", 12) Then
  FileWrite($out, "no win" & @CRLF)
  Exit 1
EndIf
Local $h = WinGetHandle("CrackMe 3")
WinActivate($h)
Sleep(300)
ControlSetText($h, "", "[CLASS:TVDSEdit; INSTANCE:1]", $pw)
Sleep(150)
ControlClick($h, "", "[TEXT:OK]")
Sleep(1000)
Local $a = WinList()
For $i = 1 To $a[0][0]
  Local $t = WinGetText($a[$i][1])
  If StringInStr($t, "Password") Then
    FileWrite($out, "binpw => [" & $a[$i][0] & "] " & StringReplace($t,@CRLF,"/") & @CRLF)
  EndIf
Next
FileWrite($out, "edithex=")
; dump edit as approx
FileWrite($out, ControlGetText($h, "", "[CLASS:TVDSEdit; INSTANCE:1]") & @CRLF)
