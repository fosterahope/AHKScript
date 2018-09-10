#include %A_ScriptDir%
#include Define.ahk			; Window 정의 값
#include InitGlobal.ahk		; Global 변수를 초기화한다.
#include EventHandler.ahk	; UI 이벤트 핸들러
#include Function.ahk		; Main Thread

#SingleInstance force	; 중복실행 방지
; #NoTrayIcon				; 트레이 아이콘 없음
;==============================
;UI Init - Start
;==============================
InitUI:
{
	nWidthPosExit  		:= g_nFrameWidth -90
	nWidthPosChange		:= nWidthPosExit - 100
	nHeightPos 			:= g_nFrameHeight - 50

	; Title 초기화
	; 꾸미는 건 나중에
	
	; UI Create
	mainDlg := Guicreate()
	
	; 상태 바 초기화
	vStatusBar := mainDlg.Add("StatusBar",,)
	vStatusBar.SetParts(150)
	
	; 버튼 초기화
	vBtnChange := mainDlg.Add("Button", "x10 y10 w80", "시작(&s)")
	vBtnChange.OnEvent("Click", "OnButtonStatusChange")
	vBtnExit := mainDlg.Add("Button", "x100 y10 w80", "종료(&q)")
	vBtnExit.OnEvent("Click", "OnButtonExit")
	
	; Check, Edit Box 초기화
	vEdit성역주 := mainDlg.Add("Edit", "x10 y50 w30 h20 +Center", "2")
	vCheck성역주 := mainDlg.Add("Checkbox", "x45 y50 w100 h20", "성역주")

	vEdit공력증강 := mainDlg.Add("Edit", "x10 y80 w30 h20 +Center", "5")
	vCheck공력증강 := mainDlg.Add("Checkbox", "x45 y80 w100 h20", "공력증강")

	vEdit헬파이어 := mainDlg.Add("Edit", "x10 y110 w30 h20 +Center", "1")
	vCheck헬파이어 := mainDlg.Add("Checkbox", "x45 y110 w100 h20", "헬파이어")

	vEdit삼매진화 := mainDlg.Add("Edit", "x10 y140 w30 h20 +Center", "9")
	vCheck삼매진화 := mainDlg.Add("Checkbox", "x45 y140 w100 h20", "삼매진화")

	vEdit혼마술첨  := mainDlg.Add("Edit", "x10 y170 w30 h20 +Center", "7")
	vCheck혼마술첨 := mainDlg.Add("Checkbox", "x45 y170 w100 h20", "혼마술첨")

	vEdit혼마술  := mainDlg.Add("Edit", "x10 y200 w30 h20 +Center", "6")
	vCheck혼마술 := mainDlg.Add("Checkbox", "x45 y200 w100 h20", "혼마술")
	
	vEdit명상  := mainDlg.Add("Edit", "x10 y230 w30 h20 +Center", "q")
	vCheck명상:= mainDlg.Add("Checkbox", "x45 y230 w100 h20", "명상")
	
	vEdit십자소생 := mainDlg.Add("Edit", "x10 y230 w30 h20 +Center", "T")
	vCheck십자소생 := mainDlg.Add("Checkbox", "x45 y230 w100 h20", "십자소생파겁")
	
	; Ui Show
	mainDlg.Show("Center")
		
	UpdateUi()	; 최초 UI 초기화
}

Action:
{
	RunInit()
	return	
}

return
