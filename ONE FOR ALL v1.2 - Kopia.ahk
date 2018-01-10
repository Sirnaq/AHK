#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance, force
Gui, add, text, ,Nazwa Pisma:
gui, add, ComboBox, vPismo gPismo w400, PRACA|-----------------------------------------------------------------------------------------------------------------------------------|potrącenia|nie pracuje|zbieg|zwolnienie|urlop|Odpowiedź na zaj. wynagrodzenia - kwota wolna|Odpowiedź na zaj. wierzytelności|Pismo pracodawcy|Pismo byłego pracodawcy|Pismo PUP|Pismo ZK|Pismo AŚ|Odpowiedź ZK na zaj. wynagrodzenia - nie przebywa|Odpowiedź ZK na zaj. wynagrodzenia - zwolniony|Info ZK o przekazaniu wg właściwości|Odpowiedź KRK na zapytanie|Odpowiedź KRK na zapytanie - nie figuruje|-----------------------------------------------------------------------------------------------------------------------------------|ZUSY|-----------------------------------------------------------------------------------------------------------------------------------|Odpowiedź ZUS na zaj. - błędne dane|Odpowiedź ZUS na zaj. - kwota wolna|Odpowiedź ZUS na zaj. - nie pobiera|Odpowiedź ZUS na zaj. - potrącenia|Odpowiedź ZUS na zaj. - zbieg|Odpowiedź ZUS na zaj. - zgon|Info ZUS o ostatniej racie|Info ZUS o zmianie wysokości potrąceń|Pismo ZUS|Odpowiedź ZUS na umorzenie|-------------------------------------------------------------------------------------------------------------------------------|Urzędy Skarbowe|-------------------------------------------------------------------------------------------------------------------------------|Pismo US|Info US o przekazaniu nadpłaty|Odpowiedź US na zaj. wierzytelności – zbieg|Odpowiedź US na zapytanie - zwrot|Odpowiedź US na zaj. wierzytelności - inna właściwość|Odpowiedź US na zapytanie|Zwrot mylnie skierowanej korespondencji od US|Info US o przekazaniu wg właściwości|Wniosek US o rozstrzygnięcie zbiegu|-----------------------------------------------------------------------------------------------------------------------------------|KRUSY|-----------------------------------------------------------------------------------------------------------------------------------|Info KRUS o ostatniej racie|Odpowiedź KRUS na zapytanie|Odpowiedź KRUS na zaj. - zbieg|-----------------------------------------------------------------------------------------------------------------------------------|Dłużnik|-----------------------------------------------------------------------------------------------------------------------------------|Pismo dłużnika|Pismo dłużnika + PROTOKÓŁ ZAJĘCIA RUCHOMOŚCI|Pismo osoby trzeciej w sprawie|Pismo pełnomocnika dłużnika|Pismo przedstawiciela ustawowego|Odpis skrócony aktu zgonu|Pokwitowanie odbioru pisma|-----------------------------------------------------------------------------------------------------------------------------------|Komornik|-----------------------------------------------------------------------------------------------------------------------------------|Odpowiedź KS na wniosek o wszczęcie - wysłuchanie|Odpowiedź KS na wniosek o wszczęcie - zwrot tytułu|Odpowiedź KS na wniosek o wszczęcie - plan podziału|Odpowiedź KS na wniosek o wszczęcie - odpis zaj.|Odpowiedź KS na wniosek o wszczęcie - postanowienie o zakończeniu - zgon|Odpowiedź KS na wniosek o wszczęcie - postanowienie o zakończeniu|Odpowiedź KS na wniosek o wszczęcie - zawiadomienie|Odpowiedź KS na wniosek o wszczęcie - postanowienie o przekazaniu sprawy|Odpowiedź KS na wniosek o wszczęcie - zbiorówka|Pismo KS|Pismo KS o przekazanie akt|Postanowienie o przekazaniu sprawy od KS|-----------------------------------------------------------------------------------------------------------------------------------|Wierzyciel|-----------------------------------------------------------------------------------------------------------------------------------|Pismo wierzyciela|Pismo pełnomocnika wierzyciela|Pismo syndyka|Wniosek wierzyciela o umorzenie postępowania egzekucyjnego|Wniosek wierzyciela o zawieszenie postępowania egzekucyjnego|Pismo wierzyciela o zmianie pełnomocnika w sprawie
Gui, add, text, ,Filtr:
Gui, add, ComboBox, vfiltr gfiltr w100, zaj|us|zus|krus
Gui, add, text, ,Log:
Gui, add, edit, vlogar w300 h300,
Gui, add, checkbox, vhist ghist, 
Gui, add, Button, gPomoc, Pomoc
gui, show, h470 w450, Pisma
nr:=0

F1::
	send, {f3}{tab}
	WinWaitActive, Repertorium ogólne, Sprawa egzekucyjna
	send, {tab}{tab}m
	WinWaitActive, Dłużnik
	send,{tab}{tab}+{tab}
	send, ^c
	sleep, 300
	imie := Clipboard
	send, {tab}
	send, ^c
	sleep, 300
	nazwisko := Clipboard
	send, {esc}
	WinWaitActive, Repertorium ogólne, Sprawa egzekucyjna
	msgbox, %imie% %nazwisko%
	
return

#IfWinActive, Repertorium ogólne, Lista czynności w sprawie

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
	ControlFocus, Button30, Skanowanie dokumentów
	Send, {enter}
return


NumpadMult::
	;ControlClick, Button13
	;WinWaitActive, Czynność obca
	;send, {tab}{bs}Odpowiedź na zaj. wynagrodzenia - %pismo%
	;sleep, 100
	;WinActivate, Czynność obca
	;ControlFocus, Button3
	;send, {enter}
	;WinWaitActive, Skanowanie dokumentów
	;sleep, 150
	;ControlFocus, Button30, Skanowanie dokumentów
	;Send, {enter}
	if (filtr = "zaj")
	{
		ControlClick, Button13
		WinWaitActive, Czynność obca
		send, {tab}{bs}Odpowiedź na zaj. wynagrodzenia - %pismo%
		sleep, 100
		WinActivate, Czynność obca
		ControlFocus, Button3
		send, {enter}
		WinWaitActive, Skanowanie dokumentów
		sleep, 150
		ControlFocus, Button30, Skanowanie dokumentów
		Send, {enter}
	}
	else
	{
		ControlClick, Button13
		WinWaitActive, Czynność obca
		send, {tab}{bs}%pismo%
		sleep, 100
		WinActivate, Czynność obca
		ControlFocus, Button3
		send, {enter}
		WinWaitActive, Skanowanie dokumentów
		sleep, 150
		ControlFocus, Button30, Skanowanie dokumentów
		Send, {enter}
	}
return

NumpadSub::
	ControlClick, Button13
	WinWaitActive, Czynność obca
	send, {tab}{bs}Odpowiedź na zaj. wierzytelności - %pismo%
	sleep, 100
	WinActivate, Czynność obca
	ControlFocus, Button3
	send, {enter}
	WinWaitActive, Skanowanie dokumentów
	sleep, 150
	ControlFocus, Button30, Skanowanie dokumentów
	Send, {enter}
return

#IfWinActive
;--------------------------------------


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
	ControlFocus, Button30, Skanowanie dokumentów
	Send, {enter}
return

NumpadMult::
	if (filtr = "zaj")
	{
		ControlClick, Button13
		WinWaitActive, Czynność obca
		send, {tab}{bs}Odpowiedź na zaj. wynagrodzenia - %pismo%
		sleep, 100
		WinActivate, Czynność obca
		ControlFocus, Button3
		send, {enter}
		WinWaitActive, Skanowanie dokumentów
		sleep, 150
		ControlFocus, Button30, Skanowanie dokumentów
		Send, {enter}
	}
	else
	{
		ControlClick, Button13
		WinWaitActive, Czynność obca
		send, {tab}{bs}%pismo%
		sleep, 100
		WinActivate, Czynność obca
		ControlFocus, Button3
		send, {enter}
		WinWaitActive, Skanowanie dokumentów
		sleep, 150
		ControlFocus, Button30, Skanowanie dokumentów
		Send, {enter}
	}
return

NumpadSub::
	ControlClick, Button13
	WinWaitActive, Czynność obca
	send, {tab}{bs}Odpowiedź na zaj. wierzytelności - %pismo%
	sleep, 100
	WinActivate, Czynność obca
	ControlFocus, Button3
	send, {enter}
	WinWaitActive, Skanowanie dokumentów
	sleep, 150
	ControlFocus, Button30, Skanowanie dokumentów
	Send, {enter}
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
	WinWaitActive, Czynność obca,,3
	IfWinNotActive, Czynność obca
	{
		return
	}
	;send, {tab}{tab}{right}{ctrl Down}{Shift Down}{left}{left}{left}{left}{left}{left}{left}{left}{left}{left}{left}{left}{left}{left}{left}{Shift Up}{Ctrl up}
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
	sleep, 500
	Ifwinactive, Repertorium ogólne, Lista czynności w sprawie
		{
			ControlFocus, Button9, Repertorium ogólne, Lista czynności w sprawie
			send, +{tab}{tab}
			clipboard := 0
			send, ^c
			sleep, 300
			if clipboard = 0
			{
				
			}
			else
			{
				kmka = %clipboard%
				nr+=1
				log = %log%%nr%.) %kmka% %typ%`n
				GuiControl,, logar, %log%
			}
			ControlFocus, pbdw1101, Repertorium ogólne, Lista czynności w sprawie
			if (hist = 1)
			{
				send, {f2}
			}
		}
	else
		{
			send, {esc}{esc}{f4}{tab}
			clipboard := 0
			sleep, 300
			send, ^c
			sleep, 300
			if clipboard = 0
			{
				
			}
			else
			{
				kmka = %clipboard%
				nr+=1
				log = %log%%nr%.) %kmka% %typ%`n
				GuiControl,, logar, %log%
			}
			sleep, 300
			send, {enter}
			send,+{tab}{tab}{tab}%filtr%{enter}
			ControlFocus, pbdw1101, Repertorium ogólne, Lista czynności w sprawie
			if (hist = 1)
			{
				send, {f2}
			}
			return
		}
return
#IfWinActive

#IfWinActive Otwórz z pliku
Numpad1::
	ControlFocus, SysTreeView321
	send, {tab}{right}{left}{enter}
return
Numpad2::
	ControlFocus, SysTreeView321
	send, {tab}{right}{left}{Delete}{Enter}
	Sleep, 360
	ControlFocus, SysTreeView321
	send, {tab}{right}{left}{enter}
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
		Sleep, 300
		IfWinActive, Lista czynności w sprawie Km
		{
			send, +{tab}{tab}{tab}
			send, %filtr%{enter}
		}
		IfWinActive, Błąd obsługi
		{
			WinClose, Błąd obsługi
			return
		}
		else
		{
			WinWaitActive, Lista czynności w sprawie Km
			send, +{tab}{tab}{tab}
			send, %filtr%{enter}
			return
		}
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
 rbutton::
 if (A_priorhotkey = A_thishotkey and A_TimeSincePriorHotkey < 300)
{
	MouseGetPos, , , ,lista,1
	if (lista="PBTreeView32_1001")
	{
		send, {rbutton}{down}{enter}		
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
 
 lbutton::
 if (A_priorhotkey = A_thishotkey and A_TimeSincePriorHotkey < 300)
{
	MouseGetPos, , , ,lista,1
	if (lista="PBTreeView32_1001")
	{
		send, {rbutton}{down}{down}{enter}
		winactivate, Lista czynności w sprawie Km
		Sleep, 300
		IfWinActive, Lista czynności w sprawie Km
		{
			send, +{tab}{tab}{tab}
			send, %filtr%{enter}
		}
		IfWinActive, Błąd obsługi
		{
			WinClose, Błąd obsługi
			return
		}
		else
		{
			WinWaitActive, Lista czynności w sprawie Km
			send, +{tab}{tab}{tab}
			send, %filtr%{enter}
			return
		}
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

filtr:
gui, submit, nohide
return

hist:
gui, submit, nohide
return

Pismo:
gui, submit, nohide
if (pismo="zbieg") or (pismo="Odpowiedź ZUS na zaj. - zbieg")
{
	typ := "Z"
}
else
{
	if (pismo="Pismo ZK") or (pismo="Pismo AŚ")
	{
		typ := ""
	}
	else
	{
		if (pismo="zwolnienie") or (pismo="urlop") or (pismo = "Pismo pracodawcy")
		{
			typ:="O"
		}
		else
		{
			typ:="A"
		}
	}
}
return

;keypad
;---------------------------------------------------------
#ifwinactive Repertorium ogólne, Lista czynności w sprawie
NumpadAdd::
ControlFocus, Button3, Repertorium ogólne, Lista czynności w sprawie
send, +{tab}{tab}
return
#IfWinActive

#IfWinActive, Repertorium ogólne
f4::
send, {f4}
WinActivate, Wybór sprawy egzekucyjnej
WinWaitActive,Wybór sprawy egzekucyjnej
ControlFocus, Button10, Wybór sprawy egzekucyjnej
send, {tab}{tab}
return
#IfWinActive

#IfWinActive Wybór sprawy egzekucyjnej
NumpadEnter::
send, {enter}
sleep, 300
IfWinActive, Repertorium ogólne, Lista czynności w sprawie
{
	send, +{tab}{tab}{tab}
	send, %filtr%{enter}
}
else
{
	return
}
return
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
;o::
;	ControlGetFocus, nazwa, Repertorium ogólne, Lista czynności w sprawie Km
;	MsgBox, %nazwa%
;return
k::
ControlGetFocus, nazwa, Repertorium ogólne, Lista czynności w sprawie Km
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
	ControlGetFocus, nazwa, Repertorium ogólne, Lista czynności w sprawie Km
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
		return
	}
return

x::
	ControlGetFocus, nazwa, Repertorium ogólne, Lista czynności w sprawie Km
	IfInString, nazwa, Edit
	{
		send, x
	}
	if nazwa=pbdw1101
	{
	send, e
	WinWaitActive, Informacje o czynności egzekucyjnej
	ControlFocus, Button1, Informacje o czynności egzekucyjnej
	send, {tab}{tab}{tab}{tab}{tab}{tab}{tab}^{left}^{left}^{left}^{left}^{left}^{left}^{left}^{left}^{left}^{left}{right}{right}{right}{right}{right}{right}{right}{right}{right} AŚ{enter}
	}
	else
	{
		return
	}
return

p::
ControlGetFocus, nazwa, Repertorium ogólne, Lista czynności w sprawie Km
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

#IfWinActive Lista spraw dłużnika i jego synonimy
NumpadEnter::
	WinClose, Lista spraw dłużnika i jego synonimy
return
#IfWinActive

#IfWinActive, Pisma
F4::
	clipboard := 0
	sleep, 100
	Send, ^c
	sleep, 100
	if (clipboard = 0)
	{
		
	}
	else
	{
		If clipboard contains /08,/09,/10,/11,/12,/13,/14,/15,/16,/17,/18
		{
			nrsprawy = %clipboard%
			winactivate, Repertorium ogólne
			ifwinactive, Repertorium ogólne, Lista czynności w sprawie
			{
				send, +{tab}+{tab}+{tab}{tab}%nrsprawy%{enter}
			}
			else
			{
				IfWinActive, Repertorium ogólne, Skorowidz uczestników
				{
					send, {esc}{f4}{tab}%nrsprawy%{enter}
				}
				else
				{
					IfWinActive, Lista czynności w sprawie
					{
						;winclose, Lista czynności w sprawie
						;sleep, 100
						;send, {esc}{f4}{tab}%nrsprawy%{enter}
					}
					else
					{
						IfWinExist, Repertorium ogólne
						{
							send, {f4}{tab}%nrsprawy%{enter}
						}
						else
						{
							msgbox, A może otwarłbyś Komornika?
						}
					}
				}
		}
		}
		else
		{
			msgbox, Nie zaznaczono KMKI
		}
	}
return
#IfWinActive

Pomoc:
	msgbox, Pomoc:`nSkrypt działa na historii, ma dodatkowe funkcje dla skorowidza uczestników, klawisze f6,f7,f8`n* na numpadzie zaj. wynagrodzenia`n- na numpadzie zaj. wierzytelności`n+ na numpadzie podświetlenie kmki`ndwukrotne kliknięcie na kmkę w liście spraw uczestnika otworzy historię i ustawi odpowiedni filtr`nUWAGA: dodawać pracę jedynie z filtrem: "zaj" `nZaznacz Odpowiedź na zaj., przyciski z - ZK, x - AŚ, p - PUP, k - KONTO`nJak zaznaczy się kmkę w logu i klikne F4 to wejdzie automatycznie w historię
return
;F9::
;	msgbox, %hist%
;return

#ifwinactive Sprawa egzekucyjna
Esc::
	WinClose, Sprawa egzekucyjna 
return
#IfWinActive

#IfWinActive, Repertorium ogólne, Skorowidz uczestników
esc & f1::
	send, {esc}
return

esc::

return

f1::

return
#IfWinActive

f12::
MsgBox %typ%
return
