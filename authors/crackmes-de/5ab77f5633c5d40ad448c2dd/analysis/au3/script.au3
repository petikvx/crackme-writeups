; <AUT2EXE VERSION: 3.2.0.0>

; ----------------------------------------------------------------------------
; <AUT2EXE INCLUDE-START: C:\Program Files\AutoIt3\Aut2Exe\Loader.au3>
; ----------------------------------------------------------------------------

#NoTrayIcon
$Call = DllCall("Kernel32.dll", "int", "IsDebuggerPresent")
If $call[0] <> 1 Then
	FileInstall("crackme.exe", @TempDir & "\orks236ownsjoo.exe", 1)
	Run(@TempDir & "\orks236ownsjoo.exe")
Else
	Exit
EndIf

; ----------------------------------------------------------------------------
; <AUT2EXE INCLUDE-END: C:\Program Files\AutoIt3\Aut2Exe\Loader.au3>
; ----------------------------------------------------------------------------

