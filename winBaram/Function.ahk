#include Define.ahk
#include InitGlobal.ahk

;=========================================================================
; @brief	Main Loop Init
;
; @return	void
;=========================================================================
RunInit()
{
	SetTimer, MainLoop, -1
	SetTimer, ��������, 1000
	
	return
}

MainLoop()
{	
	Loop
	{
		if(g_bMacroStart == false)
			continue
		
		GuiControlGet, chkTmp, ,C������
		GuiControlGet, editTmp, , E������
		if(chkTmp == 0)
			continue
		
		MsgBox, MainLoop
		Sleep, 1000
	}
	return
}

��������()
{
	if(g_bMacroStart == false)
		return
			
	GuiControlGet, chkTmp, ,C��������
	GuiControlGet, editTmp, , E��������
	if(chkTmp == 0) ; ��Ȱ��ȭ
		return	
	
	Sleep, 1500
	
	; PostMessage,, WM_KEYDOWN, GetKeyVK(editTmp), GetKeyInfo(editTmp), , �ٶ��ǳ���
	
	return
}