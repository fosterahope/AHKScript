#include Define.ahk
#include InitGlobal.ahk

;=========================================================================
; @brief	UI를 갱신한다.
;
; @return	void
;=========================================================================
UpdateUi()
{
	global vStatusBar
	global vBtnChange
	if(g_bMacroStart == true)
	{
		vStatusBar.SetText("매크로 수행 중", 1)
		vBtnChange.Text := "정지"
	}
	else
	{
		vStatusBar.SetText("대기중", 1)
		vBtnChange.Text := "시작"
	}	
	return
}

;=========================================================================
; @brief	Main Loop Init
;
; @return	void
;=========================================================================
RunInit()
{
	SetTimer "MainLoop", -1
	SetTimer "공력증강", 1000		; 1초마다 공력증강을 수행한다.

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
		
		;GuiControlGet, chkTmp, ,C성역주
		; GuiControlGet, editTmp, , E성역주
		if(chkTmp == 0)
			continue
		
		Sleep(1000)
	}
	return
}

공력증강()
{
	if(g_bMacroStart == false)
		return
	
	global vCheck공력증강
	chkVal := vCheck공력증강.value
	if(chkVal == 0) ; 비활성화
		return	

	global vEdit공력증강
	editVal := vEdit공력증강.value
	
	name	 := GetKeyName(editVal)
	wParam   := GetKeyVK(editVal)
	lParam   := GetKeyInfo(editVal)

	MsgBox Format("Name:`{:X}`nVK:`{:X}`nSC:`{:X}", WM_KEYDOWN, wParam, lParam)
	; PostMessage(WM_KEYDOWN, GetKeyVK(editVal), GetKeyInfo(editVal), , 바람의나라)
	
	return
}