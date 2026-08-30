Global $SUSER = @UserName
Global $I , $KEY
Global $AASC = StringToASCIIArray ( $SUSER )
Global $ILEN = StringLen ( $SUSER )
Global $IDEC [ $ILEN ]
Do
	$IDEC [ $I ] = $AASC [ $I ] - $ILEN
	If $IDEC [ $I ] = 95 Then
		$IDEC [ $I ] += 7
	EndIf
	$I += 1
Until $I = $ILEN
For $VELEMENT In $IDEC
	$KEY &= Chr ( $VELEMENT )
Next
ConsoleWrite ( $KEY )
#Region ### START Koda GUI section ### Form=
$FORM1 = GUICreate ( "Simple Crackme by hacktooth" , 378 , 185 , 254 , 182 )
$LABEL1 = GUICtrlCreateLabel ( "Simple Crackme by hacktooth" , 56 , 8 , 253 , 28 )
GUICtrlSetFont ( + 4294967295 , 14 , 400 , 0 , "MS Sans Serif" )
$SERIAL = GUICtrlCreateInput ( "Enter your Serial Code here!" , 56 , 48 , 257 , 21 )
$CHECK = GUICtrlCreateButton ( "Check" , 56 , 80 , 257 , 33 )
$LABREG = GUICtrlCreateLabel ( "Not Registered..." , 56 , 128 , 200 , 17 )
$INFOLAB = GUICtrlCreateLabel ( "" , 56 , 152 , 200 , 17 )
GUISetState ( @SW_SHOW )
#EndRegion ### END Koda GUI section ###
While 1
	$NMSG = GUIGetMsg ( )
	Switch $NMSG
	Case $GUI_EVENT_CLOSE
		Exit
	Case $CHECK
		If GUICtrlRead ( $SERIAL ) <> $KEY Then
			$I = 1
			MsgBox ( "" , "Error" , "Wrong serial! Retry" )
		Else
			MsgBox ( "" , "OK" , "Correct serial!" )
		EndIf
	EndSwitch
WEnd
