#include InitGlobal.ahk

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
	WinMove, Entropia Universe Client (32 bit) [Calypso], , 0, 0
	WinMove, Entropia Universe Client (64 bit) [Calypso], , 0, 0
	MainLoop()
}

MainLoop()
{	
	Loop
	{
		if(g_bMacroStart == false)
			continue

		InitProcess()
			
		; 메뉴가 열려있으면 닫는다.
		if( IsMainMenu() == 1 )
		{
			send {ESC}
		}
		; 죽었을 때 부활 
		if( IsReviving() == 1 )
		{
			ConfirmRevive()
			continue
		}
		
		; 땀존에 있을 때
		if( IsArriveSweatZone() == 1 )
		{
			if (IsSweatDry() == 1)
			{
				if(IsTarget() == 1)
				{
					send {ESC}
				}
				send {TAB}
				Sleep, 3500
				send {c down}
				Sleep, 300
				send {c up}
			}
			else
			{
				Sleep, 500
				if(IsTarget() == 0)
				{
					send {z down}
					Sleep, 500
					send {z up}
					send {TAB}
				}
				send f
			}
			Sleep, 1000
			continue
		}
		
		; 땀존에 없을 때
		bIsEsc := false
		if(IsTarget() == 1)
		{
			bIsEsc := true
			send {ESC}
		}
		
		if (IsSearchSweatZone() == 1)
		{
			send {w down}
			Sleep, 1000
			send {w up}
		}
		else
		{
			if(bIsEsc == true)
			{
				send {z down}
				Sleep, 1000
				send {z up}
			}
			else
			{
				send {z down}
				send {z up}
			}
		}
		bIsEsc := false
	}
	return
}

IsSearchSweatZone()
{
	; 125%
	; ImageSearch, vx, vy, 1185, 800, 1190, 865, *20 images/sweat_zone.png
	; 100%
	ImageSearch, vx, vy, 945, 640, 950, 680, *20 images/sweat_zone.png
	return %ErrorLevel% == 0 ? 1 : 0	
}

IsArriveSweatZone()
{
	; 125%
	; ImageSearch, vx, vy, 1175, 850, 1205, 880, *20 images/sweat_zone.png
	; 100%
	ImageSearch, vx, vy, 940, 680, 960, 690, *20 images/sweat_zone.png
	return %ErrorLevel% == 0 ? 1 : 0
}

IsSweatDry()
{
	; 125%
	; ImageSearch, vx, vy, 150, 150, 950, 400, *50 images/dry.png
	; 100%
	ImageSearch, vx, vy, 220, 150, 820, 200, *50 images/dry.png
	return %ErrorLevel% == 0 ? 1 : 0
}

IsReviving()
{
	; 125%
	; ImageSearch, vx, vy, 300, 400, 1000, 600, images/reviving_1.png
	; 100%
	ImageSearch, vx, vy, 230, 330, 800, 480, *50 images/reviving_1.png
	if (%ErrorLevel% == 0)
	{
		return 1
	}
	; 125%
	; ImageSearch, vx, vy, 350, 400, 450, 500, *10 images/reviving_2.png
	; 100%
	ImageSearch, vx, vy, 230, 330, 800, 480, *10 images/reviving_2.png
	if (%ErrorLevel% == 0)
	{
		return 1
	}
	; 125%
	; ImageSearch, vx, vy, 650, 500, 950, 650, *10 images/reviving_3.png
	; 100%
	ImageSearch, vx, vy, 630, 420, 800, 480, *10 images/reviving_3.png
	if (%ErrorLevel% == 0)
	{
		return 1
	}

	return 0
}

IsTarget()
{
	ImageSearch, vx, vy, 300, 200, 1000, 500, *10 images/target3.png
	if (%ErrorLevel% == 0)
	{
		return 1
	}
	ImageSearch, vx, vy, 300, 200, 1000, 500, *10 images/target.png
	if (%ErrorLevel% == 0)
	{
		return 1
	}
	ImageSearch, vx, vy, 300, 200, 1000, 500, images/target2.png
	if( %ErrorLevel% == 0)
	{
		return 1
	}
	return 0
}

IsMainMenu()
{
	ImageSearch, vx, vy, 350, 400, 700, 500, *30 images/main_menu.png
	return %ErrorLevel% == 0 ? 1 : 0
}

ConfirmRevive()
{
	; 120%
	; ImageSearch, vx, vy, 300, 400, 1000, 600, *50 images/revive_ok1.png
	; 100%
	ImageSearch, vx, vy, 300, 430, 800, 500, *50 images/revive_ok1.png
	if( %ErrorLevel% == 0)
	{
		vxx := vx + 70
		Send {Click, %vxx%, %vy%}
		Send {Click, %vxx%, %vy%}
		Send {Click, %vxx%, %vy%}
		; 125%
		; MouseMove, 420, 50
		; 100%
		MouseMove, 310, 40
	}
	; 120%
	; ImageSearch, vx, vy, 300, 400, 1000, 600, *50 images/revive_ok2.png
	ImageSearch, vx, vy, 300, 430, 800, 500, *50 images/revive_ok2.png
	if( %ErrorLevel% == 0)
	{
		Send {Click, %vx%, %vy%}
		Send {Click, %vx%, %vy%}
		Send {Click, %vx%, %vy%}
		; 125%
		; MouseMove, 420, 50
		; 100%
		MouseMove, 310, 40
	}
	; 125%
	; ImageSearch, vx, vy, 300, 400, 1000, 600, *50 images/revive_ok3.png
	; 100%
	ImageSearch, vx, vy, 300, 430, 800, 500, *50 images/revive_ok3.png
	if( %ErrorLevel% == 0)
	{
		Send {Click, %vx%, %vy%}
		Send {Click, %vx%, %vy%}
		Send {Click, %vx%, %vy%}
		; 125%
		; MouseMove, 420, 50
		; 100%
		MouseMove, 310, 40
	}
}

InitProcess()
{
	Process, Exist, Entropia.exe
	if(%ErrorLevel% == 0)
	{
		Sleep, 1000
		Send {Click, 400, 1056}
		Sleep, 1000
		Send {Click, 1300, 900}
		Sleep, 5000
		WinMove, Entropia Universe Client (32 bit), , 0, 0
		WinMove, Entropia Universe Client (64 bit), , 0, 0
		Send {Click, 400, 1056}
		Sleep, 1000
		Send {Click, 400, 1056}
		Sleep, 1000
		Send {Click, 375, 390}
		Sleep, 500
		Send {f0st2rah5peE@}
		Sleep, 500
		Send {Enter}
	}
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
	ExitApp
	return
}

