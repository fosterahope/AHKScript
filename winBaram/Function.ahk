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
	SetTimer, 공력증강, 1000
	
	return
}

MainLoop()
{	
	Loop
	{
		if(g_bMacroStart == false)
			continue
		
		GuiControlGet, chkTmp, ,C성역주
		GuiControlGet, editTmp, , E성역주
		if(chkTmp == 0)
			continue
		
		MsgBox, MainLoop
		Sleep, 1000
	}
	return
}

공력증강()
{
	if(g_bMacroStart == false)
		return
			
	GuiControlGet, chkTmp, ,C공력증강
	GuiControlGet, editTmp, , E공력증강
	if(chkTmp == 0) ; 비활성화
		return	
	
	Sleep, 1500
	
	; PostMessage,, WM_KEYDOWN, GetKeyVK(editTmp), GetKeyInfo(editTmp), , 바람의나라
	
	return
}