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
	SetTimer, 공력증강, 1000		; 1초마다 공력증강을 수행한다.

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
			
	GuiControlGet, chkVal, ,C공력증강
	GuiControlGet, editVal, , E공력증강
	if(chkVal == 0) ; 비활성화
		return	

	PostMessage, WM_KEYDOWN, GetKeyVK(editVal), GetKeyInfo(editVal), , 제목 없음 - 메모장 ; 바람의나라
	;PostMessage, WM_KEYUP, GetKeyVK(editVal), GetKeyInfo(editVal), , 바람의나라
	
	return
}