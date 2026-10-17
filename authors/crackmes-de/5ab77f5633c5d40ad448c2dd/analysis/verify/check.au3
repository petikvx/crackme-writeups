Global $name = "petik"
$length = StringLen($name)
If $length < 10 Then
	For $i = $length to 9
		$name = $name & "q"
	Next
EndIf
$number = OrderRegister($name, $name & "orcs236")
$check = RegisterGenerate($name, $name & "orcs236", $number)
FileWrite(@ScriptDir & "\out.txt", @UserName & "|" & @ComputerName & "|" & $number & "|" & $check)
Func OrderRegister($RegName, $RegMail)
	If $RegName = "" Or $RegMail = "" Then
		SetError(1)
		Return(0)
	EndIf
	Return(RegGetCode(0, $RegName, $RegMail))
EndFunc

Func RegisterGenerate($RegName, $RegMail, $RegNumber)
	If $RegName = "" Or $RegMail = "" Or $RegNumber = "" Then
		SetError(1)
		Return(0)
	EndIf
	Return(RegGetCode(1, $RegName, $RegMail, $RegNumber))
EndFunc

Func Stretch($Macro, $Mode, $Size = 5)
	If $Macro = "" Then Return(0)
	$Macro = _StringEncrypt(1, $Macro, $Mode, 1)
	Local $Length = StringLen($Macro)
	Local $Temp = $Macro
	If $Length > $Size Then
		$Array = StringSplit($Macro, "")
		Do
			$Temp = ""
			For $i = 1 To $Array[0]-1 Step 1
				$Temp = $Temp & Mod(($Array[$i] + $Array[$i+1]), 10)
			Next
			$Length = StringLen($Temp)
			$Array = StringSplit($Temp, "")
		Until $Length = $Size
	Else
		If $Length < $Size Then
			$Temp = $Macro
			Do
				$Temp = $Temp * 2
				$Length = StringLen($Temp)
			Until $Length = $Size
		EndIf
	EndIf
	Return $Temp
EndFunc

Func RegGetCode($Mode, $Name, $Email, $Number = 0)
	If $Name = "" Or $Email = "" Then
		Return(0)
	EndIf
	If $Mode = 1 Then
		$Temp = StringReplace($Number, "-", "")
		$Temp = Stretch($Temp, 1, 10)
		$Temp = StringLeft($Temp, 5) & "-" & StringTrimLeft($Temp, 5)
		Return(Stretch($Name, 1) & "-" & Stretch($Email, 1) & "-" & $Temp)
	Else
		$Temp = Stretch(@UserName & @ComputerName, 0, 20)
		Return(StringLeft($Temp, 5) & "-" & StringMid($Temp, 6, 5) & "-" & StringMid($Temp, 11, 5) & "-" & StringRight($Temp, 5))
	EndIf
EndFunc


Func _StringEncrypt($i_Encrypt, $s_EncryptText, $Mode, $i_EncryptLevel = 1)
	If $Mode = 1 Then
		$s_EncryptPassword = "In"
	Else
		$s_EncryptPassword = "Out"
	EndIf
	If $i_Encrypt <> 0 And $i_Encrypt <> 1 Then
		SetError(1)
		Return ''
	ElseIf $s_EncryptText = '' Or $s_EncryptPassword = '' Then
		SetError(1)
		Return ''
	Else
		If Number($i_EncryptLevel) <= 0 Or Int($i_EncryptLevel) <> $i_EncryptLevel Then $i_EncryptLevel = 1
		Local $v_EncryptModified
		Local $i_EncryptCountH
		Local $i_EncryptCountG
		Local $v_EncryptSwap
		Local $av_EncryptBox[256][2]
		Local $i_EncryptCountA
		Local $i_EncryptCountB
		Local $i_EncryptCountC
		Local $i_EncryptCountD
		Local $i_EncryptCountE
		Local $v_EncryptCipher
		Local $v_EncryptCipherBy
		If $i_Encrypt = 1 Then
			For $i_EncryptCountF = 0 To $i_EncryptLevel Step 1
				$i_EncryptCountG = ''
				$i_EncryptCountH = ''
				$v_EncryptModified = ''
				For $i_EncryptCountG = 1 To StringLen($s_EncryptText)
					If $i_EncryptCountH = StringLen($s_EncryptPassword) Then
						$i_EncryptCountH = 1
					Else
						$i_EncryptCountH = $i_EncryptCountH + 1
					EndIf
					$v_EncryptModified = $v_EncryptModified & Chr(BitXOR(Asc(StringMid($s_EncryptText, $i_EncryptCountG, 1)), Asc(StringMid($s_EncryptPassword, $i_EncryptCountH, 1)), 255))
				Next
				$s_EncryptText = $v_EncryptModified
				$i_EncryptCountA = ''
				$i_EncryptCountB = 0
				$i_EncryptCountC = ''
				$i_EncryptCountD = ''
				$i_EncryptCountE = ''
				$v_EncryptCipherBy = ''
				$v_EncryptCipher = ''
				$v_EncryptSwap = ''
				$av_EncryptBox = ''
				Local $av_EncryptBox[256][2]
				For $i_EncryptCountA = 0 To 255
					$av_EncryptBox[$i_EncryptCountA][1] = Asc(StringMid($s_EncryptPassword, Mod($i_EncryptCountA, StringLen($s_EncryptPassword)) + 1, 1))
					$av_EncryptBox[$i_EncryptCountA][0] = $i_EncryptCountA
				Next
				For $i_EncryptCountA = 0 To 255
					$i_EncryptCountB = Mod(($i_EncryptCountB + $av_EncryptBox[$i_EncryptCountA][0] + $av_EncryptBox[$i_EncryptCountA][1]), 256)
					$v_EncryptSwap = $av_EncryptBox[$i_EncryptCountA][0]
					$av_EncryptBox[$i_EncryptCountA][0] = $av_EncryptBox[$i_EncryptCountB][0]
					$av_EncryptBox[$i_EncryptCountB][0] = $v_EncryptSwap
				Next
				For $i_EncryptCountA = 1 To StringLen($s_EncryptText)
					$i_EncryptCountC = Mod(($i_EncryptCountC + 1), 256)
					$i_EncryptCountD = Mod(($i_EncryptCountD + $av_EncryptBox[$i_EncryptCountC][0]), 256)
					$i_EncryptCountE = $av_EncryptBox[Mod(($av_EncryptBox[$i_EncryptCountC][0] + $av_EncryptBox[$i_EncryptCountD][0]), 256) ][0]
					$v_EncryptCipherBy = BitXOR(Asc(StringMid($s_EncryptText, $i_EncryptCountA, 1)), $i_EncryptCountE)
					$v_EncryptCipher = $v_EncryptCipher & Hex($v_EncryptCipherBy, 2)
				Next
				$s_EncryptText = $v_EncryptCipher
			Next
		Else
			For $i_EncryptCountF = 0 To $i_EncryptLevel Step 1
				$i_EncryptCountB = 0
				$i_EncryptCountC = ''
				$i_EncryptCountD = ''
				$i_EncryptCountE = ''
				$v_EncryptCipherBy = ''
				$v_EncryptCipher = ''
				$v_EncryptSwap = ''
				$av_EncryptBox = ''
				Local $av_EncryptBox[256][2]
				For $i_EncryptCountA = 0 To 255
					$av_EncryptBox[$i_EncryptCountA][1] = Asc(StringMid($s_EncryptPassword, Mod($i_EncryptCountA, StringLen($s_EncryptPassword)) + 1, 1))
					$av_EncryptBox[$i_EncryptCountA][0] = $i_EncryptCountA
				Next
				For $i_EncryptCountA = 0 To 255
					$i_EncryptCountB = Mod(($i_EncryptCountB + $av_EncryptBox[$i_EncryptCountA][0] + $av_EncryptBox[$i_EncryptCountA][1]), 256)
					$v_EncryptSwap = $av_EncryptBox[$i_EncryptCountA][0]
					$av_EncryptBox[$i_EncryptCountA][0] = $av_EncryptBox[$i_EncryptCountB][0]
					$av_EncryptBox[$i_EncryptCountB][0] = $v_EncryptSwap
				Next
				For $i_EncryptCountA = 1 To StringLen($s_EncryptText) Step 2
					$i_EncryptCountC = Mod(($i_EncryptCountC + 1), 256)
					$i_EncryptCountD = Mod(($i_EncryptCountD + $av_EncryptBox[$i_EncryptCountC][0]), 256)
					$i_EncryptCountE = $av_EncryptBox[Mod(($av_EncryptBox[$i_EncryptCountC][0] + $av_EncryptBox[$i_EncryptCountD][0]), 256) ][0]
					$v_EncryptCipherBy = BitXOR(Dec(StringMid($s_EncryptText, $i_EncryptCountA, 2)), $i_EncryptCountE)
					$v_EncryptCipher = $v_EncryptCipher & Chr($v_EncryptCipherBy)
				Next
				$s_EncryptText = $v_EncryptCipher
				$i_EncryptCountG = ''
				$i_EncryptCountH = ''
				$v_EncryptModified = ''
				For $i_EncryptCountG = 1 To StringLen($s_EncryptText)
					If $i_EncryptCountH = StringLen($s_EncryptPassword) Then
						$i_EncryptCountH = 1
					Else
						$i_EncryptCountH = $i_EncryptCountH + 1
					EndIf
					$v_EncryptModified = $v_EncryptModified & Chr(BitXOR(Asc(StringMid($s_EncryptText, $i_EncryptCountG, 1)), Asc(StringMid($s_EncryptPassword, $i_EncryptCountH, 1)), 255))
				Next
				$s_EncryptText = $v_EncryptModified
			Next
		EndIf
		Return $s_EncryptText
	EndIf
EndFunc

; ----------------------------------------------------------------------------
