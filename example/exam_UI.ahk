; GUI 구현 테스트
Gui, Add, Text, x30 y5 w120 h20, 매크로 프로그램	; 프로그램 제목 표시
Gui, Add, Text, x60 y25 w50 h20 vA, 준비!!		; 현재 상태를 표시할 텍스트
Gui, Add, Text, x60 y50 h20 w50 vB, 0 회		; 클리어 횟수를 표시
Gui, Add, Button, x20 y80 w130 h20, 시작			; 시작 버튼
Gui, Add, Button, x20 y110 w130 h20, 종료		; 종료 버튼
Gui, Show

return

Button시작:
MsgBox, test
return

Button종료:
return
