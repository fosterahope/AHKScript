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

	; Title �ʱ�ȭ
	; �ٹ̴� �� ���߿�
	
	; UI Create
	mainDlg := Guicreate()
	
	; ���� �� �ʱ�ȭ
	vStatusBar := mainDlg.Add("StatusBar",,)
	vStatusBar.SetParts(150)
	
	; ��ư �ʱ�ȭ
	vBtnChange := mainDlg.Add("Button", "x10 y10 w80", "����(&s)")
	vBtnChange.OnEvent("Click", "OnButtonStatusChange")
	vBtnExit := mainDlg.Add("Button", "x100 y10 w80", "����(&q)")
	vBtnExit.OnEvent("Click", "OnButtonExit")
	
	; Check, Edit Box �ʱ�ȭ
	vEdit������ := mainDlg.Add("Edit", "x10 y50 w30 h20 +Center", "2")
	vCheck������ := mainDlg.Add("Checkbox", "x45 y50 w100 h20", "������")

	vEdit�������� := mainDlg.Add("Edit", "x10 y80 w30 h20 +Center", "5")
	vCheck�������� := mainDlg.Add("Checkbox", "x45 y80 w100 h20", "��������")

	vEdit�����̾� := mainDlg.Add("Edit", "x10 y110 w30 h20 +Center", "1")
	vCheck�����̾� := mainDlg.Add("Checkbox", "x45 y110 w100 h20", "�����̾�")

	vEdit�����ȭ := mainDlg.Add("Edit", "x10 y140 w30 h20 +Center", "9")
	vCheck�����ȭ := mainDlg.Add("Checkbox", "x45 y140 w100 h20", "�����ȭ")

	vEditȥ����÷  := mainDlg.Add("Edit", "x10 y170 w30 h20 +Center", "7")
	vCheckȥ����÷ := mainDlg.Add("Checkbox", "x45 y170 w100 h20", "ȥ����÷")

	vEditȥ����  := mainDlg.Add("Edit", "x10 y200 w30 h20 +Center", "6")
	vCheckȥ���� := mainDlg.Add("Checkbox", "x45 y200 w100 h20", "ȥ����")
	
	vEdit���  := mainDlg.Add("Edit", "x10 y230 w30 h20 +Center", "q")
	vCheck���:= mainDlg.Add("Checkbox", "x45 y230 w100 h20", "���")
	
	vEdit���ڼһ� := mainDlg.Add("Edit", "x10 y230 w30 h20 +Center", "T")
	vCheck���ڼһ� := mainDlg.Add("Checkbox", "x45 y230 w100 h20", "���ڼһ��İ�")
	
	; Ui Show
	mainDlg.Show("Center")
		
	UpdateUi()	; ���� UI �ʱ�ȭ
}

Action:
{
	RunInit()
	return	
}

return
