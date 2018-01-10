#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
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
sleep, 7000

;Tutaj wkleić skrypt

send, {enter}
winactivate, Repertorium ogólne
winwaitactive, Repertorium ogólne
}

loop, 500
{
mousemove, 571, 959
send, {rbutton}{down}{down}{down}{down}{enter}
winactivate, Sprawa egzekucyjna
winwaitactive, Sprawa egzekucyjna
sleep, 7000

;Tutaj wkleić skrypt

send, {enter}
winactivate, Repertorium ogólne
winwaitactive, Repertorium ogólne
}
return