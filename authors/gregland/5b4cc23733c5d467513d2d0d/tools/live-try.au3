Opt("WinTitleMatchMode", 2)
Local $pw = "9456145"
If $CmdLine[0] >= 1 Then $pw = $CmdLine[1]
Local $out = @ScriptDir & "\try-result.txt"
FileDelete($out)
If Not WinWait("CrackMe by Gregland", "", 10) Then
  FileWrite($out, "no win" & @CRLF)
  Exit 1
EndIf
Local $h = WinGetHandle("CrackMe by Gregland")
WinActivate($h)
Sleep(150)
ControlSetText($h, "", "[CLASS:TVDSEdit; INSTANCE:1]", $pw)
Sleep(50)
ControlClick($h, "", "[CLASS:TVDSButton; INSTANCE:1]")
Sleep(600)
Local $found = ""
Local $a = WinList()
For $i = 1 To $a[0][0]
  Local $t = WinGetText($a[$i][1])
  If StringInStr($t, "Password") Then $found = $a[$i][0] & "|" & StringReplace($t, @CRLF, "/")
Next
FileWrite($out, $pw & " => " & $found & @CRLF)
If StringInStr($found, "Password OK") And Not StringInStr($found, "NOK") Then Exit 0
Exit 2
