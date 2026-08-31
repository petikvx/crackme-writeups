Opt("WinTitleMatchMode", 2)
Local $pw = "cerqsqQSD"
If $CmdLine[0] >= 1 Then $pw = $CmdLine[1]
Local $out = @ScriptDir & "\try-result.txt"
FileDelete($out)
If Not WinWait("CrackMe 3", "", 12) Then
  FileWrite($out, "no win" & @CRLF)
  Exit 1
EndIf
Local $h = WinGetHandle("CrackMe 3")
WinActivate($h)
Sleep(300)
FileWrite($out, "title=" & WinGetTitle($h) & @CRLF)
FileWrite($out, "classlist=" & StringReplace(WinGetClassList($h), @LF, "|") & @CRLF)
ControlSetText($h, "", "[CLASS:TVDSEdit; INSTANCE:1]", $pw)
Sleep(100)
; try OK button
If ControlClick($h, "", "[TEXT:OK]") = 0 Then
  ControlClick($h, "", "[CLASS:TVDSButton; INSTANCE:1]")
EndIf
Sleep(900)
Local $a = WinList()
For $i = 1 To $a[0][0]
  Local $t = WinGetText($a[$i][1])
  If StringInStr($t, "Password") Or StringInStr($t, "debugger") Then
    FileWrite($out, $pw & " => [" & $a[$i][0] & "] " & StringReplace($t,@CRLF,"/") & @CRLF)
  EndIf
Next
; also dump edit text
FileWrite($out, "edit=[" & ControlGetText($h, "", "[CLASS:TVDSEdit; INSTANCE:1]") & "]" & @CRLF)
