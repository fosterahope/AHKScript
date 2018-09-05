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
	SetTimer, ��������, 1000		; 1�ʸ��� ���������� �����Ѵ�.

	; Example
	; MsgBox, % Format("Origin :`{}`, LPARAM `{:X}`, VK`{:X}`", editTmp, GetKeyInfo(editTmp), GetKeyVK(editTmp))
	
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
			
	GuiControlGet, chkVal, ,C��������
	GuiControlGet, editVal, , E��������
	if(chkVal == 0) ; ��Ȱ��ȭ
		return	

	PostMessage, WM_KEYDOWN, GetKeyVK(editVal), GetKeyInfo(editVal), , ���� ���� - �޸��� ; �ٶ��ǳ���
	;PostMessage, WM_KEYUP, GetKeyVK(editVal), GetKeyInfo(editVal), , �ٶ��ǳ���
	
	return
}