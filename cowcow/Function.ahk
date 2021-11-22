; COWCOW Function.ahk

#include ..\inc\ADBFunction.ahk

;=========================================================================
; @brief	Program Init
;=========================================================================
#NoEnv
#SingleInstance, Ignore
SendMode Input
DetectHiddenWindows On
DetectHiddenText, On

;=========================================================================
; @brief	UI를 갱신한다.
;=========================================================================
UpdateUi()
{
	global ButtonStatus
	if(g_bMacroStart == true)
	{
		SB_SetText("수행 중", 1)
		GuiControl, Text, ButtonStatus, 정지(&x)
	}
	else
	{
		SB_SetText("대기 중", 1)
		GuiControl, Text, ButtonStatus, 시작(&s)
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
	MainLoop()
}

MainLoop()
{	
	Loop
	{
		if(g_bMacroStart == false)
		{
			continue
		}
		
		; test logic
/*
		NoxSwipe(210, 250, 210, 800, 100)
		NoxSwipe(210, 250, 210, 800, 200)
		g_nIdx := 0
		loop, %g_nMaxId%
		{
			SelectAccount(true)
			g_nIdx := g_nIdx + 1
		}
		Sleep, 5000000
*/	
		g_nIdx := g_nInitIdx ; 처음 값 세팅
		g_nInitIdx := 0
		loopCnt := g_nMaxId - g_nIdx
		loop, %loopCnt%
		{
START_TRY:
			if(g_bMacroStart == false)
			{
				; 의미는 없지만 일시정지 상태
				goto START_TRY
			}
	
			; App 초기화 후 open
			AppOpen()
			
			; 계정 선택 열기 
			bRet := AccountOpen()
			if(bRet == false)
			{
				goto START_TRY
			}
	
			; 로그인 선택
			bRet := SelectAccount(false)
			if(bRet == false)
			{
				goto START_TRY
			}
			Sleep, 2000
			; 로그인 후 공지사항 닫기
			ADBBack()
			Sleep, 3000
			ADBBack()
ALREADY_WORK:
			nStatus := GetStatus(vx_btn, vy_btn)
			; 0 못 찾음
			; 1 완료(HAVESTT)
			; 2 대기(WORK)
			; 3 작업 중(STOP)
			
			if(nStatus == 3)
			{
				if(g_nIdx == 0)
				{
					; 첫 번째 계정 기준으로 이미 작업 중이면 작업이 끝날 때까지 반복한다.
					Sleep, 30000
					goto ALREADY_WORK
				}
				else
				{
					; 첫 번째가 아니면 다음 계정으로 넘어간다.
					goto WORK_DONE
				}
			}
			
			if(nStatus == 1)
			{
				NoxClick(vx_btn, vy_btn) ; 수확하고 시작
			}
			
			if(nStatus == 0)
			{
				goto START_TRY ; 공지창이 닫기지 않은 현상 등
			}
			
			; 여물 받기
			bRet := ReceiveStover()
			if(bRet == false)
			{
				goto START_TRY
			}
			
			; 광고 시청 후 광고 닫기 
			bRet := AdWatchComplete()
			if(bRet := false)
			{
				goto START_TRY
			}
			bRet := StartWork()
			if(bRet := false)
			{
				goto START_TRY
			}
WORK_DONE:
			g_nIdx := g_nIdx + 1
			Sleep, 1000
		}
		ADBBack()
		ADBHome()
		; OnButtonStatus() ; loop를 다 돌고 매크로 정지
		; 다시 반복 
		Sleep, 1000
	}
	return
}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
AppOpen()
{
	ADBBack()
	ADBHome()
	Sleep, 1000
	NoxLongPress(53, 500, 1000) ; cowcow App Pos
	ADBEnter()
	ADBEnter()
	Sleep, 1000
	NoxClick(80, 320) ; data delete item
	Sleep, 700
	NoxClick(80, 320) ; data delete item
	Sleep, 700
	NoxClick(435, 580) ; delete OK
	ADBHome()
	Sleep, 1500
	NoxClick(53, 500) ; app Open
	Sleep, 2000
}

IsAlreadyWork()
{
	loop, 3
	{
		bRet := Nox_FastImgSearch("images\stop.png", 275, 500, 350, 550, vx, vy)
		if(bRet == true)
		{
			MsgBox, Already
			return true
		}
	}
}
AccountOpen()
{
	loop, 30
	{
		bRet := Nox_FastImgSearch("images\main.png", 25, 490, 55, 530, vx, vy)
		if(bRet == true)
		{
			NoxClick(vx, vy)
			return true
		}
	}
	return false
}

SelectAccount_test()
{
	NoxSwipe(210, 250, 210, 800, 100)
	NoxSwipe(210, 250, 210, 800, 200)
	
	g_nIdx := 0
	loop, 36
	{
		remain_y := 0
		if(g_nIdx < 11)
		{
			; empty action
		}
		else if(g_nIdx < 22)
		{
			; first scroll
			if(g_nIdx == 11)	; test
			{
				NoxSwipe(210, 875, 210, 280, 900)
				Sleep, 500
			}
		}
		else if(g_nIdx < 33)
		{
			; second scroll
			if(g_nIdx == 22) ; test
			{
				; NoxSwipe(210, 875, 210, 280, 900)
				NoxSwipe(210, 875, 209, 280, 900)
				Sleep, 500
			}
		}
		else
		{
			; third scroll
			if(g_nIdx == 33) ; test
			{
				;NoxSwipe(210, 875, 210, 280, 900)
				;NoxSwipe(210, 875, 210, 280, 900)
				NoxSwipe(210, 875, 210, 280, 900)
				Sleep, 500
			}
			remain_y := 661 - 59 ; 항상 바뀔 수 있음 
		}
		new_Idx := Mod(g_nIdx, 11)
		login_x := 200

		if(remain_y == 0)
		{
			login_y := 240 + (59 * new_Idx)
		}
		else
		{
			login_y := remain_y + (59 * new_Idx)
		}
		; MsgBox, %login_x%, %login_y%
		NoxSwipe(login_x, login_y, 520, login_y, 500)
		g_nIdx := g_nIdx + 1
	}
}

SelectAccount(bTest)
{
	loop, 30
	{
		bRet := Nox_FastImgSearch("images\account_select.png", 270, 135, 335, 180, vx, vy)
		if(bRet == true)
		{
			remain_y := 0
			if(g_nIdx < 11)
			{
				; empty action
			}
			else if(g_nIdx < 22)
			{
				; first scroll
				if(bTest == false || g_nIdx == 11)
				{
					NoxSwipe(210, 875, 210, 280, 900)
					Sleep, 500
				}
			}
			else if(g_nIdx < 33)
			{
				if(bTest == false)
				{
					NoxSwipe(210, 875, 210, 280, 900)
					Sleep, 500
				}
				; second scroll
				if(bTest == false || g_nIdx == 22)
				{
					NoxSwipe(210, 875, 209, 280, 900)
					Sleep, 500
				}
			}
			else if(g_nIdx < 44)
			{
				if(bTest == false)
				{
					NoxSwipe(210, 875, 210, 280, 900)
					Sleep, 500
					NoxSwipe(210, 875, 209, 280, 900)
					Sleep, 500
				}
				; third scroll
				if(bTest == false || g_nIdx == 33)
				{
					NoxSwipe(210, 875, 210, 280, 900)
					Sleep, 500
				}
			}
			else
			{
				if(bTest == false)
				{
					NoxSwipe(210, 875, 210, 280, 900)
					Sleep, 500
					NoxSwipe(210, 875, 210, 280, 900)
					Sleep, 500
					NoxSwipe(210, 875, 210, 280, 900)
					Sleep, 500
				}
				; forth scroll
				if(bTest == false || g_nIdx == 44)
				{
					NoxSwipe(210, 875, 210, 280, 900)
					Sleep, 500
				}
				remain_y := 650 ; 마지막 페이지 변동되는 값
			}
			
			new_Idx := Mod(g_nIdx, 11)
			login_x := 200

			if(remain_y == 0)
			{
				login_y := 240 + (59 * new_Idx)
			}
			else
			{
				login_y := remain_y + (59 * new_Idx)
			}
			
				
			if(bTest == true)
			{
				NoxSwipe(login_x, login_y, 500, login_y, 400)
			}
			else
			{
				NoxLongPress(login_x, login_y, 400)
				Sleep, 2000
			}
			return true
		}
	}
	return false
}

GetStatus(byref vx_btn, byref vy_btn)
{
	loop, 10
	{
		bRet := Nox_FastImgSearch("images\harvest.png", 250, 500, 370, 545, vx, vy)
		if(bRet == true)
		{
			vx_btn := vx
			vy_btn := vy
			return 1  ; 완료
		}
		
		bRet := Nox_FastImgSearch("images\work.png", 270, 510, 350, 545, vx, vy)
		if(bRet == true)
		{
			vx_btn := vx
			vy_btn := vy
			return 2 ; 대기
		}
		
		bRet := Nox_FastImgSearch("images\stop.png", 275, 500, 350, 550, vx, vy)
		if(bRet == true)
		{
			vx_btn := vx
			vy_btn := vy
			return 3 ; 작업중
		}
	}
	vx_btn := 0
	vy_btn := 0
	; 오류
	return 0
}

ReceiveStover()
{
	loop, 10
	{
		bRet := Nox_FastImgSearch("images\stover.png", 460, 510, 520, 540, vx, vy)
		if(bRet == true)
		{
			NoxClick(vx, vy)
			Sleep, 1000
			loop, 10
			{
				bbRet := Nox_FastImgSearch("images\movie.png", 155, 575, 210, 605, vx, vy)
				if(bbRet := true)
				{
					; 동영상 보기까지 눌러야 성공
					NoxClick(vx, vy)
					Sleep, 1000 
					return true
				}
			}
			return false
		}
	}
	return false
}

AdWatchComplete()
{
	Sleep, 50000 ; 50초 광고 시청 후 종료
	ADBBack()
	Sleep, 3100
	ADBBack()
	Sleep, 3100
	ADBBack()
	Sleep, 3100
	ADBBack()
	
	bbRet := Nox_FastImgSearch("images\stover.png", 460, 510, 520, 540, vx, vy)
	if(bbRet == true)
	{
		return true
	}
	return false ; main 화면으로 복구하지 못했으면 실패 처리 
}

StartWork()
{
	loop, 10
	{
		bRet := Nox_FastImgSearch("images\work.png", 270, 510, 350, 545, vx, vy)
		if(bRet == true)
		{
			NoxClick(vx, vy)
			return true
		}
	}
	return false
}




;=========================================================================
; @brief	GUI Event
;=========================================================================
OnButtonStatus()
{
	g_bMacroStart := !g_bMacroStart
	UpdateUi()	
	; Macro Function
	return 
}

OnButtonQuit()
{
	g_MacroStart := false
	UpdateUi()
	ADBRelease()
	ExitApp
	return
}

