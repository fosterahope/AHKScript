#include %A_ScriptDir%
#include Define.ahk			; Window 정의 값
#include InitGlobal.ahk		; Global 변수를 초기화한다.
#include EventHandler.ahk	; UI 이벤트 핸들러
#include Function.ahk		; Main Thread

#SingleInstance force	; 중복실행 방지
; #NoTrayIcon				; 트레이 아이콘 없음
;==============================
;UI Init - Start
;==============================
InitUI:
{
	nWidthPosExit  		:= g_nFrameWidth -90
	nWidthPosChange		:= nWidthPosExit - 100
	nHeightPos 			:= g_nFrameHeight - 50

	; Status Bar Create
	Gui, Add, StatusBar,, Program Start
	SB_SetParts(150)
	
	; Ui Show
	Gui, show, w%g_nFrameWidth% h%g_nFrameHeight%, %g_ProgramName%
	
	Gui, Add, Button, x10 y10 w80, 시작(&s)
	Gui, Add, Button, x100 y10 w80, 종료(&q)
	
	; 버튼 초기화
	vBtnChange := mainDlg.Add("Button", "x10 y10 w80", "시작(&s)")
	vBtnChange.OnEvent("Click", "OnButtonStatusChange")
	vBtnExit := mainDlg.Add("Button", "x100 y10 w80", "종료(&q)")
	vBtnExit.OnEvent("Click", "OnButtonExit")
		
		
		
	UpdateUi()	; 최초 UI 초기화
}

Action:
{
	RunInit()
	return	
}

return
