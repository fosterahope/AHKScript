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
; @brief	UI�� �����Ѵ�.
;=========================================================================
UpdateUi()
{
	global ButtonStatus
	if(g_bMacroStart == true)
	{
		SB_SetText("���� ��", 1)
		GuiControl, Text, ButtonStatus, ����(&x)
	}
	else
	{
		SB_SetText("��� ��", 1)
		GuiControl, Text, ButtonStatus, ����(&s)
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
		g_nIdx := g_nInitIdx ; ó�� �� ����
		g_nInitIdx := 0
		loopCnt := g_nMaxId - g_nIdx
		loop, %loopCnt%
		{
START_TRY:
			if(g_bMacroStart == false)
			{
				; �ǹ̴� ������ �Ͻ����� ����
				goto START_TRY
			}
	
			; App �ʱ�ȭ �� open
			AppOpen()
			
			; ���� ���� ���� 
			bRet := AccountOpen()
			if(bRet == false)
			{
				goto START_TRY
			}
	
			; �α��� ����
			bRet := SelectAccount(false)
			if(bRet == false)
			{
				goto START_TRY
			}
			Sleep, 2000
			; �α��� �� �������� �ݱ�
			ADBBack()
			Sleep, 3000
			ADBBack()
ALREADY_WORK:
			nStatus := GetStatus(vx_btn, vy_btn)
			; 0 �� ã��
			; 1 �Ϸ�(HAVESTT)
			; 2 ���(WORK)
			; 3 �۾� ��(STOP)
			
			if(nStatus == 3)
			{
				if(g_nIdx == 0)
				{
					; ù ��° ���� �������� �̹� �۾� ���̸� �۾��� ���� ������ �ݺ��Ѵ�.
					Sleep, 30000
					goto ALREADY_WORK
				}
				else
				{
					; ù ��°�� �ƴϸ� ���� �������� �Ѿ��.
					goto WORK_DONE
				}
			}
			
			if(nStatus == 1)
			{
				NoxClick(vx_btn, vy_btn) ; ��Ȯ�ϰ� ����
			}
			
			if(nStatus == 0)
			{
				goto START_TRY ; ����â�� �ݱ��� ���� ���� ��
			}
			
			; ���� �ޱ�
			bRet := ReceiveStover()
			if(bRet == false)
			{
				goto START_TRY
			}
			
			; ���� ��û �� ���� �ݱ� 
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
		; OnButtonStatus() ; loop�� �� ���� ��ũ�� ����
		; �ٽ� �ݺ� 
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
			remain_y := 661 - 59 ; �׻� �ٲ� �� ���� 
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
				remain_y := 650 ; ������ ������ �����Ǵ� ��
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
			return 1  ; �Ϸ�
		}
		
		bRet := Nox_FastImgSearch("images\work.png", 270, 510, 350, 545, vx, vy)
		if(bRet == true)
		{
			vx_btn := vx
			vy_btn := vy
			return 2 ; ���
		}
		
		bRet := Nox_FastImgSearch("images\stop.png", 275, 500, 350, 550, vx, vy)
		if(bRet == true)
		{
			vx_btn := vx
			vy_btn := vy
			return 3 ; �۾���
		}
	}
	vx_btn := 0
	vy_btn := 0
	; ����
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
					; ������ ������� ������ ����
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
	Sleep, 50000 ; 50�� ���� ��û �� ����
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
	return false ; main ȭ������ �������� �������� ���� ó�� 
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

