#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


~RShift::
~LShift::
	;Configuration
	AcceptableMouseMovementPixels := 30 ;Normally around 30. Set to 10000 to disable mouse checking. Can be set very low because mouse should barely move while typing.
	LongestAcceptableShiftTapTime := 1500 ;Normally around 1500. Set to 10000 to type bracket no matter how long shift is held
	
	
	;Mouse clicks are ignored by A_PriorKey when shift is pressed
	;Therefore an alternative method must be used to detect shift-click select as no "keys" are pressed
	;This will be done by checking mouse position before and after {Shift Up} to see if something might be highlighted
	;Tooltip %A_PriorKey%
	MouseGetPos, startingXpos, startingYpos 
	KeyWait Shift
	;Tooltip "Shift Released"
	;Sleep 100
	MouseGetPos, endingXpos, endingYpos 
	xPosChange := Abs(startingXpos - endingXpos)
	yPosChange := Abs(startingYpos - endingYpos)
	MousePosChangeOverall := xPosChange + yPosChange
	;Tooltip %MousePosChangeOverall%
	;Sleep 100	
	

	
	If ( A_TimeSincePriorHotkey < LongestAcceptableShiftTapTime and InStr(A_PriorKey,"Shift") and MousePosChangeOverall < AcceptableMouseMovementPixels  )
		   SendRaw, % InStr(A_ThisHotkey,"LShift") ? "(" : ")" 
	
Return	
	;Debugging section
	ShiftWasLastKey := InStr(A_PriorKey,"Shift")
	IsTapTimeAcceptable := A_TimeSincePriorHotkey < LongestAcceptableShiftTapTime
	IsMouseMoveAcceptable := MousePosChangeOverall < AcceptableMouseMovementPixels
	Tooltip,
	(LTrim 
		"Taptime" %IsTapTimeAcceptable% 
		"Shiftpressed" %ShiftWasLastKey% 
		"Prior" %A_PriorKey% & %A_TimeSincePriorHotkey%
		"Mouse" %IsMouseMoveAcceptable% 
	)
	Sleep 1500	
	Tooltip
Return