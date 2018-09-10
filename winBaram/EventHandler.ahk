#include InitGlobal.ahk

;=========================================================================
; @brief	시작 또는 중지 버튼 이벤트 동작을 수행한다.
;
; @return	void
;=========================================================================
OnButtonStatusChange()
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