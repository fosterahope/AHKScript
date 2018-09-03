#include InitGlobal.ahk

;=========================================================================
; @brief	UI를 갱신한다.
;
; @return	void
;=========================================================================
UpdateUi()
{
	if(g_bMacroStart == true)
	{
		SB_SetText("매크로 수행 중", 1)
		GuiControl, Text, BtnChange, 정지
	}
	else
	{
		SB_SetText("대기중", 1)
		GuiControl, Text, BtnChange, 시작
	}
	
	return
}

;=========================================================================
; @brief	시작 또는 중지 버튼 이벤트 동작을 수행한다.
;
; @return	void
;=========================================================================
OnButtonStartPause()
{
	g_bMacroStart := !g_bMacroStart
	
	UpdateUi()
	
	; Macro Function
	
	return 
}

;=========================================================================
; @brief	종료 버튼 이벤트 동작을 수행한다.
;
; @return	void
;=========================================================================
OnButtonExit()
{
	g_MacroStart := false
	UpdateUi()
	ExitApp
	return
}