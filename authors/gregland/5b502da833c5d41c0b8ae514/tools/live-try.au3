Opt("WinTitleMatchMode", 2)
Local $nom = "petik"
Local $mail = "petik@x.test"
Local $serial = "D532-7E11-D9A2-D2AF"
If $CmdLine[0] >= 1 Then $nom = $CmdLine[1]
If $CmdLine[0] >= 2 Then $mail = $CmdLine[2]
If $CmdLine[0] >= 3 Then $serial = $CmdLine[3]

Local $out = @ScriptDir & "\try-result.txt"
FileDelete($out)

If Not WinWait("CrackMe 4", "", 15) Then
  FileWrite($out, "no win" & @CRLF)
  Exit 1
EndIf
Local $h = WinGetHandle("CrackMe 4")
WinActivate($h)
WinWaitActive($h, "", 5)
Sleep(400)

FileWrite($out, "title=" & WinGetTitle($h) & @CRLF)
FileWrite($out, "classlist=" & StringReplace(WinGetClassList($h), @LF, "|") & @CRLF)

; Focus + select-all + type (more reliable than ControlSetText for some VDS builds)
Local $fields[3] = [$nom, $mail, $serial]
For $i = 1 To 3
  ControlFocus($h, "", "[CLASS:TVDSEdit; INSTANCE:" & $i & "]")
  Sleep(80)
  ControlSend($h, "", "[CLASS:TVDSEdit; INSTANCE:" & $i & "]", "^a")
  Sleep(40)
  ControlSend($h, "", "[CLASS:TVDSEdit; INSTANCE:" & $i & "]", $fields[$i - 1], 1)
  Sleep(80)
  ; fallback
  If ControlGetText($h, "", "[CLASS:TVDSEdit; INSTANCE:" & $i & "]") <> $fields[$i - 1] Then
    ControlSetText($h, "", "[CLASS:TVDSEdit; INSTANCE:" & $i & "]", $fields[$i - 1])
  EndIf
Next
Sleep(300)

For $i = 1 To 3
  FileWrite($out, "edit" & $i & "=[" & ControlGetText($h, "", "[CLASS:TVDSEdit; INSTANCE:" & $i & "]") & "]" & @CRLF)
Next

ControlFocus($h, "", "[TEXT:ok]")
Local $clicked = ControlClick($h, "", "[TEXT:ok]")
If $clicked = 0 Then $clicked = ControlClick($h, "", "[CLASS:TVDSButton; INSTANCE:1]")
FileWrite($out, "clicked=" & $clicked & " serial=" & $serial & @CRLF)
Sleep(1200)

Local $a = WinList()
For $i = 1 To $a[0][0]
  Local $t = WinGetText($a[$i][1])
  If StringInStr($t, "REGISTER") Or StringInStr($t, "PROBLEM") Or StringInStr($t, "LICENCE") Or StringInStr($t, "DEBUG") Then
    FileWrite($out, "msg=[" & $a[$i][0] & "] " & StringReplace($t, @CRLF, "/") & @CRLF)
  EndIf
Next
