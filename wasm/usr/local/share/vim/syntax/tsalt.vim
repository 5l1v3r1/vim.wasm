if exists("b:current_syntax")
finish
endif
let s:cpo_save = &cpo
set cpo&vim
syn case ignore
syn keyword tsaltFunction	IsAscii IsAlNum IsAlpha IsCntrl IsDigit
syn keyword tsaltFunction	IsLower IsUpper ToLower ToUpper
syn keyword tsaltFunction	Carrier cInp_Cnt cGetC cGetCT cPutC cPutN
syn keyword tsaltFunction	cPutS cPutS_TR FlushBuf Get_Baud
syn keyword tsaltFunction	Get_DataB Get_Port Get_StopB Hangup
syn keyword tsaltFunction	KillConnectDevice MakeConnectDevice
syn keyword tsaltFunction	Send_Brk Set_ConnectDevice Set_Port
syn keyword tsaltFunction	fClearErr fClose fDelete fError fEOF fFlush
syn keyword tsaltFunction	fGetC fGetS FileAttr FileFind FileSize
syn keyword tsaltFunction	FileTime fnStrip fOpen fPutC fPutS fRead
syn keyword tsaltFunction	fRename fSeek fTell fWrite
syn keyword tsaltFunction	Capture Capture_Stat Printer Receive Send
syn keyword tsaltFunction	Set_DefProt UsageLog Usage_Stat UStamp
syn keyword tsaltFunction	Track Track_AddChr Track_Free Track_Hit
syn keyword tsaltFunction	WaitFor
syn keyword tsaltFunction	InKey InKeyW KeyGet KeyLoad KeySave KeySet
syn keyword tsaltFunction	ChatMode Dos Dial DosFunction ExitTelix
syn keyword tsaltFunction	GetEnv GetFon HelpScreen LoadFon NewDir
syn keyword tsaltFunction	Randon Redial RedirectDOS Run
syn keyword tsaltFunction	Set_Terminal Show_Directory TelixVersion
syn keyword tsaltFunction	Terminal TransTab Update_Term
syn keyword tsaltFunction	ArgCount Call CallD CompileScript GetRunPath
syn keyword tsaltFunction	Is_Loaded Load_Scr ScriptVersion
syn keyword tsaltFunction	TelixForWindows Unload_Scr
syn keyword tsaltFunction	Alarm PlayWave Tone
syn keyword tsaltFunction	CopyChrs CopyStr DelChrs GetS GetSXY
syn keyword tsaltFunction	InputBox InsChrs ItoS SetChr StoI StrCat
syn keyword tsaltFunction	StrChr StrCompI StrLen StrLower StrMaxLen
syn keyword tsaltFunction	StrPos StrPosI StrUpper SubChr SubChrs
syn keyword tsaltFunction	SubStr
syn keyword tsaltFunction	CurTime Date Delay Delay_Scr Get_OnlineTime
syn keyword tsaltFunction	tDay tHour tMin tMonth tSec tYear Time
syn keyword tsaltFunction	Time_Up Timer_Free Time_Restart
syn keyword tsaltFunction	Time_Start Time_Total
syn keyword tsaltFunction	Box CNewLine Cursor_OnOff Clear_Scr
syn keyword tsaltFunction	GetTermHeight GetTermWidth GetX GetY
syn keyword tsaltFunction	GotoXY MsgBox NewLine PrintC PrintC_Trm
syn keyword tsaltFunction	PrintN PrintN_Trm PrintS PrintS_Trm
syn keyword tsaltFunction	PrintSC PRintSC_Trm
syn keyword tsaltFunction	PStrA PStrAXY Scroll Status_Wind vGetChr
syn keyword tsaltFunction	vGetChrs vGetChrsA  vPutChr vPutChrs
syn keyword tsaltFunction	vPutChrsA vRstrArea vSaveArea
syn keyword tsaltFunction	DDEExecute DDEInitate DDEPoke DDERequest
syn keyword tsaltFunction	DDETerminate DDETerminateAll
syn keyword tsaltSysVar	_add_lf _alarm_on _answerback_str _asc_rcrtrans
syn keyword tsaltSysVar	_asc_remabort _asc_rlftrans _asc_scpacing
syn keyword tsaltSysVar	_asc_scrtrans _asc_secho _asc_slpacing
syn keyword tsaltSysVar	_asc_spacechr _asc_striph _back_color
syn keyword tsaltSysVar	_capture_fname _connect_str _dest_bs
syn keyword tsaltSysVar	_dial_pause _dial_time _dial_post
syn keyword tsaltSysVar	_dial_pref1 _dial_pref2 _dial_pref3
syn keyword tsaltSysVar	_dial_pref4 _dir_prog _down_dir
syn keyword tsaltSysVar	_entry_bbstype _entry_comment _entry_enum
syn keyword tsaltSysVar	_entry_name _entry_num _entry_logonname
syn keyword tsaltSysVar	_entry_pass _fore_color _image_file
syn keyword tsaltSysVar	_local_echo _mdm_hang_str _mdm_init_str
syn keyword tsaltSysVar	_no_connect1 _no_connect2 _no_connect3
syn keyword tsaltSysVar	_no_connect4 _no_connect5 _redial_stop
syn keyword tsaltSysVar	_scr_chk_key _script_dir _sound_on
syn keyword tsaltSysVar	_strip_high _swap_bs _telix_dir _up_dir
syn keyword tsaltSysVar	_usage_fname _zmodauto _zmod_rcrash
syn keyword tsaltSysVar	_zmod_scrash
syn keyword tsaltType	str int
syn keyword tsaltStatement	goto break return continue
syn keyword tsaltConditional	if then else
syn keyword tsaltRepeat		while for do
syn keyword tsaltTodo contained	TODO
syn match tsaltSpecial		contained "\^\d\d\d\|\^."
syn region tsaltString		start=+"+  skip=+\\\\\|\\"+  end=+"+  contains=tsaltSpecial
syn match tsaltCharacter	"'[^\\]'"
syn match tsaltSpecialCharacter	"'\\.'"
syn region tsaltParen		transparent start='(' end=')' contains=ALLBUT,tsaltParenError,tsaltIncluded,tsaltSpecial,tsaltTodo
syn match tsaltParenError		")"
syn match tsaltInParen		contained "[{}]"
hi link tsaltParenError		tsaltError
hi link tsaltInParen		tsaltError
syn match  tsaltNumber		"\<\d\+\(u\=l\=\|lu\|f\)\>"
syn match  tsaltFloat		"\<\d\+\.\d*\(e[-+]\=\d\+\)\=[fl]\=\>"
syn match  tsaltFloat		"\.\d\+\(e[-+]\=\d\+\)\=[fl]\=\>"
syn match  tsaltFloat		"\<\d\+e[-+]\=\d\+[fl]\=\>"
syn match  tsaltNumber		"0x[0-9a-f]\+\(u\=l\=\|lu\)\>"
syn region tsaltComment		start="/\*"  end="\*/" contains=cTodo
syn match  tsaltComment		"//.*" contains=cTodo
syn match  tsaltCommentError	"\*/"
syn region tsaltPreCondit	start="^[ \t]*#[ \t]*\(if\>\|ifdef\>\|ifndef\>\|elif\>\|else\>\|endif\>\)"  skip="\\$"  end="$" contains=tsaltComment,tsaltString,tsaltCharacter,tsaltNumber,tsaltCommentError
syn region tsaltIncluded	contained start=+"+  skip=+\\\\\|\\"+  end=+"+
syn match  tsaltIncluded	contained "<[^>]*>"
syn match  tsaltInclude		"^[ \t]*#[ \t]*include\>[ \t]*["<]" contains=tsaltIncluded
syn region tsaltDefine		start="^[ \t]*#[ \t]*\(define\>\|undef\>\)" skip="\\$" end="$" contains=ALLBUT,tsaltPreCondit,tsaltIncluded,tsaltInclude,tsaltDefine,tsaltInParen
syn region tsaltPreProc		start="^[ \t]*#[ \t]*\(pragma\>\|line\>\|warning\>\|warn\>\|error\>\)" skip="\\$" end="$" contains=ALLBUT,tsaltPreCondit,tsaltIncluded,tsaltInclude,tsaltDefine,tsaltInParen
syn region tsaltMulti	transparent start='?' end=':' contains=ALLBUT,tsaltIncluded,tsaltSpecial,tsaltTodo
syn sync ccomment tsaltComment
hi def link tsaltFunction		Statement
hi def link tsaltSysVar		Type
hi def link tsaltConditional		Conditional
hi def link tsaltRepeat		Repeat
hi def link tsaltCharacter		SpecialChar
hi def link tsaltSpecialCharacter	SpecialChar
hi def link tsaltNumber		Number
hi def link tsaltFloat		Float
hi def link tsaltCommentError	tsaltError
hi def link tsaltInclude		Include
hi def link tsaltPreProc		PreProc
hi def link tsaltDefine		Macro
hi def link tsaltIncluded		tsaltString
hi def link tsaltError		Error
hi def link tsaltStatement		Statement
hi def link tsaltPreCondit		PreCondit
hi def link tsaltType		Type
hi def link tsaltString		String
hi def link tsaltComment		Comment
hi def link tsaltSpecial		Special
hi def link tsaltTodo		Todo
let b:current_syntax = "tsalt"
let &cpo = s:cpo_save
unlet s:cpo_save
