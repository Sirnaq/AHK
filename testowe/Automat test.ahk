#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#SingleInstance, force
x:=801
y:=210

#IfWinActive, Repertorium ogólne, Lista czynności

f1::
loop, 35
{
MouseClick, r, %x%,%y%
y:=y+27
send,{down}{down}{down}{down}{enter}
WinWaitActive, Sprawa egzekucyjna

WinWaitActive, Repertorium ogólne, Lista czynności
}
return

#IfWinActive