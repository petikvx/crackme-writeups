; Live check — Wine + AutoIt3.exe against original/crackme.exe
;   DISPLAY=:0 wine original/crackme.exe &
;   wine AutoIt3.exe tools/live-check.au3 [serial]
; Default serial = keygen(petik) = k`odf

Opt("WinTitleMatchMode", 2)

Local $serial = "k`odf"
If $CmdLine[0] >= 1 Then $serial = $CmdLine[1]

Local $out = @ScriptDir & "\live-check-result.txt"
FileDelete($out)
FileWrite($out, "start user=" & @UserName & " serial=" & $serial & @CRLF)

If Not WinWait("Simple Crackme by hacktooth", "", 20) Then
	FileWrite($out, "FAIL: window not found" & @CRLF)
	Exit 1
EndIf

FileWrite($out, "window found" & @CRLF)
Local $h = WinGetHandle("Simple Crackme by hacktooth")
WinActivate($h)
Sleep(300)
ControlFocus($h, "", "[CLASS:Edit; INSTANCE:1]")
ControlSetText($h, "", "[CLASS:Edit; INSTANCE:1]", $serial)
Sleep(200)
FileWrite($out, "edit=" & ControlGetText($h, "", "[CLASS:Edit; INSTANCE:1]") & @CRLF)
ControlClick($h, "", "[CLASS:Button; INSTANCE:1]")
Sleep(500)

If WinExists("OK") Then
	FileWrite($out, "OK" & @CRLF & WinGetText("OK") & @CRLF)
	ControlClick("OK", "", "Button1")
	Sleep(200)
	WinClose($h)
	Exit 0
EndIf

If WinExists("Error") Then
	FileWrite($out, "ERROR" & @CRLF & WinGetText("Error") & @CRLF)
	ControlClick("Error", "", "Button1")
	Sleep(200)
	WinClose($h)
	Exit 2
EndIf

FileWrite($out, "FAIL: no MsgBox" & @CRLF)
WinClose($h)
Exit 3
