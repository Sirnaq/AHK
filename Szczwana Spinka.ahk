#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#SingleInstance, force

;Do powiadomień spinacza
;---------------------------------------------
SetTimer, close, 400

;GUI
;---------------------------------------------
Gui, add, text, , Wpisz KM:
Gui, add, edit, w200 vkmka gWpisywanie,
Gui, add, button, default w100 h20 gEnter, Ok
Gui, add, edit, w200 h150 vlogar ReadOnly,
Gui, add, text, , Banki?
Gui, add, checkbox, vbanki gbanki
if (A_ScreenWidth = 1600 and A_ScreenHeight = 1200)
{
	Gui, show, x1150 y130 h270 w300, Szczwana Spinka
}
else
{
	Gui, show, x830 y20 h270 w300, Szczwana Spinka
}
;Labelki
;-----------------------------------------------

nr:=1

banki:
Gui, submit, nohide
return

Wpisywanie:
Gui, submit, nohide
return


Enter:
ifwinexist Sprytny Spinacz
{
winactivate, Sprytny Spinacz
winwaitactive, Sprytny Spinacz
if (A_ScreenWidth = 1600 and A_ScreenHeight = 1200)
{
	x:=1220
	y:=242
}
else
{
x := A_ScreenWidth * 0.6765625
y := A_ScreenHeight * 0.234375 
}
mousemove, %x%, %y%, 0
;mousemove, 866, 240, 0
send, {lbutton}^a{bs}%kmka%{enter}

return
}
else
{
msgbox, Włącz Spinacza!
return
}
return

;Grupa
;------------------------------------
GroupAdd, niezaw, Adresaci pisma
GroupAdd, niezaw, Repertorium ogólne
GroupAdd, niezaw, Lista czynności w sprawie


;Skróty
;-------------------------------------

#IfWinActive, Skanowanie
Esc::
WinClose, Skanowanie
return
#IfWinActive

#ifwinactive, Sprytny Spinacz
bs::
if (A_ScreenWidth = 1600 and A_ScreenHeight = 1200)
{
	x:=1220
	y:=242
}
else
{
x := A_ScreenWidth * 0.6765625
y := A_ScreenHeight * 0.234375
}
mousemove, %x%, %y%, 0
sleep, 100
send, {lbutton}^a^x
sleep, 100
winactivate, Szczwana Spinka
send, ^a{bs}^v
return

numpadenter::
Log = %log%%nr%.) %kmka%`n
nr+=1 
GuiControl,, logar, %log%
if (A_ScreenWidth = 1600 and A_ScreenHeight = 1200)
{
	x:=1369
	y:=1144
}
else
{
x := A_ScreenWidth * 0.78828125
y := A_ScreenHeight * 0.943359375
}
mousemove, %x%, %y%, 0
;mousemove, 1009, 966, 0
send, {lbutton}
winactivate, Szczwana Spinka
send, ^a{bs}
ControlFocus, Edit2, Szczwana Spinka
send, ^{end}
ControlFocus, Edit1, Szczwana Spinka
return
#ifwinactive

guiclose:
exitapp
return

#IfWinActive, Sprytny Spinacz

numpad1::
	WinActivate, Szczwana Spinka
	send, 1
return



Numpad2::
	WinActivate, Szczwana Spinka
	WinWaitActive, Szczwana Spinka
	send, 2
return



Numpad3::
	WinActivate, Szczwana Spinka
	WinWaitActive, Szczwana Spinka
	send, 3
return



Numpad4::
	WinActivate, Szczwana Spinka
	WinWaitActive, Szczwana Spinka
	send, 4
return



Numpad5::
	WinActivate, Szczwana Spinka
	WinWaitActive, Szczwana Spinka
	send, 5
return



Numpad6::
	WinActivate, Szczwana Spinka
	WinWaitActive, Szczwana Spinka
	send, 6
return



Numpad7::
	WinActivate, Szczwana Spinka
	WinWaitActive, Szczwana Spinka
	send, 7
return



Numpad8::
	WinActivate, Szczwana Spinka
	WinWaitActive, Szczwana Spinka
	send, 8
return



Numpad9::
	WinActivate, Szczwana Spinka
	WinWaitActive, Szczwana Spinka
	send, 9
return



Numpad0::
	WinActivate, Szczwana Spinka
	send, 0
return



#IfWinActive

#Ifwinactive Wybór pracownika
NumpadEnter::
	send, Mościbrodzki
	;MsgBox %A_ScreenWidth% %A_ScreenHeight%
	if (A_ScreenWidth = 1600 and A_ScreenHeight = 1200)
	{
		x :=126
		y :=126
	}
	else
{	
	x := A_ScreenWidth * 0.15703125
	y := A_ScreenHeight * 0.1240234375
}
	mousemove, %x%, %y%, 0
	;mousemove, 201, 127
	sleep, 250
	send, {lbutton}
	if (A_ScreenWidth = 1600 and A_ScreenHeight = 1200)
	{
		x:=119
		y:=353
	}
else
{	
	x := A_ScreenWidth * 0.096875
	y := A_ScreenHeight * 0.369140625
}
	mousemove, %x%, %y%, 0
	;mousemove, 124, 378
	sleep, 250
	send, {LButton}
return
#IfWinActive


;Blok powiadomień Spinacza
;---------------------------------------------------------------------------------------------

close:
IfWinExist, Wyszukiwanie spraw po danych adresowych
{
winclose, Wyszukiwanie spraw po danych adresowych
sleep, 100
WinClose, Informacja
send, +{tab}
return
}
else
{
Ifwinexist, UWAGA
{
winclose, UWAGA
send, +{tab}
return
}
else
{
IfWinExist, Uwaga
{
	winactivate, Uwaga
	ControlClick, Button2, Uwaga
	;x := A_ScreenWidth * 0.22890625
	;y := A_ScreenHeight * 0.1318359375
	;MouseClick, l, %x%, %y%,1,0
	;MouseClick, l, 293, 135,1,0
	sleep, 100
	winactivate, Lista błędów
	winclose, Lista błędów
	winclose, Informacja
	send, +{tab}
return
}
else
{
	IfWinExist, Informacja
	{
		winclose, Informacja
		send, +{tab}
		return
	}
	else
	{
		return
	}
}
}
}
ifwinexist, Informacja
{
	winclose, Informacja
}
return 

#IfWinActive, Zapraszamy
numpadenter::
	WinActivate, Zapraszamy
	WinWaitActive, Zapraszamy
	send, kJap9iof4rhu{enter}
	WinWaitActive, Komornik SQL-VAT
	send {enter}
	WinWaitActive, Repertorium ogólne
	send, {f3}
return
#IfWinActive

#IfWinNotActive Repertorium Ogólne
esc::
	SetTitleMatchMode, 2
	ifwinactive, Adobe Reader
	{
		winclose, Adobe Reader
		return
	}
	else
	{
		send, {esc}
		return
	}
return
#IfWinNotActive



NumpadAdd::
return


NumpadIns::
send, 0
return

NumpadDel::
send, {,}
return

NumpadEnd::
Send, 1
return

NumpadDown::
send, 2
return

NumpadPgdn::
send, 3
return

NumpadLeft::
send, 4
return

NumpadClear::
send, 5
return

NumpadRight::
send, 6
return

NumpadHome::
send, 7
return

NumpadUp::
send, 8
return

NumpadPgup::
Send, 9
return

NumpadSub::
	IfWinActive, Szczwana Spinka
	{
		winactivate, Repertorium ogólne
		sleep,100
		ifwinexist, Lista czynności w sprawie
			winclose, Lista czynności w sprawie
		sleep,10
		ifwinexist, Skorowidz uczestników
			WinClose, Skorowidz uczestników
		sleep,10
		ifwinactive, Repertorium ogólne, Lista czynności w sprawie
			send, {esc}
	
		ifwinactive, Repertorium ogólne, Sprawa egzekucyjna
			send, {esc}
		sleep, 400
		ifwinactive, Repertorium ogólne, Lista czynności w sprawie
			send, {esc}
	
		ifwinactive, Repertorium ogólne, Sprawa egzekucyjna
			send, {esc}
		
		ifwinnotactive, Repertorium ogólne, Skorowidz uczestników
		{
			send, {f5}
			sleep, 300
			ControlClick, Edit4, Repertorium ogólne, Skorowidz uczestników
			;x := A_ScreenWidth * 0.45
			;y := A_ScreenHeight * 0.134765625
			;MouseClick,l,%x%,%y%,1,0
			;MouseClick,l,576,138,1,0
			send,^a
		}

		ifwinactive, Repertorium ogólne, Skorowidz uczestników
		{
			ControlFocus, Edit4, Repertorium ogólne, Skorowidz uczestników
			;x := A_ScreenWidth * 0.45
			;y := A_ScreenHeight * 0.134765625
			;MouseClick,l,%x%,%y%,1,0
			;MouseClick,l,576,138,1,0
			send,^a
		}
		
	}
	else
	{
		WinActivate, Szczwana Spinka
	}
return

#IfWinActive, Szczwana Spinka

Down::
	WinActivate, Sprytny Spinacz
	Mousemove, 1593, 147
	Sleep, 100
	send, {LButton}
	MouseMove, 1531, 114
	sleep, 100
	send, {lbutton}
	WinActivate, Szczwana Spinka
	ControlFocus, Edit1
return

up::
	WinActivate, Sprytny Spinacz
	Mousemove, 1593, 85
	Sleep, 100
	send, {LButton}
	MouseMove, 1531, 114
	sleep, 100
	send, {lbutton}
	WinActivate, Szczwana Spinka
	ControlFocus, Edit1
return

NumpadMult::

return
#IfWinActive

#IfWinActive Szczwana Spinka
F4::
	Clipboard =
	send, ^c
	ClipWait, 2
	IfInString, Clipboard, /15
	{
		winactivate, Repertorium ogólne
		IfWinActive, Repertorium ogólne, Lista czynności w sprawie
		{
			send, +{tab}+{tab}+{tab}{tab}^v{enter}
		}
		else
		{
			Ifwinactive, Repertorium ogólne, Skorowidz uczestników
			{
				
				IfWinExist, Lista czynności w sprawie Km
				{
					winclose, Lista czynności w sprawie Km
					winwaitactive, Repertorium ogólne, , 3
					IfWinActive, Repertorium ogólne, Skorowidz uczestników
					{
						send, {esc}{f4}{tab}{tab}^v{enter}
					}
					else
					{
						send, {f4}{tab}{tab}^v{enter}
					}
				}
				else
				{
					send, {Esc}{f4}{tab}{tab}^v{enter}
				}
			}
			else
			{
				IfWinExist, Lista czynności w sprawie Km
				{
					winclose, Lista czynności w sprawie Km
					winwaitactive, Repertorium ogólne, , 3
					IfWinActive, Repertorium ogólne, Skorowidz uczestników
					{
						send, {esc}{f4}{tab}{tab}^v{enter}
					}
					else
					{
						send, {f4}{tab}{tab}^v{enter}
					}
				}
				else
				{
					send, {f4}{tab}{tab}^v{enter}
				}
			}
		}
	}
	IfInString, Clipboard, /18
	{
		winactivate, Repertorium ogólne
		IfWinActive, Repertorium ogólne, Lista czynności w sprawie
		{
			send, +{tab}+{tab}+{tab}{tab}^v{enter}
		}
		else
		{
			Ifwinactive, Repertorium ogólne, Skorowidz uczestników
			{
				IfWinExist, Lista czynności w sprawie Km
				{
					winclose, Lista czynności w sprawie Km
					winwaitactive, Repertorium ogólne, , 3
					IfWinActive, Repertorium ogólne, Skorowidz uczestników
					{
						send, {esc}{f4}{tab}{tab}^v{enter}
					}
					else
					{
						send, {f4}{tab}{tab}^v{enter}
					}
				}
				else
				{
					send, {Esc}{f4}{tab}{tab}^v{enter}
				}
			}
			else
			{
				IfWinExist, Lista czynności w sprawie Km
				{
					winclose, Lista czynności w sprawie Km
					winwaitactive, Repertorium ogólne, , 3
					IfWinActive, Repertorium ogólne, Skorowidz uczestników
					{
						send, {esc}{f4}{tab}{tab}^v{enter}
					}
					else
					{
						send, {f4}{tab}{tab}^v{enter}
					}
				}
				else
				{
					send, {f4}{tab}{tab}^v{enter}
				}
			}
		}
	}
	IfInString, Clipboard, /16
	{
		winactivate, Repertorium ogólne
		IfWinActive, Repertorium ogólne, Lista czynności w sprawie
		{
			send, +{tab}+{tab}+{tab}{tab}^v{enter}
		}
		else
		{
			Ifwinactive, Repertorium ogólne, Skorowidz uczestników
			{
				IfWinExist, Lista czynności w sprawie Km
				{
					winclose, Lista czynności w sprawie Km
					winwaitactive, Repertorium ogólne, , 3
					IfWinActive, Repertorium ogólne, Skorowidz uczestników
					{
						send, {esc}{f4}{tab}{tab}^v{enter}
					}
					else
					{
						send, {f4}{tab}{tab}^v{enter}
					}
				}
				else
				{
					send, {Esc}{f4}{tab}{tab}^v{enter}
				}
			}
			else
			{
				IfWinExist, Lista czynności w sprawie Km
				{
					winclose, Lista czynności w sprawie Km
					winwaitactive, Repertorium ogólne, , 3
					IfWinActive, Repertorium ogólne, Skorowidz uczestników
					{
						send, {esc}{f4}{tab}{tab}^v{enter}
					}
					else
					{
						send, {f4}{tab}{tab}^v{enter}
					}
				}
				else
				{
					send, {f4}{tab}{tab}^v{enter}
				}
			}
		}
	}
	IfInString, Clipboard, /17
	{
		winactivate, Repertorium ogólne
		IfWinActive, Repertorium ogólne, Lista czynności w sprawie
		{
			send, +{tab}+{tab}+{tab}{tab}^v{enter}
		}
		else
		{
			Ifwinactive, Repertorium ogólne, Skorowidz uczestników
			{
				IfWinExist, Lista czynności w sprawie Km
				{
					winclose, Lista czynności w sprawie Km
					winwaitactive, Repertorium ogólne, , 3
					IfWinActive, Repertorium ogólne, Skorowidz uczestników
					{
						send, {esc}{f4}{tab}{tab}^v{enter}
					}
					else
					{
						send, {f4}{tab}{tab}^v{enter}
					}
				}
				else
				{
					send, {Esc}{f4}{tab}{tab}^v{enter}
				}
			}
			else
			{
				IfWinExist, Lista czynności w sprawie Km
				{
					winclose, Lista czynności w sprawie Km
					winwaitactive, Repertorium ogólne, , 3
					IfWinActive, Repertorium ogólne, Skorowidz uczestników
					{
						send, {esc}{f4}{tab}{tab}^v{enter}
					}
					else
					{
						send, {f4}{tab}{tab}^v{enter}
					}
				}
				else
				{
					send, {f4}{tab}{tab}^v{enter}
				}
			}
		}
	}
	IfInString, Clipboard, /14
	{
		winactivate, Repertorium ogólne
		IfWinActive, Repertorium ogólne, Lista czynności w sprawie
		{
			send, +{tab}+{tab}+{tab}{tab}^v{enter}
		}
		else
		{
			Ifwinactive, Repertorium ogólne, Skorowidz uczestników
			{
				IfWinExist, Lista czynności w sprawie Km
				{
					winclose, Lista czynności w sprawie Km
					winwaitactive, Repertorium ogólne, , 3
					IfWinActive, Repertorium ogólne, Skorowidz uczestników
					{
						send, {esc}{f4}{tab}{tab}^v{enter}
					}
					else
					{
						send, {f4}{tab}{tab}^v{enter}
					}
				}
				else
				{
					send, {Esc}{f4}{tab}{tab}^v{enter}
				}
			}
			else
			{
				IfWinExist, Lista czynności w sprawie Km
				{
					winclose, Lista czynności w sprawie Km
					winwaitactive, Repertorium ogólne, , 3
					IfWinActive, Repertorium ogólne, Skorowidz uczestników
					{
						send, {esc}{f4}{tab}{tab}^v{enter}
					}
					else
					{
						send, {f4}{tab}{tab}^v{enter}
					}
				}
				else
				{
					send, {f4}{tab}{tab}^v{enter}
				}
			}
		}
	}
	IfInString, Clipboard, /13
	{
		winactivate, Repertorium ogólne
		IfWinActive, Repertorium ogólne, Lista czynności w sprawie
		{
			send, +{tab}+{tab}+{tab}{tab}^v{enter}
		}
		else
		{
			Ifwinactive, Repertorium ogólne, Skorowidz uczestników
			{
				IfWinExist, Lista czynności w sprawie Km
				{
					winclose, Lista czynności w sprawie Km
					winwaitactive, Repertorium ogólne, , 3
					IfWinActive, Repertorium ogólne, Skorowidz uczestników
					{
						send, {esc}{f4}{tab}{tab}^v{enter}
					}
					else
					{
						send, {f4}{tab}{tab}^v{enter}
					}
				}
				else
				{
					send, {Esc}{f4}{tab}{tab}^v{enter}
				}
			}
			else
			{
				IfWinExist, Lista czynności w sprawie Km
				{
					winclose, Lista czynności w sprawie Km
					winwaitactive, Repertorium ogólne, , 3
					IfWinActive, Repertorium ogólne, Skorowidz uczestników
					{
						send, {esc}{f4}{tab}{tab}^v{enter}
					}
					else
					{
						send, {f4}{tab}{tab}^v{enter}
					}
				}
				else
				{
					send, {f4}{tab}{tab}^v{enter}
				}
			}
		}
	}
	IfInString, Clipboard, /12
	{
		winactivate, Repertorium ogólne
		IfWinActive, Repertorium ogólne, Lista czynności w sprawie
		{
			send, +{tab}+{tab}+{tab}{tab}^v{enter}
		}
		else
		{
			Ifwinactive, Repertorium ogólne, Skorowidz uczestników
			{
				IfWinExist, Lista czynności w sprawie Km
				{
					winclose, Lista czynności w sprawie Km
					winwaitactive, Repertorium ogólne, , 3
					IfWinActive, Repertorium ogólne, Skorowidz uczestników
					{
						send, {esc}{f4}{tab}{tab}^v{enter}
					}
					else
					{
						send, {f4}{tab}{tab}^v{enter}
					}
				}
				else
				{
					send, {Esc}{f4}{tab}{tab}^v{enter}
				}
			}
			else
			{
				IfWinExist, Lista czynności w sprawie Km
				{
					winclose, Lista czynności w sprawie Km
					winwaitactive, Repertorium ogólne, , 3
					IfWinActive, Repertorium ogólne, Skorowidz uczestników
					{
						send, {esc}{f4}{tab}{tab}^v{enter}
					}
					else
					{
						send, {f4}{tab}{tab}^v{enter}
					}
				}
				else
				{
					send, {f4}{tab}{tab}^v{enter}
				}
			}
		}
	}
	IfInString, Clipboard, /11
	{
		winactivate, Repertorium ogólne
		IfWinActive, Repertorium ogólne, Lista czynności w sprawie
		{
			send, +{tab}+{tab}+{tab}{tab}^v{enter}
		}
		else
		{
			Ifwinactive, Repertorium ogólne, Skorowidz uczestników
			{
				IfWinExist, Lista czynności w sprawie Km
				{
					winclose, Lista czynności w sprawie Km
					winwaitactive, Repertorium ogólne, , 3
					IfWinActive, Repertorium ogólne, Skorowidz uczestników
					{
						send, {esc}{f4}{tab}{tab}^v{enter}
					}
					else
					{
						send, {f4}{tab}{tab}^v{enter}
					}
				}
				else
				{
					send, {Esc}{f4}{tab}{tab}^v{enter}
				}
			}
			else
			{
				IfWinExist, Lista czynności w sprawie Km
				{
					winclose, Lista czynności w sprawie Km
					winwaitactive, Repertorium ogólne, , 3
					IfWinActive, Repertorium ogólne, Skorowidz uczestników
					{
						send, {esc}{f4}{tab}{tab}^v{enter}
					}
					else
					{
						send, {f4}{tab}{tab}^v{enter}
					}
				}
				else
				{
					send, {f4}{tab}{tab}^v{enter}
				}				
			}
		}
	}
	return
#IfWinActive

;f5::
;	msgbox, %A_ScreenHeight% x %A_ScreenWidth%
;return

#ifwinactive Szczwana Spinka
PGDN::
		WinActivate, Sprytny Spinacz
		MouseClick, l, 1538,142
		WinActivate, Szczwana Spinka
return
#IfWinActive



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


#ifwinactive Repertorium ogólne, Skorowidz uczestników
lButton::
If (A_PriorHotKey = A_ThisHotKey and A_TimeSincePriorHotkey < 300)
{
MouseGetPos, , , ,skorowidz,1
if (skorowidz="PBTreeView32_1001")
{
	send, {rbutton}{down}{down}{enter}
	winactivate, Lista czynności w sprawie Km
	if (banki = 1)
	{
	send, {tab}{tab}{tab}{tab}{tab}{tab}bank{enter}
	}
	else
	{
		return
	}
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

#IfWinActive