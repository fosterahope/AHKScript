#include InitGlobal.ahk

;=========================================================================
; @brief	���� �Ǵ� ���� ��ư �̺�Ʈ ������ �����Ѵ�.
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
; @brief	���� ��ư �̺�Ʈ ������ �����Ѵ�.
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