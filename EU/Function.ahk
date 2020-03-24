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
	return
}

MainLoop()
{	
	Loop
	{
		if(g_bMacroStart == false)
			continue
		
		if(chkTmp == 0)
			continue
	}
	return
}