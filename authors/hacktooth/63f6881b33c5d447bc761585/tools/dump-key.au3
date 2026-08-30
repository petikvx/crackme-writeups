; Dump expected serial for @UserName (same predicate as crackme).
Local $sUser = @UserName
Local $i, $key
Local $aAsc = StringToASCIIArray($sUser)
Local $iLen = StringLen($sUser)
Local $iDec[$iLen]
Do
	$iDec[$i] = $aAsc[$i] - $iLen
	If $iDec[$i] = 95 Then
		$iDec[$i] += 7
	EndIf
	$i += 1
Until $i = $iLen
For $vElement In $iDec
	$key &= Chr($vElement)
Next
Local $out = @ScriptDir & "\dump-key-result.txt"
FileDelete($out)
FileWrite($out, "user=" & $sUser & @CRLF & "key=" & $key & @CRLF)
ConsoleWrite("user=" & $sUser & " key=" & $key & @CRLF)
