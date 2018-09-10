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
	SetTimer "MainLoop", -1
	SetTimer "��������", 1000		; 1�ʸ��� ���������� �����Ѵ�.

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
		
		;GuiControlGet, chkTmp, ,C������
		; GuiControlGet, editTmp, , E������
		if(chkTmp == 0)
			continue
		
		Sleep(1000)
	}
	return
}

��������()
{
	if(g_bMacroStart == false)
		return
	
	global vCheck��������
	chkVal := vCheck��������.value
	if(chkVal == 0) ; ��Ȱ��ȭ
		return	

	global vEdit��������
	editVal := vEdit��������.value
	
	name	 := GetKeyName(editVal)
	wParam   := GetKeyVK(editVal)
	lParam   := GetKeyInfo(editVal)

	MsgBox Format("Name:`{:X}`nVK:`{:X}`nSC:`{:X}", WM_KEYDOWN, wParam, lParam)
	; PostMessage(WM_KEYDOWN, GetKeyVK(editVal), GetKeyInfo(editVal), , �ٶ��ǳ���)
	
	return
}