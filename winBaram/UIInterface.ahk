; ==============================
; Variable Init
; ==============================
global g_ProgramName := "��Ű - cyh �׽�Ʈ UI"
global g_MacroStart := false

; ==============================
; UI Init - Start
; ==============================
InitUI:
{
	Gui, Add, StatusBar, ,					; ��ũ�� ���� ���¹�
	Gui, Add, Button, default, ����			; ���� ��ư
	Gui, Add, Button, default, ����			; ���� ��ư
	Gui, Add, Button, default, ����			; ���� ��ư

	; ���� �� �ʱ�ȭ
	SB_SetParts(50)							; ��ũ�� ���� ���� / ��Ÿ

	; UI Show
	Gui, Show, Center w300 h500, %g_ProgramName%
	UpdateUi()	; ���� UI �ʱ�ȭ
	
	return
}

Button����:
{
	g_MacroStart := true
	UpdateUI()
	return
}

Button����:
{
	g_MacroStart := false
	UpdateUI()
	return
}

Button����:
{
	g_MacroStart := false
	UpdateUI()
	ExitApp
	return
}