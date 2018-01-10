#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance, force

#IfWinActive, Lista spraw
yPozycja := 82

down::
	ImageSearch, xPozycja, yPozycja, 9, %yPozycja%, 1590, 1053, czynna.bmp
	;ImageSearch, xZajecia, yZajecia, 9, %yPozycja%, 1590, 1053, zajecia.bmp
	MouseMove, %xPozycja%, %yPozycja%
	yPozycja += 1
	if (yPozycja = "")
	{
		yPozycja := 82
	}
return

#IfWinActive