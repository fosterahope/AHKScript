; telegram - hi.com Function Code

#include ..\inc\ADBFunction.ahk

;=========================================================================
; @brief	Program Init
;=========================================================================
#NoEnv
#SingleInstance, Ignore
SendMode Input
DetectHiddenWindows On
DetectHiddenText, On
SetTitleMatchMode, 2


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
		
		g_nIdx := 1
		loop, %g_nMaxId%
		{
START_TRY:
			if(g_bMacroStart == false)
			{
				; 일시정지 상태
				goto START_TRY
			}

			; App 초기화 후 open
			nPid := AppOpen()
			if(nPid == false)
			{
				goto START_TRY
			}
			
			bRet := FirstMining(1)
			if(bRet == false)
			{
				goto START_TRY
			}
			
			bRet := FirstMining(2)
			if(bRet == false)
			{
				goto START_TRY
			}
			
			if(g_nIdx != 13)
			{
				bRet := FirstMining(3)
				if(bRet == false)
				{
					goto START_TRY
				}
			}
			
			AppClose(nPid)
			
			g_nIdx := g_nIdx + 1
			Sleep, 1000
		}
		OnButtonStatus() ; loop를 다 돌고 매크로 정지
		Sleep, 1000
	}
	return
}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
AppOpen()
{
	/*
	TopQDir(100, 10)
	
	bRet := ImgSearch(vx, vy, 0, 350, 550, 500, "images/folder.png", 5)
	if(bRet == false)
	{
		return false
	}
	OnClick(vx, vy, 1000)
	; OnClick(240, 630, 1000)
	;loop, %g_nIdx%
	;{
		OnDown(500)	
	;}
	
	OnEnter(3000)
	*/
	
	strPath := "D:\telegram\link\Telegram_" g_nIdx ".exe.lnk"
	Run, % strPath,,,getPID
	
	TopTelegram()
	
	loop, 20
	{
		bRet := ImgSearch(vx, vy, 5, 30, 50, 70, "images/start.png", 1)
		if(bRet == false)
		{
			TopTelegram()
		}
		else
		{
			Sleep, 2000
			return %getPID%
		}
		Sleep, 500
	}
	return false
}

AppClose(nPid)
{
	Run, taskkill /F /PID %nPid%,,Hide
	return true
}

FirstMining(n)
{
	OnClick(30, 40, 2000) ; Select Click
	if(n == 1)
	{
		OnClick(100, 185, 2000) ; First Click
	}
	else if(n == 2)
	{
		OnClick(100, 225, 2000) ; Second Click
	}
	else
	{
		OnClick(100, 275, 2000) ; Third Click
	}

	bRet := ImgSearch(vx, vy, 0, 80, 65, 570, "images/main.png", 5)
	if(bRet == false)
	{
		return false
	}
	OnClick(vx, vy, 1000)
	
	bRet := ImgSearch(vx, vy, 290, 300, 500, 600, "images/clab.png", 5)
	if(bRet == false)
	{
		return false
	}
	OnClick(vx, vy, 2000)
	OnSend("1", 1000)
	OnEnter(1000)
}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; common function


TopWeb(x, y)
{
	WinActivate, ahk_class Chrome_WidgetWin_1
	Sleep, 500
	OnClick(x, y, 1000)
}

TopQDir(x, y)
{
	WinActivate, Q-Dir 6.98.1
	; WinActivate, ahk_exe Q-Dir.exe
	Sleep, 500
	OnClick(x, y, 1000)
}

TopTelegram()
{
	WinSet, Top, ,Telegram
	WinActivate, Telegram
	WinActivate, ahk_class Qt5152QWindowIcon
	WinActivate, ahk_exe Telegram.exe
	Sleep, 500
}

ImgSearch(ByRef vx, Byref vy, x1, y1, x2, y2, path, timeout)
{
	tEnd := A_TickCount + (timeout * 1000)
	Loop
	{
		ImageSearch, vx, vy, x1, y1, x2, y2, *20 %path%
		if(%ErrorLevel% == 0)
		{
			return True
		}
		
		if (A_TickCount >= tEnd)
		{
			break
		}
	}
	return False
}

OnClick(x, y, delay)
{
	MouseMove, x, y
	Sleep, 300
	Send, {Click}
	Sleep, %delay%
}

OnSend(data, delay)
{
	Send, %data%
	Sleep, %delay%
}

OnDown(delay)
{
	Send {Down}
	Sleep, %delay%
}

OnEnter(delay)
{
	Send, {Enter}
	Sleep, %delay%
}

OnSendRaw(data, delay)
{
	SendRaw, %data%
	Sleep, %delay%s
}

OnExit(delay)
{
	Send, ^{F4}
	Sleep, %delay%
}

OnDrag(x1, y1, x2, y2)
{
	Mousemove, x1, y1
	Click, down
	Sleep, 80
	Mousemove, x2, y2
	Sleep, 300
	Click, up
	Sleep, 500
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

