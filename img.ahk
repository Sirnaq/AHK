#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#SingleInstance, force


#IfWinActive Lista spraw
p::
	IfNotExist, czynna.bmp
		msgbox, nie istnieje
	ImageSearch, x, y, 01, 01, 700, 1053, czynna.bmp
	MouseMove, %x%, %y%
	MsgBox, %x%, %y%
return
#IfWinActive