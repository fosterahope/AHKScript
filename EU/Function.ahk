#include Define.ahk
#include InitGlobal.ahk

;=========================================================================
; @brief	UI�� �����Ѵ�.
;
; @return	void
;=========================================================================
UpdateUi()
{
	global vStatusBar
	global vBtnChange
	if(g_bMacroStart == true)
	{
		vStatusBar.SetText("��ũ�� ���� ��", 1)
		vBtnChange.Text := "����"
	}
	else
	{
		vStatusBar.SetText("�����", 1)
		vBtnChange.Text := "����"
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