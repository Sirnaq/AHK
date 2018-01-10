#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance, force

gui, add, ComboBox, vPismo gPismo w300, PRACA|-----------------------------------------------------------------------------------------------------------------------------------|potrącenia|nie pracuje|Odpowiedź na zaj. wynagrodzenia – kwota wolna|Odpowiedź na zaj. wierzytelności|Pismo pracodawcy|Pismo byłego pracodawcy|zbieg|Odpowiedź ZK na zaj. wynagrodzenia – zwolniony|Odpowiedź KRK na zapytanie|Odpowiedź KRK na zapytanie – nie figuruje
gui, show, h100 w350, Pisma
;nie pracuje wierzytelność
;--------------------------------
GroupAdd, glowna, Repertorium ogólne, Lista czynności w sprawie
GroupAdd, glowna, Lista czynności w sprawie Km
#IfWinActive, Repertorium ogólne

^q::
	ControlClick, Button13
	WinWaitActive, Czynność obca
	send, {tab}{bs}%pismo%
	WinActivate, Czynność obca
	ControlFocus, Button3
	send, {enter}
	WinWaitActive, Skanowanie dokumentów
	sleep, 150
	ControlFocus, Button31, Skanowanie dokumentów
	Send, {enter}
	WinWaitActive, Otwórz z pliku, , 3
	if (errorlevel = 1)
	{
		return
	}
	ControlFocus, DirectUIHWND2
	MouseClick, l, 287, 200, 1
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
	WinActivate, Czynność obca
	ControlFocus, Button3
	send, {enter}
	WinWaitActive, Skanowanie dokumentów
	sleep, 150
	ControlFocus, Button31, Skanowanie dokumentów
	Send, {enter}
	WinWaitActive, Otwórz z pliku, , 3
	if (errorlevel = 1)
	{
		return
	}
	ControlFocus, DirectUIHWND2
	MouseClick, l, 287, 200, 1
	;send, {tab}{bs}
	;MouseClick,l,281,171
	;send, Odpowiedź na zaj. wynagrodzenia - %pismo%
	;send, {tab}{tab}{tab}
	;ControlFocus, Button12
	;send, s
	;MouseClick,l,471,283
	;WinWaitActive, Skanowanie dokumentów
	;MouseClick, l, 384, 39
return

^s::
	ControlClick, Button13
	WinWaitActive, Czynność obca
	send, {tab}{bs}Odpowiedź na zaj. wierzytelności - %pismo%
	WinActivate, Czynność obca
	ControlFocus, Button3
	send, {enter}
	WinWaitActive, Skanowanie dokumentów
	sleep, 150
	ControlFocus, Button31, Skanowanie dokumentów
	Send, {enter}
	WinWaitActive, Otwórz z pliku, , 3
	if (errorlevel = 1)
	{
		return
	}
	ControlFocus, DirectUIHWND2
	MouseClick, l, 287, 200, 1
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
	WinActivate, Czynność obca
	ControlFocus, Button3
	send, {enter}
	WinWaitActive, Skanowanie dokumentów
	sleep, 150
	ControlFocus, Button31, Skanowanie dokumentów
	Send, {enter}
	WinWaitActive, Otwórz z pliku, , 3
	if (errorlevel = 1)
	{
		return
	}
	ControlFocus, DirectUIHWND2
	MouseClick, l, 287, 200, 1
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
	WinActivate, Czynność obca
	ControlFocus, Button3
	send, {enter}
	WinWaitActive, Skanowanie dokumentów
	sleep, 150
	ControlFocus, Button31, Skanowanie dokumentów
	Send, {enter}
	WinWaitActive, Otwórz z pliku, , 3
	if (errorlevel = 1)
	{
		return
	}
	ControlFocus, DirectUIHWND2
	MouseClick, l, 287, 200, 1
return

^s::
	ControlClick, Button13
	WinWaitActive, Czynność obca
	send, {tab}{bs}Odpowiedź na zaj. wierzytelności - %pismo%
	WinActivate, Czynność obca
	ControlFocus, Button3
	send, {enter}
	WinWaitActive, Skanowanie dokumentów
	sleep, 150
	ControlFocus, Button31, Skanowanie dokumentów
	Send, {enter}
	WinWaitActive, Otwórz z pliku, , 3
	if (errorlevel = 1)
	{
		return
	}
	ControlFocus, DirectUIHWND2
	MouseClick, l, 287, 200, 1
return

#IfWinActive


#IfWinActive
;--------------------------------------

#ifwinactive, Skanowanie dokumentów
esc::
	WinClose, Skanowanie dokumentów
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
	ControlFocus, Button15, Skanowanie dokumentów
	send, {enter}
	WinWaitActive, Czynność obca
		ControlFocus, Button11, Czynność obca
		send, {enter}
		;WinWaitActive, ahk_group glowna, , 3
		;if (errorlevel = 1)
		;{
	;		return
	;	}
	;	ControlFocus, pbdw1101, ahk_group glowna
	;	send, +{tab}+{tab}{tab}{tab}{tab}
	;	sleep, 500
	;	ControlGetFocus, teraz, ahk_group glowna
	;	if (teraz = "Edit7")
	;	{
	;		send, %Pismo%{enter}
	;	}
	;	else
	;	{
	;		MsgBox, zjebało się i nie sprawdziło czy skan się dodał
	;		FileRemoveDir, %droga%\temp, 1
	;		return
	;	}
	;	send, e
	;	WinWaitActive, Informacje o czynności egzekucyjnej, ,3
	;	if (errorlevel = 1)
	;	{
	;		return
	;	}
	;	send, {tab}{tab}{tab}{tab}{tab}{tab}{tab}
	;	sleep, 300
	;	ControlGetFocus, x, A
	;		ControlGettext, rest, %x%
	;		ControlFocus, Button14, A
	;		send, {enter}
	;		WinWaitActive, ahk_group glowna, , 3
	;		if (errorlevel = 1)
	;	{
	;		return
	;	}
	;	ControlFocus, pbdw1101
	;	send, +{tab}+{tab}{tab}{tab}{tab}{bs}{enter}
	;	if (rest = "")
	;	{
	;		FileMove, %droga%\temp\*.pdf, %droga%
	;		FileRemoveDir, %droga%\temp, 0
	;		MsgBox, Skan się nie dodał
	;		return
	;	}
	;	else
	;	{
	;		FileRemoveDir, %droga%\temp, 1
	;	}
return
#IfWinActive

#IfWinActive Otwórz z pliku
Numpad1::
	ControlFocus, SysTreeView321
	send, {tab}{right}{left}{enter}
return
Numpad2::
;	ControlFocus, SysTreeView321
;	send, {tab}{right}{left}
;	ControlGetText, droga, ToolbarWindow322
;	StringTrimLeft, droga, droga, 7
;	ControlGetText, cel, Edit1, Otwórz z pliku
;	wyprawa = %droga%\%cel%
;	FileCreateDir, %droga%\temp
;	FileMove, %wyprawa%, %droga%\temp
;	;Sleep, 500
;	ControlFocus, SysTreeView321
;	send, {tab}{right}{left}
;	send, {f5}
;	sleep, 1000
;	MouseClick, l, 562, 200, 1
;	sleep, 50
;	MouseClick, l, 562, 200, 1
		MouseClick,l,337,225
	send, {Delete}{enter}
	sleep, 1000
	MouseClick,l,337,225
	send, {enter}
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

#IfWinActive, ahk_group glowna
k::
ControlGetFocus, nazwa, ahk_group glowna
	IfInString, nazwa, Edit
	{
		send, k
	}
	if nazwa=pbdw1101
	{
	send, e
	WinWaitActive, Informacje o czynności egzekucyjnej
	ControlFocus, Button1, Informacje o czynności egzekucyjnej
	send, {tab}{tab}{tab}{tab}{tab}{tab}{tab}{right} - konto{enter}
}
else
{
	return
}
return

z::
ControlGetFocus, nazwa, ahk_group glowna
	IfInString, nazwa, Edit
	{
		send, z
	}
	if nazwa=pbdw1101
	{
	send, e
	WinWaitActive, Informacje o czynności egzekucyjnej
	ControlFocus, Button1, Informacje o czynności egzekucyjnej
	send, {tab}{tab}{tab}{tab}{tab}{tab}{tab}^{left}^{left}^{left}^{left}^{left}^{left}^{left}^{left}^{left}^{left}{right}{right}{right}{right}{right}{right}{right}{right}{right} ZK{enter}
}
else
{
	IfWinActive, Czynność obca
	{
	send, {enter}
	}
	return
}

return

p::
ControlGetFocus, nazwa, ahk_group glowna
	IfInString, nazwa, Edit
	{
		send, p
	}
	if nazwa=pbdw1101
	{
	send, e
	WinWaitActive, Informacje o czynności egzekucyjnej
	ControlFocus, Button1, Informacje o czynności egzekucyjnej
	send, {tab}{tab}{tab}{tab}{tab}{tab}{tab}^{left}^{left}^{left}^{left}^{left}^{left}^{left}^{left}^{left}^{left}{right}{right}{right}{right}{right}{right}{right}{right}{right} PUP{enter}
}
else
{
	return
}
return

#IfWinActive

#IfWinActive, Czynność obca
z::
ControlGetFocus, nazwa
IfInString, nazwa, Edit
{
	send, z
}
else
{
ControlFocus, Button11
send, {enter}
}
return
#IfWinActive