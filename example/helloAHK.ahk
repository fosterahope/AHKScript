;create 
#SingleInstance force	; 중복실행 방지
#NoTrayIcon				; 트레이 아이콘 없음
StartX := 10			; 시작좌표 x 초기화
StartY := 10			; 시작좌표 y 초기화

;gui control init
InitGui:
	Gui, Add, Edit, x5 y5 w240 h65 vEditVal				;에디트박스 생성
	Gui, Add, Button, x5 y72 w240 h24 gBtn1, 확인		;버튼 생성
	Gui, Show, x%StartX% y%StartY% w250 h100, Example	;윈도우 생성
return

;gui event
Btn1:
	gosub, funcMSG
return

;function
funcMSG:
	Gui, Submit, nohide		; 컨트롤에 있는 값 가져오기
	msgBox, %EditVal%		; 메시지 출력
return

;hotkey
F1::
	gosub, funcMSG
return

;exit
GuiClose:
	ExitApp