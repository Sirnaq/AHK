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
	gui, add, text, , Data:
	gui, add, edit, w200 vdata gdata, %data1%
	gui, add, text, , Pełnomocnik:
	gui, add, edit, w200 vpelno gpelno, %pelno1%
	gui, show, w250 h200, Automat
	winactivate, Automat
	winwaitactive, Automat
	mousemove, 197, 131
	send, {lbutton} {bs}
	mousemove, 197, 178
	send, {lbutton} {bs}
	mousemove, 197, 60
	send, {lbutton}
;Labelki
;---------------------------------------------------------------------------------------------

znak:
	gui, submit, nohide
return

Wprowad:
ifwinexist, Repertorium ogólne
{
	winactivate, Repertorium ogólne
	send {tab}m
	sleep, 250
	winactivate, Wierzyciel
	winwaitactive Wierzyciel
	send {f4}m{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}%data%{tab}{shift down}{right}{right}{right}{right}{right}{right}{right}{shift up}^c{enter}
	IniWrite, Q, C:\Currenda\ini\Komornik.ini, Komornik, Litera
	send, d{tab}{tab}{tab}%pelno%{enter}{enter}
	winactivate, Pełnomocnik
	winwaitactive, Pełnomocnik
	send, {tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}%data%{tab}{tab}{tab}{down}{down}{down}+{tab}%znak%{shift down}{left}{left}{left}{left}{left}{left}{left}{shift up}
	send, {enter}{enter}f
	return
}
else
{
	return
}

data:
	gui, submit, nohide
return

pelno:
	gui, submit, nohide
return

guiclose:
	iniwrite, %data%, automat.ini, Automat, data
	iniwrite, %pelno%, automat.ini, Automat, pelnomocnik
	exitapp
return




;hotkeys
-----------------------------------------------------------------
#ifwinactive Repertorium ogólne
numpadenter::
	send, {enter}
	winactivate, Automat

#ifwinactive Pełnomocnik - KA GOGACZ FORTUNATO
numpadmult::
send {enter}{up}m{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{shift down}{right}{right}{right}{right}{right}{right}{right}{right}{shift up}
return

#ifwinactive Pełnomocnik - KA MLEKODAJ AGIO
numpadmult::
send {enter}{down}m{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{shift down}{right}{right}{right}{right}{right}{right}{right}{right}{shift up}
return