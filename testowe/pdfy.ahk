#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance, force
SetTitleMatchMode, 2
#IfWinActive, Adobe Reader

q::
winclose, Adobe Reader
WinActivate, Marcin
send, {del}
sleep, 100
WinActivate, Usuń plik
sleep, 100
send, {enter}
winwaitactive, Marcin
send, {left}{right}
return

w::
winclose, Adobe Reader
WinActivate, Marcin
return
#IfWinActive