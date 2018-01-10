#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#singleinstance, force
;do powiadomienia
;------------------------------------------------------------
SetTimer, close, 200
;Kotkeys
;-------------------------------------------------------------


#ifwinactive Wybór trzeciodłużnika dochodu
ins::
	;mousemove, 524, 74
	ControlFocus, Edit1
	send, ^a^c
	;mousemove, 524, 30
	WinActivate, Wybór trzeciodłużnika dochodu
	ControlFocus, pbdw1102
	;lbutton
	send, d
	sleep, 100
	send, ^v
return
#ifwinactive

#ifwinactive Wybór trzeciodłużnika wierzytelności
ins::
	;mousemove, 524, 74
	;ControlFocus, Edit1
	;send, ^a^c
	;mousemove, 524, 30
	WinActivate, Wybór trzeciodłużnika dochodu
	;ControlFocus, pbdw1102
	send, d
	sleep, 100
	send, ^v
return
#ifwinactive

#IfWinActive, Stan sprawy - podgląd wydruku
NumpadEnter::
WinClose, Stan sprawy - podgląd wydruku
return
#IfWinActive

#ifwinactive Repertorium ogólne, Sprawa egzekucyjna

s::
controlgetfocus, coto, A
if (coto = "Edit30")
{
	send, {enter}
	sleep, 500
}
send, s
WinWaitActive, Wydruk stanu sprawy na dzień, , 3
if (errorlevel = 1)
{
	ErrorLevel := 0
	return
}
else
{
	Send, {Enter}
	WinWaitActive, Stan sprawy - podgląd wydruku, , 3
	if (errorlevel = 1)
{
	ErrorLevel := 0
	return
}
}
return

o::
	
return

p::
controlgetfocus, coto, A
if (coto = "Edit30")
{
	send, {enter}
	sleep, 500
}
	IfWinActive, Repertorium ogólne, Sprawa egzekucyjna, ,Lista czynności w sprawie
	{
		;IniWrite, Q, C:\Currenda\ini\Komornik.ini, Komornik, Litera
		;mousemove, 1179, 612, 0
		ControlFocus, Button19, Repertorium ogólne
		;ControlClick, Button19, Repertorium ogólne
		send, {enter}{down}{down}{enter}
	}
return

k::
controlgetfocus, coto, A
if (coto = "Edit30")
{
	;MsgBox, jest
	send, {enter}
	sleep, 500
}
IfWinActive, Repertorium ogólne, Sprawa egzekucyjna, ,Lista czynności w sprawie
	{
		;mousemove, 1179, 612, 0
		ControlFocus, Button19, Repertorium ogólne
		send, {Enter}{down}{enter}
	}
return

u::
controlgetfocus, coto, A
if (coto = "Edit30")
{
	send, {enter}
	sleep, 500
}
IfWinActive, Repertorium ogólne, Sprawa egzekucyjna, ,Lista czynności w sprawie
	{
		ControlFocus, Button19, Repertorium ogólne
		;IniWrite, Q, C:\Currenda\ini\Komornik.ini, Komornik, Litera
		;mousemove, 1179, 612, 0
		send, {Enter}{down}{down}{down}{down}{down}{enter}
	}
	
return

e::
controlgetfocus, coto, A
if (coto = "Edit30")
{
	send, {enter}
	sleep, 500
}
IfWinActive, Repertorium ogólne, Sprawa egzekucyjna, ,Lista czynności w sprawie
	{
		ControlFocus, Button19, Repertorium ogólne
		;IniWrite, Q, C:\Currenda\ini\Komornik.ini, Komornik, Litera
		;mousemove, 1179, 612, 0
		send, {Enter}{down}{down}{enter}
	}
return

z::
controlgetfocus, coto, A
if (coto = "Edit30")
{
	send, {enter}
	sleep, 500
}
IfWinActive, Repertorium ogólne, Sprawa egzekucyjna, ,Lista czynności w sprawie
	{
		;Mousemove, 1179, 612, 0
		ControlFocus, Button19, Repertorium ogólne
		send, {Enter}{down}{down}{enter}
	}
return

#ifwinactive
;cz2
;----------------------------------------------------------------------------------------------
#ifwinactive, Dłużnik - 
p::
	send, d{tab}{tab}{down}{tab}
	winactivate, Wybór trzeciodłużnika dochodu
	WinWaitActive, Wybór trzeciodłużnika dochodu
	send, {tab}{down}{Down}
	Control, choose, 3, pbdwst1101
	ControlFocus, Edit1
	send, +{tab}
	;mousemove, 1136, 206, 0
	;send, {lbutton}
	;mousemove, 524, 74
	;send, {lbutton}
	
	WinWaitClose, Wybór
	winwaitactive, Dochód uczestnika, , 3
	if (errorlevel = 1)
	{
		ErrorLevel := 0
		return
	}
	send, {enter}{enter}
	sleep, 250
	send, f
return

u::
	send, l
return

e::
	send, l
	sleep, 300
	Control, ShowDropDown
	if (A_ScreenWidth = 1600)
	{
		mousemove, 183,44	
	}
	else
	{	
		mousemove, 117, 62
	}
	sleep, 500
	send, {lbutton}
	mousemove, 0, 47, 0, R
	sleep, 250
	send, {lbutton}
	sleep, 250
	send, {tab}{tab}
return

k::
	send, d
return

numpadenter::
	send, {enter}
	sleep, 250
	send, f
return

z::
	send, l
	winwaitactive, Lista dochodów
	mousemove, 750, 46, 0
	send, {lbutton}
	mousemove, 750, 196, 0
	send, {lbutton}
	mousemove, 277, 45, 0
	send, {lbutton}
return

#ifwinactive

#IfWinActive, Wybór

F6::
	Control, Choose, 8, ComboBox4
	ControlClick, Edit1
	send, ^a{bs}
return

F7::
	Control, Choose, 2, ComboBox4
	ControlClick, Edit1
	send, ^a{bs}
return

F8::
	control, choose, 3, ComboBox4
	controlclick, Edit1
	send, ^a{bs}
return
#IfWinActive

;------------------------------------------------------------------------------------------------



#Ifwinactive, Lista wierzytelności
numpadmult::
	mousemove, 230, 44
	send, {lbutton}
	sleep, 250
	send, ^c
	mousemove, 42, 42
	send, {lbutton}
	winactivate, Wybór trzeciodłużnika wierzytelności
	winwaitactive, Wybór trzeciodłużnika wierzytelności
	control, choose, 2, ComboBox4
	;mousemove, 1175, 190
	;send, {lbutton}
	send, {tab}{tab}{tab}{tab}{Down}{Down}
	send, +{tab}
	send, ^v{enter}
	
	WinWaitActive, Wierzytelność
	sleep, 300
	if (A_ScreenWidth = 1600)
	{
		MouseClick, l, 198, 299	
	}
	else
	{	
		MouseClick, l, 153, 259
	}
	
	
	;mousemove, 153, 259
	;send, {lbutton}
	winactivate, Propozycje nazw wierzytelności
	winwaitactive, Propozycje nazw wierzytelności
	;mousemove, 294, 112
	;send, {lbutton}
	;mousemove, 571, 622
	send, {tab}{Down}{Down}{Down}z
	;send, {lbutton}
	sleep, 100
	send, {enter}
	sleep, 250
	;mousemove, 238, 95
	send, {enter}{enter}{enter}f
	
return
#ifwinactive

#ifwinactive Baza Internetowa Regon
numpadenter::
	mouseclick, l, 171, 376
	;mousemove, 171, 376
	;send, {lbutton}
	
	sleep, 100
	ImageSearch, szukanyX, szukanyY, 254, 207, 1493, 1107, regon.bmp
	szukanyX := szukanyX + 20
	szukanyY := szukanyY + 35
	mouseclick, l,  %szukanyX%, %szukanyY%
	;MouseClick, l, 294, 325
return
NumpadAdd::
	send, {f5}
	sleep, 500
	ControlClick, x101 y315, 
return
#ifwinactive

; Hotstringi
;---------------------------------------------------------
::zoo::Sp. Z O.O.
::sc::S.C.
::sa::S.A.
::pphu::P.P.H.U. 
::sj::S.J.
::spj::Sp.J.
::phu::P.H.U.
::spk::Sp.K.
::fhu::F.H.U.
;hotstringi Banków
;-----------------------------------------------------------
::1940::
send, 1940{enter}{enter}{enter}{enter}{Enter}{Enter}

return
;labelka
;----------------------
close: 
	ifwinexist, Firma
	{
		ifwinexist, Powtórzona nazwa
		{
			WinClose, Powtórzona nazwa
		}
		else
		{
			return
		}
	}
	else
	{
		return
	}
return

#IfWinActive
	
#ifwinactive, Repertorium ogólne, Sprawa egzekucyjna
NumpadAdd::
	ControlClick, x302 y122
return
#IfWinActive

home::
Reload
return