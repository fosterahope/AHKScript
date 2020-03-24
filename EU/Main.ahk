#include %A_ScriptDir%
#include Define.ahk			; Window ���� ��
#include InitGlobal.ahk		; Global ������ �ʱ�ȭ�Ѵ�.
#include EventHandler.ahk	; UI �̺�Ʈ �ڵ鷯
#include Function.ahk		; Main Thread

#SingleInstance force	; �ߺ����� ����
; #NoTrayIcon				; Ʈ���� ������ ����
;==============================
;UI Init - Start
;==============================
InitUI:
{
	nWidthPosExit  		:= g_nFrameWidth -90
	nWidthPosChange		:= nWidthPosExit - 100
	nHeightPos 			:= g_nFrameHeight - 50

	; Status Bar Create
	Gui, Add, StatusBar,, Program Start
	SB_SetParts(150)
	
	; Ui Show
	Gui, show, w%g_nFrameWidth% h%g_nFrameHeight%, %g_ProgramName%
	
	Gui, Add, Button, x10 y10 w80, ����(&s)
	Gui, Add, Button, x100 y10 w80, ����(&q)
	
	; ��ư �ʱ�ȭ
	vBtnChange := mainDlg.Add("Button", "x10 y10 w80", "����(&s)")
	vBtnChange.OnEvent("Click", "OnButtonStatusChange")
	vBtnExit := mainDlg.Add("Button", "x100 y10 w80", "����(&q)")
	vBtnExit.OnEvent("Click", "OnButtonExit")
		
		
		
	UpdateUi()	; ���� UI �ʱ�ȭ
}

Action:
{
	RunInit()
	return	
}

return
