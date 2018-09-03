#include %A_ScriptDir%
#include Define.ahk				; Window ���� ��
#include InitGlobal.ahk			; Global ������ �ʱ�ȭ�Ѵ�.
#include EventHandler.ahk		; UI �̺�Ʈ �ڵ鷯
#include Function.ahk			; Main Thread
;==============================
;UI Init - Start
;==============================
InitUI:
{
	nWidthPosExit  		:= g_nFrameWidth -90
	nWidthPosChange		:= nWidthPosExit - 100
	nHeightPos 			:= g_nFrameHeight - 50

	; Title �ʱ�ȭ
	; �ٹ̴� �� ���߿�
	
	
	; ���� �� �ʱ�ȭ
	Gui, Add, StatusBar, ,	
	SB_SetParts(300 / 2)
	
	; ��ư �ʱ�ȭ
	Gui, Add, Button, x%nWidthPosChange% y%nHeightPos% w80 h22 gOnButtonStartPause vBtnChange, ����
	Gui, Add, Button, x%nWidthPosExit% y%nHeightPos% w80 h22 gOnButtonExit vBtnExit, ����
	
	; Check, Edit Box �ʱ�ȭ
	Gui, Add, Edit, x10 y10 w30 h20 +Center vE������, 1
	Gui, Add, Checkbox, x45 y10 w100 h20 vC������, ������
	
	Gui, Add, Edit, x10 y40 w30 h20 +Center vE��������, 2
	Gui, Add, Checkbox, x45 y40 w100 h20 vC��������, ��������
	
	;Gui, Add, Checkbox, x10 y10 w80 h20 vChk gChk, �����̾�
	;Gui, Add, Checkbox, x10 y10 w80 h20 vChk gChk, �����ȭ
	;Gui, Add, Checkbox, x10 y10 w80 h20 vChk gChk, ȥ����÷
	;Gui, Add, Checkbox, x10 y10 w80 h20 vChk gChk, ���ڼһ���ȯ��
	;Gui, Add, Checkbox, x10 y10 w80 h20 vChk gChk, ���
	;Gui, Add, Checkbox, x10 y10 w80 h20 vChk gChk, ȥ����

	; UI Show
	Gui, Show, Center w%g_nFrameWidth% h%g_nFrameHeight%, %g_ProgramName%
	UpdateUi()	; ���� UI �ʱ�ȭ
}

Action:
{
	RunInit()
	return	
}

return
