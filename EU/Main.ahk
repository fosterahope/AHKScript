#include %A_ScriptDir%
#include InitGlobal.ahk		; Global ������ �ʱ�ȭ�Ѵ�.
#include Function.ahk		; Main Thread

#SingleInstance force	; �ߺ����� ����
; #NoTrayIcon				; Ʈ���� ������ ����
;==============================
;UI Init - Start
;==============================
InitUI:
{
	; Status Bar Create
	Gui, Add, StatusBar,, Program Start
	SB_SetParts(150)
	
	; Ui Show
	Gui, show, w%g_nFrameWidth% h%g_nFrameHeight%, %g_ProgramName%
	Gui, Add, Button, x10 y10 w80 vButtonStatus gOnButtonStatus, ����(&s)
	Gui, Add, Button, x110 y10 w80 gOnButtonQuit, ����(&q)
	
	Gui +Resize -MinimizeBox
	Gui +Resize -MaximizeBox
	
	UpdateUi()	; ���� UI �ʱ�ȭ
}

Action:
{
	RunInit()
	return	
}

; ������ ���� ����
return

gOnButtonStatus:
OnButtonStatus()
return

F4::
OnButtonQuit:
OnButtonQuit()
return
