#NoTrayIcon
#Region
#AutoIt3Wrapper_Outfile=crackme.exe
#EndRegion
Global Const $OPT_COORDSRELATIVE = 0
Global Const $OPT_COORDSABSOLUTE = 1
Global Const $OPT_COORDSCLIENT = 2
Global Const $OPT_ERRORSILENT = 0
Global Const $OPT_ERRORFATAL = 1
Global Const $OPT_CAPSNOSTORE = 0
Global Const $OPT_CAPSSTORE = 1
Global Const $OPT_MATCHSTART = 1
Global Const $OPT_MATCHANY = 2
Global Const $OPT_MATCHEXACT = 3
Global Const $OPT_MATCHADVANCED = 4
Global Const $CCS_TOP = 1
Global Const $CCS_NOMOVEY = 2
Global Const $CCS_BOTTOM = 3
Global Const $CCS_NORESIZE = 4
Global Const $CCS_NOPARENTALIGN = 8
Global Const $CCS_NOHILITE = 16
Global Const $CCS_ADJUSTABLE = 32
Global Const $CCS_NODIVIDER = 64
Global Const $CCS_VERT = 128
Global Const $CCS_LEFT = 129
Global Const $CCS_NOMOVEX = 130
Global Const $CCS_RIGHT = 131
Global Const $DT_DRIVETYPE = 1
Global Const $DT_SSDSTATUS = 2
Global Const $DT_BUSTYPE = 3
Global Const $PROXY_IE = 0
Global Const $PROXY_NONE = 1
Global Const $PROXY_SPECIFIED = 2
Global Const $OBJID_WINDOW = 0
Global Const $OBJID_TITLEBAR = 4294967294
Global Const $OBJID_SIZEGRIP = 4294967289
Global Const $OBJID_CARET = 4294967288
Global Const $OBJID_CURSOR = 4294967287
Global Const $OBJID_ALERT = 4294967286
Global Const $OBJID_SOUND = 4294967285
Global Const $DLG_CENTERONTOP = 0
Global Const $DLG_NOTITLE = 1
Global Const $DLG_NOTONTOP = 2
Global Const $DLG_TEXTLEFT = 4
Global Const $DLG_TEXTRIGHT = 8
Global Const $DLG_MOVEABLE = 16
Global Const $DLG_TEXTVCENTER = 32
Global Const $MCID_UNKNOWN = + 4294967295
Global Const $MCID_HAND = 0
Global Const $MCID_APPSTARTING = 1
Global Const $MCID_ARROW = 2
Global Const $MCID_CROSS = 3
Global Const $MCID_HELP = 4
Global Const $MCID_IBEAM = 5
Global Const $MCID_ICON = 6
Global Const $MCID_NO = 7
Global Const $MCID_SIZE = 8
Global Const $MCID_SIZEALL = 9
Global Const $MCID_SIZENESW = 10
Global Const $MCID_SIZENS = 11
Global Const $MCID_SIZENWSE = 12
Global Const $MCID_SIZEWE = 13
Global Const $MCID_UPARROW = 14
Global Const $MCID_WAIT = 15
Global Const $MCID_NONE = 16
Global Const $SD_LOGOFF = 0
Global Const $SD_SHUTDOWN = 1
Global Const $SD_REBOOT = 2
Global Const $SD_FORCE = 4
Global Const $SD_POWERDOWN = 8
Global Const $SD_FORCEHUNG = 16
Global Const $SD_STANDBY = 32
Global Const $SD_HIBERNATE = 64
Global Const $STDIN_CHILD = 1
Global Const $STDOUT_CHILD = 2
Global Const $STDERR_CHILD = 4
Global Const $STDERR_MERGED = 8
Global Const $STDIO_INHERIT_PARENT = 16
Global Const $RUN_CREATE_NEW_CONSOLE = 65536
Global Const $UBOUND_DIMENSIONS = 0
Global Const $UBOUND_ROWS = 1
Global Const $UBOUND_COLUMNS = 2
Global Const $MOUSEEVENTF_ABSOLUTE = 32768
Global Const $MOUSEEVENTF_MOVE = 1
Global Const $MOUSEEVENTF_LEFTDOWN = 2
Global Const $MOUSEEVENTF_LEFTUP = 4
Global Const $MOUSEEVENTF_RIGHTDOWN = 8
Global Const $MOUSEEVENTF_RIGHTUP = 16
Global Const $MOUSEEVENTF_MIDDLEDOWN = 32
Global Const $MOUSEEVENTF_MIDDLEUP = 64
Global Const $MOUSEEVENTF_WHEEL = 2048
Global Const $MOUSEEVENTF_XDOWN = 128
Global Const $MOUSEEVENTF_XUP = 256
Global Const $REG_NONE = 0
Global Const $REG_SZ = 1
Global Const $REG_EXPAND_SZ = 2
Global Const $REG_BINARY = 3
Global Const $REG_DWORD = 4
Global Const $REG_DWORD_LITTLE_ENDIAN = 4
Global Const $REG_DWORD_BIG_ENDIAN = 5
Global Const $REG_LINK = 6
Global Const $REG_MULTI_SZ = 7
Global Const $REG_RESOURCE_LIST = 8
Global Const $REG_FULL_RESOURCE_DESCRIPTOR = 9
Global Const $REG_RESOURCE_REQUIREMENTS_LIST = 10
Global Const $REG_QWORD = 11
Global Const $REG_QWORD_LITTLE_ENDIAN = 11
Global Const $HWND_BOTTOM = 1
Global Const $HWND_NOTOPMOST = + 4294967294
Global Const $HWND_TOP = 0
Global Const $HWND_TOPMOST = + 4294967295
Global Const $SWP_NOSIZE = 1
Global Const $SWP_NOMOVE = 2
Global Const $SWP_NOZORDER = 4
Global Const $SWP_NOREDRAW = 8
Global Const $SWP_NOACTIVATE = 16
Global Const $SWP_FRAMECHANGED = 32
Global Const $SWP_DRAWFRAME = 32
Global Const $SWP_SHOWWINDOW = 64
Global Const $SWP_HIDEWINDOW = 128
Global Const $SWP_NOCOPYBITS = 256
Global Const $SWP_NOOWNERZORDER = 512
Global Const $SWP_NOREPOSITION = 512
Global Const $SWP_NOSENDCHANGING = 1024
Global Const $SWP_DEFERERASE = 8192
Global Const $SWP_ASYNCWINDOWPOS = 16384
Global Const $KEYWORD_DEFAULT = 1
Global Const $KEYWORD_NULL = 2
Global Const $DECLARED_LOCAL = + 4294967295
Global Const $DECLARED_UNKNOWN = 0
Global Const $DECLARED_GLOBAL = 1
Global Const $ASSIGN_CREATE = 0
Global Const $ASSIGN_FORCELOCAL = 1
Global Const $ASSIGN_FORCEGLOBAL = 2
Global Const $ASSIGN_EXISTFAIL = 4
Global Const $BI_ENABLE = 0
Global Const $BI_DISABLE = 1
Global Const $BREAK_ENABLE = 1
Global Const $BREAK_DISABLE = 0
Global Const $CDTRAY_OPEN = "open"
Global Const $CDTRAY_CLOSED = "closed"
Global Const $SEND_DEFAULT = 0
Global Const $SEND_RAW = 1
Global Const $DIR_DEFAULT = 0
Global Const $DIR_EXTENDED = 1
Global Const $DIR_NORECURSE = 2
Global Const $DIR_REMOVE = 1
Global Const $DT_ALL = "ALL"
Global Const $DT_CDROM = "CDROM"
Global Const $DT_REMOVABLE = "REMOVABLE"
Global Const $DT_FIXED = "FIXED"
Global Const $DT_NETWORK = "NETWORK"
Global Const $DT_RAMDISK = "RAMDISK"
Global Const $DT_UNKNOWN = "UNKNOWN"
Global Const $DT_UNDEFINED = 1
Global Const $DT_FAT = "FAT"
Global Const $DT_FAT32 = "FAT32"
Global Const $DT_EXFAT = "exFAT"
Global Const $DT_NTFS = "NTFS"
Global Const $DT_NWFS = "NWFS"
Global Const $DT_CDFS = "CDFS"
Global Const $DT_UDF = "UDF"
Global Const $DMA_DEFAULT = 0
Global Const $DMA_PERSISTENT = 1
Global Const $DMA_AUTHENTICATION = 8
Global Const $DS_UNKNOWN = "UNKNOWN"
Global Const $DS_READY = "READY"
Global Const $DS_NOTREADY = "NOTREADY"
Global Const $DS_INVALID = "INVALID"
Global Const $MOUSE_CLICK_LEFT = "left"
Global Const $MOUSE_CLICK_RIGHT = "right"
Global Const $MOUSE_CLICK_MIDDLE = "middle"
Global Const $MOUSE_CLICK_MAIN = "main"
Global Const $MOUSE_CLICK_MENU = "menu"
Global Const $MOUSE_CLICK_PRIMARY = "primary"
Global Const $MOUSE_CLICK_SECONDARY = "secondary"
Global Const $MOUSE_WHEEL_UP = "up"
Global Const $MOUSE_WHEEL_DOWN = "down"
Global Const $NUMBER_AUTO = 0
Global Const $NUMBER_32BIT = 1
Global Const $NUMBER_64BIT = 2
Global Const $NUMBER_DOUBLE = 3
Global Const $OBJ_NAME = 1
Global Const $OBJ_STRING = 2
Global Const $OBJ_PROGID = 3
Global Const $OBJ_FILE = 4
Global Const $OBJ_MODULE = 5
Global Const $OBJ_CLSID = 6
Global Const $OBJ_IID = 7
Global Const $EXITCLOSE_NORMAL = 0
Global Const $EXITCLOSE_BYEXIT = 1
Global Const $EXITCLOSE_BYCLICK = 2
Global Const $EXITCLOSE_BYLOGOFF = 3
Global Const $EXITCLOSE_BYSHUTDOWN = 4
Global Const $PROCESS_STATS_MEMORY = 0
Global Const $PROCESS_STATS_IO = 1
Global Const $PROCESS_LOW = 0
Global Const $PROCESS_BELOWNORMAL = 1
Global Const $PROCESS_NORMAL = 2
Global Const $PROCESS_ABOVENORMAL = 3
Global Const $PROCESS_HIGH = 4
Global Const $PROCESS_REALTIME = 5
Global Const $RUN_LOGON_NOPROFILE = 0
Global Const $RUN_LOGON_PROFILE = 1
Global Const $RUN_LOGON_NETWORK = 2
Global Const $RUN_LOGON_INHERIT = 4
Global Const $SOUND_NOWAIT = 0
Global Const $SOUND_WAIT = 1
Global Const $SHEX_OPEN = "open"
Global Const $SHEX_EDIT = "edit"
Global Const $SHEX_PRINT = "print"
Global Const $SHEX_PROPERTIES = "properties"
Global Const $TCP_DATA_DEFAULT = 0
Global Const $TCP_DATA_BINARY = 1
Global Const $UDP_OPEN_DEFAULT = 0
Global Const $UDP_OPEN_BROADCAST = 1
Global Const $UDP_DATA_DEFAULT = 0
Global Const $UDP_DATA_BINARY = 1
Global Const $UDP_DATA_ARRAY = 2
Global Const $TIP_NOICON = 0
Global Const $TIP_INFOICON = 1
Global Const $TIP_WARNINGICON = 2
Global Const $TIP_ERRORICON = 3
Global Const $TIP_BALLOON = 1
Global Const $TIP_CENTER = 2
Global Const $TIP_FORCEVISIBLE = 4
Global Const $WINDOWS_NOONTOP = 0
Global Const $WINDOWS_ONTOP = 1
Global Const $WIN_STATE_EXISTS = 1
Global Const $WIN_STATE_VISIBLE = 2
Global Const $WIN_STATE_ENABLED = 4
Global Const $WIN_STATE_ACTIVE = 8
Global Const $WIN_STATE_MINIMIZED = 16
Global Const $WIN_STATE_MAXIMIZED = 32
Global Const $MB_OK = 0
Global Const $MB_OKCANCEL = 1
Global Const $MB_ABORTRETRYIGNORE = 2
Global Const $MB_YESNOCANCEL = 3
Global Const $MB_YESNO = 4
Global Const $MB_RETRYCANCEL = 5
Global Const $MB_CANCELTRYCONTINUE = 6
Global Const $MB_HELP = 16384
Global Const $MB_ICONNONE = 0
Global Const $MB_ICONSTOP = 16
Global Const $MB_ICONERROR = 16
Global Const $MB_ICONHAND = 16
Global Const $MB_ICONQUESTION = 32
Global Const $MB_ICONEXCLAMATION = 48
Global Const $MB_ICONWARNING = 48
Global Const $MB_ICONINFORMATION = 64
Global Const $MB_ICONASTERISK = 64
Global Const $MB_USERICON = 128
Global Const $MB_DEFBUTTON1 = 0
Global Const $MB_DEFBUTTON2 = 256
Global Const $MB_DEFBUTTON3 = 512
Global Const $MB_DEFBUTTON4 = 768
Global Const $MB_APPLMODAL = 0
Global Const $MB_SYSTEMMODAL = 4096
Global Const $MB_TASKMODAL = 8192
Global Const $MB_DEFAULT_DESKTOP_ONLY = 131072
Global Const $MB_RIGHT = 524288
Global Const $MB_RTLREADING = 1048576
Global Const $MB_SETFOREGROUND = 65536
Global Const $MB_TOPMOST = 262144
Global Const $MB_SERVICE_NOTIFICATION = 2097152
Global Const $MB_RIGHTJUSTIFIED = $MB_RIGHT
Global Const $IDTIMEOUT = + 4294967295
Global Const $IDOK = 1
Global Const $IDCANCEL = 2
Global Const $IDABORT = 3
Global Const $IDRETRY = 4
Global Const $IDIGNORE = 5
Global Const $IDYES = 6
Global Const $IDNO = 7
Global Const $IDCLOSE = 8
Global Const $IDHELP = 9
Global Const $IDTRYAGAIN = 10
Global Const $IDCONTINUE = 11
Global Const $STR_NOCASESENSE = 0
Global Const $STR_CASESENSE = 1
Global Const $STR_NOCASESENSEBASIC = 2
Global Const $STR_STRIPLEADING = 1
Global Const $STR_STRIPTRAILING = 2
Global Const $STR_STRIPSPACES = 4
Global Const $STR_STRIPALL = 8
Global Const $STR_CHRSPLIT = 0
Global Const $STR_ENTIRESPLIT = 1
Global Const $STR_NOCOUNT = 2
Global Const $STR_REGEXPMATCH = 0
Global Const $STR_REGEXPARRAYMATCH = 1
Global Const $STR_REGEXPARRAYFULLMATCH = 2
Global Const $STR_REGEXPARRAYGLOBALMATCH = 3
Global Const $STR_REGEXPARRAYGLOBALFULLMATCH = 4
Global Const $STR_ENDISSTART = 0
Global Const $STR_ENDNOTSTART = 1
Global Const $SB_ANSI = 1
Global Const $SB_UTF16LE = 2
Global Const $SB_UTF16BE = 3
Global Const $SB_UTF8 = 4
Global Const $SE_UTF16 = 0
Global Const $SE_ANSI = 1
Global Const $SE_UTF8 = 2
Global Const $STR_UTF16 = 0
Global Const $STR_UCS2 = 1
#Region Global Variables and Constants
Global $_G_ARRAYDISPLAY_HLISTVIEW
Global $_G_ARRAYDISPLAY_ITRANSPOSE
Global $_G_ARRAYDISPLAY_IDISPLAYROW
Global $_G_ARRAYDISPLAY_AARRAY
Global $_G_ARRAYDISPLAY_IDIMS
Global $_G_ARRAYDISPLAY_NROWS
Global $_G_ARRAYDISPLAY_NCOLS
Global $_G_ARRAYDISPLAY_IITEM_START
Global $_G_ARRAYDISPLAY_IITEM_END
Global $_G_ARRAYDISPLAY_ISUBITEM_START
Global $_G_ARRAYDISPLAY_ISUBITEM_END
Global $_G_ARRAYDISPLAY_AINDEX
Global $_G_ARRAYDISPLAY_AINDEXES [ 1 ]
Global $_G_ARRAYDISPLAY_ISORTDIR
Global $_G_ARRAYDISPLAY_ASHEADER
Global $_G_ARRAYDISPLAY_ANUMERICSORT
Global $ARRAYDISPLAY_ROWPREFIX = "#"
Global $ARRAYDISPLAY_NUMERICSORT = "*"
Global Const $ARRAYDISPLAY_COLALIGNLEFT = 0
Global Const $ARRAYDISPLAY_TRANSPOSE = 1
Global Const $ARRAYDISPLAY_COLALIGNRIGHT = 2
Global Const $ARRAYDISPLAY_COLALIGNCENTER = 4
Global Const $ARRAYDISPLAY_VERBOSE = 8
Global Const $ARRAYDISPLAY_NOROW = 64
Global Const $ARRAYDISPLAY_CHECKERROR = 128
Global Const $_ARRAYCONSTANT_TAGLVITEM = "struct;uint Mask;int Item;int SubItem;uint State;uint StateMask;ptr Text;int TextMax;int Image;lparam Param;" & "int Indent;int GroupID;uint Columns;ptr pColumns;ptr piColFmt;int iGroup;endstruct"
#EndRegion Global Variables and Constants
#Region Functions list
#EndRegion Functions list
Func __ARRAYDISPLAY_SHARE ( Const ByRef $AARRAY , $STITLE = Default , $SARRAYRANGE = Default , $IFLAGS = Default , $VUSER_SEPARATOR = Default , $SHEADER = Default , $IMAX_COLWIDTH = Default , $HUSER_FUNCTION = Default , $BDEBUG = True , Const $_ISCRIPTLINENUMBER = @ScriptLineNumber , Const $_ICALLERERROR = @error , Const $_ICALLEREXTENDED = @extended )
	Local $SMSGBOXTITLE = ( ( $BDEBUG ) ? ( "_DebugArrayDisplay" ) : ( "_ArrayDisplay" ) )
	If $STITLE = Default Then $STITLE = $SMSGBOXTITLE
	If $SARRAYRANGE = Default Then $SARRAYRANGE = ""
	If $IFLAGS = Default Then $IFLAGS = 0
	If $VUSER_SEPARATOR = Default Then $VUSER_SEPARATOR = ""
	If $SHEADER = Default Then $SHEADER = ""
	If $IMAX_COLWIDTH = Default Then $IMAX_COLWIDTH = 350
	If $IMAX_COLWIDTH > 4095 Then $IMAX_COLWIDTH = 4095
	If $HUSER_FUNCTION = Default Then $HUSER_FUNCTION = 0
	$_G_ARRAYDISPLAY_ITRANSPOSE = BitAND ( $IFLAGS , $ARRAYDISPLAY_TRANSPOSE )
	Local $ICOLALIGN = BitAND ( $IFLAGS , 6 )
	Local $IVERBOSE = Int ( BitAND ( $IFLAGS , $ARRAYDISPLAY_VERBOSE ) )
	$_G_ARRAYDISPLAY_IDISPLAYROW = Int ( BitAND ( $IFLAGS , $ARRAYDISPLAY_NOROW ) = 0 )
	Local $IBUTTONBORDER = ( ( $BDEBUG ) ? ( 40 ) : ( 20 ) )
	#Region Check valid array
	Local $SMSG = "" , $IRET = 1
	Local $FTIMER = 0
	If IsArray ( $AARRAY ) Then
		$_G_ARRAYDISPLAY_AARRAY = $AARRAY
		$_G_ARRAYDISPLAY_IDIMS = UBound ( $_G_ARRAYDISPLAY_AARRAY , $UBOUND_DIMENSIONS )
		If $_G_ARRAYDISPLAY_IDIMS = 1 Then $_G_ARRAYDISPLAY_ITRANSPOSE = 0
		$_G_ARRAYDISPLAY_NROWS = UBound ( $_G_ARRAYDISPLAY_AARRAY , $UBOUND_ROWS )
		$_G_ARRAYDISPLAY_NCOLS = ( $_G_ARRAYDISPLAY_IDIMS = 2 ) ? UBound ( $_G_ARRAYDISPLAY_AARRAY , $UBOUND_COLUMNS ) : 1
		Dim $_G_ARRAYDISPLAY_ANUMERICSORT [ $_G_ARRAYDISPLAY_NCOLS ]
		If $_G_ARRAYDISPLAY_IDIMS > 2 Then
			$SMSG = "Larger than 2D array passed to function"
			$IRET = 2
		EndIf
		If $_ICALLERERROR Then
			If $BDEBUG Then
				If IsDeclared ( "__g_sReportCallBack_DebugReport_Debug" ) Then
					$SMSG = "@@ Debug( " & $_ISCRIPTLINENUMBER & ") : @error = " & $_ICALLERERROR & " in " & $SMSGBOXTITLE & "( '" & $STITLE & "' )"
					Execute ( "$__g_sReportCallBack_DebugReport_Debug(""" & $SMSG & """)" )
				EndIf
				$IRET = 3
			ElseIf BitAND ( $IFLAGS , $ARRAYDISPLAY_CHECKERROR ) Then
				$SMSG = "@error = " & $_ICALLERERROR & " when calling the function"
				If $_ISCRIPTLINENUMBER > 0 Then $SMSG &= " at line " & $_ISCRIPTLINENUMBER
				$IRET = 3
			EndIf
		EndIf
	Else
		$SMSG = "No array variable passed to function"
	EndIf
	If $SMSG Then
		If $IVERBOSE And MsgBox ( $MB_SYSTEMMODAL + $MB_ICONERROR + $MB_YESNO , $SMSGBOXTITLE & "() Error: " & $STITLE , $SMSG & @CRLF & @CRLF & "Exit the script?" ) = $IDYES Then
			Exit
		Else
			Return SetError ( $IRET , 0 , 0 )
		EndIf
	EndIf
	#EndRegion Check valid array
	#Region Check array range
	Local $ICW_COLWIDTH = Number ( $VUSER_SEPARATOR )
	Local $SCURR_SEPARATOR = Opt ( "GUIDataSeparatorChar" )
	If $VUSER_SEPARATOR = "" Then $VUSER_SEPARATOR = $SCURR_SEPARATOR
	$_G_ARRAYDISPLAY_IITEM_START = 0
	$_G_ARRAYDISPLAY_IITEM_END = $_G_ARRAYDISPLAY_NROWS + 4294967295
	$_G_ARRAYDISPLAY_ISUBITEM_START = 0
	$_G_ARRAYDISPLAY_ISUBITEM_END = ( ( $_G_ARRAYDISPLAY_IDIMS = 2 ) ? ( $_G_ARRAYDISPLAY_NCOLS + 4294967295 ) : ( 0 ) )
	Local $AVRANGESPLIT
	If $SARRAYRANGE Then
		Local $VTMP , $AARRAY_RANGE = StringRegExp ( $SARRAYRANGE & "||" , "(?U)(.*)\|" , $STR_REGEXPARRAYGLOBALMATCH )
		If $AARRAY_RANGE [ 0 ] Then
			$AVRANGESPLIT = StringSplit ( $AARRAY_RANGE [ 0 ] , ":" )
			If @error Then
				$_G_ARRAYDISPLAY_IITEM_END = Number ( $AARRAY_RANGE [ 0 ] )
			Else
				$_G_ARRAYDISPLAY_IITEM_START = Number ( $AVRANGESPLIT [ 1 ] )
				If $AVRANGESPLIT [ 2 ] <> "" Then
					$_G_ARRAYDISPLAY_IITEM_END = Number ( $AVRANGESPLIT [ 2 ] )
				EndIf
			EndIf
		EndIf
		If $_G_ARRAYDISPLAY_IITEM_START < 0 Then $_G_ARRAYDISPLAY_IITEM_START = 0
		If $_G_ARRAYDISPLAY_IITEM_END >= $_G_ARRAYDISPLAY_NROWS Then $_G_ARRAYDISPLAY_IITEM_END = $_G_ARRAYDISPLAY_NROWS + 4294967295
		If ( $_G_ARRAYDISPLAY_IITEM_START > $_G_ARRAYDISPLAY_IITEM_END ) And ( $_G_ARRAYDISPLAY_IITEM_END > 0 ) Then
			$VTMP = $_G_ARRAYDISPLAY_IITEM_START
			$_G_ARRAYDISPLAY_IITEM_START = $_G_ARRAYDISPLAY_IITEM_END
			$_G_ARRAYDISPLAY_IITEM_END = $VTMP
		EndIf
		If $_G_ARRAYDISPLAY_IDIMS = 2 And $AARRAY_RANGE [ 1 ] Then
			$AVRANGESPLIT = StringSplit ( $AARRAY_RANGE [ 1 ] , ":" )
			If @error Then
				$_G_ARRAYDISPLAY_ISUBITEM_END = Number ( $AARRAY_RANGE [ 1 ] )
			Else
				$_G_ARRAYDISPLAY_ISUBITEM_START = Number ( $AVRANGESPLIT [ 1 ] )
				If $AVRANGESPLIT [ 2 ] <> "" Then
					$_G_ARRAYDISPLAY_ISUBITEM_END = Number ( $AVRANGESPLIT [ 2 ] )
				EndIf
			EndIf
			If $_G_ARRAYDISPLAY_ISUBITEM_START > $_G_ARRAYDISPLAY_ISUBITEM_END Then
				$VTMP = $_G_ARRAYDISPLAY_ISUBITEM_START
				$_G_ARRAYDISPLAY_ISUBITEM_START = $_G_ARRAYDISPLAY_ISUBITEM_END
				$_G_ARRAYDISPLAY_ISUBITEM_END = $VTMP
			EndIf
			If $_G_ARRAYDISPLAY_ISUBITEM_START < 0 Then $_G_ARRAYDISPLAY_ISUBITEM_START = 0
			If $_G_ARRAYDISPLAY_ISUBITEM_END >= $_G_ARRAYDISPLAY_NCOLS Then $_G_ARRAYDISPLAY_ISUBITEM_END = $_G_ARRAYDISPLAY_NCOLS + 4294967295
		EndIf
	EndIf
	Local $SDISPLAYDATA = "[" & $_G_ARRAYDISPLAY_NROWS & "]"
	If $_G_ARRAYDISPLAY_IDIMS = 2 Then
		$SDISPLAYDATA &= " [" & $_G_ARRAYDISPLAY_NCOLS & "]"
	EndIf
	Local $STIPDATA = ""
	If $SARRAYRANGE Then
		If $STIPDATA Then $STIPDATA &= " - "
		$STIPDATA &= "Range set " & $SARRAYRANGE
	EndIf
	If $_G_ARRAYDISPLAY_ITRANSPOSE Then
		If $STIPDATA Then $STIPDATA &= " - "
		$STIPDATA &= "Transposed"
	EndIf
	If $SARRAYRANGE Or $_G_ARRAYDISPLAY_ITRANSPOSE Then $_G_ARRAYDISPLAY_AARRAY = __ARRAYDISPLAY_CREATESUBARRAY ( )
	#EndRegion Check array range
	#Region Check custom header
	$_G_ARRAYDISPLAY_ASHEADER = StringSplit ( $SHEADER , $SCURR_SEPARATOR , $STR_NOCOUNT )
	If UBound ( $_G_ARRAYDISPLAY_ASHEADER ) = 0 Then Dim $_G_ARRAYDISPLAY_ASHEADER [ 1 ] = [ "" ]
	$SHEADER = "Row"
	Local $IINDEX = $_G_ARRAYDISPLAY_ISUBITEM_START
	If $_G_ARRAYDISPLAY_ITRANSPOSE Then
		$SHEADER = "Row"
		For $J = 0 To $_G_ARRAYDISPLAY_NCOLS + 4294967295
			$SHEADER &= $SCURR_SEPARATOR & $ARRAYDISPLAY_ROWPREFIX & " " & $J + $_G_ARRAYDISPLAY_ISUBITEM_START
		Next
	Else
		If $_G_ARRAYDISPLAY_ASHEADER [ 0 ] Then
			For $IINDEX = $_G_ARRAYDISPLAY_ISUBITEM_START To $_G_ARRAYDISPLAY_ISUBITEM_END
				If $IINDEX >= UBound ( $_G_ARRAYDISPLAY_ASHEADER ) Then ExitLoop
				If StringRight ( $_G_ARRAYDISPLAY_ASHEADER [ $IINDEX ] , 1 ) = $ARRAYDISPLAY_NUMERICSORT Then
					$_G_ARRAYDISPLAY_ASHEADER [ $IINDEX ] = StringTrimRight ( $_G_ARRAYDISPLAY_ASHEADER [ $IINDEX ] , 1 )
					$_G_ARRAYDISPLAY_ANUMERICSORT [ $IINDEX - $_G_ARRAYDISPLAY_ISUBITEM_START ] = 1
				EndIf
				$SHEADER &= $SCURR_SEPARATOR & $_G_ARRAYDISPLAY_ASHEADER [ $IINDEX ]
			Next
		EndIf
		For $J = $IINDEX To $_G_ARRAYDISPLAY_ISUBITEM_END
			$SHEADER &= $SCURR_SEPARATOR & "Col " & $J
		Next
	EndIf
	If Not $_G_ARRAYDISPLAY_IDISPLAYROW Then $SHEADER = StringTrimLeft ( $SHEADER , 4 )
	#EndRegion Check custom header
	#Region Generate Sort index for columns
	__ARRAYDISPLAY_SORTINDEXES ( 0 , + 4294967295 )
	Local $HTIMER = TimerInit ( )
	__ARRAYDISPLAY_SORTINDEXES ( 1 , 1 )
	$FTIMER = TimerDiff ( $HTIMER )
	If $FTIMER * $_G_ARRAYDISPLAY_NCOLS < 1000 Then
		__ARRAYDISPLAY_SORTINDEXES ( 2 , $_G_ARRAYDISPLAY_NCOLS )
		If $BDEBUG Then ConsoleWrite ( "Sorting all indexes = " & TimerDiff ( $HTIMER ) & @CRLF & @CRLF )
	Else
		If $BDEBUG Then ConsoleWrite ( "Sorting one index = " & TimerDiff ( $HTIMER ) & @CRLF )
	EndIf
	#EndRegion Generate Sort index for columns
	#Region GUI and Listview generation
	If $IVERBOSE And ( $_G_ARRAYDISPLAY_NROWS * $_G_ARRAYDISPLAY_NCOLS ) > 1000 Then
		SplashTextOn ( $SMSGBOXTITLE , "Preparing display" & @CRLF & @CRLF & "Please be patient" , 300 , 100 )
	EndIf
	Local Const $_ARRAYCONSTANT_GUI_DOCKBOTTOM = 64
	Local Const $_ARRAYCONSTANT_GUI_DOCKBORDERS = 102
	Local Const $_ARRAYCONSTANT_GUI_DOCKHEIGHT = 512
	Local Const $_ARRAYCONSTANT_GUI_DOCKLEFT = 2
	Local Const $_ARRAYCONSTANT_GUI_DOCKRIGHT = 4
	Local Const $_ARRAYCONSTANT_GUI_DOCKHCENTER = 8
	Local Const $_ARRAYCONSTANT_GUI_EVENT_CLOSE = + 4294967293
	Local Const $_ARRAYCONSTANT_GUI_EVENT_ARRAY = 1
	Local Const $_ARRAYCONSTANT_GUI_FOCUS = 256
	Local Const $_ARRAYCONSTANT_SS_CENTER = 1
	Local Const $_ARRAYCONSTANT_SS_CENTERIMAGE = 512
	Local Const $_ARRAYCONSTANT_LVM_GETITEMRECT = ( 4096 + 14 )
	Local Const $_ARRAYCONSTANT_LVM_GETITEMSTATE = ( 4096 + 44 )
	Local Const $_ARRAYCONSTANT_LVM_GETSELECTEDCOUNT = ( 4096 + 50 )
	Local Const $_ARRAYCONSTANT_LVM_SETEXTENDEDLISTVIEWSTYLE = ( 4096 + 54 )
	Local Const $_ARRAYCONSTANT_LVS_EX_GRIDLINES = 1
	Local Const $_ARRAYCONSTANT_LVIS_SELECTED = 2
	Local Const $_ARRAYCONSTANT_LVS_SHOWSELALWAYS = 8
	Local Const $_ARRAYCONSTANT_LVS_OWNERDATA = 4096
	Local Const $_ARRAYCONSTANT_LVS_EX_FULLROWSELECT = 32
	Local Const $_ARRAYCONSTANT_LVS_EX_DOUBLEBUFFER = 65536
	Local Const $_ARRAYCONSTANT_WS_EX_CLIENTEDGE = 512
	Local Const $_ARRAYCONSTANT_WS_MAXIMIZEBOX = 65536
	Local Const $_ARRAYCONSTANT_WS_MINIMIZEBOX = 131072
	Local Const $_ARRAYCONSTANT_WS_SIZEBOX = 262144
	Local $ICOORDMODE = Opt ( "GUICoordMode" , 1 )
	Local $IORGWIDTH = 210 , $IHEIGHT = 200 , $IMINSIZE = 250
	Local $HGUI = GUICreate ( $STITLE , $IORGWIDTH , $IHEIGHT , Default , Default , BitOR ( $_ARRAYCONSTANT_WS_SIZEBOX , $_ARRAYCONSTANT_WS_MINIMIZEBOX , $_ARRAYCONSTANT_WS_MAXIMIZEBOX ) )
	Local $AIGUISIZE = WinGetClientSize ( $HGUI )
	Local $IDLISTVIEW = GUICtrlCreateListView ( $SHEADER , 0 , 0 , $AIGUISIZE [ 0 ] , $AIGUISIZE [ 1 ] - $IBUTTONBORDER , BitOR ( $_ARRAYCONSTANT_LVS_SHOWSELALWAYS , $_ARRAYCONSTANT_LVS_OWNERDATA ) )
	$_G_ARRAYDISPLAY_HLISTVIEW = GUICtrlGetHandle ( $IDLISTVIEW )
	GUICtrlSendMsg ( $IDLISTVIEW , $_ARRAYCONSTANT_LVM_SETEXTENDEDLISTVIEWSTYLE , $_ARRAYCONSTANT_LVS_EX_GRIDLINES , $_ARRAYCONSTANT_LVS_EX_GRIDLINES )
	GUICtrlSendMsg ( $IDLISTVIEW , $_ARRAYCONSTANT_LVM_SETEXTENDEDLISTVIEWSTYLE , $_ARRAYCONSTANT_LVS_EX_FULLROWSELECT , $_ARRAYCONSTANT_LVS_EX_FULLROWSELECT )
	GUICtrlSendMsg ( $IDLISTVIEW , $_ARRAYCONSTANT_LVM_SETEXTENDEDLISTVIEWSTYLE , $_ARRAYCONSTANT_LVS_EX_DOUBLEBUFFER , $_ARRAYCONSTANT_LVS_EX_DOUBLEBUFFER )
	GUICtrlSendMsg ( $IDLISTVIEW , $_ARRAYCONSTANT_LVM_SETEXTENDEDLISTVIEWSTYLE , $_ARRAYCONSTANT_WS_EX_CLIENTEDGE , $_ARRAYCONSTANT_WS_EX_CLIENTEDGE )
	Local $HHEADER = HWnd ( GUICtrlSendMsg ( $IDLISTVIEW , ( 4096 + 31 ) , 0 , 0 ) )
	GUICtrlSetResizing ( $IDLISTVIEW , $_ARRAYCONSTANT_GUI_DOCKBORDERS )
	Local $ICOLFILL = $_G_ARRAYDISPLAY_NCOLS + $_G_ARRAYDISPLAY_IDISPLAYROW
	If $ICOLALIGN Then
		For $I = 0 To $ICOLFILL + 4294967295
			__ARRAYDISPLAY_JUSTIFYCOLUMN ( $IDLISTVIEW , $I , $ICOLALIGN / 2 )
		Next
	EndIf
	GUICtrlSendMsg ( $IDLISTVIEW , ( 4096 + 47 ) , $_G_ARRAYDISPLAY_NROWS , 0 )
	Local $TRECT = DllStructCreate ( "struct; long Left;long Top;long Right;long Bottom; endstruct" )
	DllCall ( "user32.dll" , "struct*" , "SendMessageW" , "hwnd" , $_G_ARRAYDISPLAY_HLISTVIEW , "uint" , $_ARRAYCONSTANT_LVM_GETITEMRECT , "wparam" , 0 , "struct*" , $TRECT )
	Local $AIWIN_POS = WinGetPos ( $HGUI )
	Local $AILV_POS = ControlGetPos ( $HGUI , "" , $IDLISTVIEW )
	$IHEIGHT = ( ( $_G_ARRAYDISPLAY_NROWS + 3 ) * ( DllStructGetData ( $TRECT , "Bottom" ) - DllStructGetData ( $TRECT , "Top" ) ) ) + $AIWIN_POS [ 3 ] - $AILV_POS [ 3 ]
	If $IHEIGHT > @DesktopHeight + 4294967196 Then
		$IHEIGHT = @DesktopHeight + 4294967196
	ElseIf $IHEIGHT < $IMINSIZE Then
		$IHEIGHT = $IMINSIZE
	EndIf
	If $IVERBOSE Then SplashOff ( )
	$_G_ARRAYDISPLAY_ISORTDIR = 1024
	Local $ICOLUMN = 0 , $ICOLUMNPREV = + 4294967295
	If $_G_ARRAYDISPLAY_IDISPLAYROW Then
		$ICOLUMNPREV = $ICOLUMN
		__ARRAYDISPLAY_HEADERSETITEMFORMAT ( $HHEADER , $ICOLUMN , 16384 + $_G_ARRAYDISPLAY_ISORTDIR + $ICOLALIGN / 2 )
	EndIf
	$_G_ARRAYDISPLAY_AINDEX = $_G_ARRAYDISPLAY_AINDEXES [ 0 ]
	#EndRegion GUI and Listview generation
	Local $P__ARRAYDISPLAY_NOTIFYHANDLER = DllCallbackGetPtr ( DllCallbackRegister ( "__ArrayDisplay_NotifyHandler" , "lresult" , "hwnd;uint;wparam;lparam;uint_ptr;dword_ptr" ) )
	DllCall ( "comctl32.dll" , "bool" , "SetWindowSubclass" , "hwnd" , $HGUI , "ptr" , $P__ARRAYDISPLAY_NOTIFYHANDLER , "uint_ptr" , 0 , "dword_ptr" , 0 )
	#Region Adjust dialog width
	Local $IWIDTH = 40 , $ICOLWIDTH = 0 , $AICOLWIDTH [ $ICOLFILL ] , $IMIN_COLWIDTH = 55
	Local $ICOLWIDTHHEADER
	For $I = 0 To $ICOLFILL + 4294967295
		GUICtrlSendMsg ( $IDLISTVIEW , ( 4096 + 30 ) , $I , + 4294967295 )
		$ICOLWIDTH = GUICtrlSendMsg ( $IDLISTVIEW , ( 4096 + 29 ) , $I , 0 )
		If $SHEADER <> "" Then
			If $ICOLWIDTH = 0 Then ExitLoop
			GUICtrlSendMsg ( $IDLISTVIEW , ( 4096 + 30 ) , $I , + 4294967294 )
			$ICOLWIDTHHEADER = GUICtrlSendMsg ( $IDLISTVIEW , ( 4096 + 29 ) , $I , 0 )
			If $ICOLWIDTH < $IMIN_COLWIDTH And $ICOLWIDTHHEADER < $IMIN_COLWIDTH Then
				GUICtrlSendMsg ( $IDLISTVIEW , ( 4096 + 30 ) , $I , $IMIN_COLWIDTH )
				$ICOLWIDTH = $IMIN_COLWIDTH
			ElseIf $ICOLWIDTHHEADER < $ICOLWIDTH Then
				GUICtrlSendMsg ( $IDLISTVIEW , ( 4096 + 30 ) , $I , $ICOLWIDTH )
			Else
				$ICOLWIDTH = $ICOLWIDTHHEADER
			EndIf
		Else
			If $ICOLWIDTH < $IMIN_COLWIDTH Then
				GUICtrlSendMsg ( $IDLISTVIEW , ( 4096 + 30 ) , $I , $IMIN_COLWIDTH )
				$ICOLWIDTH = $IMIN_COLWIDTH
			EndIf
		EndIf
		$IWIDTH += $ICOLWIDTH
		$AICOLWIDTH [ $I ] = $ICOLWIDTH
	Next
	If $IWIDTH > @DesktopWidth + 4294967196 Then
		$IWIDTH = 40
		For $I = 0 To $ICOLFILL + 4294967295
			If $AICOLWIDTH [ $I ] > $IMAX_COLWIDTH Then
				GUICtrlSendMsg ( $IDLISTVIEW , ( 4096 + 30 ) , $I , $IMAX_COLWIDTH )
				$IWIDTH += $IMAX_COLWIDTH
			Else
				$IWIDTH += $AICOLWIDTH [ $I ]
			EndIf
			If $I < 20 And $BDEBUG Then ConsoleWrite ( "@@ Debug(" & @ScriptLineNumber & ") : $iWidth = " & $IWIDTH & " $i = " & $I & @CRLF )
		Next
	EndIf
	If $IWIDTH > @DesktopWidth + 4294967196 Then
		$IWIDTH = @DesktopWidth + 4294967196
	ElseIf $IWIDTH < $IMINSIZE Then
		$IWIDTH = $IMINSIZE
	EndIf
	#EndRegion Adjust dialog width
	Local $ISCROLLBARSIZE = 0
	If $IHEIGHT = ( @DesktopHeight + 4294967196 ) Then $ISCROLLBARSIZE = 15
	WinMove ( $HGUI , "" , ( @DesktopWidth - $IWIDTH + $ISCROLLBARSIZE ) / 2 , ( @DesktopHeight - $IHEIGHT ) / 2 , $IWIDTH + $ISCROLLBARSIZE , $IHEIGHT )
	$AIGUISIZE = WinGetClientSize ( $HGUI )
	GUICtrlSetPos ( $IDLISTVIEW , 0 , 0 , $IWIDTH , $AIGUISIZE [ 1 ] - $IBUTTONBORDER )
	#Region Create bottom infos
	Local $IBUTTONWIDTH_1 = $AIGUISIZE [ 0 ] / 2
	Local $IBUTTONWIDTH_2 = $AIGUISIZE [ 0 ] / 3
	Local $IDCOPY_ID = 9999 , $IDCOPY_DATA = 99999 , $IDDATA_LABEL = 99999 , $IDUSER_FUNC = 99999 , $IDEXIT_SCRIPT = 99999
	If $BDEBUG Then
		$IDCOPY_ID = GUICtrlCreateButton ( "Copy Data && Hdr/Row" , 0 , $AIGUISIZE [ 1 ] - $IBUTTONBORDER , $IBUTTONWIDTH_1 , 20 )
		$IDCOPY_DATA = GUICtrlCreateButton ( "Copy Data Only" , $IBUTTONWIDTH_1 , $AIGUISIZE [ 1 ] - $IBUTTONBORDER , $IBUTTONWIDTH_1 , 20 )
		Local $IBUTTONWIDTH_VAR = $IBUTTONWIDTH_1
		Local $IOFFSET = $IBUTTONWIDTH_1
		If IsFunc ( $HUSER_FUNCTION ) Then
			$IDUSER_FUNC = GUICtrlCreateButton ( "Run User Func" , $IBUTTONWIDTH_2 , $AIGUISIZE [ 1 ] + 4294967276 , $IBUTTONWIDTH_2 , 20 )
			$IBUTTONWIDTH_VAR = $IBUTTONWIDTH_2
			$IOFFSET = $IBUTTONWIDTH_2 * 2
		EndIf
		$IDEXIT_SCRIPT = GUICtrlCreateButton ( "Exit Script" , $IOFFSET , $AIGUISIZE [ 1 ] + 4294967276 , $IBUTTONWIDTH_VAR , 20 )
		$IDDATA_LABEL = GUICtrlCreateLabel ( $SDISPLAYDATA , 0 , $AIGUISIZE [ 1 ] + 4294967276 , $IBUTTONWIDTH_VAR , 18 , BitOR ( $_ARRAYCONSTANT_SS_CENTER , $_ARRAYCONSTANT_SS_CENTERIMAGE ) )
	Else
		$IDDATA_LABEL = GUICtrlCreateLabel ( $SDISPLAYDATA , 0 , $AIGUISIZE [ 1 ] + 4294967276 , $AIGUISIZE [ 0 ] , 18 , BitOR ( $_ARRAYCONSTANT_SS_CENTER , $_ARRAYCONSTANT_SS_CENTERIMAGE ) )
	EndIf
	If $_G_ARRAYDISPLAY_ITRANSPOSE Or $SARRAYRANGE Then
		GUICtrlSetColor ( $IDDATA_LABEL , 16711680 )
		GUICtrlSetTip ( $IDDATA_LABEL , $STIPDATA )
	EndIf
	GUICtrlSetResizing ( $IDCOPY_ID , $_ARRAYCONSTANT_GUI_DOCKLEFT + $_ARRAYCONSTANT_GUI_DOCKBOTTOM + $_ARRAYCONSTANT_GUI_DOCKHEIGHT )
	GUICtrlSetResizing ( $IDCOPY_DATA , $_ARRAYCONSTANT_GUI_DOCKRIGHT + $_ARRAYCONSTANT_GUI_DOCKBOTTOM + $_ARRAYCONSTANT_GUI_DOCKHEIGHT )
	GUICtrlSetResizing ( $IDDATA_LABEL , $_ARRAYCONSTANT_GUI_DOCKLEFT + $_ARRAYCONSTANT_GUI_DOCKBOTTOM + $_ARRAYCONSTANT_GUI_DOCKHEIGHT )
	GUICtrlSetResizing ( $IDUSER_FUNC , $_ARRAYCONSTANT_GUI_DOCKHCENTER + $_ARRAYCONSTANT_GUI_DOCKBOTTOM + $_ARRAYCONSTANT_GUI_DOCKHEIGHT )
	GUICtrlSetResizing ( $IDEXIT_SCRIPT , $_ARRAYCONSTANT_GUI_DOCKRIGHT + $_ARRAYCONSTANT_GUI_DOCKBOTTOM + $_ARRAYCONSTANT_GUI_DOCKHEIGHT )
	#EndRegion Create bottom infos
	GUISetState ( @SW_SHOW , $HGUI )
	If $FTIMER > 1000 And Not $SARRAYRANGE Then
		Beep ( 750 , 250 )
		ToolTip ( "Sorting Action can take as long as " & Ceiling ( $FTIMER / 1000 ) & " sec" & @CRLF & @CRLF & "Please be patient when you click to sort a column" , 50 , 50 , $SMSGBOXTITLE , $TIP_WARNINGICON , $TIP_BALLOON )
		Sleep ( 3000 )
		ToolTip ( "" )
	EndIf
	#Region GUI Handling events
	Local $IONEVENTMODE = Opt ( "GUIOnEventMode" , 0 ) , $AMSG
	While 1
		$AMSG = GUIGetMsg ( $_ARRAYCONSTANT_GUI_EVENT_ARRAY )
		If $AMSG [ 1 ] = $HGUI Then
			Switch $AMSG [ 0 ]
			Case $_ARRAYCONSTANT_GUI_EVENT_CLOSE
				ExitLoop
			Case $IDCOPY_ID , $IDCOPY_DATA
				Local $ISEL_COUNT = GUICtrlSendMsg ( $IDLISTVIEW , $_ARRAYCONSTANT_LVM_GETSELECTEDCOUNT , 0 , 0 )
				If $IVERBOSE And ( Not $ISEL_COUNT ) And ( $_G_ARRAYDISPLAY_IITEM_END - $_G_ARRAYDISPLAY_IITEM_START ) * ( $_G_ARRAYDISPLAY_ISUBITEM_END - $_G_ARRAYDISPLAY_ISUBITEM_START ) > 10000 Then
					SplashTextOn ( $SMSGBOXTITLE , "Copying data" & @CRLF & @CRLF & "Please be patient" , 300 , 100 )
				EndIf
				Local $SCLIP = "" , $SITEM , $ASPLIT , $IFIRSTCOL = 0
				If $AMSG [ 0 ] = $IDCOPY_DATA And $_G_ARRAYDISPLAY_IDISPLAYROW Then $IFIRSTCOL = 1
				For $I = 0 To GUICtrlSendMsg ( $IDLISTVIEW , 4100 , 0 , 0 ) + 4294967295
					If $ISEL_COUNT And Not ( GUICtrlSendMsg ( $IDLISTVIEW , $_ARRAYCONSTANT_LVM_GETITEMSTATE , $I , $_ARRAYCONSTANT_LVIS_SELECTED ) <> 0 ) Then
						ContinueLoop
					EndIf
					$SITEM = __ARRAYDISPLAY_GETITEMTEXTSTRINGSELECTED ( $IDLISTVIEW , $I , $IFIRSTCOL )
					If $AMSG [ 0 ] = $IDCOPY_ID And Not $_G_ARRAYDISPLAY_IDISPLAYROW Then
						$SITEM = $ARRAYDISPLAY_ROWPREFIX & " " & ( $I + $_G_ARRAYDISPLAY_IITEM_START ) & $SCURR_SEPARATOR & $SITEM
					EndIf
					If $ICW_COLWIDTH Then
						$ASPLIT = StringSplit ( $SITEM , $SCURR_SEPARATOR )
						$SITEM = ""
						For $J = 1 To $ASPLIT [ 0 ]
							$SITEM &= StringFormat ( "%-" & $ICW_COLWIDTH + 1 & "s" , StringLeft ( $ASPLIT [ $J ] , $ICW_COLWIDTH ) )
						Next
					Else
						$SITEM = StringReplace ( $SITEM , $SCURR_SEPARATOR , $VUSER_SEPARATOR )
					EndIf
					$SCLIP &= $SITEM & @CRLF
				Next
				$SITEM = $SHEADER
				If $AMSG [ 0 ] = $IDCOPY_ID Then
					$SITEM = $SHEADER
					If Not $_G_ARRAYDISPLAY_IDISPLAYROW Then
						$SITEM = "Row" & $SCURR_SEPARATOR & $SITEM
					EndIf
					If $ICW_COLWIDTH Then
						$ASPLIT = StringSplit ( $SITEM , $SCURR_SEPARATOR )
						$SITEM = ""
						For $J = 1 To $ASPLIT [ 0 ]
							$SITEM &= StringFormat ( "%-" & $ICW_COLWIDTH + 1 & "s" , StringLeft ( $ASPLIT [ $J ] , $ICW_COLWIDTH ) )
						Next
					Else
						$SITEM = StringReplace ( $SITEM , $SCURR_SEPARATOR , $VUSER_SEPARATOR )
					EndIf
					$SCLIP = $SITEM & @CRLF & $SCLIP
				EndIf
				ClipPut ( $SCLIP )
				SplashOff ( )
				GUICtrlSetState ( $IDLISTVIEW , $_ARRAYCONSTANT_GUI_FOCUS )
			Case $IDLISTVIEW
				$ICOLUMN = GUICtrlGetState ( $IDLISTVIEW )
				If Not IsArray ( $_G_ARRAYDISPLAY_AINDEXES [ $ICOLUMN + Not $_G_ARRAYDISPLAY_IDISPLAYROW ] ) Then
					__ARRAYDISPLAY_SORTINDEXES ( $ICOLUMN + Not $_G_ARRAYDISPLAY_IDISPLAYROW )
				EndIf
				If $ICOLUMN <> $ICOLUMNPREV Then
					__ARRAYDISPLAY_HEADERSETITEMFORMAT ( $HHEADER , $ICOLUMNPREV , 16384 + $ICOLALIGN / 2 )
					If $_G_ARRAYDISPLAY_IDISPLAYROW And $ICOLUMN = 0 Then
						$_G_ARRAYDISPLAY_AINDEX = $_G_ARRAYDISPLAY_AINDEXES [ 0 ]
					Else
						$_G_ARRAYDISPLAY_AINDEX = $_G_ARRAYDISPLAY_AINDEXES [ $ICOLUMN + Not $_G_ARRAYDISPLAY_IDISPLAYROW ]
					EndIf
				EndIf
				$_G_ARRAYDISPLAY_ISORTDIR = ( $ICOLUMN = $ICOLUMNPREV ) ? $_G_ARRAYDISPLAY_ISORTDIR = 1024 ? 512 : 1024 : 1024
				__ARRAYDISPLAY_HEADERSETITEMFORMAT ( $HHEADER , $ICOLUMN , 16384 + $_G_ARRAYDISPLAY_ISORTDIR + $ICOLALIGN / 2 )
				GUICtrlSendMsg ( $IDLISTVIEW , ( 4096 + 140 ) , $ICOLUMN , 0 )
				GUICtrlSendMsg ( $IDLISTVIEW , ( 4096 + 47 ) , $_G_ARRAYDISPLAY_NROWS , 0 )
				$ICOLUMNPREV = $ICOLUMN
			Case $IDUSER_FUNC
				Local $AISELITEMS [ 1 ] = [ 0 ]
				For $I = 0 To GUICtrlSendMsg ( $IDLISTVIEW , 4100 , 0 , 0 ) + 4294967295
					If ( GUICtrlSendMsg ( $IDLISTVIEW , $_ARRAYCONSTANT_LVM_GETITEMSTATE , $I , $_ARRAYCONSTANT_LVIS_SELECTED ) <> 0 ) Then
						$AISELITEMS [ 0 ] += 1
						ReDim $AISELITEMS [ $AISELITEMS [ 0 ] + 1 ]
						$AISELITEMS [ $AISELITEMS [ 0 ] ] = $I + $_G_ARRAYDISPLAY_IITEM_START
					EndIf
				Next
				$HUSER_FUNCTION ( $_G_ARRAYDISPLAY_AARRAY , $AISELITEMS )
				GUICtrlSetState ( $IDLISTVIEW , $_ARRAYCONSTANT_GUI_FOCUS )
			Case $IDEXIT_SCRIPT
				GUIDelete ( $HGUI )
				Exit
			EndSwitch
		EndIf
	WEnd
	#EndRegion GUI Handling events
	DllCall ( "comctl32.dll" , "bool" , "RemoveWindowSubclass" , "hwnd" , $HGUI , "ptr" , $P__ARRAYDISPLAY_NOTIFYHANDLER , "uint_ptr" , 0 )
	$_G_ARRAYDISPLAY_AINDEX = 0
	Dim $_G_ARRAYDISPLAY_AINDEXES [ 1 ]
	GUIDelete ( $HGUI )
	Opt ( "GUICoordMode" , $ICOORDMODE )
	Opt ( "GUIOnEventMode" , $IONEVENTMODE )
	Return SetError ( $_ICALLERERROR , $_ICALLEREXTENDED , 1 )
EndFunc
Func __ARRAYDISPLAY_NOTIFYHANDLER ( $HWND , $IMSG , $WPARAM , $LPARAM , $ISUBCLASSID , $PDATA )
	If $IMSG <> 78 Then Return DllCall ( "comctl32.dll" , "lresult" , "DefSubclassProc" , "hwnd" , $HWND , "uint" , $IMSG , "wparam" , $WPARAM , "lparam" , $LPARAM ) [ 0 ]
	Local Static $TAGNMHDR = "struct;hwnd hWndFrom;uint_ptr IDFrom;INT Code;endstruct"
	Local Static $TAGNMLVDISPINFO = $TAGNMHDR & ";" & $_ARRAYCONSTANT_TAGLVITEM
	Local $TNMLVDISPINFO = DllStructCreate ( $TAGNMLVDISPINFO , $LPARAM )
	Switch HWnd ( DllStructGetData ( $TNMLVDISPINFO , "hWndFrom" ) )
	Case $_G_ARRAYDISPLAY_HLISTVIEW
		Switch DllStructGetData ( $TNMLVDISPINFO , "Code" )
		Case + 4294967119
			Local Static $TTEXT = DllStructCreate ( "wchar[4096]" ) , $PTEXT = DllStructGetPtr ( $TTEXT )
			Local $IITEM = DllStructGetData ( $TNMLVDISPINFO , "Item" )
			Local $IROW = ( $_G_ARRAYDISPLAY_ISORTDIR = 1024 ) ? $_G_ARRAYDISPLAY_AINDEX [ $IITEM ] : $_G_ARRAYDISPLAY_AINDEX [ $_G_ARRAYDISPLAY_NROWS + 4294967295 - $IITEM ]
			Local $ICOL = DllStructGetData ( $TNMLVDISPINFO , "SubItem" )
			Local $STEMP
			If $_G_ARRAYDISPLAY_IDISPLAYROW = 0 Then
				If $_G_ARRAYDISPLAY_IDIMS = 2 Then
					$STEMP = $_G_ARRAYDISPLAY_AARRAY [ $IROW ] [ $ICOL ]
				Else
					$STEMP = $_G_ARRAYDISPLAY_AARRAY [ $IROW ]
				EndIf
				Switch VarGetType ( $STEMP )
				Case "Array"
					$STEMP = "{Array}"
				Case "Map"
					$STEMP = "{Map}"
				EndSwitch
				If StringLen ( $STEMP ) > 4095 Then $STEMP = StringLeft ( $STEMP , 4095 )
				DllStructSetData ( $TTEXT , 1 , $STEMP )
				DllStructSetData ( $TNMLVDISPINFO , "Text" , $PTEXT )
			Else
				If $ICOL = 0 Then
					If $_G_ARRAYDISPLAY_ITRANSPOSE Then
						Local $SCAPTIONCPLT = ""
						If $IROW + $_G_ARRAYDISPLAY_IITEM_START < UBound ( $_G_ARRAYDISPLAY_ASHEADER ) And StringStripWS ( $_G_ARRAYDISPLAY_ASHEADER [ $IROW + $_G_ARRAYDISPLAY_IITEM_START ] , 1 + 2 ) <> "" Then
							$SCAPTIONCPLT = " (" & StringStripWS ( $_G_ARRAYDISPLAY_ASHEADER [ $IROW + $_G_ARRAYDISPLAY_IITEM_START ] , 1 + 2 )
							If StringRight ( $SCAPTIONCPLT , 1 ) = $ARRAYDISPLAY_NUMERICSORT Then $SCAPTIONCPLT = StringTrimRight ( $SCAPTIONCPLT , 1 )
							$SCAPTIONCPLT &= ")"
						EndIf
						DllStructSetData ( $TTEXT , 1 , "Col " & ( $IROW + $_G_ARRAYDISPLAY_IITEM_START ) & $SCAPTIONCPLT )
					Else
						DllStructSetData ( $TTEXT , 1 , $ARRAYDISPLAY_ROWPREFIX & " " & $IROW + $_G_ARRAYDISPLAY_IITEM_START )
					EndIf
					DllStructSetData ( $TNMLVDISPINFO , "Text" , $PTEXT )
				Else
					If $_G_ARRAYDISPLAY_IDIMS = 2 Then
						$STEMP = $_G_ARRAYDISPLAY_AARRAY [ $IROW ] [ $ICOL + 4294967295 ]
					Else
						$STEMP = $_G_ARRAYDISPLAY_AARRAY [ $IROW ]
					EndIf
					Switch VarGetType ( $STEMP )
					Case "Array"
						$STEMP = "{Array}"
					Case "Map"
						$STEMP = "{Map}"
					EndSwitch
					If StringLen ( $STEMP ) > 4095 Then $STEMP = StringLeft ( $STEMP , 4095 )
					DllStructSetData ( $TTEXT , 1 , $STEMP )
					DllStructSetData ( $TNMLVDISPINFO , "Text" , $PTEXT )
				EndIf
			EndIf
			Return
		EndSwitch
	EndSwitch
	Return DllCall ( "comctl32.dll" , "lresult" , "DefSubclassProc" , "hwnd" , $HWND , "uint" , $IMSG , "wparam" , $WPARAM , "lparam" , $LPARAM ) [ 0 ]
	#forceref $iSubclassId, $pData
EndFunc
Func __ARRAYDISPLAY_SORTINDEXES ( $ICOLSTART , $ICOLEND = $ICOLSTART )
	Dim $_G_ARRAYDISPLAY_AINDEX [ $_G_ARRAYDISPLAY_NROWS ]
	If $ICOLEND = + 4294967295 Then
		Dim $_G_ARRAYDISPLAY_AINDEXES [ $_G_ARRAYDISPLAY_NCOLS + $_G_ARRAYDISPLAY_IDISPLAYROW + 1 ]
		For $I = 0 To $_G_ARRAYDISPLAY_NROWS + 4294967295
			$_G_ARRAYDISPLAY_AINDEX [ $I ] = $I
		Next
		$_G_ARRAYDISPLAY_AINDEXES [ 0 ] = $_G_ARRAYDISPLAY_AINDEX
	EndIf
	If $ICOLSTART = + 4294967295 Then
		$ICOLSTART = 1
		$ICOLEND = $_G_ARRAYDISPLAY_NCOLS
	EndIf
	If $ICOLSTART Then
		Local $TINDEX
		For $I = $ICOLSTART To $ICOLEND
			$TINDEX = __ARRAYDISPLAY_GETSORTCOLSTRUCT ( $_G_ARRAYDISPLAY_AARRAY , $I + 4294967295 )
			For $J = 0 To $_G_ARRAYDISPLAY_NROWS + 4294967295
				$_G_ARRAYDISPLAY_AINDEX [ $J ] = DllStructGetData ( $TINDEX , 1 , $J + 1 )
			Next
			$_G_ARRAYDISPLAY_AINDEXES [ $I ] = $_G_ARRAYDISPLAY_AINDEX
		Next
	EndIf
EndFunc
Func __ARRAYDISPLAY_GETSORTCOLSTRUCT ( Const ByRef $AARRAY , $ICOL )
	If UBound ( $AARRAY , $UBOUND_DIMENSIONS ) < 1 Or UBound ( $AARRAY , $UBOUND_DIMENSIONS ) > 2 Then
		Return SetError ( 6 , 0 , 0 )
	EndIf
	Return __ARRAYDISPLAY_SORTARRAYSTRUCT ( $AARRAY , $ICOL )
EndFunc
Func __ARRAYDISPLAY_SORTARRAYSTRUCT ( Const ByRef $AARRAY , $ICOL )
	Local $IDIMS = UBound ( $AARRAY , $UBOUND_DIMENSIONS )
	Local $TINDEX = DllStructCreate ( "uint[" & $_G_ARRAYDISPLAY_NROWS & "]" )
	Local $PINDEX = DllStructGetPtr ( $TINDEX )
	Static $HDLL = DllOpen ( "kernel32.dll" )
	Static $HDLLCOMP = DllOpen ( "shlwapi.dll" )
	Local $LO , $HI , $MI , $R , $NVAL1 , $NVAL2
	For $I = 1 To $_G_ARRAYDISPLAY_NROWS + 4294967295
		$LO = 0
		$HI = $I + 4294967295
		Do
			$MI = Int ( ( $LO + $HI ) / 2 )
			If Not $_G_ARRAYDISPLAY_ITRANSPOSE And $_G_ARRAYDISPLAY_ANUMERICSORT [ $ICOL ] Then
				If $IDIMS = 1 Then
					$NVAL1 = Number ( $AARRAY [ $I ] )
					$NVAL2 = Number ( $AARRAY [ DllStructGetData ( $TINDEX , 1 , $MI + 1 ) ] )
				Else
					$NVAL1 = Number ( $AARRAY [ $I ] [ $ICOL ] )
					$NVAL2 = Number ( $AARRAY [ DllStructGetData ( $TINDEX , 1 , $MI + 1 ) ] [ $ICOL ] )
				EndIf
				$R = $NVAL1 < $NVAL2 ? + 4294967295 : $NVAL1 > $NVAL2 ? 1 : 0
			Else
				If $IDIMS = 1 Then
					$R = DllCall ( $HDLLCOMP , "int" , "StrCmpLogicalW" , "wstr" , $AARRAY [ $I ] , "wstr" , $AARRAY [ DllStructGetData ( $TINDEX , 1 , $MI + 1 ) ] ) [ 0 ]
				Else
					$R = DllCall ( $HDLLCOMP , "int" , "StrCmpLogicalW" , "wstr" , $AARRAY [ $I ] [ $ICOL ] , "wstr" , $AARRAY [ DllStructGetData ( $TINDEX , 1 , $MI + 1 ) ] [ $ICOL ] ) [ 0 ]
				EndIf
			EndIf
			Switch $R
			Case + 4294967295
				$HI = $MI + 4294967295
			Case 1
				$LO = $MI + 1
			Case 0
				ExitLoop
			EndSwitch
		Until $LO > $HI
		DllCall ( $HDLL , "none" , "RtlMoveMemory" , "struct*" , $PINDEX + ( $MI + 1 ) * 4 , "struct*" , $PINDEX + $MI * 4 , "ulong_ptr" , ( $I - $MI ) * 4 )
		DllStructSetData ( $TINDEX , 1 , $I , $MI + 1 + ( $LO = $MI + 1 ) )
	Next
	Return $TINDEX
EndFunc
Func __ARRAYDISPLAY_CREATESUBARRAY ( )
	Local $NROWS = $_G_ARRAYDISPLAY_IITEM_END - $_G_ARRAYDISPLAY_IITEM_START + 1
	Local $NCOLS = $_G_ARRAYDISPLAY_ISUBITEM_END - $_G_ARRAYDISPLAY_ISUBITEM_START + 1
	Local $IROW = + 4294967295 , $ICOL , $ITEMP , $ATEMP
	If $_G_ARRAYDISPLAY_ITRANSPOSE Then
		Dim $ATEMP [ $NCOLS ] [ $NROWS ]
		For $I = $_G_ARRAYDISPLAY_IITEM_START To $_G_ARRAYDISPLAY_IITEM_END
			$IROW += 1
			$ICOL = + 4294967295
			For $J = $_G_ARRAYDISPLAY_ISUBITEM_START To $_G_ARRAYDISPLAY_ISUBITEM_END
				$ICOL += 1
				$ATEMP [ $ICOL ] [ $IROW ] = $_G_ARRAYDISPLAY_AARRAY [ $I ] [ $J ]
			Next
		Next
		$ITEMP = $_G_ARRAYDISPLAY_IITEM_START
		$_G_ARRAYDISPLAY_IITEM_START = $_G_ARRAYDISPLAY_ISUBITEM_START
		$_G_ARRAYDISPLAY_ISUBITEM_START = $ITEMP
		$ITEMP = $_G_ARRAYDISPLAY_IITEM_END
		$_G_ARRAYDISPLAY_IITEM_END = $_G_ARRAYDISPLAY_ISUBITEM_END
		$_G_ARRAYDISPLAY_ISUBITEM_END = $ITEMP
		$_G_ARRAYDISPLAY_NROWS = $NCOLS
		$_G_ARRAYDISPLAY_NCOLS = $NROWS
	Else
		If $_G_ARRAYDISPLAY_IDIMS = 1 Then
			Dim $ATEMP [ $NROWS ]
			For $I = $_G_ARRAYDISPLAY_IITEM_START To $_G_ARRAYDISPLAY_IITEM_END
				$IROW += 1
				$ATEMP [ $IROW ] = $_G_ARRAYDISPLAY_AARRAY [ $I ]
			Next
		Else
			Dim $ATEMP [ $NROWS ] [ $NCOLS ]
			For $I = $_G_ARRAYDISPLAY_IITEM_START To $_G_ARRAYDISPLAY_IITEM_END
				$IROW += 1
				$ICOL = + 4294967295
				For $J = $_G_ARRAYDISPLAY_ISUBITEM_START To $_G_ARRAYDISPLAY_ISUBITEM_END
					$ICOL += 1
					$ATEMP [ $IROW ] [ $ICOL ] = $_G_ARRAYDISPLAY_AARRAY [ $I ] [ $J ]
				Next
			Next
			$_G_ARRAYDISPLAY_NCOLS = $NCOLS
		EndIf
		$_G_ARRAYDISPLAY_NROWS = $NROWS
	EndIf
	Return $ATEMP
EndFunc
Func __ARRAYDISPLAY_HEADERSETITEMFORMAT ( $HWND , $IINDEX , $IFORMAT )
	Local Static $THDITEM = DllStructCreate ( "uint Mask;int XY;ptr Text;handle hBMP;int TextMax;int Fmt;lparam Param;int Image;int Order;uint Type;ptr pFilter;uint State" )
	DllStructSetData ( $THDITEM , "Mask" , 4 )
	DllStructSetData ( $THDITEM , "Fmt" , $IFORMAT )
	Local $ARESULT = DllCall ( "user32.dll" , "lresult" , "SendMessageW" , "hwnd" , $HWND , "uint" , 4620 , "wparam" , $IINDEX , "struct*" , $THDITEM )
	Return $ARESULT [ 0 ] <> 0
EndFunc
Func __ARRAYDISPLAY_GETITEMTEXT ( $IDLISTVIEW , $IINDEX , $ISUBITEM = 0 )
	Local $TBUFFER = DllStructCreate ( "wchar Text[4096]" )
	Local $PBUFFER = DllStructGetPtr ( $TBUFFER )
	Local $TITEM = DllStructCreate ( $_ARRAYCONSTANT_TAGLVITEM )
	DllStructSetData ( $TITEM , "SubItem" , $ISUBITEM )
	DllStructSetData ( $TITEM , "TextMax" , 4096 )
	DllStructSetData ( $TITEM , "Text" , $PBUFFER )
	If IsHWnd ( $IDLISTVIEW ) Then
		DllCall ( "user32.dll" , "lresult" , "SendMessageW" , "hwnd" , $IDLISTVIEW , "uint" , 4211 , "wparam" , $IINDEX , "struct*" , $TITEM )
	Else
		Local $PITEM = DllStructGetPtr ( $TITEM )
		GUICtrlSendMsg ( $IDLISTVIEW , 4211 , $IINDEX , $PITEM )
	EndIf
	Return DllStructGetData ( $TBUFFER , "Text" )
EndFunc
Func __ARRAYDISPLAY_GETITEMTEXTSTRINGSELECTED ( $IDLISTVIEW , $IITEM , $IFIRSTCOL )
	Local $SROW = "" , $SSEPARATORCHAR = Opt ( "GUIDataSeparatorChar" )
	Local $ISELECTED = $IITEM
	Local $HHEADER = HWnd ( GUICtrlSendMsg ( $IDLISTVIEW , 4127 , 0 , 0 ) )
	Local $NCOL = DllCall ( "user32.dll" , "lresult" , "SendMessageW" , "hwnd" , $HHEADER , "uint" , 4608 , "wparam" , 0 , "lparam" , 0 ) [ 0 ]
	For $X = $IFIRSTCOL To $NCOL + 4294967295
		$SROW &= __ARRAYDISPLAY_GETITEMTEXT ( $IDLISTVIEW , $ISELECTED , $X ) & $SSEPARATORCHAR
	Next
	Return StringTrimRight ( $SROW , 1 )
EndFunc
Func __ARRAYDISPLAY_JUSTIFYCOLUMN ( $IDLISTVIEW , $IINDEX , $IALIGN = + 4294967295 )
	Local $TCOLUMN = DllStructCreate ( "uint Mask;int Fmt;int CX;ptr Text;int TextMax;int SubItem;int Image;int Order;int cxMin;int cxDefault;int cxIdeal" )
	If $IALIGN < 0 Or $IALIGN > 2 Then $IALIGN = 0
	DllStructSetData ( $TCOLUMN , "Mask" , 1 )
	DllStructSetData ( $TCOLUMN , "Fmt" , $IALIGN )
	Local $PCOLUMN = DllStructGetPtr ( $TCOLUMN )
	Local $IRET = GUICtrlSendMsg ( $IDLISTVIEW , 4192 , $IINDEX , $PCOLUMN )
	Return $IRET <> 0
EndFunc
Global Enum $ARRAYFILL_FORCE_DEFAULT , $ARRAYFILL_FORCE_SINGLEITEM , $ARRAYFILL_FORCE_INT , $ARRAYFILL_FORCE_NUMBER , $ARRAYFILL_FORCE_PTR , $ARRAYFILL_FORCE_HWND , $ARRAYFILL_FORCE_STRING , $ARRAYFILL_FORCE_BOOLEAN
Global Enum $ARRAYUNIQUE_NOCOUNT , $ARRAYUNIQUE_COUNT
Global Enum $ARRAYUNIQUE_AUTO , $ARRAYUNIQUE_FORCE32 , $ARRAYUNIQUE_FORCE64 , $ARRAYUNIQUE_MATCH , $ARRAYUNIQUE_DISTINCT
Func _ARRAYADD ( ByRef $AARRAY , $VVALUE , $ISTART = 0 , $SDELIM_ITEM = "|" , $SDELIM_ROW = @CRLF , $IFORCE = $ARRAYFILL_FORCE_DEFAULT )
	If $ISTART = Default Then $ISTART = 0
	If $SDELIM_ITEM = Default Then $SDELIM_ITEM = "|"
	If $SDELIM_ROW = Default Then $SDELIM_ROW = @CRLF
	If $IFORCE = Default Then $IFORCE = $ARRAYFILL_FORCE_DEFAULT
	If Not IsArray ( $AARRAY ) Then Return SetError ( 1 , 0 , + 4294967295 )
	Local $IDIM_1 = UBound ( $AARRAY , $UBOUND_ROWS )
	Local $HDATATYPE = 0
	Switch $IFORCE
	Case $ARRAYFILL_FORCE_INT
		$HDATATYPE = Int
	Case $ARRAYFILL_FORCE_NUMBER
		$HDATATYPE = Number
	Case $ARRAYFILL_FORCE_PTR
		$HDATATYPE = Ptr
	Case $ARRAYFILL_FORCE_HWND
		$HDATATYPE = HWnd
	Case $ARRAYFILL_FORCE_STRING
		$HDATATYPE = String
	Case $ARRAYFILL_FORCE_BOOLEAN
		$HDATATYPE = "Boolean"
	EndSwitch
	Switch UBound ( $AARRAY , $UBOUND_DIMENSIONS )
	Case 1
		If $IFORCE = $ARRAYFILL_FORCE_SINGLEITEM Then
			ReDim $AARRAY [ $IDIM_1 + 1 ]
			$AARRAY [ $IDIM_1 ] = $VVALUE
			Return $IDIM_1
		EndIf
		If IsArray ( $VVALUE ) Then
			If UBound ( $VVALUE , $UBOUND_DIMENSIONS ) <> 1 Then Return SetError ( 5 , 0 , + 4294967295 )
			$HDATATYPE = 0
		Else
			Local $ATMP = StringSplit ( $VVALUE , $SDELIM_ITEM , $STR_NOCOUNT + $STR_ENTIRESPLIT )
			If UBound ( $ATMP , $UBOUND_ROWS ) = 1 Then
				$ATMP [ 0 ] = $VVALUE
			EndIf
			$VVALUE = $ATMP
		EndIf
		Local $IADD = UBound ( $VVALUE , $UBOUND_ROWS )
		ReDim $AARRAY [ $IDIM_1 + $IADD ]
		For $I = 0 To $IADD + 4294967295
			If String ( $HDATATYPE ) = "Boolean" Then
				Switch $VVALUE [ $I ]
				Case "True" , "1"
					$AARRAY [ $IDIM_1 + $I ] = True
				Case "False" , "0" , ""
					$AARRAY [ $IDIM_1 + $I ] = False
				EndSwitch
			ElseIf IsFunc ( $HDATATYPE ) Then
				$AARRAY [ $IDIM_1 + $I ] = $HDATATYPE ( $VVALUE [ $I ] )
			Else
				$AARRAY [ $IDIM_1 + $I ] = $VVALUE [ $I ]
			EndIf
		Next
		Return $IDIM_1 + $IADD + 4294967295
	Case 2
		Local $IDIM_2 = UBound ( $AARRAY , $UBOUND_COLUMNS )
		If $ISTART < 0 Or $ISTART > $IDIM_2 + 4294967295 Then Return SetError ( 4 , 0 , + 4294967295 )
		Local $IVALDIM_1 , $IVALDIM_2 = 0 , $ICOLCOUNT
		If IsArray ( $VVALUE ) Then
			If UBound ( $VVALUE , $UBOUND_DIMENSIONS ) <> 2 Then Return SetError ( 5 , 0 , + 4294967295 )
			$IVALDIM_1 = UBound ( $VVALUE , $UBOUND_ROWS )
			$IVALDIM_2 = UBound ( $VVALUE , $UBOUND_COLUMNS )
			$HDATATYPE = 0
		Else
			Local $ASPLIT_1 = StringSplit ( $VVALUE , $SDELIM_ROW , $STR_NOCOUNT + $STR_ENTIRESPLIT )
			$IVALDIM_1 = UBound ( $ASPLIT_1 , $UBOUND_ROWS )
			Local $ATMP [ $IVALDIM_1 ] [ 0 ] , $ASPLIT_2
			For $I = 0 To $IVALDIM_1 + 4294967295
				$ASPLIT_2 = StringSplit ( $ASPLIT_1 [ $I ] , $SDELIM_ITEM , $STR_NOCOUNT + $STR_ENTIRESPLIT )
				$ICOLCOUNT = UBound ( $ASPLIT_2 )
				If $ICOLCOUNT > $IVALDIM_2 Then
					$IVALDIM_2 = $ICOLCOUNT
					ReDim $ATMP [ $IVALDIM_1 ] [ $IVALDIM_2 ]
				EndIf
				For $J = 0 To $ICOLCOUNT + 4294967295
					$ATMP [ $I ] [ $J ] = $ASPLIT_2 [ $J ]
				Next
			Next
			$VVALUE = $ATMP
		EndIf
		If UBound ( $VVALUE , $UBOUND_COLUMNS ) + $ISTART > UBound ( $AARRAY , $UBOUND_COLUMNS ) Then Return SetError ( 3 , 0 , + 4294967295 )
		ReDim $AARRAY [ $IDIM_1 + $IVALDIM_1 ] [ $IDIM_2 ]
		For $IWRITETO_INDEX = 0 To $IVALDIM_1 + 4294967295
			For $J = 0 To $IDIM_2 + 4294967295
				If $J < $ISTART Then
					$AARRAY [ $IWRITETO_INDEX + $IDIM_1 ] [ $J ] = ""
				ElseIf $J - $ISTART > $IVALDIM_2 + 4294967295 Then
					$AARRAY [ $IWRITETO_INDEX + $IDIM_1 ] [ $J ] = ""
				Else
					If String ( $HDATATYPE ) = "Boolean" Then
						Switch $VVALUE [ $IWRITETO_INDEX ] [ $J - $ISTART ]
						Case "True" , "1"
							$AARRAY [ $IWRITETO_INDEX + $IDIM_1 ] [ $J ] = True
						Case "False" , "0" , ""
							$AARRAY [ $IWRITETO_INDEX + $IDIM_1 ] [ $J ] = False
						EndSwitch
					ElseIf IsFunc ( $HDATATYPE ) Then
						$AARRAY [ $IWRITETO_INDEX + $IDIM_1 ] [ $J ] = $HDATATYPE ( $VVALUE [ $IWRITETO_INDEX ] [ $J - $ISTART ] )
					Else
						$AARRAY [ $IWRITETO_INDEX + $IDIM_1 ] [ $J ] = $VVALUE [ $IWRITETO_INDEX ] [ $J - $ISTART ]
					EndIf
				EndIf
			Next
		Next
Case Else
		Return SetError ( 2 , 0 , + 4294967295 )
	EndSwitch
	Return UBound ( $AARRAY , $UBOUND_ROWS ) + 4294967295
EndFunc
Func _ARRAYBINARYSEARCH ( Const ByRef $AARRAY , $VVALUE , $ISTART = 0 , $IEND = 0 , $ICOLUMN = 0 )
	If $ISTART = Default Then $ISTART = 0
	If $IEND = Default Then $IEND = 0
	If $ICOLUMN = Default Then $ICOLUMN = 0
	If Not IsArray ( $AARRAY ) Then Return SetError ( 1 , 0 , + 4294967295 )
	Local $IDIM_1 = UBound ( $AARRAY , $UBOUND_ROWS )
	If $IDIM_1 = 0 Then Return SetError ( 6 , 0 , + 4294967295 )
	If $IEND < 1 Or $IEND > $IDIM_1 + 4294967295 Then $IEND = $IDIM_1 + 4294967295
	If $ISTART < 0 Then $ISTART = 0
	If $ISTART > $IEND Then Return SetError ( 4 , 0 , + 4294967295 )
	Local $IMID = Int ( ( $IEND + $ISTART ) / 2 )
	Switch UBound ( $AARRAY , $UBOUND_DIMENSIONS )
	Case 1
		If $AARRAY [ $ISTART ] > $VVALUE Or $AARRAY [ $IEND ] < $VVALUE Then Return SetError ( 2 , 0 , + 4294967295 )
		While $ISTART <= $IMID And $VVALUE <> $AARRAY [ $IMID ]
			If $VVALUE < $AARRAY [ $IMID ] Then
				$IEND = $IMID + 4294967295
			Else
				$ISTART = $IMID + 1
			EndIf
			$IMID = Int ( ( $IEND + $ISTART ) / 2 )
		WEnd
		If $ISTART > $IEND Then Return SetError ( 3 , 0 , + 4294967295 )
	Case 2
		Local $IDIM_2 = UBound ( $AARRAY , $UBOUND_COLUMNS ) + 4294967295
		If $ICOLUMN < 0 Or $ICOLUMN > $IDIM_2 Then Return SetError ( 7 , 0 , + 4294967295 )
		If $AARRAY [ $ISTART ] [ $ICOLUMN ] > $VVALUE Or $AARRAY [ $IEND ] [ $ICOLUMN ] < $VVALUE Then Return SetError ( 2 , 0 , + 4294967295 )
		While $ISTART <= $IMID And $VVALUE <> $AARRAY [ $IMID ] [ $ICOLUMN ]
			If $VVALUE < $AARRAY [ $IMID ] [ $ICOLUMN ] Then
				$IEND = $IMID + 4294967295
			Else
				$ISTART = $IMID + 1
			EndIf
			$IMID = Int ( ( $IEND + $ISTART ) / 2 )
		WEnd
		If $ISTART > $IEND Then Return SetError ( 3 , 0 , + 4294967295 )
Case Else
		Return SetError ( 5 , 0 , + 4294967295 )
	EndSwitch
	Return $IMID
EndFunc
Func _ARRAYCOLDELETE ( ByRef $AARRAY , $ICOLUMN , $BCONVERT = False )
	If $BCONVERT = Default Then $BCONVERT = False
	If Not IsArray ( $AARRAY ) Then Return SetError ( 1 , 0 , + 4294967295 )
	Local $IDIM_1 = UBound ( $AARRAY , $UBOUND_ROWS )
	If UBound ( $AARRAY , $UBOUND_DIMENSIONS ) <> 2 Then Return SetError ( 2 , 0 , + 4294967295 )
	Local $IDIM_2 = UBound ( $AARRAY , $UBOUND_COLUMNS )
	Switch $IDIM_2
	Case 2
		If $ICOLUMN < 0 Or $ICOLUMN > 1 Then Return SetError ( 3 , 0 , + 4294967295 )
		If $BCONVERT Then
			Local $ATEMPARRAY [ $IDIM_1 ]
			For $I = 0 To $IDIM_1 + 4294967295
				$ATEMPARRAY [ $I ] = $AARRAY [ $I ] [ ( Not $ICOLUMN ) ]
			Next
			$AARRAY = $ATEMPARRAY
		Else
			ContinueCase
		EndIf
Case Else
		If $ICOLUMN < 0 Or $ICOLUMN > $IDIM_2 + 4294967295 Then Return SetError ( 3 , 0 , + 4294967295 )
		For $I = 0 To $IDIM_1 + 4294967295
			For $J = $ICOLUMN To $IDIM_2 + 4294967294
				$AARRAY [ $I ] [ $J ] = $AARRAY [ $I ] [ $J + 1 ]
			Next
		Next
		ReDim $AARRAY [ $IDIM_1 ] [ $IDIM_2 + 4294967295 ]
	EndSwitch
	Return UBound ( $AARRAY , $UBOUND_COLUMNS )
EndFunc
Func _ARRAYCOLINSERT ( ByRef $AARRAY , $ICOLUMN )
	If Not IsArray ( $AARRAY ) Then Return SetError ( 1 , 0 , + 4294967295 )
	Local $IDIM_1 = UBound ( $AARRAY , $UBOUND_ROWS )
	Switch UBound ( $AARRAY , $UBOUND_DIMENSIONS )
	Case 1
		Local $ATEMPARRAY [ $IDIM_1 ] [ 2 ]
		Switch $ICOLUMN
		Case 0 , 1
			For $I = 0 To $IDIM_1 + 4294967295
				$ATEMPARRAY [ $I ] [ ( Not $ICOLUMN ) ] = $AARRAY [ $I ]
			Next
	Case Else
			Return SetError ( 3 , 0 , + 4294967295 )
		EndSwitch
		$AARRAY = $ATEMPARRAY
	Case 2
		Local $IDIM_2 = UBound ( $AARRAY , $UBOUND_COLUMNS )
		If $ICOLUMN < 0 Or $ICOLUMN > $IDIM_2 Then Return SetError ( 3 , 0 , + 4294967295 )
		ReDim $AARRAY [ $IDIM_1 ] [ $IDIM_2 + 1 ]
		For $I = 0 To $IDIM_1 + 4294967295
			For $J = $IDIM_2 To $ICOLUMN + 1 Step + 4294967295
				$AARRAY [ $I ] [ $J ] = $AARRAY [ $I ] [ $J + 4294967295 ]
			Next
			$AARRAY [ $I ] [ $ICOLUMN ] = ""
		Next
Case Else
		Return SetError ( 2 , 0 , + 4294967295 )
	EndSwitch
	Return UBound ( $AARRAY , $UBOUND_COLUMNS )
EndFunc
Func _ARRAYCOMBINATIONS ( Const ByRef $AARRAY , $ISET , $SDELIMITER = "" )
	If $SDELIMITER = Default Then $SDELIMITER = ""
	If Not IsArray ( $AARRAY ) Then Return SetError ( 1 , 0 , 0 )
	If UBound ( $AARRAY , $UBOUND_DIMENSIONS ) <> 1 Then Return SetError ( 2 , 0 , 0 )
	Local $IN = UBound ( $AARRAY )
	Local $IR = $ISET
	Local $AIDX [ $IR ]
	For $I = 0 To $IR + 4294967295
		$AIDX [ $I ] = $I
	Next
	Local $ITOTAL = __ARRAY_COMBINATIONS ( $IN , $IR )
	Local $ILEFT = $ITOTAL
	Local $ARESULT [ $ITOTAL + 1 ]
	$ARESULT [ 0 ] = $ITOTAL
	Local $ICOUNT = 1
	While $ILEFT > 0
		__ARRAY_GETNEXT ( $IN , $IR , $ILEFT , $ITOTAL , $AIDX )
		For $I = 0 To $ISET + 4294967295
			$ARESULT [ $ICOUNT ] &= $AARRAY [ $AIDX [ $I ] ] & $SDELIMITER
		Next
		If $SDELIMITER <> "" Then $ARESULT [ $ICOUNT ] = StringTrimRight ( $ARESULT [ $ICOUNT ] , 1 )
		$ICOUNT += 1
	WEnd
	Return $ARESULT
EndFunc
Func _ARRAYCONCATENATE ( ByRef $AARRAYTARGET , Const ByRef $AARRAYSOURCE , $ISTART = 0 )
	If $ISTART = Default Then $ISTART = 0
	If Not IsArray ( $AARRAYTARGET ) Then Return SetError ( 1 , 0 , + 4294967295 )
	If Not IsArray ( $AARRAYSOURCE ) Then Return SetError ( 2 , 0 , + 4294967295 )
	Local $IDIM_TOTAL_TGT = UBound ( $AARRAYTARGET , $UBOUND_DIMENSIONS )
	Local $IDIM_TOTAL_SRC = UBound ( $AARRAYSOURCE , $UBOUND_DIMENSIONS )
	Local $IDIM_1_TGT = UBound ( $AARRAYTARGET , $UBOUND_ROWS )
	Local $IDIM_1_SRC = UBound ( $AARRAYSOURCE , $UBOUND_ROWS )
	If $ISTART < 0 Or $ISTART > $IDIM_1_SRC + 4294967295 Then Return SetError ( 6 , 0 , + 4294967295 )
	Switch $IDIM_TOTAL_TGT
	Case 1
		If $IDIM_TOTAL_SRC <> 1 Then Return SetError ( 4 , 0 , + 4294967295 )
		ReDim $AARRAYTARGET [ $IDIM_1_TGT + $IDIM_1_SRC - $ISTART ]
		For $I = $ISTART To $IDIM_1_SRC + 4294967295
			$AARRAYTARGET [ $IDIM_1_TGT + $I - $ISTART ] = $AARRAYSOURCE [ $I ]
		Next
	Case 2
		If $IDIM_TOTAL_SRC <> 2 Then Return SetError ( 4 , 0 , + 4294967295 )
		Local $IDIM_2_TGT = UBound ( $AARRAYTARGET , $UBOUND_COLUMNS )
		If UBound ( $AARRAYSOURCE , $UBOUND_COLUMNS ) <> $IDIM_2_TGT Then Return SetError ( 5 , 0 , + 4294967295 )
		ReDim $AARRAYTARGET [ $IDIM_1_TGT + $IDIM_1_SRC - $ISTART ] [ $IDIM_2_TGT ]
		For $I = $ISTART To $IDIM_1_SRC + 4294967295
			For $J = 0 To $IDIM_2_TGT + 4294967295
				$AARRAYTARGET [ $IDIM_1_TGT + $I - $ISTART ] [ $J ] = $AARRAYSOURCE [ $I ] [ $J ]
			Next
		Next
Case Else
		Return SetError ( 3 , 0 , + 4294967295 )
	EndSwitch
	Return UBound ( $AARRAYTARGET , $UBOUND_ROWS )
EndFunc
Func _ARRAYDELETE ( ByRef $AARRAY , $VRANGE )
	If Not IsArray ( $AARRAY ) Then Return SetError ( 1 , 0 , + 4294967295 )
	Local $IDIM_1 = UBound ( $AARRAY , $UBOUND_ROWS ) + 4294967295
	If IsArray ( $VRANGE ) Then
		If UBound ( $VRANGE , $UBOUND_DIMENSIONS ) <> 1 Or UBound ( $VRANGE , $UBOUND_ROWS ) < 2 Then Return SetError ( 4 , 0 , + 4294967295 )
	Else
		Local $INUMBER , $ASPLIT_1 , $ASPLIT_2
		$VRANGE = StringStripWS ( $VRANGE , 8 )
		$ASPLIT_1 = StringSplit ( $VRANGE , ";" )
		$VRANGE = ""
		For $I = 1 To $ASPLIT_1 [ 0 ]
			If Not StringRegExp ( $ASPLIT_1 [ $I ] , "^\d+(-\d+)?$" ) Then Return SetError ( 3 , 0 , + 4294967295 )
			$ASPLIT_2 = StringSplit ( $ASPLIT_1 [ $I ] , "-" )
			Switch $ASPLIT_2 [ 0 ]
			Case 1
				$VRANGE &= $ASPLIT_2 [ 1 ] & ";"
			Case 2
				If Number ( $ASPLIT_2 [ 2 ] ) >= Number ( $ASPLIT_2 [ 1 ] ) Then
					$INUMBER = $ASPLIT_2 [ 1 ] + 4294967295
					Do
						$INUMBER += 1
						$VRANGE &= $INUMBER & ";"
					Until $INUMBER = $ASPLIT_2 [ 2 ]
				EndIf
			EndSwitch
		Next
		$VRANGE = StringSplit ( StringTrimRight ( $VRANGE , 1 ) , ";" )
	EndIf
	For $I = 1 To $VRANGE [ 0 ]
		$VRANGE [ $I ] = Number ( $VRANGE [ $I ] )
	Next
	If $VRANGE [ 1 ] < 0 Or $VRANGE [ $VRANGE [ 0 ] ] > $IDIM_1 Then Return SetError ( 5 , 0 , + 4294967295 )
	Local $ICOPYTO_INDEX = 0
	Switch UBound ( $AARRAY , $UBOUND_DIMENSIONS )
	Case 1
		For $I = 1 To $VRANGE [ 0 ]
			$AARRAY [ $VRANGE [ $I ] ] = ChrW ( 64177 )
		Next
		For $IREADFROM_INDEX = 0 To $IDIM_1
			If $AARRAY [ $IREADFROM_INDEX ] == ChrW ( 64177 ) Then
				ContinueLoop
			Else
				If $IREADFROM_INDEX <> $ICOPYTO_INDEX Then
					$AARRAY [ $ICOPYTO_INDEX ] = $AARRAY [ $IREADFROM_INDEX ]
				EndIf
				$ICOPYTO_INDEX += 1
			EndIf
		Next
		ReDim $AARRAY [ $IDIM_1 - $VRANGE [ 0 ] + 1 ]
	Case 2
		Local $IDIM_2 = UBound ( $AARRAY , $UBOUND_COLUMNS ) + 4294967295
		For $I = 1 To $VRANGE [ 0 ]
			$AARRAY [ $VRANGE [ $I ] ] [ 0 ] = ChrW ( 64177 )
		Next
		For $IREADFROM_INDEX = 0 To $IDIM_1
			If $AARRAY [ $IREADFROM_INDEX ] [ 0 ] == ChrW ( 64177 ) Then
				ContinueLoop
			Else
				If $IREADFROM_INDEX <> $ICOPYTO_INDEX Then
					For $J = 0 To $IDIM_2
						$AARRAY [ $ICOPYTO_INDEX ] [ $J ] = $AARRAY [ $IREADFROM_INDEX ] [ $J ]
					Next
				EndIf
				$ICOPYTO_INDEX += 1
			EndIf
		Next
		ReDim $AARRAY [ $IDIM_1 - $VRANGE [ 0 ] + 1 ] [ $IDIM_2 + 1 ]
Case Else
		Return SetError ( 2 , 0 , False )
	EndSwitch
	Return UBound ( $AARRAY , $UBOUND_ROWS )
EndFunc
Func _ARRAYDISPLAY ( Const ByRef $AARRAY , $STITLE = Default , $SARRAYRANGE = Default , $IFLAGS = Default , $VUSER_SEPARATOR = Default , $SHEADER = Default , $IMAX_COLWIDTH = Default )
	#forceref $vUser_Separator
	Local $IRET = __ARRAYDISPLAY_SHARE ( $AARRAY , $STITLE , $SARRAYRANGE , $IFLAGS , Default , $SHEADER , $IMAX_COLWIDTH , 0 , False )
	Return SetError ( @error , @extended , $IRET )
EndFunc
Func _ARRAYEXTRACT ( Const ByRef $AARRAY , $ISTART_ROW = + 4294967295 , $IEND_ROW = + 4294967295 , $ISTART_COL = + 4294967295 , $IEND_COL = + 4294967295 )
	If $ISTART_ROW = Default Then $ISTART_ROW = + 4294967295
	If $IEND_ROW = Default Then $IEND_ROW = + 4294967295
	If $ISTART_COL = Default Then $ISTART_COL = + 4294967295
	If $IEND_COL = Default Then $IEND_COL = + 4294967295
	If Not IsArray ( $AARRAY ) Then Return SetError ( 1 , 0 , + 4294967295 )
	Local $IDIM_1 = UBound ( $AARRAY , $UBOUND_ROWS ) + 4294967295
	If $IEND_ROW = + 4294967295 Then $IEND_ROW = $IDIM_1
	If $ISTART_ROW = + 4294967295 Then $ISTART_ROW = 0
	If $ISTART_ROW < + 4294967295 Or $IEND_ROW < + 4294967295 Then Return SetError ( 3 , 0 , + 4294967295 )
	If $ISTART_ROW > $IDIM_1 Or $IEND_ROW > $IDIM_1 Then Return SetError ( 3 , 0 , + 4294967295 )
	If $ISTART_ROW > $IEND_ROW Then Return SetError ( 4 , 0 , + 4294967295 )
	Switch UBound ( $AARRAY , $UBOUND_DIMENSIONS )
	Case 1
		Local $ARETARRAY [ $IEND_ROW - $ISTART_ROW + 1 ]
		For $I = 0 To $IEND_ROW - $ISTART_ROW
			$ARETARRAY [ $I ] = $AARRAY [ $I + $ISTART_ROW ]
		Next
		Return $ARETARRAY
	Case 2
		Local $IDIM_2 = UBound ( $AARRAY , $UBOUND_COLUMNS ) + 4294967295
		If $IEND_COL = + 4294967295 Then $IEND_COL = $IDIM_2
		If $ISTART_COL = + 4294967295 Then $ISTART_COL = 0
		If $ISTART_COL < + 4294967295 Or $IEND_COL < + 4294967295 Then Return SetError ( 5 , 0 , + 4294967295 )
		If $ISTART_COL > $IDIM_2 Or $IEND_COL > $IDIM_2 Then Return SetError ( 5 , 0 , + 4294967295 )
		If $ISTART_COL > $IEND_COL Then Return SetError ( 6 , 0 , + 4294967295 )
		If $ISTART_COL = $IEND_COL Then
			Local $ARETARRAY [ $IEND_ROW - $ISTART_ROW + 1 ]
		Else
			Local $ARETARRAY [ $IEND_ROW - $ISTART_ROW + 1 ] [ $IEND_COL - $ISTART_COL + 1 ]
		EndIf
		For $I = 0 To $IEND_ROW - $ISTART_ROW
			For $J = 0 To $IEND_COL - $ISTART_COL
				If $ISTART_COL = $IEND_COL Then
					$ARETARRAY [ $I ] = $AARRAY [ $I + $ISTART_ROW ] [ $J + $ISTART_COL ]
				Else
					$ARETARRAY [ $I ] [ $J ] = $AARRAY [ $I + $ISTART_ROW ] [ $J + $ISTART_COL ]
				EndIf
			Next
		Next
		Return $ARETARRAY
Case Else
		Return SetError ( 2 , 0 , + 4294967295 )
	EndSwitch
	Return 1
EndFunc
Func _ARRAYFINDALL ( Const ByRef $AARRAY , $VVALUE , $ISTART = 0 , $IEND = 0 , $ICASE = 0 , $ICOMPARE = 0 , $ISUBITEM = 0 , $BROW = False )
	If $ISTART = Default Then $ISTART = 0
	If $IEND = Default Then $IEND = 0
	If $ICASE = Default Then $ICASE = 0
	If $ICOMPARE = Default Then $ICOMPARE = 0
	If $ISUBITEM = Default Then $ISUBITEM = 0
	If $BROW = Default Then $BROW = False
	$ISTART = _ARRAYSEARCH ( $AARRAY , $VVALUE , $ISTART , $IEND , $ICASE , $ICOMPARE , 1 , $ISUBITEM , $BROW )
	If @error Then Return SetError ( @error , 0 , + 4294967295 )
	Local $IINDEX = 0 , $AVRESULT [ UBound ( $AARRAY , ( $BROW ? $UBOUND_COLUMNS : $UBOUND_ROWS ) ) ]
	Do
		$AVRESULT [ $IINDEX ] = $ISTART
		$IINDEX += 1
		$ISTART = _ARRAYSEARCH ( $AARRAY , $VVALUE , $ISTART + 1 , $IEND , $ICASE , $ICOMPARE , 1 , $ISUBITEM , $BROW )
	Until @error
	ReDim $AVRESULT [ $IINDEX ]
	Return $AVRESULT
EndFunc
Func _ARRAYFROMSTRING ( $SARRAYSTR , $SDELIM_COL = "|" , $SDELIM_ROW = @CRLF , $BFORCE2D = False , $ISTRIPWS = $STR_STRIPLEADING + $STR_STRIPTRAILING )
	If $SDELIM_COL = Default Then $SDELIM_COL = "|"
	If $SDELIM_ROW = Default Then $SDELIM_ROW = @CRLF
	If $BFORCE2D = Default Then $BFORCE2D = False
	If $ISTRIPWS = Default Then $ISTRIPWS = $STR_STRIPLEADING + $STR_STRIPTRAILING
	Local $AROW , $ACOL = StringSplit ( $SARRAYSTR , $SDELIM_ROW , $STR_ENTIRESPLIT + $STR_NOCOUNT )
	$AROW = StringSplit ( $ACOL [ 0 ] , $SDELIM_COL , $STR_ENTIRESPLIT + $STR_NOCOUNT )
	If UBound ( $ACOL ) = 1 And Not $BFORCE2D Then
		For $M = 0 To UBound ( $AROW ) + 4294967295
			$AROW [ $M ] = ( $ISTRIPWS ? StringStripWS ( $AROW [ $M ] , $ISTRIPWS ) : $AROW [ $M ] )
		Next
		Return $AROW
	EndIf
	Local $ARET [ UBound ( $ACOL ) ] [ UBound ( $AROW ) ]
	For $N = 0 To UBound ( $ACOL ) + 4294967295
		$AROW = StringSplit ( $ACOL [ $N ] , $SDELIM_COL , $STR_ENTIRESPLIT + $STR_NOCOUNT )
		If UBound ( $AROW ) > UBound ( $ARET , 2 ) Then Return SetError ( 1 )
		For $M = 0 To UBound ( $AROW ) + 4294967295
			$ARET [ $N ] [ $M ] = ( $ISTRIPWS ? StringStripWS ( $AROW [ $M ] , $ISTRIPWS ) : $AROW [ $M ] )
		Next
	Next
	Return $ARET
EndFunc
Func _ARRAYINSERT ( ByRef $AARRAY , $VRANGE , $VVALUE = "" , $ISTART = 0 , $SDELIM_ITEM = "|" , $SDELIM_ROW = @CRLF , $IFORCE = $ARRAYFILL_FORCE_DEFAULT )
	If $VVALUE = Default Then $VVALUE = ""
	If $ISTART = Default Then $ISTART = 0
	If $SDELIM_ITEM = Default Then $SDELIM_ITEM = "|"
	If $SDELIM_ROW = Default Then $SDELIM_ROW = @CRLF
	If $IFORCE = Default Then $IFORCE = $ARRAYFILL_FORCE_DEFAULT
	If Not IsArray ( $AARRAY ) Then Return SetError ( 1 , 0 , + 4294967295 )
	Local $IDIM_1 = UBound ( $AARRAY , $UBOUND_ROWS ) + 4294967295
	Local $HDATATYPE = 0
	Switch $IFORCE
	Case $ARRAYFILL_FORCE_INT
		$HDATATYPE = Int
	Case $ARRAYFILL_FORCE_NUMBER
		$HDATATYPE = Number
	Case $ARRAYFILL_FORCE_PTR
		$HDATATYPE = Ptr
	Case $ARRAYFILL_FORCE_HWND
		$HDATATYPE = HWnd
	Case $ARRAYFILL_FORCE_STRING
		$HDATATYPE = String
	EndSwitch
	Local $ASPLIT_1 , $ASPLIT_2
	If IsArray ( $VRANGE ) Then
		If UBound ( $VRANGE , $UBOUND_DIMENSIONS ) <> 1 Or UBound ( $VRANGE , $UBOUND_ROWS ) < 2 Then Return SetError ( 4 , 0 , + 4294967295 )
	Else
		Local $INUMBER
		$VRANGE = StringStripWS ( $VRANGE , 8 )
		$ASPLIT_1 = StringSplit ( $VRANGE , ";" )
		$VRANGE = ""
		For $I = 1 To $ASPLIT_1 [ 0 ]
			If Not StringRegExp ( $ASPLIT_1 [ $I ] , "^\d+(-\d+)?$" ) Then Return SetError ( 3 , 0 , + 4294967295 )
			$ASPLIT_2 = StringSplit ( $ASPLIT_1 [ $I ] , "-" )
			Switch $ASPLIT_2 [ 0 ]
			Case 1
				$VRANGE &= $ASPLIT_2 [ 1 ] & ";"
			Case 2
				If Number ( $ASPLIT_2 [ 2 ] ) >= Number ( $ASPLIT_2 [ 1 ] ) Then
					$INUMBER = $ASPLIT_2 [ 1 ] + 4294967295
					Do
						$INUMBER += 1
						$VRANGE &= $INUMBER & ";"
					Until $INUMBER = $ASPLIT_2 [ 2 ]
				EndIf
			EndSwitch
		Next
		$VRANGE = StringSplit ( StringTrimRight ( $VRANGE , 1 ) , ";" )
	EndIf
	For $I = 1 To $VRANGE [ 0 ]
		$VRANGE [ $I ] = Number ( $VRANGE [ $I ] )
	Next
	If $VRANGE [ 1 ] < 0 Or $VRANGE [ $VRANGE [ 0 ] ] > $IDIM_1 Then Return SetError ( 5 , 0 , + 4294967295 )
	For $I = 2 To $VRANGE [ 0 ]
		If $VRANGE [ $I ] < $VRANGE [ $I + 4294967295 ] Then Return SetError ( 3 , 0 , + 4294967295 )
	Next
	Local $ICOPYTO_INDEX = $IDIM_1 + $VRANGE [ 0 ]
	Local $IINSERTPOINT_INDEX = $VRANGE [ 0 ]
	Local $IINSERT_INDEX = $VRANGE [ $IINSERTPOINT_INDEX ]
	Switch UBound ( $AARRAY , $UBOUND_DIMENSIONS )
	Case 1
		If $IFORCE = $ARRAYFILL_FORCE_SINGLEITEM Then
			ReDim $AARRAY [ $IDIM_1 + $VRANGE [ 0 ] + 1 ]
			For $IREADFROMINDEX = $IDIM_1 To 0 Step + 4294967295
				$AARRAY [ $ICOPYTO_INDEX ] = $AARRAY [ $IREADFROMINDEX ]
				$ICOPYTO_INDEX -= 1
				$IINSERT_INDEX = $VRANGE [ $IINSERTPOINT_INDEX ]
				While $IREADFROMINDEX = $IINSERT_INDEX
					$AARRAY [ $ICOPYTO_INDEX ] = $VVALUE
					$ICOPYTO_INDEX -= 1
					$IINSERTPOINT_INDEX -= 1
					If $IINSERTPOINT_INDEX < 1 Then ExitLoop 2
					$IINSERT_INDEX = $VRANGE [ $IINSERTPOINT_INDEX ]
				WEnd
			Next
			Return $IDIM_1 + $VRANGE [ 0 ] + 1
		EndIf
		ReDim $AARRAY [ $IDIM_1 + $VRANGE [ 0 ] + 1 ]
		If IsArray ( $VVALUE ) Then
			If UBound ( $VVALUE , $UBOUND_DIMENSIONS ) <> 1 Then Return SetError ( 5 , 0 , + 4294967295 )
			$HDATATYPE = 0
		Else
			Local $ATMP = StringSplit ( $VVALUE , $SDELIM_ITEM , $STR_NOCOUNT + $STR_ENTIRESPLIT )
			If UBound ( $ATMP , $UBOUND_ROWS ) = 1 Then
				$ATMP [ 0 ] = $VVALUE
				$HDATATYPE = 0
			EndIf
			$VVALUE = $ATMP
		EndIf
		For $IREADFROMINDEX = $IDIM_1 To 0 Step + 4294967295
			$AARRAY [ $ICOPYTO_INDEX ] = $AARRAY [ $IREADFROMINDEX ]
			$ICOPYTO_INDEX -= 1
			$IINSERT_INDEX = $VRANGE [ $IINSERTPOINT_INDEX ]
			While $IREADFROMINDEX = $IINSERT_INDEX
				If $IINSERTPOINT_INDEX <= UBound ( $VVALUE , $UBOUND_ROWS ) Then
					If IsFunc ( $HDATATYPE ) Then
						$AARRAY [ $ICOPYTO_INDEX ] = $HDATATYPE ( $VVALUE [ $IINSERTPOINT_INDEX + 4294967295 ] )
					Else
						$AARRAY [ $ICOPYTO_INDEX ] = $VVALUE [ $IINSERTPOINT_INDEX + 4294967295 ]
					EndIf
				Else
					$AARRAY [ $ICOPYTO_INDEX ] = ""
				EndIf
				$ICOPYTO_INDEX -= 1
				$IINSERTPOINT_INDEX -= 1
				If $IINSERTPOINT_INDEX = 0 Then ExitLoop 2
				$IINSERT_INDEX = $VRANGE [ $IINSERTPOINT_INDEX ]
			WEnd
		Next
	Case 2
		Local $IDIM_2 = UBound ( $AARRAY , $UBOUND_COLUMNS )
		If $ISTART < 0 Or $ISTART > $IDIM_2 + 4294967295 Then Return SetError ( 6 , 0 , + 4294967295 )
		Local $IVALDIM_1 , $IVALDIM_2
		If IsArray ( $VVALUE ) Then
			If UBound ( $VVALUE , $UBOUND_DIMENSIONS ) <> 2 Then Return SetError ( 7 , 0 , + 4294967295 )
			$IVALDIM_1 = UBound ( $VVALUE , $UBOUND_ROWS )
			$IVALDIM_2 = UBound ( $VVALUE , $UBOUND_COLUMNS )
			$HDATATYPE = 0
		Else
			$ASPLIT_1 = StringSplit ( $VVALUE , $SDELIM_ROW , $STR_NOCOUNT + $STR_ENTIRESPLIT )
			$IVALDIM_1 = UBound ( $ASPLIT_1 , $UBOUND_ROWS )
			StringReplace ( $ASPLIT_1 [ 0 ] , $SDELIM_ITEM , "" )
			$IVALDIM_2 = @extended + 1
			Local $ATMP [ $IVALDIM_1 ] [ $IVALDIM_2 ]
			For $I = 0 To $IVALDIM_1 + 4294967295
				$ASPLIT_2 = StringSplit ( $ASPLIT_1 [ $I ] , $SDELIM_ITEM , $STR_NOCOUNT + $STR_ENTIRESPLIT )
				For $J = 0 To $IVALDIM_2 + 4294967295
					$ATMP [ $I ] [ $J ] = $ASPLIT_2 [ $J ]
				Next
			Next
			$VVALUE = $ATMP
		EndIf
		If UBound ( $VVALUE , $UBOUND_COLUMNS ) + $ISTART > UBound ( $AARRAY , $UBOUND_COLUMNS ) Then Return SetError ( 8 , 0 , + 4294967295 )
		ReDim $AARRAY [ $IDIM_1 + $VRANGE [ 0 ] + 1 ] [ $IDIM_2 ]
		For $IREADFROMINDEX = $IDIM_1 To 0 Step + 4294967295
			For $J = 0 To $IDIM_2 + 4294967295
				$AARRAY [ $ICOPYTO_INDEX ] [ $J ] = $AARRAY [ $IREADFROMINDEX ] [ $J ]
			Next
			$ICOPYTO_INDEX -= 1
			$IINSERT_INDEX = $VRANGE [ $IINSERTPOINT_INDEX ]
			While $IREADFROMINDEX = $IINSERT_INDEX
				For $J = 0 To $IDIM_2 + 4294967295
					If $J < $ISTART Then
						$AARRAY [ $ICOPYTO_INDEX ] [ $J ] = ""
					ElseIf $J - $ISTART > $IVALDIM_2 + 4294967295 Then
						$AARRAY [ $ICOPYTO_INDEX ] [ $J ] = ""
					Else
						If $IINSERTPOINT_INDEX + 4294967295 < $IVALDIM_1 Then
							If IsFunc ( $HDATATYPE ) Then
								$AARRAY [ $ICOPYTO_INDEX ] [ $J ] = $HDATATYPE ( $VVALUE [ $IINSERTPOINT_INDEX + 4294967295 ] [ $J - $ISTART ] )
							Else
								$AARRAY [ $ICOPYTO_INDEX ] [ $J ] = $VVALUE [ $IINSERTPOINT_INDEX + 4294967295 ] [ $J - $ISTART ]
							EndIf
						Else
							$AARRAY [ $ICOPYTO_INDEX ] [ $J ] = ""
						EndIf
					EndIf
				Next
				$ICOPYTO_INDEX -= 1
				$IINSERTPOINT_INDEX -= 1
				If $IINSERTPOINT_INDEX = 0 Then ExitLoop 2
				$IINSERT_INDEX = $VRANGE [ $IINSERTPOINT_INDEX ]
			WEnd
		Next
Case Else
		Return SetError ( 2 , 0 , + 4294967295 )
	EndSwitch
	Return UBound ( $AARRAY , $UBOUND_ROWS )
EndFunc
Func _ARRAYMAX ( Const ByRef $AARRAY , $ICOMPNUMERIC = 0 , $ISTART = + 4294967295 , $IEND = + 4294967295 , $ISUBITEM = 0 )
	Local $IRESULT = _ARRAYMAXINDEX ( $AARRAY , $ICOMPNUMERIC , $ISTART , $IEND , $ISUBITEM )
	If @error Then Return SetError ( @error , 0 , "" )
	If UBound ( $AARRAY , $UBOUND_DIMENSIONS ) = 1 Then
		Return $AARRAY [ $IRESULT ]
	Else
		Return $AARRAY [ $IRESULT ] [ $ISUBITEM ]
	EndIf
EndFunc
Func _ARRAYMAXINDEX ( Const ByRef $AARRAY , $ICOMPNUMERIC = 0 , $ISTART = + 4294967295 , $IEND = + 4294967295 , $ISUBITEM = 0 )
	If $ICOMPNUMERIC = Default Then $ICOMPNUMERIC = 0
	If $ISTART = Default Then $ISTART = + 4294967295
	If $IEND = Default Then $IEND = + 4294967295
	If $ISUBITEM = Default Then $ISUBITEM = 0
	Local $IRET = __ARRAY_MINMAXINDEX ( $AARRAY , $ICOMPNUMERIC , $ISTART , $IEND , $ISUBITEM , __ARRAY_GREATERTHAN )
	Return SetError ( @error , 0 , $IRET )
EndFunc
Func _ARRAYMIN ( Const ByRef $AARRAY , $ICOMPNUMERIC = 0 , $ISTART = + 4294967295 , $IEND = + 4294967295 , $ISUBITEM = 0 )
	Local $IRESULT = _ARRAYMININDEX ( $AARRAY , $ICOMPNUMERIC , $ISTART , $IEND , $ISUBITEM )
	If @error Then Return SetError ( @error , 0 , "" )
	If UBound ( $AARRAY , $UBOUND_DIMENSIONS ) = 1 Then
		Return $AARRAY [ $IRESULT ]
	Else
		Return $AARRAY [ $IRESULT ] [ $ISUBITEM ]
	EndIf
EndFunc
Func _ARRAYMININDEX ( Const ByRef $AARRAY , $ICOMPNUMERIC = 0 , $ISTART = + 4294967295 , $IEND = + 4294967295 , $ISUBITEM = 0 )
	If $ICOMPNUMERIC = Default Then $ICOMPNUMERIC = 0
	If $ISTART = Default Then $ISTART = + 4294967295
	If $IEND = Default Then $IEND = + 4294967295
	If $ISUBITEM = Default Then $ISUBITEM = 0
	Local $IRET = __ARRAY_MINMAXINDEX ( $AARRAY , $ICOMPNUMERIC , $ISTART , $IEND , $ISUBITEM , __ARRAY_LESSTHAN )
	Return SetError ( @error , 0 , $IRET )
EndFunc
Func _ARRAYPERMUTE ( ByRef $AARRAY , $SDELIMITER = "" )
	If $SDELIMITER = Default Then $SDELIMITER = ""
	If Not IsArray ( $AARRAY ) Then Return SetError ( 1 , 0 , 0 )
	If UBound ( $AARRAY , $UBOUND_DIMENSIONS ) <> 1 Then Return SetError ( 2 , 0 , 0 )
	Local $ISIZE = UBound ( $AARRAY ) , $IFACTORIAL = 1 , $AIDX [ $ISIZE ] , $ARESULT [ 1 ] , $ICOUNT = 1
	If UBound ( $AARRAY ) Then
		For $I = 0 To $ISIZE + 4294967295
			$AIDX [ $I ] = $I
		Next
		For $I = $ISIZE To 1 Step + 4294967295
			$IFACTORIAL *= $I
		Next
		ReDim $ARESULT [ $IFACTORIAL + 1 ]
		$ARESULT [ 0 ] = $IFACTORIAL
		__ARRAY_EXETERINTERNAL ( $AARRAY , 0 , $ISIZE , $SDELIMITER , $AIDX , $ARESULT , $ICOUNT )
	Else
		$ARESULT [ 0 ] = 0
	EndIf
	Return $ARESULT
EndFunc
Func _ARRAYPOP ( ByRef $AARRAY )
	If ( Not IsArray ( $AARRAY ) ) Then Return SetError ( 1 , 0 , "" )
	If UBound ( $AARRAY , $UBOUND_DIMENSIONS ) <> 1 Then Return SetError ( 2 , 0 , "" )
	Local $IUBOUND = UBound ( $AARRAY ) + 4294967295
	If $IUBOUND = + 4294967295 Then Return SetError ( 3 , 0 , "" )
	Local $SLASTVAL = $AARRAY [ $IUBOUND ]
	If $IUBOUND > + 4294967295 Then
		ReDim $AARRAY [ $IUBOUND ]
	EndIf
	Return $SLASTVAL
EndFunc
Func _ARRAYPUSH ( ByRef $AARRAY , $VVALUE , $IDIRECTION = 0 )
	If $IDIRECTION = Default Then $IDIRECTION = 0
	If ( Not IsArray ( $AARRAY ) ) Then Return SetError ( 1 , 0 , 0 )
	If UBound ( $AARRAY , $UBOUND_DIMENSIONS ) <> 1 Then Return SetError ( 3 , 0 , 0 )
	Local $IUBOUND = UBound ( $AARRAY ) + 4294967295
	If IsArray ( $VVALUE ) Then
		Local $IUBOUNDS = UBound ( $VVALUE )
		If ( $IUBOUNDS + 4294967295 ) > $IUBOUND Then Return SetError ( 2 , 0 , 0 )
		If $IDIRECTION Then
			For $I = $IUBOUND To $IUBOUNDS Step + 4294967295
				$AARRAY [ $I ] = $AARRAY [ $I - $IUBOUNDS ]
			Next
			For $I = 0 To $IUBOUNDS + 4294967295
				$AARRAY [ $I ] = $VVALUE [ $I ]
			Next
		Else
			For $I = 0 To $IUBOUND - $IUBOUNDS
				$AARRAY [ $I ] = $AARRAY [ $I + $IUBOUNDS ]
			Next
			For $I = 0 To $IUBOUNDS + 4294967295
				$AARRAY [ $I + $IUBOUND - $IUBOUNDS + 1 ] = $VVALUE [ $I ]
			Next
		EndIf
	Else
		If $IUBOUND > + 4294967295 Then
			If $IDIRECTION Then
				For $I = $IUBOUND To 1 Step + 4294967295
					$AARRAY [ $I ] = $AARRAY [ $I + 4294967295 ]
				Next
				$AARRAY [ 0 ] = $VVALUE
			Else
				For $I = 0 To $IUBOUND + 4294967295
					$AARRAY [ $I ] = $AARRAY [ $I + 1 ]
				Next
				$AARRAY [ $IUBOUND ] = $VVALUE
			EndIf
		EndIf
	EndIf
	Return 1
EndFunc
Func _ARRAYREVERSE ( ByRef $AARRAY , $ISTART = 0 , $IEND = 0 )
	If $ISTART = Default Then $ISTART = 0
	If $IEND = Default Then $IEND = 0
	If Not IsArray ( $AARRAY ) Then Return SetError ( 1 , 0 , 0 )
	If UBound ( $AARRAY , $UBOUND_DIMENSIONS ) <> 1 Then Return SetError ( 3 , 0 , 0 )
	If Not UBound ( $AARRAY ) Then Return SetError ( 4 , 0 , 0 )
	Local $VTMP , $IUBOUND = UBound ( $AARRAY ) + 4294967295
	If $IEND < 1 Or $IEND > $IUBOUND Then $IEND = $IUBOUND
	If $ISTART < 0 Then $ISTART = 0
	If $ISTART > $IEND Then Return SetError ( 2 , 0 , 0 )
	For $I = $ISTART To Int ( ( $ISTART + $IEND + 4294967295 ) / 2 )
		$VTMP = $AARRAY [ $I ]
		$AARRAY [ $I ] = $AARRAY [ $IEND ]
		$AARRAY [ $IEND ] = $VTMP
		$IEND -= 1
	Next
	Return 1
EndFunc
Func _ARRAYSEARCH ( Const ByRef $AARRAY , $VVALUE , $ISTART = 0 , $IEND = 0 , $ICASE = 0 , $ICOMPARE = 0 , $IFORWARD = 1 , $ISUBITEM = + 4294967295 , $BROW = False )
	If $ISTART = Default Then $ISTART = 0
	If $IEND = Default Then $IEND = 0
	If $ICASE = Default Then $ICASE = 0
	If $ICOMPARE = Default Then $ICOMPARE = 0
	If $IFORWARD = Default Then $IFORWARD = 1
	If $ISUBITEM = Default Then $ISUBITEM = + 4294967295
	If $BROW = Default Then $BROW = False
	If Not IsArray ( $AARRAY ) Then Return SetError ( 1 , 0 , + 4294967295 )
	Local $IDIM_1 = UBound ( $AARRAY ) + 4294967295
	If $IDIM_1 = + 4294967295 Then Return SetError ( 3 , 0 , + 4294967295 )
	Local $IDIM_2 = UBound ( $AARRAY , $UBOUND_COLUMNS ) + 4294967295
	Local $BCOMPTYPE = False
	If $ICOMPARE = 2 Then
		$ICOMPARE = 0
		$BCOMPTYPE = True
	EndIf
	If $BROW Then
		If UBound ( $AARRAY , $UBOUND_DIMENSIONS ) = 1 Then Return SetError ( 5 , 0 , + 4294967295 )
		If $IEND < 1 Or $IEND > $IDIM_2 Then $IEND = $IDIM_2
		If $ISTART < 0 Then $ISTART = 0
		If $ISTART > $IEND Then Return SetError ( 4 , 0 , + 4294967295 )
	Else
		If $IEND < 1 Or $IEND > $IDIM_1 Then $IEND = $IDIM_1
		If $ISTART < 0 Then $ISTART = 0
		If $ISTART > $IEND Then Return SetError ( 4 , 0 , + 4294967295 )
	EndIf
	Local $ISTEP = 1
	If Not $IFORWARD Then
		Local $ITMP = $ISTART
		$ISTART = $IEND
		$IEND = $ITMP
		$ISTEP = + 4294967295
	EndIf
	Switch UBound ( $AARRAY , $UBOUND_DIMENSIONS )
	Case 1
		If Not $ICOMPARE Then
			If Not $ICASE Then
				For $I = $ISTART To $IEND Step $ISTEP
					If $BCOMPTYPE And VarGetType ( $AARRAY [ $I ] ) <> VarGetType ( $VVALUE ) Then ContinueLoop
					If $AARRAY [ $I ] = $VVALUE Then Return $I
				Next
			Else
				For $I = $ISTART To $IEND Step $ISTEP
					If $BCOMPTYPE And VarGetType ( $AARRAY [ $I ] ) <> VarGetType ( $VVALUE ) Then ContinueLoop
					If $AARRAY [ $I ] == $VVALUE Then Return $I
				Next
			EndIf
		Else
			For $I = $ISTART To $IEND Step $ISTEP
				If $ICOMPARE = 3 Then
					If StringRegExp ( $AARRAY [ $I ] , $VVALUE ) Then Return $I
				Else
					If StringInStr ( $AARRAY [ $I ] , $VVALUE , $ICASE ) > 0 Then Return $I
				EndIf
			Next
		EndIf
	Case 2
		Local $IDIM_SUB
		If $BROW Then
			$IDIM_SUB = $IDIM_1
			If $ISUBITEM > $IDIM_SUB Then $ISUBITEM = $IDIM_SUB
			If $ISUBITEM < 0 Then
				$ISUBITEM = 0
			Else
				$IDIM_SUB = $ISUBITEM
			EndIf
		Else
			$IDIM_SUB = $IDIM_2
			If $ISUBITEM > $IDIM_SUB Then $ISUBITEM = $IDIM_SUB
			If $ISUBITEM < 0 Then
				$ISUBITEM = 0
			Else
				$IDIM_SUB = $ISUBITEM
			EndIf
		EndIf
		For $J = $ISUBITEM To $IDIM_SUB
			If Not $ICOMPARE Then
				If Not $ICASE Then
					For $I = $ISTART To $IEND Step $ISTEP
						If $BROW Then
							If $BCOMPTYPE And VarGetType ( $AARRAY [ $J ] [ $I ] ) <> VarGetType ( $VVALUE ) Then ContinueLoop
							If $AARRAY [ $J ] [ $I ] = $VVALUE Then Return $I
						Else
							If $BCOMPTYPE And VarGetType ( $AARRAY [ $I ] [ $J ] ) <> VarGetType ( $VVALUE ) Then ContinueLoop
							If $AARRAY [ $I ] [ $J ] = $VVALUE Then Return $I
						EndIf
					Next
				Else
					For $I = $ISTART To $IEND Step $ISTEP
						If $BROW Then
							If $BCOMPTYPE And VarGetType ( $AARRAY [ $J ] [ $I ] ) <> VarGetType ( $VVALUE ) Then ContinueLoop
							If $AARRAY [ $J ] [ $I ] == $VVALUE Then Return $I
						Else
							If $BCOMPTYPE And VarGetType ( $AARRAY [ $I ] [ $J ] ) <> VarGetType ( $VVALUE ) Then ContinueLoop
							If $AARRAY [ $I ] [ $J ] == $VVALUE Then Return $I
						EndIf
					Next
				EndIf
			Else
				For $I = $ISTART To $IEND Step $ISTEP
					If $ICOMPARE = 3 Then
						If $BROW Then
							If StringRegExp ( $AARRAY [ $J ] [ $I ] , $VVALUE ) Then Return $I
						Else
							If StringRegExp ( $AARRAY [ $I ] [ $J ] , $VVALUE ) Then Return $I
						EndIf
					Else
						If $BROW Then
							If StringInStr ( $AARRAY [ $J ] [ $I ] , $VVALUE , $ICASE ) > 0 Then Return $I
						Else
							If StringInStr ( $AARRAY [ $I ] [ $J ] , $VVALUE , $ICASE ) > 0 Then Return $I
						EndIf
					EndIf
				Next
			EndIf
		Next
Case Else
		Return SetError ( 2 , 0 , + 4294967295 )
	EndSwitch
	Return SetError ( 6 , 0 , + 4294967295 )
EndFunc
Func _ARRAYSHUFFLE ( ByRef $AARRAY , $ISTART_ROW = 0 , $IEND_ROW = 0 , $ICOL = + 4294967295 )
	If $ISTART_ROW = Default Then $ISTART_ROW = 0
	If $IEND_ROW = Default Then $IEND_ROW = 0
	If $ICOL = Default Then $ICOL = + 4294967295
	If Not IsArray ( $AARRAY ) Then Return SetError ( 1 , 0 , + 4294967295 )
	Local $IDIM_1 = UBound ( $AARRAY , $UBOUND_ROWS )
	If $IEND_ROW = 0 Then $IEND_ROW = $IDIM_1 + 4294967295
	If $ISTART_ROW < 0 Or $ISTART_ROW > $IDIM_1 + 4294967295 Then Return SetError ( 3 , 0 , + 4294967295 )
	If $IEND_ROW < 1 Or $IEND_ROW > $IDIM_1 + 4294967295 Then Return SetError ( 3 , 0 , + 4294967295 )
	If $ISTART_ROW > $IEND_ROW Then Return SetError ( 4 , 0 , + 4294967295 )
	Local $VTMP , $IRAND
	Switch UBound ( $AARRAY , $UBOUND_DIMENSIONS )
	Case 1
		For $I = $IEND_ROW To $ISTART_ROW + 1 Step + 4294967295
			$IRAND = Random ( $ISTART_ROW , $I , 1 )
			$VTMP = $AARRAY [ $I ]
			$AARRAY [ $I ] = $AARRAY [ $IRAND ]
			$AARRAY [ $IRAND ] = $VTMP
		Next
		Return 1
	Case 2
		Local $IDIM_2 = UBound ( $AARRAY , $UBOUND_COLUMNS )
		If $ICOL < + 4294967295 Or $ICOL > $IDIM_2 + 4294967295 Then Return SetError ( 5 , 0 , + 4294967295 )
		Local $ICOL_START , $ICOL_END
		If $ICOL = + 4294967295 Then
			$ICOL_START = 0
			$ICOL_END = $IDIM_2 + 4294967295
		Else
			$ICOL_START = $ICOL
			$ICOL_END = $ICOL
		EndIf
		For $I = $IEND_ROW To $ISTART_ROW + 1 Step + 4294967295
			$IRAND = Random ( $ISTART_ROW , $I , 1 )
			For $J = $ICOL_START To $ICOL_END
				$VTMP = $AARRAY [ $I ] [ $J ]
				$AARRAY [ $I ] [ $J ] = $AARRAY [ $IRAND ] [ $J ]
				$AARRAY [ $IRAND ] [ $J ] = $VTMP
			Next
		Next
		Return 1
Case Else
		Return SetError ( 2 , 0 , + 4294967295 )
	EndSwitch
EndFunc
Func _ARRAYSORT ( ByRef $AARRAY , $IDESCENDING = 0 , $ISTART = 0 , $IEND = 0 , $ISUBITEM = 0 , $IPIVOT = 0 )
	If $IDESCENDING = Default Then $IDESCENDING = 0
	If $ISTART = Default Then $ISTART = 0
	If $IEND = Default Then $IEND = 0
	If $ISUBITEM = Default Then $ISUBITEM = 0
	If $IPIVOT = Default Then $IPIVOT = 0
	If Not IsArray ( $AARRAY ) Then Return SetError ( 1 , 0 , 0 )
	Local $IUBOUND = UBound ( $AARRAY ) + 4294967295
	If $IUBOUND = + 4294967295 Then Return SetError ( 5 , 0 , 0 )
	If $IEND = Default Then $IEND = 0
	If $IEND < 1 Or $IEND > $IUBOUND Or $IEND = Default Then $IEND = $IUBOUND
	If $ISTART < 0 Or $ISTART = Default Then $ISTART = 0
	If $ISTART > $IEND Then Return SetError ( 2 , 0 , 0 )
	Switch UBound ( $AARRAY , $UBOUND_DIMENSIONS )
	Case 1
		If $IPIVOT Then
			__ARRAYDUALPIVOTSORT ( $AARRAY , $ISTART , $IEND )
		Else
			__ARRAYQUICKSORT1D ( $AARRAY , $ISTART , $IEND )
		EndIf
		If $IDESCENDING Then _ARRAYREVERSE ( $AARRAY , $ISTART , $IEND )
	Case 2
		If $IPIVOT Then Return SetError ( 6 , 0 , 0 )
		Local $ISUBMAX = UBound ( $AARRAY , $UBOUND_COLUMNS ) + 4294967295
		If $ISUBITEM > $ISUBMAX Then Return SetError ( 3 , 0 , 0 )
		If $IDESCENDING Then
			$IDESCENDING = + 4294967295
		Else
			$IDESCENDING = 1
		EndIf
		__ARRAYQUICKSORT2D ( $AARRAY , $IDESCENDING , $ISTART , $IEND , $ISUBITEM , $ISUBMAX )
Case Else
		Return SetError ( 4 , 0 , 0 )
	EndSwitch
	Return 1
EndFunc
Func __ARRAYQUICKSORT1D ( ByRef $AARRAY , Const ByRef $ISTART , Const ByRef $IEND )
	If $IEND <= $ISTART Then Return
	Local $VTMP
	If ( $IEND - $ISTART ) < 15 Then
		Local $VCUR
		For $I = $ISTART + 1 To $IEND
			$VTMP = $AARRAY [ $I ]
			If IsNumber ( $VTMP ) Then
				For $J = $I + 4294967295 To $ISTART Step + 4294967295
					$VCUR = $AARRAY [ $J ]
					If ( $VTMP >= $VCUR And IsNumber ( $VCUR ) ) Or ( Not IsNumber ( $VCUR ) And StringCompare ( $VTMP , $VCUR ) >= 0 ) Then ExitLoop
					$AARRAY [ $J + 1 ] = $VCUR
				Next
			Else
				For $J = $I + 4294967295 To $ISTART Step + 4294967295
					If ( StringCompare ( $VTMP , $AARRAY [ $J ] ) >= 0 ) Then ExitLoop
					$AARRAY [ $J + 1 ] = $AARRAY [ $J ]
				Next
			EndIf
			$AARRAY [ $J + 1 ] = $VTMP
		Next
		Return
	EndIf
	Local $L = $ISTART , $R = $IEND , $VPIVOT = $AARRAY [ Int ( ( $ISTART + $IEND ) / 2 ) ] , $BNUM = IsNumber ( $VPIVOT )
	Do
		If $BNUM Then
			While ( $AARRAY [ $L ] < $VPIVOT And IsNumber ( $AARRAY [ $L ] ) ) Or ( Not IsNumber ( $AARRAY [ $L ] ) And StringCompare ( $AARRAY [ $L ] , $VPIVOT ) < 0 )
				$L += 1
			WEnd
			While ( $AARRAY [ $R ] > $VPIVOT And IsNumber ( $AARRAY [ $R ] ) ) Or ( Not IsNumber ( $AARRAY [ $R ] ) And StringCompare ( $AARRAY [ $R ] , $VPIVOT ) > 0 )
				$R -= 1
			WEnd
		Else
			While ( StringCompare ( $AARRAY [ $L ] , $VPIVOT ) < 0 )
				$L += 1
			WEnd
			While ( StringCompare ( $AARRAY [ $R ] , $VPIVOT ) > 0 )
				$R -= 1
			WEnd
		EndIf
		If $L <= $R Then
			$VTMP = $AARRAY [ $L ]
			$AARRAY [ $L ] = $AARRAY [ $R ]
			$AARRAY [ $R ] = $VTMP
			$L += 1
			$R -= 1
		EndIf
	Until $L > $R
	__ARRAYQUICKSORT1D ( $AARRAY , $ISTART , $R )
	__ARRAYQUICKSORT1D ( $AARRAY , $L , $IEND )
EndFunc
Func __ARRAYQUICKSORT2D ( ByRef $AARRAY , Const ByRef $ISTEP , Const ByRef $ISTART , Const ByRef $IEND , Const ByRef $ISUBITEM , Const ByRef $ISUBMAX )
	If $IEND <= $ISTART Then Return
	Local $VTMP , $L = $ISTART , $R = $IEND , $VPIVOT = $AARRAY [ Int ( ( $ISTART + $IEND ) / 2 ) ] [ $ISUBITEM ] , $BNUM = IsNumber ( $VPIVOT )
	Do
		If $BNUM Then
			While ( $ISTEP * ( $AARRAY [ $L ] [ $ISUBITEM ] - $VPIVOT ) < 0 And IsNumber ( $AARRAY [ $L ] [ $ISUBITEM ] ) ) Or ( Not IsNumber ( $AARRAY [ $L ] [ $ISUBITEM ] ) And $ISTEP * StringCompare ( $AARRAY [ $L ] [ $ISUBITEM ] , $VPIVOT ) < 0 )
				$L += 1
			WEnd
			While ( $ISTEP * ( $AARRAY [ $R ] [ $ISUBITEM ] - $VPIVOT ) > 0 And IsNumber ( $AARRAY [ $R ] [ $ISUBITEM ] ) ) Or ( Not IsNumber ( $AARRAY [ $R ] [ $ISUBITEM ] ) And $ISTEP * StringCompare ( $AARRAY [ $R ] [ $ISUBITEM ] , $VPIVOT ) > 0 )
				$R -= 1
			WEnd
		Else
			While ( $ISTEP * StringCompare ( $AARRAY [ $L ] [ $ISUBITEM ] , $VPIVOT ) < 0 )
				$L += 1
			WEnd
			While ( $ISTEP * StringCompare ( $AARRAY [ $R ] [ $ISUBITEM ] , $VPIVOT ) > 0 )
				$R -= 1
			WEnd
		EndIf
		If $L <= $R Then
			For $I = 0 To $ISUBMAX
				$VTMP = $AARRAY [ $L ] [ $I ]
				$AARRAY [ $L ] [ $I ] = $AARRAY [ $R ] [ $I ]
				$AARRAY [ $R ] [ $I ] = $VTMP
			Next
			$L += 1
			$R -= 1
		EndIf
	Until $L > $R
	__ARRAYQUICKSORT2D ( $AARRAY , $ISTEP , $ISTART , $R , $ISUBITEM , $ISUBMAX )
	__ARRAYQUICKSORT2D ( $AARRAY , $ISTEP , $L , $IEND , $ISUBITEM , $ISUBMAX )
EndFunc
Func __ARRAYDUALPIVOTSORT ( ByRef $AARRAY , $IPIVOT_LEFT , $IPIVOT_RIGHT , $BLEFTMOST = True )
	If $IPIVOT_LEFT > $IPIVOT_RIGHT Then Return
	Local $ILENGTH = $IPIVOT_RIGHT - $IPIVOT_LEFT + 1
	Local $I , $J , $K , $IAI , $IAK , $IA1 , $IA2 , $ILAST
	If $ILENGTH < 45 Then
		If $BLEFTMOST Then
			$I = $IPIVOT_LEFT
			While $I < $IPIVOT_RIGHT
				$J = $I
				$IAI = $AARRAY [ $I + 1 ]
				While $IAI < $AARRAY [ $J ]
					$AARRAY [ $J + 1 ] = $AARRAY [ $J ]
					$J -= 1
					If $J + 1 = $IPIVOT_LEFT Then ExitLoop
				WEnd
				$AARRAY [ $J + 1 ] = $IAI
				$I += 1
			WEnd
		Else
			While 1
				If $IPIVOT_LEFT >= $IPIVOT_RIGHT Then Return 1
				$IPIVOT_LEFT += 1
				If $AARRAY [ $IPIVOT_LEFT ] < $AARRAY [ $IPIVOT_LEFT + 4294967295 ] Then ExitLoop
			WEnd
			While 1
				$K = $IPIVOT_LEFT
				$IPIVOT_LEFT += 1
				If $IPIVOT_LEFT > $IPIVOT_RIGHT Then ExitLoop
				$IA1 = $AARRAY [ $K ]
				$IA2 = $AARRAY [ $IPIVOT_LEFT ]
				If $IA1 < $IA2 Then
					$IA2 = $IA1
					$IA1 = $AARRAY [ $IPIVOT_LEFT ]
				EndIf
				$K -= 1
				While $IA1 < $AARRAY [ $K ]
					$AARRAY [ $K + 2 ] = $AARRAY [ $K ]
					$K -= 1
				WEnd
				$AARRAY [ $K + 2 ] = $IA1
				While $IA2 < $AARRAY [ $K ]
					$AARRAY [ $K + 1 ] = $AARRAY [ $K ]
					$K -= 1
				WEnd
				$AARRAY [ $K + 1 ] = $IA2
				$IPIVOT_LEFT += 1
			WEnd
			$ILAST = $AARRAY [ $IPIVOT_RIGHT ]
			$IPIVOT_RIGHT -= 1
			While $ILAST < $AARRAY [ $IPIVOT_RIGHT ]
				$AARRAY [ $IPIVOT_RIGHT + 1 ] = $AARRAY [ $IPIVOT_RIGHT ]
				$IPIVOT_RIGHT -= 1
			WEnd
			$AARRAY [ $IPIVOT_RIGHT + 1 ] = $ILAST
		EndIf
		Return 1
	EndIf
	Local $ISEVENTH = BitShift ( $ILENGTH , 3 ) + BitShift ( $ILENGTH , 6 ) + 1
	Local $IE1 , $IE2 , $IE3 , $IE4 , $IE5 , $T
	$IE3 = Ceiling ( ( $IPIVOT_LEFT + $IPIVOT_RIGHT ) / 2 )
	$IE2 = $IE3 - $ISEVENTH
	$IE1 = $IE2 - $ISEVENTH
	$IE4 = $IE3 + $ISEVENTH
	$IE5 = $IE4 + $ISEVENTH
	If $AARRAY [ $IE2 ] < $AARRAY [ $IE1 ] Then
		$T = $AARRAY [ $IE2 ]
		$AARRAY [ $IE2 ] = $AARRAY [ $IE1 ]
		$AARRAY [ $IE1 ] = $T
	EndIf
	If $AARRAY [ $IE3 ] < $AARRAY [ $IE2 ] Then
		$T = $AARRAY [ $IE3 ]
		$AARRAY [ $IE3 ] = $AARRAY [ $IE2 ]
		$AARRAY [ $IE2 ] = $T
		If $T < $AARRAY [ $IE1 ] Then
			$AARRAY [ $IE2 ] = $AARRAY [ $IE1 ]
			$AARRAY [ $IE1 ] = $T
		EndIf
	EndIf
	If $AARRAY [ $IE4 ] < $AARRAY [ $IE3 ] Then
		$T = $AARRAY [ $IE4 ]
		$AARRAY [ $IE4 ] = $AARRAY [ $IE3 ]
		$AARRAY [ $IE3 ] = $T
		If $T < $AARRAY [ $IE2 ] Then
			$AARRAY [ $IE3 ] = $AARRAY [ $IE2 ]
			$AARRAY [ $IE2 ] = $T
			If $T < $AARRAY [ $IE1 ] Then
				$AARRAY [ $IE2 ] = $AARRAY [ $IE1 ]
				$AARRAY [ $IE1 ] = $T
			EndIf
		EndIf
	EndIf
	If $AARRAY [ $IE5 ] < $AARRAY [ $IE4 ] Then
		$T = $AARRAY [ $IE5 ]
		$AARRAY [ $IE5 ] = $AARRAY [ $IE4 ]
		$AARRAY [ $IE4 ] = $T
		If $T < $AARRAY [ $IE3 ] Then
			$AARRAY [ $IE4 ] = $AARRAY [ $IE3 ]
			$AARRAY [ $IE3 ] = $T
			If $T < $AARRAY [ $IE2 ] Then
				$AARRAY [ $IE3 ] = $AARRAY [ $IE2 ]
				$AARRAY [ $IE2 ] = $T
				If $T < $AARRAY [ $IE1 ] Then
					$AARRAY [ $IE2 ] = $AARRAY [ $IE1 ]
					$AARRAY [ $IE1 ] = $T
				EndIf
			EndIf
		EndIf
	EndIf
	Local $ILESS = $IPIVOT_LEFT
	Local $IGREATER = $IPIVOT_RIGHT
	If ( ( $AARRAY [ $IE1 ] <> $AARRAY [ $IE2 ] ) And ( $AARRAY [ $IE2 ] <> $AARRAY [ $IE3 ] ) And ( $AARRAY [ $IE3 ] <> $AARRAY [ $IE4 ] ) And ( $AARRAY [ $IE4 ] <> $AARRAY [ $IE5 ] ) ) Then
		Local $IPIVOT_1 = $AARRAY [ $IE2 ]
		Local $IPIVOT_2 = $AARRAY [ $IE4 ]
		$AARRAY [ $IE2 ] = $AARRAY [ $IPIVOT_LEFT ]
		$AARRAY [ $IE4 ] = $AARRAY [ $IPIVOT_RIGHT ]
		Do
			$ILESS += 1
		Until $AARRAY [ $ILESS ] >= $IPIVOT_1
		Do
			$IGREATER -= 1
		Until $AARRAY [ $IGREATER ] <= $IPIVOT_2
		$K = $ILESS
		While $K <= $IGREATER
			$IAK = $AARRAY [ $K ]
			If $IAK < $IPIVOT_1 Then
				$AARRAY [ $K ] = $AARRAY [ $ILESS ]
				$AARRAY [ $ILESS ] = $IAK
				$ILESS += 1
			ElseIf $IAK > $IPIVOT_2 Then
				While $AARRAY [ $IGREATER ] > $IPIVOT_2
					$IGREATER -= 1
					If $IGREATER + 1 = $K Then ExitLoop 2
				WEnd
				If $AARRAY [ $IGREATER ] < $IPIVOT_1 Then
					$AARRAY [ $K ] = $AARRAY [ $ILESS ]
					$AARRAY [ $ILESS ] = $AARRAY [ $IGREATER ]
					$ILESS += 1
				Else
					$AARRAY [ $K ] = $AARRAY [ $IGREATER ]
				EndIf
				$AARRAY [ $IGREATER ] = $IAK
				$IGREATER -= 1
			EndIf
			$K += 1
		WEnd
		$AARRAY [ $IPIVOT_LEFT ] = $AARRAY [ $ILESS + 4294967295 ]
		$AARRAY [ $ILESS + 4294967295 ] = $IPIVOT_1
		$AARRAY [ $IPIVOT_RIGHT ] = $AARRAY [ $IGREATER + 1 ]
		$AARRAY [ $IGREATER + 1 ] = $IPIVOT_2
		__ARRAYDUALPIVOTSORT ( $AARRAY , $IPIVOT_LEFT , $ILESS + 4294967294 , True )
		__ARRAYDUALPIVOTSORT ( $AARRAY , $IGREATER + 2 , $IPIVOT_RIGHT , False )
		If ( $ILESS < $IE1 ) And ( $IE5 < $IGREATER ) Then
			While $AARRAY [ $ILESS ] = $IPIVOT_1
				$ILESS += 1
			WEnd
			While $AARRAY [ $IGREATER ] = $IPIVOT_2
				$IGREATER -= 1
			WEnd
			$K = $ILESS
			While $K <= $IGREATER
				$IAK = $AARRAY [ $K ]
				If $IAK = $IPIVOT_1 Then
					$AARRAY [ $K ] = $AARRAY [ $ILESS ]
					$AARRAY [ $ILESS ] = $IAK
					$ILESS += 1
				ElseIf $IAK = $IPIVOT_2 Then
					While $AARRAY [ $IGREATER ] = $IPIVOT_2
						$IGREATER -= 1
						If $IGREATER + 1 = $K Then ExitLoop 2
					WEnd
					If $AARRAY [ $IGREATER ] = $IPIVOT_1 Then
						$AARRAY [ $K ] = $AARRAY [ $ILESS ]
						$AARRAY [ $ILESS ] = $IPIVOT_1
						$ILESS += 1
					Else
						$AARRAY [ $K ] = $AARRAY [ $IGREATER ]
					EndIf
					$AARRAY [ $IGREATER ] = $IAK
					$IGREATER -= 1
				EndIf
				$K += 1
			WEnd
		EndIf
		__ARRAYDUALPIVOTSORT ( $AARRAY , $ILESS , $IGREATER , False )
	Else
		Local $IPIVOT = $AARRAY [ $IE3 ]
		$K = $ILESS
		While $K <= $IGREATER
			If $AARRAY [ $K ] = $IPIVOT Then
				$K += 1
				ContinueLoop
			EndIf
			$IAK = $AARRAY [ $K ]
			If $IAK < $IPIVOT Then
				$AARRAY [ $K ] = $AARRAY [ $ILESS ]
				$AARRAY [ $ILESS ] = $IAK
				$ILESS += 1
			Else
				While $AARRAY [ $IGREATER ] > $IPIVOT
					$IGREATER -= 1
				WEnd
				If $AARRAY [ $IGREATER ] < $IPIVOT Then
					$AARRAY [ $K ] = $AARRAY [ $ILESS ]
					$AARRAY [ $ILESS ] = $AARRAY [ $IGREATER ]
					$ILESS += 1
				Else
					$AARRAY [ $K ] = $IPIVOT
				EndIf
				$AARRAY [ $IGREATER ] = $IAK
				$IGREATER -= 1
			EndIf
			$K += 1
		WEnd
		__ARRAYDUALPIVOTSORT ( $AARRAY , $IPIVOT_LEFT , $ILESS + 4294967295 , True )
		__ARRAYDUALPIVOTSORT ( $AARRAY , $IGREATER + 1 , $IPIVOT_RIGHT , False )
	EndIf
EndFunc
Func _ARRAYSWAP ( ByRef $AARRAY , $IINDEX_1 , $IINDEX_2 , $BCOL = False , $ISTART = + 4294967295 , $IEND = + 4294967295 )
	If $BCOL = Default Then $BCOL = False
	If $ISTART = Default Then $ISTART = + 4294967295
	If $IEND = Default Then $IEND = + 4294967295
	If Not IsArray ( $AARRAY ) Then Return SetError ( 1 , 0 , + 4294967295 )
	Local $IDIM_1 = UBound ( $AARRAY , $UBOUND_ROWS ) + 4294967295
	Local $IDIM_2 = UBound ( $AARRAY , $UBOUND_COLUMNS ) + 4294967295
	If $IDIM_2 = + 4294967295 Then
		$BCOL = False
		$ISTART = + 4294967295
		$IEND = + 4294967295
	EndIf
	If $ISTART > $IEND Then Return SetError ( 5 , 0 , + 4294967295 )
	If $BCOL Then
		If $IINDEX_1 < 0 Or $IINDEX_2 > $IDIM_2 Then Return SetError ( 3 , 0 , + 4294967295 )
		If $ISTART = + 4294967295 Then $ISTART = 0
		If $IEND = + 4294967295 Then $IEND = $IDIM_1
	Else
		If $IINDEX_1 < 0 Or $IINDEX_2 > $IDIM_1 Then Return SetError ( 3 , 0 , + 4294967295 )
		If $ISTART = + 4294967295 Then $ISTART = 0
		If $IEND = + 4294967295 Then $IEND = $IDIM_2
	EndIf
	Local $VTMP
	Switch UBound ( $AARRAY , $UBOUND_DIMENSIONS )
	Case 1
		$VTMP = $AARRAY [ $IINDEX_1 ]
		$AARRAY [ $IINDEX_1 ] = $AARRAY [ $IINDEX_2 ]
		$AARRAY [ $IINDEX_2 ] = $VTMP
	Case 2
		If $ISTART < + 4294967295 Or $IEND < + 4294967295 Then Return SetError ( 4 , 0 , + 4294967295 )
		If $BCOL Then
			If $ISTART > $IDIM_1 Or $IEND > $IDIM_1 Then Return SetError ( 4 , 0 , + 4294967295 )
			For $J = $ISTART To $IEND
				$VTMP = $AARRAY [ $J ] [ $IINDEX_1 ]
				$AARRAY [ $J ] [ $IINDEX_1 ] = $AARRAY [ $J ] [ $IINDEX_2 ]
				$AARRAY [ $J ] [ $IINDEX_2 ] = $VTMP
			Next
		Else
			If $ISTART > $IDIM_2 Or $IEND > $IDIM_2 Then Return SetError ( 4 , 0 , + 4294967295 )
			For $J = $ISTART To $IEND
				$VTMP = $AARRAY [ $IINDEX_1 ] [ $J ]
				$AARRAY [ $IINDEX_1 ] [ $J ] = $AARRAY [ $IINDEX_2 ] [ $J ]
				$AARRAY [ $IINDEX_2 ] [ $J ] = $VTMP
			Next
		EndIf
Case Else
		Return SetError ( 2 , 0 , + 4294967295 )
	EndSwitch
	Return 1
EndFunc
Func _ARRAYTOCLIP ( Const ByRef $AARRAY , $SDELIM_COL = "|" , $ISTART_ROW = + 4294967295 , $IEND_ROW = + 4294967295 , $SDELIM_ROW = @CRLF , $ISTART_COL = + 4294967295 , $IEND_COL = + 4294967295 )
	Local $SRESULT = _ARRAYTOSTRING ( $AARRAY , $SDELIM_COL , $ISTART_ROW , $IEND_ROW , $SDELIM_ROW , $ISTART_COL , $IEND_COL )
	If @error Then Return SetError ( @error , 0 , 0 )
	If ClipPut ( $SRESULT ) Then Return 1
	Return SetError ( + 4294967295 , 0 , 0 )
EndFunc
Func _ARRAYTOSTRING ( Const ByRef $AARRAY , $SDELIM_COL = "|" , $ISTART_ROW = Default , $IEND_ROW = Default , $SDELIM_ROW = @CRLF , $ISTART_COL = Default , $IEND_COL = Default )
	If $SDELIM_COL = Default Then $SDELIM_COL = "|"
	If $SDELIM_ROW = Default Then $SDELIM_ROW = @CRLF
	If $ISTART_ROW = Default Then $ISTART_ROW = + 4294967295
	If $IEND_ROW = Default Then $IEND_ROW = + 4294967295
	If $ISTART_COL = Default Then $ISTART_COL = + 4294967295
	If $IEND_COL = Default Then $IEND_COL = + 4294967295
	If Not IsArray ( $AARRAY ) Then Return SetError ( 1 , 0 , + 4294967295 )
	Local $IDIM_1 = UBound ( $AARRAY , $UBOUND_ROWS ) + 4294967295
	If $IDIM_1 = + 4294967295 Then Return ""
	If $ISTART_ROW = + 4294967295 Then $ISTART_ROW = 0
	If $IEND_ROW = + 4294967295 Then $IEND_ROW = $IDIM_1
	If $ISTART_ROW < + 4294967295 Or $IEND_ROW < + 4294967295 Then Return SetError ( 3 , 0 , + 4294967295 )
	If $ISTART_ROW > $IDIM_1 Or $IEND_ROW > $IDIM_1 Then Return SetError ( 3 , 0 , "" )
	If $ISTART_ROW > $IEND_ROW Then Return SetError ( 4 , 0 , + 4294967295 )
	Local $SRET = ""
	Switch UBound ( $AARRAY , $UBOUND_DIMENSIONS )
	Case 1
		For $I = $ISTART_ROW To $IEND_ROW
			$SRET &= $AARRAY [ $I ] & $SDELIM_COL
		Next
		Return StringTrimRight ( $SRET , StringLen ( $SDELIM_COL ) )
	Case 2
		Local $IDIM_2 = UBound ( $AARRAY , $UBOUND_COLUMNS ) + 4294967295
		If $IDIM_2 = + 4294967295 Then Return ""
		If $ISTART_COL = + 4294967295 Then $ISTART_COL = 0
		If $IEND_COL = + 4294967295 Then $IEND_COL = $IDIM_2
		If $ISTART_COL < + 4294967295 Or $IEND_COL < + 4294967295 Then Return SetError ( 5 , 0 , + 4294967295 )
		If $ISTART_COL > $IDIM_2 Or $IEND_COL > $IDIM_2 Then Return SetError ( 5 , 0 , + 4294967295 )
		If $ISTART_COL > $IEND_COL Then Return SetError ( 6 , 0 , + 4294967295 )
		Local $IDELIMCOLLEN = StringLen ( $SDELIM_COL )
		For $I = $ISTART_ROW To $IEND_ROW
			For $J = $ISTART_COL To $IEND_COL
				$SRET &= $AARRAY [ $I ] [ $J ] & $SDELIM_COL
			Next
			$SRET = StringTrimRight ( $SRET , $IDELIMCOLLEN ) & $SDELIM_ROW
		Next
		Return StringTrimRight ( $SRET , StringLen ( $SDELIM_ROW ) )
Case Else
		Return SetError ( 2 , 0 , + 4294967295 )
	EndSwitch
	Return 1
EndFunc
Func _ARRAYTRANSPOSE ( ByRef $AARRAY , $BFORCE1D = False )
	Local $ATEMP
	Switch $BFORCE1D
	Case Default
		$BFORCE1D = False
	Case True , False
Case Else
		Return SetError ( 3 , 0 , 0 )
	EndSwitch
	Switch UBound ( $AARRAY , 0 )
	Case 0
		Return SetError ( 2 , 0 , 0 )
	Case 1
		Local $ATEMP [ 1 ] [ UBound ( $AARRAY ) ]
		For $I = 0 To UBound ( $AARRAY ) + 4294967295
			$ATEMP [ 0 ] [ $I ] = $AARRAY [ $I ]
		Next
		$AARRAY = $ATEMP
	Case 2
		Local $IDIM_1 = UBound ( $AARRAY , 1 ) , $IDIM_2 = UBound ( $AARRAY , 2 )
		If $IDIM_1 <> $IDIM_2 Then
			Local $ATEMP [ $IDIM_2 ] [ $IDIM_1 ]
			For $I = 0 To $IDIM_1 + 4294967295
				For $J = 0 To $IDIM_2 + 4294967295
					$ATEMP [ $J ] [ $I ] = $AARRAY [ $I ] [ $J ]
				Next
			Next
			$AARRAY = $ATEMP
		Else
			Local $VELEMENT
			For $I = 0 To $IDIM_1 + 4294967295
				For $J = $I + 1 To $IDIM_2 + 4294967295
					$VELEMENT = $AARRAY [ $I ] [ $J ]
					$AARRAY [ $I ] [ $J ] = $AARRAY [ $J ] [ $I ]
					$AARRAY [ $J ] [ $I ] = $VELEMENT
				Next
			Next
		EndIf
		If $BFORCE1D = True And UBound ( $AARRAY , 2 ) = 1 Then
			$ATEMP = $AARRAY
			ReDim $AARRAY [ UBound ( $ATEMP ) ]
			For $I = 0 To UBound ( $ATEMP ) + 4294967295
				$AARRAY [ $I ] = $ATEMP [ $I ] [ 0 ]
			Next
		EndIf
Case Else
		Return SetError ( 1 , 0 , 0 )
	EndSwitch
	Return 1
EndFunc
Func _ARRAYTRIM ( ByRef $AARRAY , $ITRIMNUM , $IDIRECTION = 0 , $ISTART = 0 , $IEND = 0 , $ISUBITEM = 0 )
	If $IDIRECTION = Default Then $IDIRECTION = 0
	If $ISTART = Default Then $ISTART = 0
	If $IEND = Default Then $IEND = 0
	If $ISUBITEM = Default Then $ISUBITEM = 0
	If Not IsArray ( $AARRAY ) Then Return SetError ( 1 , 0 , 0 )
	Local $IDIM_1 = UBound ( $AARRAY , $UBOUND_ROWS ) + 4294967295
	If $IEND = 0 Then $IEND = $IDIM_1
	If $ISTART > $IEND Then Return SetError ( 3 , 0 , + 4294967295 )
	If $ISTART < 0 Or $IEND < 0 Then Return SetError ( 3 , 0 , + 4294967295 )
	If $ISTART > $IDIM_1 Or $IEND > $IDIM_1 Then Return SetError ( 3 , 0 , + 4294967295 )
	If $ISTART > $IEND Then Return SetError ( 4 , 0 , + 4294967295 )
	Switch UBound ( $AARRAY , $UBOUND_DIMENSIONS )
	Case 1
		If $IDIRECTION Then
			For $I = $ISTART To $IEND
				$AARRAY [ $I ] = StringTrimRight ( $AARRAY [ $I ] , $ITRIMNUM )
			Next
		Else
			For $I = $ISTART To $IEND
				$AARRAY [ $I ] = StringTrimLeft ( $AARRAY [ $I ] , $ITRIMNUM )
			Next
		EndIf
	Case 2
		Local $IDIM_2 = UBound ( $AARRAY , $UBOUND_COLUMNS ) + 4294967295
		If $ISUBITEM < 0 Or $ISUBITEM > $IDIM_2 Then Return SetError ( 5 , 0 , + 4294967295 )
		If $IDIRECTION Then
			For $I = $ISTART To $IEND
				$AARRAY [ $I ] [ $ISUBITEM ] = StringTrimRight ( $AARRAY [ $I ] [ $ISUBITEM ] , $ITRIMNUM )
			Next
		Else
			For $I = $ISTART To $IEND
				$AARRAY [ $I ] [ $ISUBITEM ] = StringTrimLeft ( $AARRAY [ $I ] [ $ISUBITEM ] , $ITRIMNUM )
			Next
		EndIf
Case Else
		Return SetError ( 2 , 0 , 0 )
	EndSwitch
	Return 1
EndFunc
Func _ARRAYUNIQUE ( Const ByRef $AARRAY , $ICOLUMN = 0 , $IBASE = 0 , $ICASE = 0 , $ICOUNT = $ARRAYUNIQUE_COUNT , $IINTTYPE = $ARRAYUNIQUE_AUTO )
	If $ICOLUMN = Default Then $ICOLUMN = 0
	If $IBASE = Default Then $IBASE = 0
	If $ICASE = Default Then $ICASE = 0
	If $ICOUNT = Default Then $ICOUNT = $ARRAYUNIQUE_COUNT
	If $IINTTYPE = Default Then $IINTTYPE = $ARRAYUNIQUE_AUTO
	If UBound ( $AARRAY , $UBOUND_ROWS ) = 0 Then Return SetError ( 1 , 0 , 0 )
	Local $IDIMS = UBound ( $AARRAY , $UBOUND_DIMENSIONS ) , $INUMCOLUMNS = UBound ( $AARRAY , $UBOUND_COLUMNS )
	If $IDIMS > 2 Then Return SetError ( 2 , 0 , 0 )
	If $IBASE < 0 Or $IBASE > 1 Or ( Not IsInt ( $IBASE ) ) Then Return SetError ( 3 , 0 , 0 )
	If $ICASE < 0 Or $ICASE > 1 Or ( Not IsInt ( $ICASE ) ) Then Return SetError ( 3 , 0 , 0 )
	If $ICOUNT < 0 Or $ICOUNT > 1 Or ( Not IsInt ( $ICOUNT ) ) Then Return SetError ( 4 , 0 , 0 )
	If $IINTTYPE < 0 Or $IINTTYPE > 4 Or ( Not IsInt ( $IINTTYPE ) ) Then Return SetError ( 5 , 0 , 0 )
	If $ICOLUMN < 0 Or ( $INUMCOLUMNS = 0 And $ICOLUMN > 0 ) Or ( $INUMCOLUMNS > 0 And $ICOLUMN >= $INUMCOLUMNS ) Then Return SetError ( 6 , 0 , 0 )
	If $IINTTYPE = $ARRAYUNIQUE_AUTO Then
		Local $BINT , $SVARTYPE
		If $IDIMS = 1 Then
			$BINT = IsInt ( $AARRAY [ $IBASE ] )
			$SVARTYPE = VarGetType ( $AARRAY [ $IBASE ] )
		Else
			$BINT = IsInt ( $AARRAY [ $IBASE ] [ $ICOLUMN ] )
			$SVARTYPE = VarGetType ( $AARRAY [ $IBASE ] [ $ICOLUMN ] )
		EndIf
		If $BINT And $SVARTYPE = "Int64" Then
			$IINTTYPE = $ARRAYUNIQUE_FORCE64
		Else
			$IINTTYPE = $ARRAYUNIQUE_FORCE32
		EndIf
	EndIf
	ObjEvent ( "AutoIt.Error" , __ARRAYUNIQUE_AUTOERRFUNC )
	Local $ODICTIONARY = ObjCreate ( "Scripting.Dictionary" )
	$ODICTIONARY .CompareMode = Number ( Not $ICASE )
	Local $VELEM , $STYPE , $VKEY , $BCOMERROR = False
	For $I = $IBASE To UBound ( $AARRAY ) + 4294967295
		If $IDIMS = 1 Then
			$VELEM = $AARRAY [ $I ]
		Else
			$VELEM = $AARRAY [ $I ] [ $ICOLUMN ]
		EndIf
		Switch $IINTTYPE
		Case $ARRAYUNIQUE_FORCE32
			$ODICTIONARY .Item ( $VELEM )
			If @error Then
				$BCOMERROR = True
				ExitLoop
			EndIf
		Case $ARRAYUNIQUE_FORCE64
			$STYPE = VarGetType ( $VELEM )
			If $STYPE = "Int32" Then
				$BCOMERROR = True
				ExitLoop
			EndIf
			$VKEY = "#" & $STYPE & "#" & String ( $VELEM )
			If Not $ODICTIONARY .Item ( $VKEY ) Then
				$ODICTIONARY ( $VKEY ) = $VELEM
			EndIf
		Case $ARRAYUNIQUE_MATCH
			$STYPE = VarGetType ( $VELEM )
			If StringLeft ( $STYPE , 3 ) = "Int" Then
				$VKEY = "#Int#" & String ( $VELEM )
			Else
				$VKEY = "#" & $STYPE & "#" & String ( $VELEM )
			EndIf
			If Not $ODICTIONARY .Item ( $VKEY ) Then
				$ODICTIONARY ( $VKEY ) = $VELEM
			EndIf
		Case $ARRAYUNIQUE_DISTINCT
			$VKEY = "#" & VarGetType ( $VELEM ) & "#" & String ( $VELEM )
			If Not $ODICTIONARY .Item ( $VKEY ) Then
				$ODICTIONARY ( $VKEY ) = $VELEM
			EndIf
		EndSwitch
	Next
	Local $AVALUES , $J = 0
	If $BCOMERROR Then
		Return SetError ( 7 , 0 , 0 )
	ElseIf $IINTTYPE <> $ARRAYUNIQUE_FORCE32 Then
		Local $AVALUES [ $ODICTIONARY .Count ]
		For $VKEY In $ODICTIONARY .Keys ( )
			$AVALUES [ $J ] = $ODICTIONARY ( $VKEY )
			If StringLeft ( $VKEY , 5 ) = "#Ptr#" Then
				$AVALUES [ $J ] = Ptr ( $AVALUES [ $J ] )
			EndIf
			$J += 1
		Next
	Else
		$AVALUES = $ODICTIONARY .Keys ( )
	EndIf
	If $ICOUNT Then
		_ARRAYINSERT ( $AVALUES , 0 , $ODICTIONARY .Count )
	EndIf
	Return $AVALUES
EndFunc
Func _ARRAY1DTOHISTOGRAM ( $AARRAY , $ISIZING = 100 )
	If UBound ( $AARRAY , 0 ) > 1 Then Return SetError ( 1 , 0 , "" )
	$ISIZING = $ISIZING * 8
	Local $T , $N , $IMIN = 0 , $IMAX = 0 , $IOFFSET = 0
	For $I = 0 To UBound ( $AARRAY ) + 4294967295
		$T = $AARRAY [ $I ]
		$T = IsNumber ( $T ) ? Round ( $T ) : 0
		If $T < $IMIN Then $IMIN = $T
		If $T > $IMAX Then $IMAX = $T
	Next
	Local $IRANGE = Int ( Round ( ( $IMAX - $IMIN ) / 8 ) ) * 8
	Local $ISPACERATIO = 4
	For $I = 0 To UBound ( $AARRAY ) + 4294967295
		$T = $AARRAY [ $I ]
		If $T Then
			$N = Abs ( Round ( ( $ISIZING * $T ) / $IRANGE ) / 8 )
			$AARRAY [ $I ] = ""
			If $T > 0 Then
				If $IMIN Then
					$IOFFSET = Int ( Abs ( Round ( ( $ISIZING * $IMIN ) / $IRANGE ) / 8 ) / 8 * $ISPACERATIO )
					$AARRAY [ $I ] = __ARRAY_STRINGREPEAT ( ChrW ( 32 ) , $IOFFSET )
				EndIf
			Else
				If $IMIN <> $T Then
					$IOFFSET = Int ( Abs ( Round ( ( $ISIZING * ( $T - $IMIN ) ) / $IRANGE ) / 8 ) / 8 * $ISPACERATIO )
					$AARRAY [ $I ] = __ARRAY_STRINGREPEAT ( ChrW ( 32 ) , $IOFFSET )
				EndIf
			EndIf
			$AARRAY [ $I ] &= __ARRAY_STRINGREPEAT ( ChrW ( 9608 ) , Int ( $N / 8 ) )
			$N = Mod ( $N , 8 )
			If $N > 0 Then $AARRAY [ $I ] &= ChrW ( 9608 + 8 - $N )
			$AARRAY [ $I ] &= " " & $T
		Else
			$AARRAY [ $I ] = ""
		EndIf
	Next
	Return $AARRAY
EndFunc
Func _ARRAY2DCREATE ( $ACOL0 , $ACOL1 )
	If ( UBound ( $ACOL0 , 0 ) <> 1 ) Or ( UBound ( $ACOL1 , 0 ) <> 1 ) Then Return SetError ( 1 , 0 , "" )
	Local $NROWS = UBound ( $ACOL0 )
	If $NROWS <> UBound ( $ACOL1 ) Then Return SetError ( 2 , 0 , "" )
	Local $ATMP [ $NROWS ] [ 2 ]
	For $I = 0 To $NROWS + 4294967295
		$ATMP [ $I ] [ 0 ] = $ACOL0 [ $I ]
		$ATMP [ $I ] [ 1 ] = $ACOL1 [ $I ]
	Next
	Return $ATMP
EndFunc
Func __ARRAY_STRINGREPEAT ( $SSTRING , $IREPEATCOUNT )
	$IREPEATCOUNT = Int ( $IREPEATCOUNT )
	If StringLen ( $SSTRING ) < 1 Or $IREPEATCOUNT <= 0 Then Return SetError ( 1 , 0 , "" )
	Local $SRESULT = ""
	While $IREPEATCOUNT > 1
		If BitAND ( $IREPEATCOUNT , 1 ) Then $SRESULT &= $SSTRING
		$SSTRING &= $SSTRING
		$IREPEATCOUNT = BitShift ( $IREPEATCOUNT , 1 )
	WEnd
	Return $SSTRING & $SRESULT
EndFunc
Func __ARRAY_EXETERINTERNAL ( ByRef $AARRAY , $ISTART , $ISIZE , $SDELIMITER , ByRef $AIDX , ByRef $ARESULT , ByRef $ICOUNT )
	If $ISTART == $ISIZE + 4294967295 Then
		For $I = 0 To $ISIZE + 4294967295
			$ARESULT [ $ICOUNT ] &= $AARRAY [ $AIDX [ $I ] ] & $SDELIMITER
		Next
		If $SDELIMITER <> "" Then $ARESULT [ $ICOUNT ] = StringTrimRight ( $ARESULT [ $ICOUNT ] , StringLen ( $SDELIMITER ) )
		$ICOUNT += 1
	Else
		Local $ITEMP
		For $I = $ISTART To $ISIZE + 4294967295
			$ITEMP = $AIDX [ $I ]
			$AIDX [ $I ] = $AIDX [ $ISTART ]
			$AIDX [ $ISTART ] = $ITEMP
			__ARRAY_EXETERINTERNAL ( $AARRAY , $ISTART + 1 , $ISIZE , $SDELIMITER , $AIDX , $ARESULT , $ICOUNT )
			$AIDX [ $ISTART ] = $AIDX [ $I ]
			$AIDX [ $I ] = $ITEMP
		Next
	EndIf
EndFunc
Func __ARRAY_COMBINATIONS ( $IN , $IR )
	Local $I_TOTAL = 1
	For $I = $IR To 1 Step + 4294967295
		$I_TOTAL *= ( $IN / $I )
		$IN -= 1
	Next
	Return Round ( $I_TOTAL )
EndFunc
Func __ARRAY_GETNEXT ( $IN , $IR , ByRef $ILEFT , $ITOTAL , ByRef $AIDX )
	If $ILEFT == $ITOTAL Then
		$ILEFT -= 1
		Return
	EndIf
	Local $I = $IR + 4294967295
	While $AIDX [ $I ] == $IN - $IR + $I
		$I -= 1
	WEnd
	$AIDX [ $I ] += 1
	For $J = $I + 1 To $IR + 4294967295
		$AIDX [ $J ] = $AIDX [ $I ] + $J - $I
	Next
	$ILEFT -= 1
EndFunc
Func __ARRAY_MINMAXINDEX ( Const ByRef $AARRAY , $ICOMPNUMERIC , $ISTART , $IEND , $ISUBITEM , $FUCOMPARISON )
	If $ICOMPNUMERIC = Default Then $ICOMPNUMERIC = 0
	If $ICOMPNUMERIC <> 1 Then $ICOMPNUMERIC = 0
	If $ISTART = Default Then $ISTART = 0
	If $IEND = Default Then $IEND = 0
	If $ISUBITEM = Default Then $ISUBITEM = 0
	If Not IsArray ( $AARRAY ) Then Return SetError ( 1 , 0 , + 4294967295 )
	Local $IDIM_1 = UBound ( $AARRAY , $UBOUND_ROWS ) + 4294967295
	If $IDIM_1 < 0 Then Return SetError ( 1 , 0 , + 4294967295 )
	If $IEND = + 4294967295 Then $IEND = $IDIM_1
	If $ISTART = + 4294967295 Then $ISTART = 0
	If $ISTART < + 4294967295 Or $IEND < + 4294967295 Then Return SetError ( 3 , 0 , + 4294967295 )
	If $ISTART > $IDIM_1 Or $IEND > $IDIM_1 Then Return SetError ( 3 , 0 , + 4294967295 )
	If $ISTART > $IEND Then Return SetError ( 4 , 0 , + 4294967295 )
	If $IDIM_1 < 0 Then Return SetError ( 5 , 0 , + 4294967295 )
	Local $IMAXMININDEX = $ISTART
	Switch UBound ( $AARRAY , $UBOUND_DIMENSIONS )
	Case 1
		If $ICOMPNUMERIC Then
			For $I = $ISTART To $IEND
				If $FUCOMPARISON ( Number ( $AARRAY [ $I ] ) , Number ( $AARRAY [ $IMAXMININDEX ] ) ) Then $IMAXMININDEX = $I
			Next
		Else
			For $I = $ISTART To $IEND
				If $FUCOMPARISON ( $AARRAY [ $I ] , $AARRAY [ $IMAXMININDEX ] ) Then $IMAXMININDEX = $I
			Next
		EndIf
	Case 2
		If $ISUBITEM < 0 Or $ISUBITEM > UBound ( $AARRAY , $UBOUND_COLUMNS ) + 4294967295 Then Return SetError ( 6 , 0 , + 4294967295 )
		If $ICOMPNUMERIC Then
			For $I = $ISTART To $IEND
				If $FUCOMPARISON ( Number ( $AARRAY [ $I ] [ $ISUBITEM ] ) , Number ( $AARRAY [ $IMAXMININDEX ] [ $ISUBITEM ] ) ) Then $IMAXMININDEX = $I
			Next
		Else
			For $I = $ISTART To $IEND
				If $FUCOMPARISON ( $AARRAY [ $I ] [ $ISUBITEM ] , $AARRAY [ $IMAXMININDEX ] [ $ISUBITEM ] ) Then $IMAXMININDEX = $I
			Next
		EndIf
Case Else
		Return SetError ( 2 , 0 , + 4294967295 )
	EndSwitch
	Return $IMAXMININDEX
EndFunc
Func __ARRAY_GREATERTHAN ( $VVALUE1 , $VVALUE2 )
	Return $VVALUE1 > $VVALUE2
EndFunc
Func __ARRAY_LESSTHAN ( $VVALUE1 , $VVALUE2 )
	Return $VVALUE1 < $VVALUE2
EndFunc
Func __ARRAYUNIQUE_AUTOERRFUNC ( )
EndFunc
Global Const $BS_GROUPBOX = 7
Global Const $BS_BOTTOM = 2048
Global Const $BS_CENTER = 768
Global Const $BS_DEFPUSHBUTTON = 1
Global Const $BS_LEFT = 256
Global Const $BS_MULTILINE = 8192
Global Const $BS_PUSHBOX = 10
Global Const $BS_PUSHLIKE = 4096
Global Const $BS_RIGHT = 512
Global Const $BS_RIGHTBUTTON = 32
Global Const $BS_TOP = 1024
Global Const $BS_VCENTER = 3072
Global Const $BS_FLAT = 32768
Global Const $BS_ICON = 64
Global Const $BS_BITMAP = 128
Global Const $BS_NOTIFY = 16384
Global Const $BS_SPLITBUTTON = 12
Global Const $BS_DEFSPLITBUTTON = 13
Global Const $BS_COMMANDLINK = 14
Global Const $BS_DEFCOMMANDLINK = 15
Global Const $BCSIF_GLYPH = 1
Global Const $BCSIF_IMAGE = 2
Global Const $BCSIF_STYLE = 4
Global Const $BCSIF_SIZE = 8
Global Const $BCSS_NOSPLIT = 1
Global Const $BCSS_STRETCH = 2
Global Const $BCSS_ALIGNLEFT = 4
Global Const $BCSS_IMAGE = 8
Global Const $BUTTON_IMAGELIST_ALIGN_LEFT = 0
Global Const $BUTTON_IMAGELIST_ALIGN_RIGHT = 1
Global Const $BUTTON_IMAGELIST_ALIGN_TOP = 2
Global Const $BUTTON_IMAGELIST_ALIGN_BOTTOM = 3
Global Const $BUTTON_IMAGELIST_ALIGN_CENTER = 4
Global Const $BS_3STATE = 5
Global Const $BS_AUTO3STATE = 6
Global Const $BS_AUTOCHECKBOX = 3
Global Const $BS_CHECKBOX = 2
Global Const $BS_RADIOBUTTON = 4
Global Const $BS_AUTORADIOBUTTON = 9
Global Const $BS_OWNERDRAW = 11
Global Const $GUI_SS_DEFAULT_BUTTON = 0
Global Const $GUI_SS_DEFAULT_CHECKBOX = 0
Global Const $GUI_SS_DEFAULT_GROUP = 0
Global Const $GUI_SS_DEFAULT_RADIO = 0
Global Const $BCM_FIRST = 5632
Global Const $BCM_GETIDEALSIZE = ( $BCM_FIRST + 1 )
Global Const $BCM_GETIMAGELIST = ( $BCM_FIRST + 3 )
Global Const $BCM_GETNOTE = ( $BCM_FIRST + 10 )
Global Const $BCM_GETNOTELENGTH = ( $BCM_FIRST + 11 )
Global Const $BCM_GETSPLITINFO = ( $BCM_FIRST + 8 )
Global Const $BCM_GETTEXTMARGIN = ( $BCM_FIRST + 5 )
Global Const $BCM_SETDROPDOWNSTATE = ( $BCM_FIRST + 6 )
Global Const $BCM_SETIMAGELIST = ( $BCM_FIRST + 2 )
Global Const $BCM_SETNOTE = ( $BCM_FIRST + 9 )
Global Const $BCM_SETSHIELD = ( $BCM_FIRST + 12 )
Global Const $BCM_SETSPLITINFO = ( $BCM_FIRST + 7 )
Global Const $BCM_SETTEXTMARGIN = ( $BCM_FIRST + 4 )
Global Const $BM_CLICK = 245
Global Const $BM_GETCHECK = 240
Global Const $BM_GETIMAGE = 246
Global Const $BM_GETSTATE = 242
Global Const $BM_SETCHECK = 241
Global Const $BM_SETDONTCLICK = 248
Global Const $BM_SETIMAGE = 247
Global Const $BM_SETSTATE = 243
Global Const $BM_SETSTYLE = 244
Global Const $BCN_FIRST = + 4294966046
Global Const $BCN_DROPDOWN = ( $BCN_FIRST + 2 )
Global Const $BCN_HOTITEMCHANGE = ( $BCN_FIRST + 1 )
Global Const $BN_CLICKED = 0
Global Const $BN_PAINT = 1
Global Const $BN_HILITE = 2
Global Const $BN_UNHILITE = 3
Global Const $BN_DISABLE = 4
Global Const $BN_DOUBLECLICKED = 5
Global Const $BN_SETFOCUS = 6
Global Const $BN_KILLFOCUS = 7
Global Const $BN_PUSHED = $BN_HILITE
Global Const $BN_UNPUSHED = $BN_UNHILITE
Global Const $BN_DBLCLK = $BN_DOUBLECLICKED
Global Const $BST_CHECKED = 1
Global Const $BST_INDETERMINATE = 2
Global Const $BST_UNCHECKED = 0
Global Const $BST_FOCUS = 8
Global Const $BST_PUSHED = 4
Global Const $BST_DONTCLICK = 128
Global Const $ES_LEFT = 0
Global Const $ES_CENTER = 1
Global Const $ES_RIGHT = 2
Global Const $ES_MULTILINE = 4
Global Const $ES_UPPERCASE = 8
Global Const $ES_LOWERCASE = 16
Global Const $ES_PASSWORD = 32
Global Const $ES_AUTOVSCROLL = 64
Global Const $ES_AUTOHSCROLL = 128
Global Const $ES_NOHIDESEL = 256
Global Const $ES_OEMCONVERT = 1024
Global Const $ES_READONLY = 2048
Global Const $ES_WANTRETURN = 4096
Global Const $ES_NUMBER = 8192
Global Const $EC_ERR = + 4294967295
Global Const $ECM_FIRST = 5376
Global Const $EM_CANUNDO = 198
Global Const $EM_CHARFROMPOS = 215
Global Const $EM_EMPTYUNDOBUFFER = 205
Global Const $EM_FMTLINES = 200
Global Const $EM_GETCUEBANNER = ( $ECM_FIRST + 2 )
Global Const $EM_GETFIRSTVISIBLELINE = 206
Global Const $EM_GETHANDLE = 189
Global Const $EM_GETIMESTATUS = 217
Global Const $EM_GETLIMITTEXT = 213
Global Const $EM_GETLINE = 196
Global Const $EM_GETLINECOUNT = 186
Global Const $EM_GETMARGINS = 212
Global Const $EM_GETMODIFY = 184
Global Const $EM_GETPASSWORDCHAR = 210
Global Const $EM_GETRECT = 178
Global Const $EM_GETSEL = 176
Global Const $EM_GETTHUMB = 190
Global Const $EM_GETWORDBREAKPROC = 209
Global Const $EM_HIDEBALLOONTIP = ( $ECM_FIRST + 4 )
Global Const $EM_LIMITTEXT = 197
Global Const $EM_LINEFROMCHAR = 201
Global Const $EM_LINEINDEX = 187
Global Const $EM_LINELENGTH = 193
Global Const $EM_LINESCROLL = 182
Global Const $EM_POSFROMCHAR = 214
Global Const $EM_REPLACESEL = 194
Global Const $EM_SCROLL = 181
Global Const $EM_SCROLLCARET = 183
Global Const $EM_SETCUEBANNER = ( $ECM_FIRST + 1 )
Global Const $EM_SETHANDLE = 188
Global Const $EM_SETIMESTATUS = 216
Global Const $EM_SETLIMITTEXT = $EM_LIMITTEXT
Global Const $EM_SETMARGINS = 211
Global Const $EM_SETMODIFY = 185
Global Const $EM_SETPASSWORDCHAR = 204
Global Const $EM_SETREADONLY = 207
Global Const $EM_SETRECT = 179
Global Const $EM_SETRECTNP = 180
Global Const $EM_SETSEL = 177
Global Const $EM_SETTABSTOPS = 203
Global Const $EM_SETWORDBREAKPROC = 208
Global Const $EM_SHOWBALLOONTIP = ( $ECM_FIRST + 3 )
Global Const $EM_UNDO = 199
Global Const $EC_LEFTMARGIN = 1
Global Const $EC_RIGHTMARGIN = 2
Global Const $EC_USEFONTINFO = 65535
Global Const $EMSIS_COMPOSITIONSTRING = 1
Global Const $EIMES_GETCOMPSTRATONCE = 1
Global Const $EIMES_CANCELCOMPSTRINFOCUS = 2
Global Const $EIMES_COMPLETECOMPSTRKILLFOCUS = 4
Global Const $EN_ALIGN_LTR_EC = 1792
Global Const $EN_ALIGN_RTL_EC = 1793
Global Const $EN_CHANGE = 768
Global Const $EN_ERRSPACE = 1280
Global Const $EN_HSCROLL = 1537
Global Const $EN_KILLFOCUS = 512
Global Const $EN_MAXTEXT = 1281
Global Const $EN_SETFOCUS = 256
Global Const $EN_UPDATE = 1024
Global Const $EN_VSCROLL = 1538
Global Const $GUI_SS_DEFAULT_EDIT = 3150016
Global Const $GUI_SS_DEFAULT_INPUT = 128
Global Const $GUI_EVENT_SINGLE = 0
Global Const $GUI_EVENT_ARRAY = 1
Global Const $GUI_EVENT_NONE = 0
Global Const $GUI_EVENT_CLOSE = + 4294967293
Global Const $GUI_EVENT_MINIMIZE = + 4294967292
Global Const $GUI_EVENT_RESTORE = + 4294967291
Global Const $GUI_EVENT_MAXIMIZE = + 4294967290
Global Const $GUI_EVENT_PRIMARYDOWN = + 4294967289
Global Const $GUI_EVENT_PRIMARYUP = + 4294967288
Global Const $GUI_EVENT_SECONDARYDOWN = + 4294967287
Global Const $GUI_EVENT_SECONDARYUP = + 4294967286
Global Const $GUI_EVENT_MOUSEMOVE = + 4294967285
Global Const $GUI_EVENT_RESIZED = + 4294967284
Global Const $GUI_EVENT_DROPPED = + 4294967283
Global Const $GUI_RUNDEFMSG = "GUI_RUNDEFMSG"
Global Const $GUI_AVISTOP = 0
Global Const $GUI_AVISTART = 1
Global Const $GUI_AVICLOSE = 2
Global Const $GUI_CHECKED = 1
Global Const $GUI_INDETERMINATE = 2
Global Const $GUI_UNCHECKED = 4
Global Const $GUI_DROPACCEPTED = 8
Global Const $GUI_NODROPACCEPTED = 4096
Global Const $GUI_ACCEPTFILES = $GUI_DROPACCEPTED
Global Const $GUI_SHOW = 16
Global Const $GUI_HIDE = 32
Global Const $GUI_ENABLE = 64
Global Const $GUI_DISABLE = 128
Global Const $GUI_FOCUS = 256
Global Const $GUI_NOFOCUS = 8192
Global Const $GUI_DEFBUTTON = 512
Global Const $GUI_EXPAND = 1024
Global Const $GUI_ONTOP = 2048
Global Const $GUI_FONTNORMAL = 0
Global Const $GUI_FONTITALIC = 2
Global Const $GUI_FONTUNDER = 4
Global Const $GUI_FONTSTRIKE = 8
Global Const $GUI_DOCKAUTO = 1
Global Const $GUI_DOCKLEFT = 2
Global Const $GUI_DOCKRIGHT = 4
Global Const $GUI_DOCKHCENTER = 8
Global Const $GUI_DOCKTOP = 32
Global Const $GUI_DOCKBOTTOM = 64
Global Const $GUI_DOCKVCENTER = 128
Global Const $GUI_DOCKWIDTH = 256
Global Const $GUI_DOCKHEIGHT = 512
Global Const $GUI_DOCKSIZE = 768
Global Const $GUI_DOCKMENUBAR = 544
Global Const $GUI_DOCKSTATEBAR = 576
Global Const $GUI_DOCKALL = 802
Global Const $GUI_DOCKBORDERS = 102
Global Const $GUI_GR_CLOSE = 1
Global Const $GUI_GR_LINE = 2
Global Const $GUI_GR_BEZIER = 4
Global Const $GUI_GR_MOVE = 6
Global Const $GUI_GR_COLOR = 8
Global Const $GUI_GR_RECT = 10
Global Const $GUI_GR_ELLIPSE = 12
Global Const $GUI_GR_PIE = 14
Global Const $GUI_GR_DOT = 16
Global Const $GUI_GR_PIXEL = 18
Global Const $GUI_GR_HINT = 20
Global Const $GUI_GR_REFRESH = 22
Global Const $GUI_GR_PENSIZE = 24
Global Const $GUI_GR_NOBKCOLOR = + 4294967294
Global Const $GUI_BKCOLOR_DEFAULT = + 4294967295
Global Const $GUI_BKCOLOR_TRANSPARENT = + 4294967294
Global Const $GUI_BKCOLOR_LV_ALTERNATE = 4261412864
Global Const $GUI_READ_DEFAULT = 0
Global Const $GUI_READ_EXTENDED = 1
Global Const $GUI_CURSOR_NOOVERRIDE = 0
Global Const $GUI_CURSOR_OVERRIDE = 1
Global Const $GUI_WS_EX_PARENTDRAG = 1048576
Global Const $SS_LEFT = 0
Global Const $SS_CENTER = 1
Global Const $SS_RIGHT = 2
Global Const $SS_ICON = 3
Global Const $SS_BLACKRECT = 4
Global Const $SS_GRAYRECT = 5
Global Const $SS_WHITERECT = 6
Global Const $SS_BLACKFRAME = 7
Global Const $SS_GRAYFRAME = 8
Global Const $SS_WHITEFRAME = 9
Global Const $SS_SIMPLE = 11
Global Const $SS_LEFTNOWORDWRAP = 12
Global Const $SS_BITMAP = 14
Global Const $SS_ENHMETAFILE = 15
Global Const $SS_ETCHEDHORZ = 16
Global Const $SS_ETCHEDVERT = 17
Global Const $SS_ETCHEDFRAME = 18
Global Const $SS_REALSIZECONTROL = 64
Global Const $SS_NOPREFIX = 128
Global Const $SS_NOTIFY = 256
Global Const $SS_CENTERIMAGE = 512
Global Const $SS_RIGHTJUST = 1024
Global Const $SS_SUNKEN = 4096
Global Const $GUI_SS_DEFAULT_LABEL = 0
Global Const $GUI_SS_DEFAULT_GRAPHIC = 0
Global Const $GUI_SS_DEFAULT_ICON = $SS_NOTIFY
Global Const $GUI_SS_DEFAULT_PIC = $SS_NOTIFY
Global Const $STM_SETICON = 368
Global Const $STM_GETICON = 369
Global Const $STM_SETIMAGE = 370
Global Const $STM_GETIMAGE = 371
Global Const $WC_ANIMATE = "SysAnimate32"
Global Const $WC_BUTTON = "Button"
Global Const $WC_COMBOBOX = "ComboBox"
Global Const $WC_COMBOBOXEX = "ComboBoxEx32"
Global Const $WC_DATETIMEPICK = "SysDateTimePick32"
Global Const $WC_EDIT = "Edit"
Global Const $WC_HEADER = "SysHeader32"
Global Const $WC_HOTKEY = "msctls_hotkey32"
Global Const $WC_IPADDRESS = "SysIPAddress32"
Global Const $WC_LINK = "SysLink"
Global Const $WC_LISTBOX = "ListBox"
Global Const $WC_LISTVIEW = "SysListView32"
Global Const $WC_MONTHCAL = "SysMonthCal32"
Global Const $WC_NATIVEFONTCTL = "NativeFontCtl"
Global Const $WC_PAGESCROLLER = "SysPager"
Global Const $WC_PROGRESS = "msctls_progress32"
Global Const $WC_REBAR = "ReBarWindow32"
Global Const $WC_SCROLLBAR = "ScrollBar"
Global Const $WC_STATIC = "Static"
Global Const $WC_STATUSBAR = "msctls_statusbar32"
Global Const $WC_TABCONTROL = "SysTabControl32"
Global Const $WC_TOOLBAR = "ToolbarWindow32"
Global Const $WC_TOOLTIPS = "tooltips_class32"
Global Const $WC_TRACKBAR = "msctls_trackbar32"
Global Const $WC_TREEVIEW = "SysTreeView32"
Global Const $WC_UPDOWN = "msctls_updown32"
Global Const $WS_OVERLAPPED = 0
Global Const $WS_TILED = $WS_OVERLAPPED
Global Const $WS_MAXIMIZEBOX = 65536
Global Const $WS_MINIMIZEBOX = 131072
Global Const $WS_TABSTOP = 65536
Global Const $WS_GROUP = 131072
Global Const $WS_SIZEBOX = 262144
Global Const $WS_THICKFRAME = $WS_SIZEBOX
Global Const $WS_SYSMENU = 524288
Global Const $WS_HSCROLL = 1048576
Global Const $WS_VSCROLL = 2097152
Global Const $WS_DLGFRAME = 4194304
Global Const $WS_BORDER = 8388608
Global Const $WS_CAPTION = 12582912
Global Const $WS_OVERLAPPEDWINDOW = BitOR ( $WS_CAPTION , $WS_MAXIMIZEBOX , $WS_MINIMIZEBOX , $WS_OVERLAPPED , $WS_SYSMENU , $WS_THICKFRAME )
Global Const $WS_TILEDWINDOW = $WS_OVERLAPPEDWINDOW
Global Const $WS_MAXIMIZE = 16777216
Global Const $WS_CLIPCHILDREN = 33554432
Global Const $WS_CLIPSIBLINGS = 67108864
Global Const $WS_DISABLED = 134217728
Global Const $WS_VISIBLE = 268435456
Global Const $WS_MINIMIZE = 536870912
Global Const $WS_ICONIC = $WS_MINIMIZE
Global Const $WS_CHILD = 1073741824
Global Const $WS_CHILDWINDOW = $WS_CHILD
Global Const $WS_POPUP = 2147483648
Global Const $WS_POPUPWINDOW = 2156396544
Global Const $DS_3DLOOK = 4
Global Const $DS_ABSALIGN = 1
Global Const $DS_CENTER = 2048
Global Const $DS_CENTERMOUSE = 4096
Global Const $DS_CONTEXTHELP = 8192
Global Const $DS_CONTROL = 1024
Global Const $DS_FIXEDSYS = 8
Global Const $DS_LOCALEDIT = 32
Global Const $DS_MODALFRAME = 128
Global Const $DS_NOFAILCREATE = 16
Global Const $DS_NOIDLEMSG = 256
Global Const $DS_SETFONT = 64
Global Const $DS_SETFOREGROUND = 512
Global Const $DS_SHELLFONT = BitOR ( $DS_FIXEDSYS , $DS_SETFONT )
Global Const $DS_SYSMODAL = 2
Global Const $WS_EX_ACCEPTFILES = 16
Global Const $WS_EX_APPWINDOW = 262144
Global Const $WS_EX_COMPOSITED = 33554432
Global Const $WS_EX_CONTROLPARENT = 65536
Global Const $WS_EX_CLIENTEDGE = 512
Global Const $WS_EX_CONTEXTHELP = 1024
Global Const $WS_EX_DLGMODALFRAME = 1
Global Const $WS_EX_LAYERED = 524288
Global Const $WS_EX_LAYOUTRTL = 4194304
Global Const $WS_EX_LEFT = 0
Global Const $WS_EX_LEFTSCROLLBAR = 16384
Global Const $WS_EX_LTRREADING = 0
Global Const $WS_EX_MDICHILD = 64
Global Const $WS_EX_NOACTIVATE = 134217728
Global Const $WS_EX_NOINHERITLAYOUT = 1048576
Global Const $WS_EX_NOPARENTNOTIFY = 4
Global Const $WS_EX_NOREDIRECTIONBITMAP = 2097152
Global Const $WS_EX_RIGHT = 4096
Global Const $WS_EX_RIGHTSCROLLBAR = 0
Global Const $WS_EX_RTLREADING = 8192
Global Const $WS_EX_STATICEDGE = 131072
Global Const $WS_EX_TOOLWINDOW = 128
Global Const $WS_EX_TOPMOST = 8
Global Const $WS_EX_TRANSPARENT = 32
Global Const $WS_EX_WINDOWEDGE = 256
Global Const $WS_EX_OVERLAPPEDWINDOW = BitOR ( $WS_EX_CLIENTEDGE , $WS_EX_WINDOWEDGE )
Global Const $WS_EX_PALETTEWINDOW = BitOR ( $WS_EX_TOOLWINDOW , $WS_EX_TOPMOST , $WS_EX_WINDOWEDGE )
Global Const $WM_NULL = 0
Global Const $WM_CREATE = 1
Global Const $WM_DESTROY = 2
Global Const $WM_MOVE = 3
Global Const $WM_SIZEWAIT = 4
Global Const $WM_SIZE = 5
Global Const $WM_ACTIVATE = 6
Global Const $WM_SETFOCUS = 7
Global Const $WM_KILLFOCUS = 8
Global Const $WM_SETVISIBLE = 9
Global Const $WM_ENABLE = 10
Global Const $WM_SETREDRAW = 11
Global Const $WM_SETTEXT = 12
Global Const $WM_GETTEXT = 13
Global Const $WM_GETTEXTLENGTH = 14
Global Const $WM_PAINT = 15
Global Const $WM_CLOSE = 16
Global Const $WM_QUERYENDSESSION = 17
Global Const $WM_QUIT = 18
Global Const $WM_ERASEBKGND = 20
Global Const $WM_QUERYOPEN = 19
Global Const $WM_SYSCOLORCHANGE = 21
Global Const $WM_ENDSESSION = 22
Global Const $WM_SYSTEMERROR = 23
Global Const $WM_SHOWWINDOW = 24
Global Const $WM_CTLCOLOR = 25
Global Const $WM_SETTINGCHANGE = 26
Global Const $WM_WININICHANGE = 26
Global Const $WM_DEVMODECHANGE = 27
Global Const $WM_ACTIVATEAPP = 28
Global Const $WM_FONTCHANGE = 29
Global Const $WM_TIMECHANGE = 30
Global Const $WM_CANCELMODE = 31
Global Const $WM_SETCURSOR = 32
Global Const $WM_MOUSEACTIVATE = 33
Global Const $WM_CHILDACTIVATE = 34
Global Const $WM_QUEUESYNC = 35
Global Const $WM_GETMINMAXINFO = 36
Global Const $WM_LOGOFF = 37
Global Const $WM_PAINTICON = 38
Global Const $WM_ICONERASEBKGND = 39
Global Const $WM_NEXTDLGCTL = 40
Global Const $WM_ALTTABACTIVE = 41
Global Const $WM_SPOOLERSTATUS = 42
Global Const $WM_DRAWITEM = 43
Global Const $WM_MEASUREITEM = 44
Global Const $WM_DELETEITEM = 45
Global Const $WM_VKEYTOITEM = 46
Global Const $WM_CHARTOITEM = 47
Global Const $WM_SETFONT = 48
Global Const $WM_GETFONT = 49
Global Const $WM_SETHOTKEY = 50
Global Const $WM_GETHOTKEY = 51
Global Const $WM_FILESYSCHANGE = 52
Global Const $WM_ISACTIVEICON = 53
Global Const $WM_QUERYPARKICON = 54
Global Const $WM_QUERYDRAGICON = 55
Global Const $WM_WINHELP = 56
Global Const $WM_COMPAREITEM = 57
Global Const $WM_FULLSCREEN = 58
Global Const $WM_CLIENTSHUTDOWN = 59
Global Const $WM_DDEMLEVENT = 60
Global Const $WM_GETOBJECT = 61
Global Const $WM_CALCSCROLL = 63
Global Const $WM_TESTING = 64
Global Const $WM_COMPACTING = 65
Global Const $WM_OTHERWINDOWCREATED = 66
Global Const $WM_OTHERWINDOWDESTROYED = 67
Global Const $WM_COMMNOTIFY = 68
Global Const $WM_MEDIASTATUSCHANGE = 69
Global Const $WM_WINDOWPOSCHANGING = 70
Global Const $WM_WINDOWPOSCHANGED = 71
Global Const $WM_POWER = 72
Global Const $WM_COPYGLOBALDATA = 73
Global Const $WM_COPYDATA = 74
Global Const $WM_CANCELJOURNAL = 75
Global Const $WM_LOGONNOTIFY = 76
Global Const $WM_KEYF1 = 77
Global Const $WM_NOTIFY = 78
Global Const $WM_ACCESS_WINDOW = 79
Global Const $WM_INPUTLANGCHANGEREQUEST = 80
Global Const $WM_INPUTLANGCHANGE = 81
Global Const $WM_TCARD = 82
Global Const $WM_HELP = 83
Global Const $WM_USERCHANGED = 84
Global Const $WM_NOTIFYFORMAT = 85
Global Const $WM_QM_ACTIVATE = 96
Global Const $WM_HOOK_DO_CALLBACK = 97
Global Const $WM_SYSCOPYDATA = 98
Global Const $WM_FINALDESTROY = 112
Global Const $WM_MEASUREITEM_CLIENTDATA = 113
Global Const $WM_CONTEXTMENU = 123
Global Const $WM_STYLECHANGING = 124
Global Const $WM_STYLECHANGED = 125
Global Const $WM_DISPLAYCHANGE = 126
Global Const $WM_GETICON = 127
Global Const $WM_SETICON = 128
Global Const $WM_NCCREATE = 129
Global Const $WM_NCDESTROY = 130
Global Const $WM_NCCALCSIZE = 131
Global Const $WM_NCHITTEST = 132
Global Const $WM_NCPAINT = 133
Global Const $WM_NCACTIVATE = 134
Global Const $WM_GETDLGCODE = 135
Global Const $WM_SYNCPAINT = 136
Global Const $WM_SYNCTASK = 137
Global Const $WM_KLUDGEMINRECT = 139
Global Const $WM_LPKDRAWSWITCHWND = 140
Global Const $WM_UAHDESTROYWINDOW = 144
Global Const $WM_UAHDRAWMENU = 145
Global Const $WM_UAHDRAWMENUITEM = 146
Global Const $WM_UAHINITMENU = 147
Global Const $WM_UAHMEASUREMENUITEM = 148
Global Const $WM_UAHNCPAINTMENUPOPUP = 149
Global Const $WM_NCMOUSEMOVE = 160
Global Const $WM_NCLBUTTONDOWN = 161
Global Const $WM_NCLBUTTONUP = 162
Global Const $WM_NCLBUTTONDBLCLK = 163
Global Const $WM_NCRBUTTONDOWN = 164
Global Const $WM_NCRBUTTONUP = 165
Global Const $WM_NCRBUTTONDBLCLK = 166
Global Const $WM_NCMBUTTONDOWN = 167
Global Const $WM_NCMBUTTONUP = 168
Global Const $WM_NCMBUTTONDBLCLK = 169
Global Const $WM_NCXBUTTONDOWN = 171
Global Const $WM_NCXBUTTONUP = 172
Global Const $WM_NCXBUTTONDBLCLK = 173
Global Const $WM_NCUAHDRAWCAPTION = 174
Global Const $WM_NCUAHDRAWFRAME = 175
Global Const $WM_INPUT_DEVICE_CHANGE = 254
Global Const $WM_INPUT = 255
Global Const $WM_KEYDOWN = 256
Global Const $WM_KEYFIRST = 256
Global Const $WM_KEYUP = 257
Global Const $WM_CHAR = 258
Global Const $WM_DEADCHAR = 259
Global Const $WM_SYSKEYDOWN = 260
Global Const $WM_SYSKEYUP = 261
Global Const $WM_SYSCHAR = 262
Global Const $WM_SYSDEADCHAR = 263
Global Const $WM_YOMICHAR = 264
Global Const $WM_KEYLAST = 265
Global Const $WM_UNICHAR = 265
Global Const $WM_CONVERTREQUEST = 266
Global Const $WM_CONVERTRESULT = 267
Global Const $WM_IM_INFO = 268
Global Const $WM_IME_STARTCOMPOSITION = 269
Global Const $WM_IME_ENDCOMPOSITION = 270
Global Const $WM_IME_COMPOSITION = 271
Global Const $WM_IME_KEYLAST = 271
Global Const $WM_INITDIALOG = 272
Global Const $WM_COMMAND = 273
Global Const $WM_SYSCOMMAND = 274
Global Const $WM_TIMER = 275
Global Const $WM_HSCROLL = 276
Global Const $WM_VSCROLL = 277
Global Const $WM_INITMENU = 278
Global Const $WM_INITMENUPOPUP = 279
Global Const $WM_SYSTIMER = 280
Global Const $WM_GESTURE = 281
Global Const $WM_GESTURENOTIFY = 282
Global Const $WM_GESTUREINPUT = 283
Global Const $WM_GESTURENOTIFIED = 284
Global Const $WM_MENUSELECT = 287
Global Const $WM_MENUCHAR = 288
Global Const $WM_ENTERIDLE = 289
Global Const $WM_MENURBUTTONUP = 290
Global Const $WM_MENUDRAG = 291
Global Const $WM_MENUGETOBJECT = 292
Global Const $WM_UNINITMENUPOPUP = 293
Global Const $WM_MENUCOMMAND = 294
Global Const $WM_CHANGEUISTATE = 295
Global Const $WM_UPDATEUISTATE = 296
Global Const $WM_QUERYUISTATE = 297
Global Const $WM_LBTRACKPOINT = 305
Global Const $WM_CTLCOLORMSGBOX = 306
Global Const $WM_CTLCOLOREDIT = 307
Global Const $WM_CTLCOLORLISTBOX = 308
Global Const $WM_CTLCOLORBTN = 309
Global Const $WM_CTLCOLORDLG = 310
Global Const $WM_CTLCOLORSCROLLBAR = 311
Global Const $WM_CTLCOLORSTATIC = 312
Global Const $MN_GETHMENU = 481
Global Const $WM_PARENTNOTIFY = 528
Global Const $WM_ENTERMENULOOP = 529
Global Const $WM_EXITMENULOOP = 530
Global Const $WM_NEXTMENU = 531
Global Const $WM_SIZING = 532
Global Const $WM_CAPTURECHANGED = 533
Global Const $WM_MOVING = 534
Global Const $WM_POWERBROADCAST = 536
Global Const $WM_DEVICECHANGE = 537
Global Const $WM_MDICREATE = 544
Global Const $WM_MDIDESTROY = 545
Global Const $WM_MDIACTIVATE = 546
Global Const $WM_MDIRESTORE = 547
Global Const $WM_MDINEXT = 548
Global Const $WM_MDIMAXIMIZE = 549
Global Const $WM_MDITILE = 550
Global Const $WM_MDICASCADE = 551
Global Const $WM_MDIICONARRANGE = 552
Global Const $WM_MDIGETACTIVE = 553
Global Const $WM_DROPOBJECT = 554
Global Const $WM_QUERYDROPOBJECT = 555
Global Const $WM_BEGINDRAG = 556
Global Const $WM_DRAGLOOP = 557
Global Const $WM_DRAGSELECT = 558
Global Const $WM_DRAGMOVE = 559
Global Const $WM_MDISETMENU = 560
Global Const $WM_ENTERSIZEMOVE = 561
Global Const $WM_EXITSIZEMOVE = 562
Global Const $WM_DROPFILES = 563
Global Const $WM_MDIREFRESHMENU = 564
Global Const $WM_TOUCH = 576
Global Const $WM_IME_SETCONTEXT = 641
Global Const $WM_IME_NOTIFY = 642
Global Const $WM_IME_CONTROL = 643
Global Const $WM_IME_COMPOSITIONFULL = 644
Global Const $WM_IME_SELECT = 645
Global Const $WM_IME_CHAR = 646
Global Const $WM_IME_SYSTEM = 647
Global Const $WM_IME_REQUEST = 648
Global Const $WM_IME_KEYDOWN = 656
Global Const $WM_IME_KEYUP = 657
Global Const $WM_NCMOUSEHOVER = 672
Global Const $WM_MOUSEHOVER = 673
Global Const $WM_NCMOUSELEAVE = 674
Global Const $WM_MOUSELEAVE = 675
Global Const $WM_WTSSESSION_CHANGE = 689
Global Const $WM_TABLET_FIRST = 704
Global Const $WM_TABLET_LAST = 735
Global Const $WM_CUT = 768
Global Const $WM_COPY = 769
Global Const $WM_PASTE = 770
Global Const $WM_CLEAR = 771
Global Const $WM_UNDO = 772
Global Const $WM_PALETTEISCHANGING = 784
Global Const $WM_HOTKEY = 786
Global Const $WM_PALETTECHANGED = 785
Global Const $WM_SYSMENU = 787
Global Const $WM_HOOKMSG = 788
Global Const $WM_EXITPROCESS = 789
Global Const $WM_WAKETHREAD = 790
Global Const $WM_PRINT = 791
Global Const $WM_PRINTCLIENT = 792
Global Const $WM_APPCOMMAND = 793
Global Const $WM_QUERYNEWPALETTE = 783
Global Const $WM_THEMECHANGED = 794
Global Const $WM_UAHINIT = 795
Global Const $WM_DESKTOPNOTIFY = 796
Global Const $WM_CLIPBOARDUPDATE = 797
Global Const $WM_DWMCOMPOSITIONCHANGED = 798
Global Const $WM_DWMNCRENDERINGCHANGED = 799
Global Const $WM_DWMCOLORIZATIONCOLORCHANGED = 800
Global Const $WM_DWMWINDOWMAXIMIZEDCHANGE = 801
Global Const $WM_DWMEXILEFRAME = 802
Global Const $WM_DWMSENDICONICTHUMBNAIL = 803
Global Const $WM_MAGNIFICATION_STARTED = 804
Global Const $WM_MAGNIFICATION_ENDED = 805
Global Const $WM_DWMSENDICONICLIVEPREVIEWBITMAP = 806
Global Const $WM_DWMTHUMBNAILSIZECHANGED = 807
Global Const $WM_MAGNIFICATION_OUTPUT = 808
Global Const $WM_MEASURECONTROL = 816
Global Const $WM_GETACTIONTEXT = 817
Global Const $WM_FORWARDKEYDOWN = 819
Global Const $WM_FORWARDKEYUP = 820
Global Const $WM_GETTITLEBARINFOEX = 831
Global Const $WM_NOTIFYWOW = 832
Global Const $WM_HANDHELDFIRST = 856
Global Const $WM_HANDHELDLAST = 863
Global Const $WM_AFXFIRST = 864
Global Const $WM_AFXLAST = 895
Global Const $WM_PENWINFIRST = 896
Global Const $WM_PENWINLAST = 911
Global Const $WM_DDE_INITIATE = 992
Global Const $WM_DDE_TERMINATE = 993
Global Const $WM_DDE_ADVISE = 994
Global Const $WM_DDE_UNADVISE = 995
Global Const $WM_DDE_ACK = 996
Global Const $WM_DDE_DATA = 997
Global Const $WM_DDE_REQUEST = 998
Global Const $WM_DDE_POKE = 999
Global Const $WM_DDE_EXECUTE = 1000
Global Const $WM_DBNOTIFICATION = 1021
Global Const $WM_NETCONNECT = 1022
Global Const $WM_HIBERNATE = 1023
Global Const $WM_USER = 1024
Global Const $WM_APP = 32768
Global Const $NM_FIRST = 0
Global Const $NM_OUTOFMEMORY = $NM_FIRST + 4294967295
Global Const $NM_CLICK = $NM_FIRST + 4294967294
Global Const $NM_DBLCLK = $NM_FIRST + 4294967293
Global Const $NM_RETURN = $NM_FIRST + 4294967292
Global Const $NM_RCLICK = $NM_FIRST + 4294967291
Global Const $NM_RDBLCLK = $NM_FIRST + 4294967290
Global Const $NM_SETFOCUS = $NM_FIRST + 4294967289
Global Const $NM_KILLFOCUS = $NM_FIRST + 4294967288
Global Const $NM_CUSTOMDRAW = $NM_FIRST + 4294967284
Global Const $NM_HOVER = $NM_FIRST + 4294967283
Global Const $NM_NCHITTEST = $NM_FIRST + 4294967282
Global Const $NM_KEYDOWN = $NM_FIRST + 4294967281
Global Const $NM_RELEASEDCAPTURE = $NM_FIRST + 4294967280
Global Const $NM_SETCURSOR = $NM_FIRST + 4294967279
Global Const $NM_CHAR = $NM_FIRST + 4294967278
Global Const $NM_TOOLTIPSCREATED = $NM_FIRST + 4294967277
Global Const $NM_LDOWN = $NM_FIRST + 4294967276
Global Const $NM_RDOWN = $NM_FIRST + 4294967275
Global Const $NM_THEMECHANGED = $NM_FIRST + 4294967274
Global Const $WM_MOUSEFIRST = 512
Global Const $WM_MOUSEMOVE = 512
Global Const $WM_LBUTTONDOWN = 513
Global Const $WM_LBUTTONUP = 514
Global Const $WM_LBUTTONDBLCLK = 515
Global Const $WM_RBUTTONDOWN = 516
Global Const $WM_RBUTTONUP = 517
Global Const $WM_RBUTTONDBLCLK = 518
Global Const $WM_MBUTTONDOWN = 519
Global Const $WM_MBUTTONUP = 520
Global Const $WM_MBUTTONDBLCLK = 521
Global Const $WM_MOUSEWHEEL = 522
Global Const $WM_XBUTTONDOWN = 523
Global Const $WM_XBUTTONUP = 524
Global Const $WM_XBUTTONDBLCLK = 525
Global Const $WM_MOUSEHWHEEL = 526
Global Const $PS_SOLID = 0
Global Const $PS_DASH = 1
Global Const $PS_DOT = 2
Global Const $PS_DASHDOT = 3
Global Const $PS_DASHDOTDOT = 4
Global Const $PS_NULL = 5
Global Const $PS_INSIDEFRAME = 6
Global Const $PS_USERSTYLE = 7
Global Const $PS_ALTERNATE = 8
Global Const $PS_ENDCAP_ROUND = 0
Global Const $PS_ENDCAP_SQUARE = 256
Global Const $PS_ENDCAP_FLAT = 512
Global Const $PS_JOIN_BEVEL = 4096
Global Const $PS_JOIN_MITER = 8192
Global Const $PS_JOIN_ROUND = 0
Global Const $PS_GEOMETRIC = 65536
Global Const $PS_COSMETIC = 0
Global Const $LWA_ALPHA = 2
Global Const $LWA_COLORKEY = 1
Global Const $RGN_AND = 1
Global Const $RGN_OR = 2
Global Const $RGN_XOR = 3
Global Const $RGN_DIFF = 4
Global Const $RGN_COPY = 5
Global Const $ERRORREGION = 0
Global Const $NULLREGION = 1
Global Const $SIMPLEREGION = 2
Global Const $COMPLEXREGION = 3
Global Const $TRANSPARENT = 1
Global Const $OPAQUE = 2
Global Const $CCM_FIRST = 8192
Global Const $CCM_GETUNICODEFORMAT = ( $CCM_FIRST + 6 )
Global Const $CCM_SETUNICODEFORMAT = ( $CCM_FIRST + 5 )
Global Const $CCM_SETBKCOLOR = $CCM_FIRST + 1
Global Const $CCM_SETCOLORSCHEME = $CCM_FIRST + 2
Global Const $CCM_GETCOLORSCHEME = $CCM_FIRST + 3
Global Const $CCM_GETDROPTARGET = $CCM_FIRST + 4
Global Const $CCM_SETWINDOWTHEME = $CCM_FIRST + 11
Global Const $GA_PARENT = 1
Global Const $GA_ROOT = 2
Global Const $GA_ROOTOWNER = 3
Global Const $SM_CXSCREEN = 0
Global Const $SM_CYSCREEN = 1
Global Const $SM_CXVSCROLL = 2
Global Const $SM_CYHSCROLL = 3
Global Const $SM_CYCAPTION = 4
Global Const $SM_CXBORDER = 5
Global Const $SM_CYBORDER = 6
Global Const $SM_CXFIXEDFRAME = 7
Global Const $SM_CXDLGFRAME = $SM_CXFIXEDFRAME
Global Const $SM_CYFIXEDFRAME = 8
Global Const $SM_CYDLGFRAME = $SM_CYFIXEDFRAME
Global Const $SM_CYVTHUMB = 9
Global Const $SM_CXHTHUMB = 10
Global Const $SM_CXICON = 11
Global Const $SM_CYICON = 12
Global Const $SM_CXCURSOR = 13
Global Const $SM_CYCURSOR = 14
Global Const $SM_CYMENU = 15
Global Const $SM_CXFULLSCREEN = 16
Global Const $SM_CYFULLSCREEN = 17
Global Const $SM_CYKANJIWINDOW = 18
Global Const $SM_MOUSEPRESENT = 19
Global Const $SM_CYVSCROLL = 20
Global Const $SM_CXHSCROLL = 21
Global Const $SM_DEBUG = 22
Global Const $SM_SWAPBUTTON = 23
Global Const $SM_RESERVED1 = 24
Global Const $SM_RESERVED2 = 25
Global Const $SM_RESERVED3 = 26
Global Const $SM_RESERVED4 = 27
Global Const $SM_CXMIN = 28
Global Const $SM_CYMIN = 29
Global Const $SM_CXSIZE = 30
Global Const $SM_CYSIZE = 31
Global Const $SM_CXSIZEFRAME = 32
Global Const $SM_CXFRAME = $SM_CXSIZEFRAME
Global Const $SM_CYSIZEFRAME = 33
Global Const $SM_CYFRAME = $SM_CYSIZEFRAME
Global Const $SM_CXMINTRACK = 34
Global Const $SM_CYMINTRACK = 35
Global Const $SM_CXDOUBLECLK = 36
Global Const $SM_CYDOUBLECLK = 37
Global Const $SM_CXICONSPACING = 38
Global Const $SM_CYICONSPACING = 39
Global Const $SM_MENUDROPALIGNMENT = 40
Global Const $SM_PENWINDOWS = 41
Global Const $SM_DBCSENABLED = 42
Global Const $SM_CMOUSEBUTTONS = 43
Global Const $SM_SECURE = 44
Global Const $SM_CXEDGE = 45
Global Const $SM_CYEDGE = 46
Global Const $SM_CXMINSPACING = 47
Global Const $SM_CYMINSPACING = 48
Global Const $SM_CXSMICON = 49
Global Const $SM_CYSMICON = 50
Global Const $SM_CYSMCAPTION = 51
Global Const $SM_CXSMSIZE = 52
Global Const $SM_CYSMSIZE = 53
Global Const $SM_CXMENUSIZE = 54
Global Const $SM_CYMENUSIZE = 55
Global Const $SM_ARRANGE = 56
Global Const $SM_CXMINIMIZED = 57
Global Const $SM_CYMINIMIZED = 58
Global Const $SM_CXMAXTRACK = 59
Global Const $SM_CYMAXTRACK = 60
Global Const $SM_CXMAXIMIZED = 61
Global Const $SM_CYMAXIMIZED = 62
Global Const $SM_NETWORK = 63
Global Const $SM_CLEANBOOT = 67
Global Const $SM_CXDRAG = 68
Global Const $SM_CYDRAG = 69
Global Const $SM_SHOWSOUNDS = 70
Global Const $SM_CXMENUCHECK = 71
Global Const $SM_CYMENUCHECK = 72
Global Const $SM_SLOWMACHINE = 73
Global Const $SM_MIDEASTENABLED = 74
Global Const $SM_MOUSEWHEELPRESENT = 75
Global Const $SM_XVIRTUALSCREEN = 76
Global Const $SM_YVIRTUALSCREEN = 77
Global Const $SM_CXVIRTUALSCREEN = 78
Global Const $SM_CYVIRTUALSCREEN = 79
Global Const $SM_CMONITORS = 80
Global Const $SM_SAMEDISPLAYFORMAT = 81
Global Const $SM_IMMENABLED = 82
Global Const $SM_CXFOCUSBORDER = 83
Global Const $SM_CYFOCUSBORDER = 84
Global Const $SM_TABLETPC = 86
Global Const $SM_MEDIACENTER = 87
Global Const $SM_STARTER = 88
Global Const $SM_SERVERR2 = 89
Global Const $SM_CMETRICS = 90
Global Const $SM_REMOTESESSION = 4096
Global Const $SM_SHUTTINGDOWN = 8192
Global Const $SM_REMOTECONTROL = 8193
Global Const $SM_CARETBLINKINGENABLED = 8194
Global Const $BLACKNESS = 66
Global Const $CAPTUREBLT = 1073741824
Global Const $DSTINVERT = 5570569
Global Const $MERGECOPY = 12583114
Global Const $MERGEPAINT = 12255782
Global Const $NOMIRRORBITMAP = 2147483648
Global Const $NOTSRCCOPY = 3342344
Global Const $NOTSRCERASE = 1114278
Global Const $PATCOPY = 15728673
Global Const $PATINVERT = 5898313
Global Const $PATPAINT = 16452105
Global Const $SRCAND = 8913094
Global Const $SRCCOPY = 13369376
Global Const $SRCERASE = 4457256
Global Const $SRCINVERT = 6684742
Global Const $SRCPAINT = 15597702
Global Const $WHITENESS = 16711778
Global Const $DT_BOTTOM = 8
Global Const $DT_CALCRECT = 1024
Global Const $DT_CENTER = 1
Global Const $DT_EDITCONTROL = 8192
Global Const $DT_END_ELLIPSIS = 32768
Global Const $DT_EXPANDTABS = 64
Global Const $DT_EXTERNALLEADING = 512
Global Const $DT_HIDEPREFIX = 1048576
Global Const $DT_INTERNAL = 4096
Global Const $DT_LEFT = 0
Global Const $DT_MODIFYSTRING = 65536
Global Const $DT_NOCLIP = 256
Global Const $DT_NOFULLWIDTHCHARBREAK = 524288
Global Const $DT_NOPREFIX = 2048
Global Const $DT_PATH_ELLIPSIS = 16384
Global Const $DT_PREFIXONLY = 2097152
Global Const $DT_RIGHT = 2
Global Const $DT_RTLREADING = 131072
Global Const $DT_SINGLELINE = 32
Global Const $DT_TABSTOP = 128
Global Const $DT_TOP = 0
Global Const $DT_VCENTER = 4
Global Const $DT_WORDBREAK = 16
Global Const $DT_WORD_ELLIPSIS = 262144
Global Const $RDW_ERASE = 4
Global Const $RDW_FRAME = 1024
Global Const $RDW_INTERNALPAINT = 2
Global Const $RDW_INVALIDATE = 1
Global Const $RDW_NOERASE = 32
Global Const $RDW_NOFRAME = 2048
Global Const $RDW_NOINTERNALPAINT = 16
Global Const $RDW_VALIDATE = 8
Global Const $RDW_ERASENOW = 512
Global Const $RDW_UPDATENOW = 256
Global Const $RDW_ALLCHILDREN = 128
Global Const $RDW_NOCHILDREN = 64
Global Const $WM_RENDERFORMAT = 773
Global Const $WM_RENDERALLFORMATS = 774
Global Const $WM_DESTROYCLIPBOARD = 775
Global Const $WM_DRAWCLIPBOARD = 776
Global Const $WM_PAINTCLIPBOARD = 777
Global Const $WM_VSCROLLCLIPBOARD = 778
Global Const $WM_SIZECLIPBOARD = 779
Global Const $WM_ASKCBFORMATNAME = 780
Global Const $WM_CHANGECBCHAIN = 781
Global Const $WM_HSCROLLCLIPBOARD = 782
Global Const $HTERROR = + 4294967294
Global Const $HTTRANSPARENT = + 4294967295
Global Const $HTNOWHERE = 0
Global Const $HTCLIENT = 1
Global Const $HTCAPTION = 2
Global Const $HTSYSMENU = 3
Global Const $HTGROWBOX = 4
Global Const $HTSIZE = $HTGROWBOX
Global Const $HTMENU = 5
Global Const $HTHSCROLL = 6
Global Const $HTVSCROLL = 7
Global Const $HTMINBUTTON = 8
Global Const $HTMAXBUTTON = 9
Global Const $HTLEFT = 10
Global Const $HTRIGHT = 11
Global Const $HTTOP = 12
Global Const $HTTOPLEFT = 13
Global Const $HTTOPRIGHT = 14
Global Const $HTBOTTOM = 15
Global Const $HTBOTTOMLEFT = 16
Global Const $HTBOTTOMRIGHT = 17
Global Const $HTBORDER = 18
Global Const $HTREDUCE = $HTMINBUTTON
Global Const $HTZOOM = $HTMAXBUTTON
Global Const $HTSIZEFIRST = $HTLEFT
Global Const $HTSIZELAST = $HTBOTTOMRIGHT
Global Const $HTOBJECT = 19
Global Const $HTCLOSE = 20
Global Const $HTHELP = 21
Global Const $COLOR_SCROLLBAR = 0
Global Const $COLOR_BACKGROUND = 1
Global Const $COLOR_ACTIVECAPTION = 2
Global Const $COLOR_INACTIVECAPTION = 3
Global Const $COLOR_MENU = 4
Global Const $COLOR_WINDOW = 5
Global Const $COLOR_WINDOWFRAME = 6
Global Const $COLOR_MENUTEXT = 7
Global Const $COLOR_WINDOWTEXT = 8
Global Const $COLOR_CAPTIONTEXT = 9
Global Const $COLOR_ACTIVEBORDER = 10
Global Const $COLOR_INACTIVEBORDER = 11
Global Const $COLOR_APPWORKSPACE = 12
Global Const $COLOR_HIGHLIGHT = 13
Global Const $COLOR_HIGHLIGHTTEXT = 14
Global Const $COLOR_BTNFACE = 15
Global Const $COLOR_BTNSHADOW = 16
Global Const $COLOR_GRAYTEXT = 17
Global Const $COLOR_BTNTEXT = 18
Global Const $COLOR_INACTIVECAPTIONTEXT = 19
Global Const $COLOR_BTNHIGHLIGHT = 20
Global Const $COLOR_3DDKSHADOW = 21
Global Const $COLOR_3DLIGHT = 22
Global Const $COLOR_INFOTEXT = 23
Global Const $COLOR_INFOBK = 24
Global Const $COLOR_HOTLIGHT = 26
Global Const $COLOR_GRADIENTACTIVECAPTION = 27
Global Const $COLOR_GRADIENTINACTIVECAPTION = 28
Global Const $COLOR_MENUHILIGHT = 29
Global Const $COLOR_MENUBAR = 30
Global Const $COLOR_DESKTOP = 1
Global Const $COLOR_3DFACE = 15
Global Const $COLOR_3DSHADOW = 16
Global Const $COLOR_3DHIGHLIGHT = 20
Global Const $COLOR_3DHILIGHT = 20
Global Const $COLOR_BTNHILIGHT = 20
Global Const $HINST_COMMCTRL = + 4294967295
Global Const $IDB_STD_SMALL_COLOR = 0
Global Const $IDB_STD_LARGE_COLOR = 1
Global Const $IDB_VIEW_SMALL_COLOR = 4
Global Const $IDB_VIEW_LARGE_COLOR = 5
Global Const $IDB_HIST_SMALL_COLOR = 8
Global Const $IDB_HIST_LARGE_COLOR = 9
Global Const $STARTF_FORCEOFFFEEDBACK = 128
Global Const $STARTF_FORCEONFEEDBACK = 64
Global Const $STARTF_PREVENTPINNING = 8192
Global Const $STARTF_RUNFULLSCREEN = 32
Global Const $STARTF_TITLEISAPPID = 4096
Global Const $STARTF_TITLEISLINKNAME = 2048
Global Const $STARTF_USECOUNTCHARS = 8
Global Const $STARTF_USEFILLATTRIBUTE = 16
Global Const $STARTF_USEHOTKEY = 512
Global Const $STARTF_USEPOSITION = 4
Global Const $STARTF_USESHOWWINDOW = 1
Global Const $STARTF_USESIZE = 2
Global Const $STARTF_USESTDHANDLES = 256
Global Const $CDDS_PREPAINT = 1
Global Const $CDDS_POSTPAINT = 2
Global Const $CDDS_PREERASE = 3
Global Const $CDDS_POSTERASE = 4
Global Const $CDDS_ITEM = 65536
Global Const $CDDS_ITEMPREPAINT = 65537
Global Const $CDDS_ITEMPOSTPAINT = 65538
Global Const $CDDS_ITEMPREERASE = 65539
Global Const $CDDS_ITEMPOSTERASE = 65540
Global Const $CDDS_SUBITEM = 131072
Global Const $CDIS_SELECTED = 1
Global Const $CDIS_GRAYED = 2
Global Const $CDIS_DISABLED = 4
Global Const $CDIS_CHECKED = 8
Global Const $CDIS_FOCUS = 16
Global Const $CDIS_DEFAULT = 32
Global Const $CDIS_HOT = 64
Global Const $CDIS_MARKED = 128
Global Const $CDIS_INDETERMINATE = 256
Global Const $CDIS_SHOWKEYBOARDCUES = 512
Global Const $CDIS_NEARHOT = 1024
Global Const $CDIS_OTHERSIDEHOT = 2048
Global Const $CDIS_DROPHILITED = 4096
Global Const $CDRF_DODEFAULT = 0
Global Const $CDRF_NEWFONT = 2
Global Const $CDRF_SKIPDEFAULT = 4
Global Const $CDRF_NOTIFYPOSTPAINT = 16
Global Const $CDRF_NOTIFYITEMDRAW = 32
Global Const $CDRF_NOTIFYSUBITEMDRAW = 32
Global Const $CDRF_NOTIFYPOSTERASE = 64
Global Const $CDRF_DOERASE = 8
Global Const $CDRF_SKIPPOSTPAINT = 256
Global Const $GUI_SS_DEFAULT_GUI = BitOR ( $WS_MINIMIZEBOX , $WS_CAPTION , $WS_POPUP , $WS_SYSMENU )
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
