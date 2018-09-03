#include InitGlobal.ahk

;=========================================================================
; @brief	UI�� �����Ѵ�.
;
; @return	void
;=========================================================================
UpdateUi()
{
	if(g_bMacroStart == true)
	{
		SB_SetText("��ũ�� ���� ��", 1)
		GuiControl, Text, BtnChange, ����
	}
	else
	{
		SB_SetText("�����", 1)
		GuiControl, Text, BtnChange, ����
	}
	
	return
}

;=========================================================================
; @brief	���� �Ǵ� ���� ��ư �̺�Ʈ ������ �����Ѵ�.
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