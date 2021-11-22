#include %A_ScriptDir%
#include InitGlobal.ahk		; Global 변수를 초기화한다.
#include Function.ahk		; Main Thread

#SingleInstance force	; 중복실행 방지
; #NoTrayIcon				; 트레이 아이콘 없음
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
	Gui, Add, Button, x10 y10 w80 vButtonStatus gOnButtonStatus, 시작(&s)
	Gui, Add, Button, x110 y10 w80 gOnButtonQuit, 종료(&q)
	
	Gui +Resize -MinimizeBox
	Gui +Resize -MaximizeBox
	
	UpdateUi()	; 최초 UI 초기화
}

Action:
{
	RunInit()
	return	
}

; 오동작 수행 방지
return

gOnButtonStatus:
OnButtonStatus()
return

F4::
OnButtonQuit:
OnButtonQuit()
return
