#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance, force
zed := 1
iks := 1
ce := 1
fał := 1
;#IfWinActive ahk_exe Explorer.EXE
#ifwinactive ahk_exe AcroRd32.exe
z::
winclose, A
SetTitleMatchMode, 2
WinWaitNotActive, Adobre Reader

if (zed < 10)
	{
		pelnomocnik="pelnomocnik_0"%zed% ".pdf"
	}
else
	{
		pelnomocnik="pelnomocnik_"%zed% ".pdf"
	}
send, {alt Down}p
sleep 100
send, {alt up}c
WinWaitActive, Właściwości
ControlFocus, Edit1, Właściwości
send, %pelnomocnik%
send, {enter}
WinWaitNotActive, Właściwości
send, {Down}{enter}
zed := zed + 1
return

o::
msgbox, %zed%
return


x::
winclose, A
SetTitleMatchMode, 2
WinWaitNotActive, Adobre Reader
if (iks < 10)
	{
		umorzenie="wniosek o umorzenie_0"%iks% ".pdf"
	}
else
	{
		umorzenie="wniosek o umorzenie_"%iks% ".pdf"
	}
send, {alt Down}p
sleep 100
send, {alt up}c
WinWaitActive, Właściwości
ControlFocus, Edit1, Właściwości
send, %umorzenie%
send, {enter}
WinWaitNotActive, Właściwości
send, {Down}{enter}
iks := iks + 1
return

c::
winclose, A
SetTitleMatchMode, 2
WinWaitNotActive, Adobre Reader
if (ce < 10)
	{
		wierzyciel="wierzyciel_0"%ce% ".pdf"
	}
else
	{
		wierzyciel="wierzyciel_"%ce% ".pdf"
	}
send, {alt Down}p
sleep 100
send, {alt up}c
WinWaitActive, Właściwości
ControlFocus, Edit1, Właściwości
send, %wierzyciel%
send, {enter}
WinWaitNotActive, Właściwości
send, {Down}{enter}
ce := ce + 1
return

v::
winclose, A
SetTitleMatchMode, 2
WinWaitNotActive, Adobre Reader
if (fał < 10)
	{
		zawieszenie="zawieszenie_0"%fał% ".pdf"
	}
else
	{
		zawieszenie="zawieszenie_"%fał% ".pdf"
	}
send, {alt Down}p
sleep 100
send, {alt up}c
WinWaitActive, Właściwości
ControlFocus, Edit1, Właściwości
send, %zawieszenie%
send, {enter}
WinWaitNotActive, Właściwości
send, {Down}{enter}
fał := fał + 1
return

#IfWinActive

