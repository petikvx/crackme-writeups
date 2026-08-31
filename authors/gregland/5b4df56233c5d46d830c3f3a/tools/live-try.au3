Opt("WinTitleMatchMode", 2)
Local $pw = "SDFG45ERZdqf"
If $CmdLine[0] >= 1 Then $pw = $CmdLine[1]
Local $out = @ScriptDir & "\try-result.txt"
FileDelete($out)
If Not WinWait("CrackMe 2 by Gregland", "", 12) Then
  FileWrite($out, "no win" & @CRLF)
  Exit 1
EndIf
Local $h = WinGetHandle("CrackMe 2 by Gregland")
WinActivate($h)
Sleep(250)
; list controls
FileWrite($out, "classlist=" & StringReplace(WinGetClassList($h), @LF, "|") & @CRLF)
For $i = 1 To 12
  Local $t = ControlGetText($h, "", "[CLASS:TVDSButton; INSTANCE:" & $i & "]")
  FileWrite($out, "btn" & $i & "=[" & $t & "]" & @CRLF)
Next
ControlSetText($h, "", "[CLASS:TVDSEdit; INSTANCE:1]", $pw)
Sleep(100)
; good button is named ok / caption OK 6
ControlClick($h, "", "[TEXT:OK 6]")
Sleep(200)
If Not WinExists("OK") Then
  ; try by instance matching caption
  For $i = 1 To 12
    If ControlGetText($h, "", "[CLASS:TVDSButton; INSTANCE:" & $i & "]") = "OK 6" Then
      ControlClick($h, "", "[CLASS:TVDSButton; INSTANCE:" & $i & "]")
      FileWrite($out, "clicked instance " & $i & @CRLF)
      ExitLoop
    EndIf
  Next
EndIf
Sleep(900)
Local $a = WinList()
For $i = 1 To $a[0][0]
  Local $t = WinGetText($a[$i][1])
  If StringInStr($t, "Password") Then FileWrite($out, $pw & " => [" & $a[$i][0] & "] " & StringReplace($t,@CRLF,"/") & @CRLF)
Next
