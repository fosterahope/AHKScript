#include %A_ScriptDir%
#include Define.ahk				; Window 정의 값
#include InitGlobal.ahk			; Global 변수를 초기화한다.
#include EventHandler.ahk		; UI 이벤트 핸들러

;==============================
;UI Init - Start
;==============================
InitUI:
{
	nWidthPosExit  		:= g_nFrameWidth -200
	nWidthPosChange		:= g_nFrameWidth - 100
	nHeightPos 			:= g_nFrameHeight - 50
	
	Gui, Add, StatusBar, ,										; 매크로 동작 상태바
	Gui, Add, Button, x%nWidthPosChange% y%nHeightPos% gOnButtonStartPause, 시작	; 상태 변경 버튼 
	Gui, Add, Button, x%nWidthPosExit% y%nHeightPos% gOnButtonExit, 종료		; 종료 버튼

	; 상태 바 초기화
	SB_SetParts(300 / 2)							; 매크로 시작 상태 / 기타

	; GuiControl, Enable, Btn ; 버튼의 글씨 및 상태 바꾸기

; TEST
	; Gui, Add, Button, gTestBtn, Pause(&p)
	; Gui, Add, Button, x150 ynHeight w50 h20, 시작중지		; 시작/중지 버튼
;

	; UI Show
	Gui, Show, Center w%g_nFrameWidth% h%g_nFrameHeight%, %g_ProgramName%
	UpdateUi()													; 최초 UI 초기화
	
	return
}


return
