#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#singleinstance, force

;gui
;-------------------------------------

	IniRead, data1, automat.ini, Automat, data
	IniRead, pelno1, automat.ini, Automat, pelnomocnik
	gui, add, text, , Wprowadź znak pełnomocnika:
	gui, add, edit, w200 vznak gznak, 
	gui, add, button, h20 w200 default gWprowad, Wprowadź
	gui, add, button, h20 w200 gPomin, Pomiń
	gui, add, text, , Data:
	gui, add, edit, w200 vdata gdata, %data1%
	gui, add, text, , Pełnomocnik:
	gui, add, edit, w200 vpelno gpelno, %pelno1%
	gui, add, Checkbox, vturbo gturbo, Turbo?
	gui, show, w250 h250, Automat
	winactivate, Automat
	winwaitactive, Automat
	mousemove, 197, 158
	send, {lbutton} {bs}
	mousemove, 197, 204
	send, {lbutton} {bs}
	
;hotkeys
;---------------------------------------
#ifwinactive Repertorium ogólne
f1::
x:=487
y:=176
mousemove, %x%, %y%
loop, 31
{
y:=y+25
mousemove, %x%, %y%, 0,
send, {rbutton}{down}{down}{down}{down}{enter}
winactivate, Sprawa egzekucyjna
winwaitactive, Sprawa egzekucyjna
MouseClick, l, 1021,561
MouseClick, l, 299,231
;turbo
;-----------------------------------------
if turbo = 1
{
send, {tab}m
WinWaitActive, Wierzyciel
send, {f4}m
winwaitactive, Pełnomocnik
MouseClick, l, 305, 529
MouseClickDrag, l, 305, 529, 212, 523
send, ^c
send, {esc}{esc}+{tab}
}
;-----------------------------------------------
winactivate, Automat
winwaitactive, Automat
mousemove, 80, 60
send, {lbutton}^a{bs}
if turbo = 1 
{
send, ^v^a
}
;---------Tutaj Skrypt Wprowadzający------------


winwaitactive, Repertorium ogólne
}

loop, 500
{
	MouseClick, l, 1266, 963
mousemove, 571, 959
send, {rbutton}{down}{down}{down}{down}{enter}
winactivate, Sprawa egzekucyjna
winwaitactive, Sprawa egzekucyjna
MouseClick, l, 1021,561
MouseClick, l, 299,231
;turbo
;-----------------------------------------
if turbo = 1
{
send, {tab}m
WinWaitActive, Wierzyciel
send, {f4}m
winwaitactive, Pełnomocnik
MouseClick, l, 305, 529
MouseClickDrag, l, 305, 529, 212, 523
send, ^c
send, {esc}{esc}+{tab}
}
;-----------------------------------------------
winactivate, Automat
winwaitactive, Automat
mousemove, 80, 60
send, {lbutton}^a{bs}
if turbo = 1
{
send, ^v^a
}
;----------Tutaj Skrypt Wprowadzający----------

winwaitactive, Repertorium ogólne
}
return
#ifwinactive

f2::
msgbox, %znak%
return

;labelki
;---------------------------------------------------------

znak:
	gui, submit, nohide
return

Wprowad:
	winactivate, Sprawa egzekucyjna
	winwaitactive, Sprawa egzekucyjna
	MouseClick, l, 330,227
	send, {tab}m
	sleep, 250
	winactivate, Wierzyciel
	winwaitactive, Wierzyciel
	send, {f4}m{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}%data%{tab}{shift down}{right}{right}{right}{right}{right}{right}{right}{shift up}^c{enter}
	;IniWrite, Q, C:\Currenda\ini\Komornik.ini, Komornik, Litera
	send, d
	winwaitactive, Wybór pełnomocnika
	control, Choose, 2, ComboBox4
	MouseClick, l, 552, 66
	send, %pelno%{enter}{enter}
	winactivate, Pełnomocnik
	winwaitactive, Pełnomocnik
	send, {tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}%data%{tab}{tab}{tab}{down}{down}{down}+{tab}%znak%{shift down}{left}{left}{left}{left}{left}{left}{left}{shift up}
	send, {enter}{enter}{enter}

return

Pomin:
	winactivate, Sprawa egzekucyjna
	winwaitactive, Sprawa egzekucyjna
	send, {enter}
return

data:
	gui, submit, nohide
return

pelno:
	gui, submit, nohide
return

turbo:
	gui, submit, nohide
return

guiclose:
	iniwrite, %data%, automat.ini, Automat, data
	iniwrite, %pelno%, automat.ini, Automat, pelnomocnik
	exitapp
return

#IfWinActive, Sprawa egzekucyjna
NumpadAdd::
	WinActivate, Automat
	send, {Enter}
return
#IfWinActive