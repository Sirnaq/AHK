#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance, force

;GUI
;-------------------------------
Gui, add, text, , Ile spraw:
Gui, add, edit, w50 vIlosc gIlosc number, 0
gui, add, text, , Data:
Gui, add, checkbox, gczydata vczydata
Gui, add, edit, w200 vData gData number limit8,
Gui, add, text, , Nazwa czynności:
Gui, add, checkbox, gczynazwa vczynazwa
Gui, add, edit, w200 vNazwa gNazwa,
gui, add, button, default w100 h20 gEnter, Ok
Gui, show, h230 w220, Poprawa
czydata:=0
czynazwa:=0
Ilosc:=0

;labelki
;---------------------------------


Ilosc:
	Gui, submit, nohide 
return

czydata:
	Gui, submit, nohide 
return
 
Data:
	Gui, submit, nohide 
return

czynazwa:
	Gui, submit, nohide 
return

Nazwa:
	Gui, submit, nohide 
return

guiclose:
exitapp
return


Enter:
if (czynazwa=0) and (czydata=0)
{
	msgbox, Wybierz co ma być zmienione
	return
}
IfWinNotExist, Repertorium ogólne, Lista czynności
{
	msgbox, Panie, otwórz pan Terminarz czynności bo nie mogę pracować
	return
}
if (Ilosc=0)
{
	msgbox, Całe 0 spraw?
	return
}
winactivate, Repertorium ogólne, Lista czynności
loop, %Ilosc%
{
	send, e
	WinWaitActive, Informacje o czynności egzekucyjnej
	send, {tab}{tab}{tab}
	IfWinNotActive, Informacje o czynności egzekucyjnej
	{
		return
	}
	if (czydata=1)
	{
		send, %Data%
	}
	send, {tab}{tab}{tab}
	sleep, 200
	if (czynazwa=1)
	{
		send, %Nazwa%
	}
	sleep, 300
	send, {enter}
	WinWaitActive, Repertorium ogólne, Lista czynności
	sleep, 200
	if (czydata=0)
	{
		send, {down}
	}
	else
	{
		sleep, 300
	}
}

return

;skróty
;------------------------------------------------------------

esc::
ExitApp
return