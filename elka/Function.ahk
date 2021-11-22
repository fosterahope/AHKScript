; elka - Function.ahk

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
START_TRY:
		RunApp()
		Sleep, 1000
		StartMining()
		
		Sleep, 2000
		bRet := AdClose()
		if(bRet == false)
		{
			; MsgBox, failed
			NoxClick(523, 51)
		}
		
		RandSleep(178000, 210000)
		Sleep, 1000
	}
	return
}

IsMain()
{
	bRet := Nox_FastImgSearch("images\main.png", 210, 340, 330, 460, vx, vy)
	if(bRet == true)
	{
		return true
	}
	return false
}

StartMining()
{
	bRet := IsMain()
	if(bRet == true)
	{
		Random, chk_x, 225, 322
		Random, chk_y, 350, 450
		NoxClick(chk_x, chk_y)				
	}
}

AdClose()
{
	loop, 40
	{
		bRet := isMain()		
		if(bRet == true)
		{
			return true
		}

		bRet := Nox_FastImgSearch("images\close1.png", 470, 33, 539, 120, vx, vy)
		if(bRet == true)
		{
			NoxClick(vx, vy)
		}
		else if(Nox_FastImgSearch("images\close2.png", 470, 33, 539, 120, vx, vy) == true)
		{
			NoxClick(vx, vy)
		}
		else
		{
			ADBBack()
		}
		Sleep, 1000
	}
	return false
}

RandSleep(sTime, eTime)
{		
	Random, rand_time, sTime, eTime
	
	Sleep, %rand_time%
}

RunApp()
{
	bRet := Nox_FastImgSearch("images\app.png", 20, 590, 80, 655, vx, vy)
	if(bRet == true)
	{
		NoxClick(vx, vy)
		return true
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