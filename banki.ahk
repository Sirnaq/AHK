#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#SingleInstance, force

GroupAdd, niezaw, Adresaci pisma
GroupAdd, niezaw, Repertorium ogólne
GroupAdd, niezaw, Lista czynności w sprawie

#IfWinActive, ahk_group niezaw
esc::
	if (A_PriorHotkey = A_ThisHotkey) and (A_TimeSincePriorHotkey < 300)
	{
		return
	}
	else
	{
		send, {esc}
	}
return
#IfWinActive

#ifwinactive Lista czynności w sprawie
esc::
WinClose, Lista czynności w sprawie
ControlClick, Edit1, Repertorium ogólne
send, ^a
return
#ifwinactive

#ifwinactive Sprawa egzekucyjna
esc::
send, z{tab}{tab}{tab}{tab}{tab}^a
return
#ifwinactive

#ifwinactive Sprytny Spinacz
NumpadMult::

ifwinexist, Repertorium ogólne
{
IniWrite, Q, C:\Currenda\ini\Komornik.ini, Komornik, Litera
sleep 150
winactivate, Repertorium ogólne
WinWaitActive, Repertorium ogólne
send, {f5}{tab}{tab}{down}{down}{tab}
return
}
else
{
ifwinexist, Komornik SQL
{
IniWrite, Q, C:\Currenda\ini\Komornik.ini, Komornik, Litera
sleep 150
winactivate, Komornik SQL
send, {enter}
sleep, 1000
send, {f5}{tab}{tab}{down}{down}{tab}
return
}
else
{
return
}
}
#ifwinactive

;#ifwinactive Sprytny Spinacz
;NumpadSub::
;send, {shift down}{tab}{tab}{tab}{shift up}^a^c
;winactivate, Repertorium ogólne
;WinWaitActive, Repertorium ogólne
;send, {f3}{tab}^v{enter}
;return
;#ifwinactive

;#ifwinactive Repertorium ogólne
;NumpadSub::
;winactivate, Sprytny Spinacz
;WinWaitActive, Sprytny Spinacz
;send, {tab}{tab}{tab}
;return
;#ifwinactive

#ifwinactive Repertorium ogólne, Skorowidz uczestników
lButton::
If (A_PriorHotKey = A_ThisHotKey and A_TimeSincePriorHotkey < 300)
{
MouseGetPos, , , ,skorowidz,1
if (skorowidz="PBTreeView32_1001")
{
	send, {rbutton}{down}{down}{enter}
	winactivate, Lista czynności w sprawie Km
	send, {tab}{tab}{tab}{tab}{tab}{tab}bank{enter}
}
else
{
	send, {lButton}
}
}
else
{
	send, {lbutton down}
	KeyWait, lbutton
	send, {lbutton up}
}
return



;lButton::
;MouseGetPos, , , ,skorowidz,1
;if (skorowidz="PBTreeView32_1001")
;{
;	send, {rbutton}{down}{enter}
;	winactivate, Sprawa egzekucyjna
;}
;else
;{
;	send, {lButton}
;}
;return

#ifwinactive

#ifwinactive Repertorium ogólne
f3::
	send, {f3}
	WinWaitActive, Wybór sprawy egzekucyjnej
	send, {tab}{tab}
return

F4::
	send, {F4}
	WinWaitActive, Wybór sprawy egzekucyjnej
	send, {tab}{tab}
return

#ifwinactive

#ifwinactive Skanowanie dokumentów
esc::
winclose, Skanowanie dokumentów
return
#ifwinactive

#ifwinactive Bez tytułu
NumpadMult::

ifwinexist, Repertorium ogólne
{
IniWrite, Q, C:\Currenda\ini\Komornik.ini, Komornik, Litera
sleep 150
winactivate, Repertorium ogólne
WinWaitActive, Repertorium ogólne
send, {f5}{tab}{tab}{down}{down}{tab}
return
}
else
{
ifwinexist, Komornik SQL
{
IniWrite, Q, C:\Currenda\ini\Komornik.ini, Komornik, Litera
sleep 150
winactivate, Komornik SQL
send, {enter}
sleep, 1000
send, {f5}{tab}{tab}{down}{down}{tab}
return
}
else
{
return
}
}
#ifwinactive

#IfWinActive, Repertorium ogólne

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

#ifwinactive, Baza Internetowa Regon
NumpadEnter::
	x := A_ScreenWidth * 0.13125
	y := A_ScreenHeight * 0.3701171875
	mouseclick, l, %x%, %y%
	;mouseclick, l, 168, 379
return
#IfWinActive

;skróty
;-------------------------------------------------------
::zoo::Sp Z.O.O
::sa::S.A.
