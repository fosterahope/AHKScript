;create 
#SingleInstance force	; �ߺ����� ����
#NoTrayIcon				; Ʈ���� ������ ����
StartX := 10			; ������ǥ x �ʱ�ȭ
StartY := 10			; ������ǥ y �ʱ�ȭ

;gui control init
InitGui:
	Gui, Add, Edit, x5 y5 w240 h65 vEditVal				;����Ʈ�ڽ� ����
	Gui, Add, Button, x5 y72 w240 h24 gBtn1, Ȯ��		;��ư ����
	Gui, Show, x%StartX% y%StartY% w250 h100, Example	;������ ����
return

;gui event
Btn1:
	gosub, funcMSG
return

;function
funcMSG:
	Gui, Submit, nohide		; ��Ʈ�ѿ� �ִ� �� ��������
	msgBox, %EditVal%		; �޽��� ���
return

;hotkey
F1::
	gosub, funcMSG
return

;exit
GuiClose:
	ExitApp