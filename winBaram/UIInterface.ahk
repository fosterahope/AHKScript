; ==============================
; Variable Init
; ==============================
global g_ProgramName := "핫키 - cyh 테스트 UI"
global g_MacroStart := false

; ==============================
; UI Init - Start
; ==============================
InitUI:
{
	Gui, Add, StatusBar, ,					; 매크로 동작 상태바
	Gui, Add, Button, default, 시작			; 시작 버튼
	Gui, Add, Button, default, 중지			; 중지 버튼
	Gui, Add, Button, default, 종료			; 종료 버튼

	; 상태 바 초기화
	SB_SetParts(50)							; 매크로 시작 상태 / 기타

	; UI Show
	Gui, Show, Center w300 h500, %g_ProgramName%
	UpdateUi()	; 최초 UI 초기화
	
	return
}

Button시작:
{
	g_MacroStart := true
	UpdateUI()
	return
}

Button중지:
{
	g_MacroStart := false
	UpdateUI()
	return
}

Button종료:
{
	g_MacroStart := false
	UpdateUI()
	ExitApp
	return
}