#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance, force
gui, add, edit, vszperacz gszperacz w200 h750
gui, show, w220 h800

szperacz:
gui, submit, nohide
return

ScrollLock::
send, ^c
send, {Alt Down}{tab}
sleep, 150
send, {Alt Up}
sleep, 100
ControlFocus, %clipboard%, A
return

PrintScreen::
	winget, lista, ControlList, A
	guicontrol, text, szperacz, %lista%
return

tab::
winactivate, szperacz
DetectHiddenText, on
DetectHiddenWindows, on
send, ^{left}^+{Right}
send, ^c
sleep, 150
send,{down}
send, {Alt Down}{tab}
sleep, 150
send, {Alt Up}
sleep, 300
controlgetpos, x, y, , , %clipboard%, A
mousemove, %x%, %y%
return

GuiClose:
ExitApp
return