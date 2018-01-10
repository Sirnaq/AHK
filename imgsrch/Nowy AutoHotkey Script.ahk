#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance, Force


s::
	ImageSearch, x, y, 1, 1, 1425, 1000, x.jpg
	MouseMove, %x%, %y%
	msgbox, %x%, %y%
return
