#include %A_ScriptDir%
#include Define.ahk				; Window 정의 값
#include InitGlobal.ahk			; Global 변수를 초기화한다.
#include EventHandler.ahk		; UI 이벤트 핸들러
#include Function.ahk			; Main Thread
;==============================
;UI Init - Start
;==============================
InitUI:
{
	nWidthPosExit  		:= g_nFrameWidth -90
	nWidthPosChange		:= nWidthPosExit - 100
	nHeightPos 			:= g_nFrameHeight - 50

	; Title 초기화
	; 꾸미는 건 나중에
	
	
	; 상태 바 초기화
	Gui, Add, StatusBar, ,	
	SB_SetParts(300 / 2)
	
	; 버튼 초기화
	Gui, Add, Button, x%nWidthPosChange% y%nHeightPos% w80 h22 gOnButtonStartPause vBtnChange, 시작
	Gui, Add, Button, x%nWidthPosExit% y%nHeightPos% w80 h22 gOnButtonExit vBtnExit, 종료
	
	; Check, Edit Box 초기화
	Gui, Add, Edit, x10 y10 w30 h20 +Center vE성역주, 1
	Gui, Add, Checkbox, x45 y10 w100 h20 vC성역주, 성역주
	
	Gui, Add, Edit, x10 y40 w30 h20 +Center vE공력증강, 2
	Gui, Add, Checkbox, x45 y40 w100 h20 vC공력증강, 공력증강
	
	;Gui, Add, Checkbox, x10 y10 w80 h20 vChk gChk, 헬파이어
	;Gui, Add, Checkbox, x10 y10 w80 h20 vChk gChk, 삼매진화
	;Gui, Add, Checkbox, x10 y10 w80 h20 vChk gChk, 혼마술첨
	;Gui, Add, Checkbox, x10 y10 w80 h20 vChk gChk, 십자소상파환겁
	;Gui, Add, Checkbox, x10 y10 w80 h20 vChk gChk, 명상
	;Gui, Add, Checkbox, x10 y10 w80 h20 vChk gChk, 혼마술

	; UI Show
	Gui, Show, Center w%g_nFrameWidth% h%g_nFrameHeight%, %g_ProgramName%
	UpdateUi()	; 최초 UI 초기화
}

Action:
{
	RunInit()
	return	
}

return
