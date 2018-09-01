#include %A_ScriptDir%
#include Define.ahk				; Window ���� ��
#include InitGlobal.ahk			; Global ������ �ʱ�ȭ�Ѵ�.
#include EventHandler.ahk		; UI �̺�Ʈ �ڵ鷯

;==============================
;UI Init - Start
;==============================
InitUI:
{
	nWidthPosExit  		:= g_nFrameWidth -200
	nWidthPosChange		:= g_nFrameWidth - 100
	nHeightPos 			:= g_nFrameHeight - 50
	
	Gui, Add, StatusBar, ,										; ��ũ�� ���� ���¹�
	Gui, Add, Button, x%nWidthPosChange% y%nHeightPos% gOnButtonStartPause, ����	; ���� ���� ��ư 
	Gui, Add, Button, x%nWidthPosExit% y%nHeightPos% gOnButtonExit, ����		; ���� ��ư

	; ���� �� �ʱ�ȭ
	SB_SetParts(300 / 2)							; ��ũ�� ���� ���� / ��Ÿ

	; GuiControl, Enable, Btn ; ��ư�� �۾� �� ���� �ٲٱ�

; TEST
	; Gui, Add, Button, gTestBtn, Pause(&p)
	; Gui, Add, Button, x150 ynHeight w50 h20, ��������		; ����/���� ��ư
;

	; UI Show
	Gui, Show, Center w%g_nFrameWidth% h%g_nFrameHeight%, %g_ProgramName%
	UpdateUi()													; ���� UI �ʱ�ȭ
	
	return
}


return
