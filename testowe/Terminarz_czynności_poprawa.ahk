#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance, force
#IfWinActive, Repertorium ogólne, Lista czynności
f1::
loop, 12
{
	send, e
	sleep, 100
	send, {tab}{tab}{tab}03082017
	sleep, 300
	send, {Enter}
	
	sleep, 600
	;IfWinNotActive, Repertorium ogólne
	;{
;		return
;	}
}
return

f2::
loop, 98
{
	send, m
	WinWaitActive, Informacje o czynności egzekucyjnej
	send, {tab}{tab}{tab}{tab}{tab}{tab}Wniosek wierzyciela o umorzenie postępowania egzekucyjnego
	sleep, 300
	send, {enter}
	WinWaitActive, Repertorium ogólne, Lista czynności
	send, {down}
}
return

#IfWinActive