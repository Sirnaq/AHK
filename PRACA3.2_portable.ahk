#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance, force

gui, add, ComboBox, vPismo gPismo w300, PRACA|-----------------------------------------------------------------------------------------------------------------------------------|potrącenia|nie pracuje|Odpowiedź na zaj. wynagrodzenia – kwota wolna|Odpowiedź na zaj. wierzytelności|Pismo pracodawcy|Pismo byłego pracodawcy|zbieg|Odpowiedź ZK na zaj. wynagrodzenia – zwolniony|Odpowiedź KRK na zapytanie|Odpowiedź KRK na zapytanie – nie figuruje
gui, show, h100 w350, Pisma
;nie pracuje wierzytelność
;--------------------------------
#IfWinActive, Repertorium ogólne

^q::
	ControlClick, Button13
		WinWaitActive, Czynność obca
		send, {tab}{bs}%pismo%
		sleep, 100
		WinActivate, Czynność obca
		ControlFocus, Button3
		send, {enter}
		WinWaitActive, Skanowanie dokumentów
		sleep, 150
		ControlFocus, Button31, Skanowanie dokumentów
		Send, {enter}
return

;^s::
;	ControlClick, Button13
;	WinWaitActive, Czynność obca
;	MouseClick,l,281,171
;	send, Pismo ZUS
;	MouseClick,l,471,283
;	WinWaitActive, Skanowanie dokumentów
;	MouseClick, l, 384, 39
;return


^a::
	ControlClick, Button13
		WinWaitActive, Czynność obca
		send, {tab}{bs}Odpowiedź na zaj. wynagrodzenia - %pismo%
		sleep, 100
		WinActivate, Czynność obca
		ControlFocus, Button3
		send, {enter}
		WinWaitActive, Skanowanie dokumentów
		sleep, 150
		ControlFocus, Button31, Skanowanie dokumentów
		Send, {enter}
return

^s::
	ControlClick, Button13
	WinWaitActive, Czynność obca
	send, {tab}{bs}Odpowiedź na zaj. wierzytelności - %pismo%
	sleep, 100
	WinActivate, Czynność obca
	ControlFocus, Button3
	send, {enter}
	WinWaitActive, Skanowanie dokumentów
	sleep, 150
	ControlFocus, Button31, Skanowanie dokumentów
	Send, {enter}
return

#IfWinActive
;--------------------------------------

;nie pracuje wierzytelność
;--------------------------------
#IfWinActive, Lista czynności w sprawie

^q::
	ControlClick, Button13
		WinWaitActive, Czynność obca
		send, {tab}{bs}%pismo%
		sleep, 100
		WinActivate, Czynność obca
		ControlFocus, Button3
		send, {enter}
		WinWaitActive, Skanowanie dokumentów
		sleep, 150
		ControlFocus, Button31, Skanowanie dokumentów
		Send, {enter}
return

;^s::
;	ControlClick, Button13
;	WinWaitActive, Czynność obca
;	MouseClick,l,281,171
;	send, Pismo ZUS
;	MouseClick,l,471,283
;	WinWaitActive, Skanowanie dokumentów
;	MouseClick, l, 384, 39
;return

^a::
	ControlClick, Button13
		WinWaitActive, Czynność obca
		send, {tab}{bs}Odpowiedź na zaj. wynagrodzenia - %pismo%
		sleep, 100
		WinActivate, Czynność obca
		ControlFocus, Button3
		send, {enter}
		WinWaitActive, Skanowanie dokumentów
		sleep, 150
		ControlFocus, Button31, Skanowanie dokumentów
		Send, {enter}
return

^s::
	ControlClick, Button13
	WinWaitActive, Czynność obca
	send, {tab}{bs}Odpowiedź na zaj. wierzytelności - %pismo%
	sleep, 100
	WinActivate, Czynność obca
	ControlFocus, Button3
	send, {enter}
	WinWaitActive, Skanowanie dokumentów
	sleep, 150
	ControlFocus, Button31, Skanowanie dokumentów
	Send, {enter}
return

#IfWinActive


#IfWinActive
;--------------------------------------

#ifwinactive, Skanowanie dokumentów
esc::
	WinClose, Skanowanie dokumentów
return

d::
	ControlFocus, Button34, Skanowanie dokumentów
	Send, {enter}
	WinWaitActive, Otwórz z pliku
	ControlGetText, cel, Edit1
if (cel = "")
{	
	ControlFocus, SysTreeView321
	send, {tab}{right}{left}
	sleep, 300
	ControlClick, ToolbarWindow322
	ControlGetText, droga, Edit2
	ControlGetText, cel, Edit1
	sleep, 300
	;send, {enter}
	ControlFocus, Button1
	send, {enter}
	sciezka = %droga%\%cel%
	;MsgBox, %droga%\%cel%
	}
else
{
	ControlClick, ToolbarWindow322
	ControlGetText, droga, Edit2
	ControlGetText, cel, Edit1
	sleep, 300
	;send, {enter}
	ControlFocus, Button1
	send, {enter}
	sciezka = %droga%\%cel%
	}
return

#IfWinActive

#IfWinActive, Repertorium ogólne, Skorowidz

F6::
	Control, Choose, 8, ComboBox4, Repertorium ogólne
	ControlClick, Edit1
	send, ^a{bs}
return

F7::
	Control, Choose, 2, ComboBox4, Repertorium ogólne
	ControlClick, Edit1
	send, ^a{bs}
return

F8::
	control, choose, 3, ComboBox4, Repertorium ogólne
	controlclick, Edit1
	send, ^a{bs}
return
#IfWinActive

#IfWinActive Skanowanie dokumentów
NumpadEnter::
	FileDelete, %sciezka%
	droga = ""
	cel = ""
	ControlFocus, Button15, Skanowanie dokumentów
	send, {enter}
	WinWaitActive, Czynność obca,,3
	IfWinNotActive, Czynność obca
	{
		return
	}
	send, {tab}{tab}
	
	send, ^c
	sleep, 300
	if (clipboard = "Odpowiedź na zaj. wynagrodzenia - Odpowiedź na zaj. wynagrodzenia - kwota wolna")
	{
		send, Odpowiedź na zaj. wynagrodzenia – kwota wolna
		sleep, 100
		ControlFocus, Button11, Czynność obca
		send, {enter}
	}
	else
	{
	if (clipboard = "Odpowiedź na zaj. wynagrodzenia - Odpowiedź ZK na zaj. wynagrodzenia - zwolniony")
	{
		send, Odpowiedź ZK na zaj. wynagrodzenia - zwolniony
		sleep, 100
		ControlFocus, Button11, Czynność obca
		send, {enter}
	}
	else
	{
	if (clipboard = "Odpowiedź na zaj. wynagrodzenia - Odpowiedź ZK na zaj. wynagrodzenia - nie przebywa")
	{
		send, Odpowiedź ZK na zaj. wynagrodzenia - nie przebywa
		sleep, 100
		ControlFocus, Button11, Czynność obca
		send, {enter}
	}
	else
	{
	if (clipboard = "Odpowiedź na zaj. wynagrodzenia - Odpowiedź na zaj. wierzytelności")
	{
		send, Odpowiedź na zaj. wierzytelności
		sleep, 100
		ControlFocus, Button11, Czynność obca
		send, {enter}
	}
	else
	{
	if (clipboard = "Odpowiedź na zaj. wynagrodzenia - Pismo pracodawcy")
	{
		send, Pismo pracodawcy
		sleep, 100
		ControlFocus, Button11, Czynność obca
		send, {enter}
	}
	else
	{
	if (clipboard = "Odpowiedź na zaj. wynagrodzenia - Pismo byłego pracodawcy")
	{
		send, Pismo byłego pracodawcy
		sleep, 100
		ControlFocus, Button11, Czynność obca
		send, {enter}
	}
	else
	{
	if (clipboard = "Odpowiedź na zaj. wynagrodzenia - Pismo PUP")
	{
		send, Pismo PUP
		sleep, 100
		ControlFocus, Button11, Czynność obca
		send, {enter}
	}
	else
	{
	if (clipboard = "Odpowiedź na zaj. wynagrodzenia - Pismo ZK")
	{
		send, Pismo ZK
		sleep, 100
		ControlFocus, Button11, Czynność obca
		send, {enter}
	}
	else
	{
	if (clipboard = "Odpowiedź na zaj. wynagrodzenia - Info ZK o przekazaniu wg właściwości")
	{
		send, Info ZK o przekazaniu wg właściwości
		sleep, 100
		ControlFocus, Button11, Czynność obca
		send, {enter}
	}
	else
	{
	if (clipboard = "Odpowiedź na zaj. wynagrodzenia - Odpowiedź KRK na zapytanie")
	{
		send, Odpowiedź KRK na zapytanie
		sleep, 100
		ControlFocus, Button11, Czynność obca
		send, {enter}
	}
	else
	{
	if (clipboard = "Odpowiedź na zaj. wynagrodzenia - Odpowiedź KRK na zapytanie - nie figuruje")
	{
		send, Odpowiedź KRK na zapytanie - nie figuruje
		sleep, 100
		ControlFocus, Button11, Czynność obca
		send, {enter}
	}
	else
	{
	;---------------------------------------------------------------------------
	if (clipboard = "Odpowiedź na zaj. wierzytelności - Odpowiedź na zaj. wynagrodzenia - kwota wolna")
	{
		send, Odpowiedź na zaj. wierzytelności – kwota wolna
		sleep, 100
		ControlFocus, Button11, Czynność obca
		send, {enter}
		MsgBox, Kwota wolna przy wierzytelnościach?
	}
	else
	{
	if (clipboard = "Odpowiedź na zaj. wierzytelności - Odpowiedź ZK na zaj. wynagrodzenia - zwolniony")
	{
		send, Odpowiedź ZK na zaj. wierzytelności - zwolniony
		sleep, 100
		ControlFocus, Button11, Czynność obca
		send, {enter}
		MsgBox, wierzytelności?
	}
	else
	{
	if (clipboard = "Odpowiedź na zaj. wierzytelności - Odpowiedź ZK na zaj. wynagrodzenia - nie przebywa")
	{
		send, Odpowiedź ZK na zaj. wierzytelności - nie przebywa
		sleep, 100
		ControlFocus, Button11, Czynność obca
		send, {enter}
		MsgBox, wierzytelności?
	}
	else
	{
	if (clipboard = "Odpowiedź na zaj. wierzytelności - Odpowiedź na zaj. wierzytelności")
	{
		send, Odpowiedź na zaj. wierzytelności
		sleep, 100
		ControlFocus, Button11, Czynność obca
		send, {enter}
	}
	else
	{
	if (clipboard = "Odpowiedź na zaj. wierzytelności - Pismo pracodawcy")
	{
		send, Pismo pracodawcy
		sleep, 100
		ControlFocus, Button11, Czynność obca
		send, {enter}
	}
	else
	{
	if (clipboard = "Odpowiedź na zaj. wierzytelności - Pismo byłego pracodawcy")
	{
		send, Pismo byłego pracodawcy
		sleep, 100
		ControlFocus, Button11, Czynność obca
		send, {enter}
	}
	else
	{
	if (clipboard = "Odpowiedź na zaj. wierzytelności - Pismo PUP")
	{
		send, Pismo PUP
		sleep, 100
		ControlFocus, Button11, Czynność obca
		send, {enter}
	}
	else
	{
	if (clipboard = "Odpowiedź na zaj. wierzytelności - Pismo ZK")
	{
		send, Pismo ZK
		sleep, 100
		ControlFocus, Button11, Czynność obca
		send, {enter}
	}
	else
	{
	if (clipboard = "Odpowiedź na zaj. wierzytelności - Info ZK o przekazaniu wg właściwości")
	{
		send, Info ZK o przekazaniu wg właściwości
		sleep, 100
		ControlFocus, Button11, Czynność obca
		send, {enter}
	}
	else
	{
	if (clipboard = "Odpowiedź na zaj. wierzytelności - Odpowiedź KRK na zapytanie")
	{
		send, Odpowiedź KRK na zapytanie
		sleep, 100
		ControlFocus, Button11, Czynność obca
		send, {enter}
	}
	else
	{
	if (clipboard = "Odpowiedź na zaj. wierzytelności - Odpowiedź KRK na zapytanie - nie figuruje")
	{
		send, Odpowiedź KRK na zapytanie - nie figuruje
		sleep, 100
		ControlFocus, Button11, Czynność obca
		send, {enter}
	}
	;----------------------------------------------------------------------------------
	else
	{
		ControlFocus, Button11, Czynność obca
		send, {enter}
	}
}}}}}}}}}}}}}}}}}}}}}
return
#IfWinActive

#IfWinActive Otwórz z pliku
NumpadEnter::
ControlGetText, cel, Edit1
if (cel = "")
{	
	ControlFocus, SysTreeView321
	send, {tab}{right}{left}
	sleep, 300
	ControlClick, ToolbarWindow322
	ControlGetText, droga, Edit2
	ControlGetText, cel, Edit1
	;send, {enter}
	ControlFocus, Button1, Otwórz z pliku
	send, {enter}
	sciezka = %droga%\%cel%
	;MsgBox, %droga%\%cel%
	}
else
{
	ControlClick, ToolbarWindow322
	ControlGetText, droga, Edit2
	ControlGetText, cel, Edit1
	;send, {enter}
	ControlFocus, Button1, Otwórz z pliku
	Send, {enter}
	sciezka = %droga%\%cel%
	}
return
#IfWinActive

#IfWinActive, Lista spraw uczestnika i jego synonimy
 lbutton::
 if (A_priorhotkey = A_thishotkey and A_TimeSincePriorHotkey < 300)
{
	MouseGetPos, , , ,lista,1
	if (lista="PBTreeView32_1001")
	{
		send, {rbutton}{down}{down}{enter}
		winactivate, Lista czynności w sprawie Km
		WinWaitActive, Lista czynności w sprawie Km
		;MouseClick,l,509,157
		;send, zaj{enter}
	}
	else
	{
		send, {lbutton down}
		KeyWait, lbutton
		send, {lbutton up}
	}
	
}
else
{
	send, {lbutton down}
	KeyWait, lbutton
	send, {lbutton up}
}
 return
#IfWinActive

#IfWinActive, Repertorium ogólne, Skorowidz uczestników
 lbutton::
 if (A_priorhotkey = A_thishotkey and A_TimeSincePriorHotkey < 300)
{
	MouseGetPos, , , ,lista,1
	if (lista="PBTreeView32_1001")
	{
		send, {rbutton}{down}{down}{enter}
		winactivate, Lista czynności w sprawie Km
		WinWaitActive, Lista czynności w sprawie Km
		;MouseClick,l,509,157
		;send, zaj{enter}
	}
	else
	{
		send, {lbutton down}
		KeyWait, lbutton
		send, {lbutton up}
	}
	
}
else
{
	send, {lbutton down}
	KeyWait, lbutton
	send, {lbutton up}
}
 return
#IfWinActive


Pismo:
gui, submit, nohide
return

;keypad
;---------------------------------------------------------
#ifwinactive Repertorium ogólne, Lista czynności w sprawie
;NumpadAdd::
;ControlFocus, Button9, Repertorium ogólne, Lista czynności w sprawie
;send, {tab}{tab}{tab}{tab}
;ControlClick, x364 y141, Repertorium ogólne, Lista
;return
#IfWinActive

#IfWinActive, Repertorium ogólne
;f4::
;send, {f4}
;WinActivate, Wybór sprawy egzekucyjnej
;WinWaitActive,Wybór sprawy egzekucyjnej
;ControlFocus, Button10, Wybór sprawy egzekucyjnej
;send, {tab}{tab}
;ControlClick,  x272 y117,
return
#IfWinActive

#IfWinActive Wybór sprawy egzekucyjnej
;NumpadEnter::
;send, {enter}
;WinWaitActive, Repertorium ogólne, Lista czynności w sprawie
;MouseClick,l,603,238
;send, zaj{enter}
;return
#IfWinActive

home::
	Reload
return

GuiClose:
ExitApp
return

#IfWinNotActive Repertorium ogólne, Skorowidz uczestników
F6::

return
#IfWinNotActive

::zoo::SP. Z O.O.

#IfWinActive, Repertorium ogólne, Lista czynności w sprawie
k::
	send, e
	WinWaitActive, Informacje o czynności egzekucyjnej
	ControlFocus, Button1, Informacje o czynności egzekucyjnej
	send, {tab}{tab}{tab}{tab}{tab}{tab}{tab}{right} - konto{enter}
return

z::
	send, e
	WinWaitActive, Informacje o czynności egzekucyjnej
	ControlFocus, Button1, Informacje o czynności egzekucyjnej
	send, {tab}{tab}{tab}{tab}{tab}{tab}{tab}^{left}^{left}^{left}^{left}^{left}^{left}^{left}^{left}^{left}^{left}{right}{right}{right}{right}{right}{right}{right}{right}{right} ZK{enter}
return

p::
	send, e
	WinWaitActive, Informacje o czynności egzekucyjnej
	ControlFocus, Button1, Informacje o czynności egzekucyjnej
	send, {tab}{tab}{tab}{tab}{tab}{tab}{tab}^{left}^{left}^{left}^{left}^{left}^{left}^{left}^{left}^{left}^{left}{right}{right}{right}{right}{right}{right}{right}{right}{right} PUP{enter}
return

#IfWinActive