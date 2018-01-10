#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance, force

Gui, add, text, ,Nazwa Pisma:
gui, add, ComboBox, vPismo gPismo w400, PRACA|-----------------------------------------------------------------------------------------------------------------------------------|potrącenia|nie pracuje|zbieg|zwolnienie|urlop|Odpowiedź na zaj. wynagrodzenia - kwota wolna|Odpowiedź na zaj. wierzytelności|Pismo pracodawcy|Pismo byłego pracodawcy|Pismo PUP|Pismo ZK|Pismo AŚ|Odpowiedź ZK na zaj. wynagrodzenia - nie przebywa|Odpowiedź ZK na zaj. wynagrodzenia - zwolniony|Info ZK o przekazaniu wg właściwości|Odpowiedź KRK na zapytanie|Odpowiedź KRK na zapytanie - nie figuruje|-----------------------------------------------------------------------------------------------------------------------------------|ZUSY|-----------------------------------------------------------------------------------------------------------------------------------|Odpowiedź ZUS na zaj. - błędne dane|Odpowiedź ZUS na zaj. - kwota wolna|Odpowiedź ZUS na zaj. - nie pobiera|Odpowiedź ZUS na zaj. - potrącenia|Odpowiedź ZUS na zaj. - zbieg|Odpowiedź ZUS na zaj. - zgon|Odpowiedź ZUS na zaj. - nie figuruje|Info ZUS o przekazaniu wg właściwości|Info ZUS o ostatniej racie|Info ZUS o wstrzymaniu świadczenia|Info ZUS o zmianie wysokości potrąceń|Pismo ZUS|Odpowiedź ZUS na umorzenie|-------------------------------------------------------------------------------------------------------------------------------|Urzędy Skarbowe|-------------------------------------------------------------------------------------------------------------------------------|Odpowiedź US na zaj. wierzytelności - inna właściwość|Odpowiedź US na zaj. wierzytelności - zbieg|Odpowiedź US na zaj. wierzytelności - nie rozlicza się|Odpowiedź US na zaj. wierzytelności - zgon|Odpowiedź US na zaj. wierzytelności - wyrejestrowany|Odpowiedź US na zapytanie - zwrot|Odpowiedź US na zapytanie|Info US o przekazaniu nadpłaty|Info US o przekazaniu wg właściwości|Zwrot mylnie skierowanej korespondencji od US|Wniosek US o rozstrzygnięcie zbiegu|Pismo US|-----------------------------------------------------------------------------------------------------------------------------------|KRUSY|-----------------------------------------------------------------------------------------------------------------------------------|Info KRUS o ostatniej racie|Odpowiedź KRUS na zapytanie|Odpowiedź KRUS na zaj. - zbieg|Odpowiedź KRUS na zapytanie - ubezpieczenie społeczne|Odpowiedź KRUS na zapytanie - nie pobiera|Odpowiedź KRUS na zapytanie - nie figuruje|-----------------------------------------------------------------------------------------------------------------------------------|Dłużnik|-----------------------------------------------------------------------------------------------------------------------------------|Pismo dłużnika|Pismo dłużnika + PROTOKÓŁ ZAJĘCIA RUCHOMOŚCI|Pismo osoby trzeciej w sprawie|Pismo pełnomocnika dłużnika|Pismo przedstawiciela ustawowego|Odpis skrócony aktu zgonu|Pokwitowanie odbioru pisma|Wniosek dłużnika - wstrzymanie odsetek|-----------------------------------------------------------------------------------------------------------------------------------|Komornik|-----------------------------------------------------------------------------------------------------------------------------------|Odpowiedź KS na wniosek o wszczęcie - wysłuchanie|Odpowiedź KS na wniosek o wszczęcie - zwrot tytułu|Odpowiedź KS na wniosek o wszczęcie - plan podziału|Odpowiedź KS na wniosek o wszczęcie - odpis zaj.|Odpowiedź KS na wniosek o wszczęcie - postanowienie o zakończeniu - zgon|Odpowiedź KS na wniosek o wszczęcie - postanowienie o zakończeniu|Odpowiedź KS na wniosek o wszczęcie - zawiadomienie|Odpowiedź KS na wniosek o wszczęcie - postanowienie o przekazaniu sprawy|Odpowiedź KS na wniosek o wszczęcie - zbiorówka|Pismo KS|Pismo KS o przekazanie akt|Postanowienie o przekazaniu sprawy od KS|Zwrot mylnie skierowanej korespondencji od KS|Zwrot postanowienia o przekazaniu sprawy od KS|-----------------------------------------------------------------------------------------------------------------------------------|Wierzyciel|-----------------------------------------------------------------------------------------------------------------------------------|Pismo wierzyciela|Pismo pełnomocnika wierzyciela|Pismo syndyka|Wniosek wierzyciela o umorzenie postępowania egzekucyjnego|Wniosek wierzyciela o zawieszenie postępowania egzekucyjnego|Wniosek wierzyciela o zmianie rachunku bankowego|Wniosek wierzyciela o przeprowadzenie czynności terenowych|Pismo wierzyciela o wstąpieniu do sprawy|Pismo wierzyciela o zmianie pełnomocnika w sprawie|Pismo pełnomocnika wierzyciela (e-mail)
Gui, add, text, ,Filtr:
Gui, add, ComboBox, vfiltr gfiltr w100, zaj|us|zus|krus
Gui, add, text, ,Log:
Gui, add, edit, vlogar w300 h300 ReadOnly,
Gui, add, checkbox, vhist ghist, 
Gui, add, Button, gPomoc, Pomoc
gui, show, h470 w450, Pisma
nr:=0
licznik:=0
tytulskoro := 0
GroupAdd, glowne, Repertorium ogólne, Lista czynności w sprawie
GroupAdd, glowne, Lista czynności w sprawie Km
SetTimer, tester, 1000


tester:
NR_temp =0
TimeOut = 1000
WinGet, wid, ID, Repertorium ogólne, Lista czynności w sprawie
Responding := DllCall("SendMessageTimeout", "UInt", wid, "UInt", 0x0000, "Int", 0, "Int", 0, "UInt", 0x0002, "UInt", TimeOut, "UInt *", NR_temp)
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
	ControlFocus, Button31, Skanowanie dokumentów
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
		ControlFocus, Button31, Skanowanie dokumentów
		Send, {enter}
		sleep, 100
		IfWinExist, Katalog ostatnio skanowanych dok.
		{
			return
		}
		WinWaitActive, Otwórz z pliku
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
		ControlFocus, Button31, Skanowanie dokumentów
		Send, {enter}
		sleep, 100
		IfWinExist, Katalog ostatnio skanowanych dok.
		{
			return
		}
		WinWaitActive, Otwórz z pliku
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
	ControlFocus, Button31, Skanowanie dokumentów
	Send, {enter}
	sleep, 100
	IfWinExist, Katalog ostatnio skanowanych dok.
		{
			return
		}
	WinWaitActive, Otwórz z pliku
	
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
	ControlFocus, Button31, Skanowanie dokumentów
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
		ControlFocus, Button31, Skanowanie dokumentów
		Send, {enter}
		sleep, 100
		IfWinExist, Katalog ostatnio skanowanych dok.
		{
			return
		}
		WinWaitActive, Otwórz z pliku
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
		ControlFocus, Button31, Skanowanie dokumentów
		Send, {enter}
		sleep, 100
		IfWinExist, Katalog ostatnio skanowanych dok.
		{
			return
		}
		WinWaitActive, Otwórz z pliku
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
	ControlFocus, Button31, Skanowanie dokumentów
	Send, {enter}
	sleep, 100
	IfWinExist, Katalog ostatnio skanowanych dok.
		{
			return
		}
	WinWaitActive, Otwórz z pliku
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

l::
ControlGetFocus, nazwa, Repertorium ogólne, Skorowidz uczestników
	IfInString, nazwa, Edit
	{
		send, l
	}
	else
	{
	ControlGet, lcheck, checked, , Button6, Repertorium ogólne, Skorowidz
	if (lcheck=0)
	{
		control, check, ,Button6, Repertorium ogólne, Skorowidz
	}
	else
	{
		control, uncheck, ,Button6, Repertorium ogólne, Skorowidz
	}
	}
return

#IfWinActive

#IfWinActive Skanowanie dokumentów
NumpadEnter::
	
	ControlFocus, Button8, Skanowanie dokumentów
	send, {enter}
	WinWaitActive, Czynność obca,,3
	IfWinNotActive, Czynność obca
	{
		FileDelete, %sciezka%
		droga = ""
		cel = ""
		return
	}
	;send, {tab}{tab}{right}{ctrl Down}{Shift Down}{left}{left}{left}{left}{left}{left}{left}{left}{left}{left}{left}{left}{left}{left}{left}{Shift Up}{Ctrl up}
	ControlFocus, Button12, Czynność obca
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
	WinWaitNotActive, Czynność obca, , 5
	if (ErrorLevel = 1)
	{
		ErrorLevel:=0
		MsgBox, zawieszony?
		return
	}
	sleep, 300
	
	Ifwinactive, Repertorium ogólne, Lista czynności w sprawie
		{
			ControlFocus, Button9, Repertorium ogólne, Lista czynności w sprawie
			send, +{tab}{tab}
			sleep, 150
			;clipboard := 0
			ControlGetFocus, triceratops, A
			ControlGetText, pterodaktyl, %triceratops%, A
			
			;send, ^c
			;sleep, 300
			;if clipboard = 0
			;{
				
			;}
			;else
			;{
				kmka = %pterodaktyl%
				nr+=1
				log = %log%%nr%.) %kmka% %typ%`n
				GuiControl,, logar, %log%
			;}
			ControlFocus, pbdw1101, Repertorium ogólne, Lista czynności w sprawie
			if (Responding = 0)
			{
				sleep, 1
				if (Responding = 0)
				{
				msgbox, 1
				return
				}
			}
			send, +{tab}+{tab}{tab}{tab}{tab}
			if (Responding = 0)
			{
				msgbox, 2
				return
			}
			sleep, 150
			StringLeft, Pismo2, pismo, 24
			send, %Pismo2%
			if (Responding = 0)
			{
				msgbox, 3
				return
			}
			sleep, 200
			if (Responding = 0)
			{
				msgbox, 4
				return
			}
			send, {enter}e
			if (Responding = 0)
			{
				msgbox, 5
				return
			}
			WinWaitActive, Informacje o czynności egzekucyjnej, , 3
			if (Responding = 0)
			{
				msgbox, 6
				return
			}
			send, {tab}{tab}{tab}{tab}{tab}{tab}{tab}
			sleep, 300
			ControlGetFocus, x, A
			ControlGettext, rest, %x%
			ControlFocus, Button14, A
			send, {enter}
			WinWaitActive, Repertorium ogólne, Lista czynności w sprawie Km, 3
			ControlFocus, pbdw1101, Repertorium ogólne, Lista czynności w sprawie
			if (filtr = "")
			{
				send, +{tab}+{tab}{tab}{tab}{tab}{bs}{enter}
			}
			else
			{
			send, +{tab}+{tab}{tab}{tab}{tab}
			sleep, 100
			send, %filtr%
			sleep, 100
			send, {Enter}
			}
			sleep, 300
			ControlFocus, pbdw1101, Repertorium ogólne, Lista czynności w sprawie
			if ( rest = "")
			{
				msgbox, skan się nie dodał
				return
			}
			else
			{
			FileDelete, %sciezka%
			droga = ""
			cel = ""
			}
			;msgbox, %rest%
			if (hist = 1)
			{
				send, {f2}
			}
		}
	else
		{
			WinGetActiveTitle, tytulskoro
			StringTrimLeft, tytulskoro, tytulskoro, 29
			IfInString, tytulskoro, SPRAWA GŁÓWNA
			{
				StringTrimRight, tytulskoro, tytulskoro, 19
			}
			ifinstring, tytulskoro, SPRAWA PRZYŁĄCZONA
			{
				StringTrimRight, tytulskoro, tytulskoro, 21
			}
			if ( tytulskoro2 = tytulskoro )
			{
			WinGetActiveTitle, tytulskoro
			StringTrimLeft, tytulskoro, tytulskoro, 29
			IfInString, tytulskoro, SPRAWA GŁÓWNA
			{
				StringTrimRight, tytulskoro, tytulskoro, 19
			}
			msgbox, dwa razy do tej samej kmki albo nie pobrał tytułu
			return
			}
			tytulskoro2 := tytulskoro
			if (tytulskoro = "") or (tytulskoro = "none")
			{
				msgbox, cos sie spierdoliło %tytulskoro%
				return
			}
			send, {esc}{esc}{f4}
			WinWaitActive, Wybór sprawy egzekucyjnej, , 3
			if (ErrorLevel = 1)
			{
				MsgBox, Wybór sprawy się nie odpalił
				ErrorLevel:=0
				return
			}
			Send, {tab}{bs}
			;clipboard := 0
			;sleep, 300
			;ControlGetFocus, krasko, A
			sleep, 150
			ControlSetText, Edit1, %tytulskoro%, A
			sleep, 200
			;send, %tytulskoro%
			
			;sleep, 300
			
				kmka = %tytulskoro%
				nr+=1
				log = %log%%nr%.) %kmka% %typ%`n
				GuiControl,, logar, %log%
			
			;sleep, 300
			send, {enter}
			winwaitactive, Repertorium ogólne, Lista czynności w sprawie, 3
			IfWinNotActive, Repertorium ogólne, Lista czynności w sprawie
			{
				FileDelete, %sciezka%
				droga = ""
				cel = ""
				msgbox, kmka sie nie wpisała, pewnie nie zassało z tytułu okna
				return
			}
			send,+{tab}{tab}{tab}%filtr%{enter}
			ControlFocus, pbdw1101, Repertorium ogólne, Lista czynności w sprawie
			send, +{tab}+{tab}{tab}{tab}{tab}
			sleep, 150
			
			StringLeft, Pismo2, pismo, 24
			
			send, %Pismo2%
			
			sleep, 200
			send, {enter}e
			
			WinWaitActive, Informacje o czynności egzekucyjnej, , 3
			
			send, {tab}{tab}{tab}{tab}{tab}{tab}{tab}
			sleep, 300
			ControlGetFocus, x, A
			ControlGettext, rest, %x%
			ControlFocus, Button14, A
			send, {enter}
			WinWaitActive, Repertorium ogólne, Lista czynności w sprawie Km, 3
			ControlFocus, pbdw1101, Repertorium ogólne, Lista czynności w sprawie
			if (filtr = "")
			{
				send, +{tab}+{tab}{tab}{tab}{tab}{bs}{enter}
			}
			else
			{
			send, +{tab}+{tab}{tab}{tab}{tab}
			sleep, 100
			send, %filtr%
			sleep, 100
			send, {Enter}
			}
			sleep, 300
			ControlFocus, pbdw1101, Repertorium ogólne, Lista czynności w sprawie
			
			if ( rest = "")
			{
				msgbox, skan się nie dodał
				return
			}
			else
			{
			FileDelete, %sciezka%
			droga = ""
			cel = ""
			}
			;msgbox, %rest%
			if (hist = 1)
			{
				send, {f2}
			}
			;msgbox, %tytulskoro%
			return
		}
return
#IfWinActive

#IfWinActive Otwórz z pliku
BackSpace::
	WinClose, Otwórz z pliku
	winwaitactive, Skanowanie dokumentów, , 3
	winclose, Skanowanie dokumentów
	WinWaitActive, Czynność obca, , 3
	ControlFocus, Button10
	send, {enter}
	WinWaitActive, Pytanie, , 3
	send, {right}{enter}
return

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
	;MsgBox, %sciezka%
return
;Numpad2::
;	ControlFocus, SysTreeView321
;	send, {tab}{right}{left}{Delete}{Enter}
;	Sleep, 360
;	ControlFocus, SysTreeView321
;	send, {tab}{right}{left}{enter}
;return
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
 NumpadEnter::
 send, {enter}
 WinWaitActive, Repertorium ogólne, Lista czynności w sprawie, 3
 IfWinNotActive, Repertorium ogólne, Lista czynności w sprawie
{
	return
}
 ;send, +{tab}+{tab}+{tab}{tab}
 return
 
 left::
	WinClose, Lista spraw uczestnika i jego synonimy
 return
 
 ;szukanie po obrazkach
 ;----------------------------------------------------------------
 down::
 loop, 10
 {
	send, {down}
	ImageSearch, zaznaczenieX, zaznaczenieY, 11, 83, 1591, 1055, zaznaczenie.bmp
	;IfNotExist, zaznaczenie.bmp
		;MsgBox, zaznaczenie
	;msgbox, %zaznaczenieX%,%zaznaczenieY%
	czynnaX := zaznaczenieX - 20
	czynnaY := zaznaczenieY + 20
	;MsgBox, %zaznaczenieX%,%zaznaczenieY%, %czynnaX%,%czynnaY%
	ImageSearch, szukanaX, szukanaY, %czynnaX%,%zaznaczenieY%, %zaznaczenieX%, %czynnaY%, czynna.bmp
	if (szukanaX = "")
	{
		ImageSearch, szukanaX, szukanaY, %czynnaX%,%zaznaczenieY%, %zaznaczenieX%, %czynnaY%, zajecia.bmp
		if (szukanaX = "")
		{
		}else{
			return
			}
		
		
	}else
	{
		return
	}
	
}
 return
 
Right::
	send, h
return

Up::
 loop, 10
 {
	send, {Up}
	ImageSearch, zaznaczenieX, zaznaczenieY, 11, 83, 1591, 1055, zaznaczenie.bmp
	;IfNotExist, zaznaczenie.bmp
		;MsgBox, zaznaczenie
	;msgbox, %zaznaczenieX%,%zaznaczenieY%
	czynnaX := zaznaczenieX - 20
	czynnaY := zaznaczenieY + 20
	;MsgBox, %zaznaczenieX%,%zaznaczenieY%, %czynnaX%,%czynnaY%
	ImageSearch, szukanaX, szukanaY, %czynnaX%,%zaznaczenieY%, %zaznaczenieX%, %czynnaY%, czynna.bmp
	if (szukanaX = "")
	{
		ImageSearch, szukanaX, szukanaY, %czynnaX%,%zaznaczenieY%, %zaznaczenieX%, %czynnaY%, zajecia.bmp
		if (szukanaX = "")
		{
		}else{
			return
			}
		
		
	}else
	{
		return
	}
	
}
 return

 ;---------------------------------------------------------------
 ;kopiowanie do synonimów
 ;----------------------------------------------------------------
 NumpadDiv::
	licznik+=1
	send, o
	WinWaitActive, Sprawa eg, , 5
	if errorlevel
	{
		ErrorLevel:=0
		msgbox, wypierdala się
		return
	}
	else
	{
	sleep, 150
	WinGetTitle, tytul%licznik%, A
	StringTrimLeft, tytul%licznik%, tytul%licznik%, 22
	winclose, A
}
return
 ;----------------------------------------------------------------
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

right::
	send, {f2}
return

Esc::
	ControlGetFocus, eskejp, A
	if (eskejp = "Edit6")
	{
		ControlGetText, eskejp1, Edit6, A
		if (eskejp1 = "")
		{
		send, 1/15{enter}{esc}
		}
		else
		{
			send, {esc}{esc}
		}
	}
	else
	{
		send, {esc}
	}
return

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

#IfWinActive, ahk_group glowne
;o::
;	ControlGetFocus, nazwa, Repertorium ogólne, Lista czynności w sprawie Km
;	MsgBox, %nazwa%
;return
k::
ControlGetFocus, nazwa, ahk_group glowne
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
	ControlGetFocus, nazwa, ahk_group glowne
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
	ControlGetFocus, nazwa, ahk_group glowne
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
ControlGetFocus, nazwa, ahk_group glowne
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

#IfWinActive Lista spraw uczestnika i jego synonimy
^p::
	;ControlGet, coto, selected, , PBTreeView32_1001, Lista spraw uczestnika i jego synonimy
	;MsgBox, %coto%
	send, {rbutton}
return
#IfWinActive

;under construction
;--------------------------

;#IfWinActive, Lista spraw dłużnika - 
#IfWinActive, Repertorium ogólne, Lista czynności w sprawie Km
NumpadDiv::
ControlGetFocus, nazwa, A
	IfInString, nazwa, Edit
	{
		send, {NumpadDiv}
	}
	else
	{
send, i{down}{enter}
WinWaitActive, Lista spraw dłużnika - 
x:=0
	loop, %licznik%
	{
		
		x+=1
		tytylejszyn:=tytul%x%	
		ControlFocus, Button1, Lista spraw dłużnika - 
		send, {enter}
		WinWaitActive, Wybór sprawy egzekucyjnej
		send, {tab}%tytylejszyn%{enter}
		WinWaitActive Lista spraw dłużnika - 
		if (x=licznik)
		{
			x:=0
			licznik:=0
			return
		}
	}
}
return
#IfWinActive

#ifwinactive, Lista spraw dłużnika - 
NumpadEnter::
		send, {enter}
		WinWaitActive, Czynność w sprawie, , 3
		if errorlevel
		{
			ErrorLevel:=0
			return
		}
		else
		{
			send, {enter}
			winwaitactive, Kopiowanie czynności, , 3
			if errorlevel
			{
				ErrorLevel:=0
				return
			}
			else
			{
				send, {enter}
			}
		}
		
return
#IfWinActive

#ifwinactive, Repertorium ogólne, Lista czynności w sprawie Km
ScrollLock::
	WinGetText, pterodaktyl, A
	MsgBox, %pterodaktyl%
	StringTrimLeft, pterodaktyl, pterodaktyl, 200
	StringTrimRight, pterodaktyl, pterodaktyl, 200
MsgBox, %pterodaktyl%	
return
#ifwinactive

#IfWinActive, Lista czynności w sprawie Km
esc::
	if ( A_ThisHotkey = A_PriorHotkey ) and ( A_TimeSincePriorHotkey < 300 )
	{
		return
	}
	else
	{
		send, {esc}
	}
return

;szukanie po obrazku
;---------------------------------------------
left::
	WinClose, Lista czynności w sprawie Km
return
;---------------------------------------------
#IfWinActive

#IfWinActive, Informacje
Pause::
ControlGetFocus, x, A
ControlGettext, rest, %x%
MsgBox, %x%%rest%
return
#IfWinActive