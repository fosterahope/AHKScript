;==============================
; Init Global Variable
;==============================
#include ..\inc\Gdip_All.ahk
#include ..\inc\Gdip_ImageSearch.ahk
;=========================================================================
; @brief	gdip Init
;=========================================================================
pToken := Gdip_StartUp()

; custom Setting
if(g_strAdbPath == "")
{
	global g_strAdbPath := "G:\Program Files\Nox\bin\nox_adb.exe"	
}
if(g_strAddrOpt == "")
{
	global g_strAddrOpt := " -s 127.0.0.1:62027"
}
; " -s 127.0.0.1:62025"
; " -s 127.0.0.1:62027"

global g_strAdbPullPath := A_WorkingDir "\images\screen.png"

global g_strAdbCapture := g_strAdbPath g_strAddrOpt " shell screencap -p /sdcard/screen.png"
global g_strAdbPull := g_strAdbPath g_strAddrOpt " pull /sdcard/screen.png " g_strAdbPullPath

; D:\Program Files\Nox\bin\nox_adb.exe -s 127.0.0.1:62025 shell screencap -p /sdcard/screen.png
; D:\Program Files\Nox\bin\nox_adb.exe -s 127.0.0.1:62025  pull /sdcard/screen.png D:\Project\git\AHKScript\PI\images\screen.png

global g_strAdbKeyEvent := g_strAdbPath g_strAddrOpt " shell input keyevent "
global g_strAdbInput := g_strAdbPath g_strAddrOpt " shell input text "
global g_strAdbTouch := g_strAdbPath g_strAddrOpt " shell input tap "
global g_strAdbSwipe := g_strAdbPath g_strAddrOpt " shell input swipe "

global g_strAdbSendRoot := g_strAdbPath g_strAddrOpt " shell sendevent /dev/input/event"

; 장비마다 번호가 다름
if(g_strAddrOpt == " -s 127.0.0.1:62026")
{
	global g_strAdbMouseEv := "4"	
}
else
{
	global g_strAdbMouseEv := "0"
}



;=========================================================================
; Function Define
;=========================================================================
Adb_ImageSearch(imgPath, x1, y1, x2, y2, byref vx, byref vy)
{	
	GetADBScreen()
	strWorking := A_WorkingDir
	strScreenPath := strWorking "\images\screen.png"
	strImgPath := strWorking "\" imgPath
	
	pBitmapAdb := Gdip_CreateBitmapFromFile(strScreenPath)
	pBitmapImg := Gdip_CreateBitmapFromFile(strImgPath)
	bRet := false
	; variation,, SearchDirection,
	result := Gdip_ImageSearch(pBitmapAdb, pBitmapImg, arrList, x1, y1, x2, y2, 30)
	if(result == 1)
	{
		StringSplit, splitList, arrList, `, ;
		vx := splitList1
		vy := splitList2
		bRet := true
		goto ADB_IMG_SEARCH_FUNCTION_END
	}
	
ADB_IMG_SEARCH_FUNCTION_END:
	Gdip_DisposeImage(pBitmapAdb), Gdip_DisposeImage(pBitmapImg)
	return bRet
}

Adb_FastImgSearch(imgPath, x1, y1, x2, y2, byref vx, byref vy)
{
	GetADBScreen_fast()
	
	pBitmapAdb := Gdip_CreateBitmapFromFile("images\screen.png")
	pBitmapImg := Gdip_CreateBitmapFromFile(imgPath)
	
	bRet := false
	; variation,, SearchDirection,
	result := Gdip_ImageSearch(pBitmapAdb, pBitmapImg, arrList, x1, y1, x2, y2, 30)
	if(result == 1)
	{
		StringSplit, splitList, arrList, `, ;
		vx := splitList1
		vy := splitList2
		bRet := true
		goto ADB_FAST_IMG_SEARCH_FUNCTION_END
	}
	
ADB_FAST_IMG_SEARCH_FUNCTION_END:
	Gdip_DisposeImage(pBitmapAdb), Gdip_DisposeImage(pBitmapImg)
	return bRet
}


; adb screen pull - images foluder screen.png
GetADBScreen()
{
	runwait, % g_strAdbCapture,, Hide
	Sleep, 100
	runwait, % g_strAdbPull,, Hide
	Sleep, 900
}

; adb screen pull - images foluder screen.png
GetADBScreen_fast()
{
	runwait, % g_strAdbCapture,, Hide
	runwait, % g_strAdbPull,, Hide
}

; adb fastClick
ADBClickF(x, y)
{
	strEv1 := g_strAdbSendRoot g_strAdbMouseEv " 3 57 0" ; ID
	strEv1 := g_strAdbSendRoot g_strAdbMouseEv " 3 53 " x
	strEv2 := g_strAdbSendRoot g_strAdbMouseEv " 3 54 " y
	strEv3 := g_strAdbSendRoot g_strAdbMouseEv " 3 58 30" ; press
	strEv4 := g_strAdbSendRoot g_strAdbMouseEv " 1 330 1" ; 버튼 down 
	strEv5 := g_strAdbSendRoot g_strAdbMouseEv " 0 0 0" ; report
	
	strEv6 := g_strAdbSendRoot g_strAdbMouseEv " 3 57 -1" ; ID
	strEv7 := g_strAdbSendRoot g_strAdbMouseEv " 1 330 0" ; Up
	strEv8 := g_strAdbSendRoot g_strAdbMouseEv " 0 0 0" ; report
	
	runwait, % strEv1,, Hide
	runwait, % strEv2,, Hide
	runwait, % strEv3,, Hide
	runwait, % strEv4,, Hide
	runwait, % strEv5,, Hide
	runwait, % strEv6,, Hide
	runwait, % strEv7,, Hide
	runwait, % strEv8,, Hide
}

; adb touch(tap)
ADBClick(x, y)
{
	strAdbClick := g_strAdbTouch x " " y
	runwait, % strAdbClick,, Hide
}

; adb text input
ADBInput(_text)
{
	strAdbText := g_strAdbInput _text
	runwait, % strAdbText,, Hide
}

ADBSwipe(x1, y1, x2, y2, duration)
{
	strSwipe := g_strAdbSwipe x1 " " y1 " " x2 " " y2 " " duration
	runwait, % strSwipe,, Hide
}

ADBLongPress(x, y, duration)
{
	strLongPress := g_strAdbSwipe x " " y " " x " " y " " duration
	runwait, % strLongPress,, Hide
}

ADBHome()
{
	strHome := g_strAdbKeyEvent 3
	runwait, % strHome,, Hide
}

ADBBack()
{
	strBack := g_strAdbKeyEvent 4
	runwait, % strBack,, Hide
}

ADBMenu()
{
	strMenu := g_strAdbKeyEvent 1
	runwait, % strMenu,, Hide
}

ADBEnter()
{
	strEnter := g_strAdbKeyEvent 66
	runwait, % strEnter,, Hide
}

ADBKeyDown()
{
	strDown := g_strAdbKeyEvent 20
	runwait, % strDown,, Hide
}

ADBKeyDown_D(nDelay)
{
	strDown := g_strAdbKeyEvent 20
	run, % strDown,, Hide
	Sleep, %nDelay%
}

ADBRelease()
{
	Gdip_Shutdown(pToken)
}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Nox Mapping Function
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Nox_ImageSearch(imgPath, x1, y1, x2, y2, byref vx, byref vy)
{
	y1_pos := y1 - 32
	y2_pos := y2 - 32
	bRet := Adb_ImageSearch(imgPath, x1, y1_pos, x2, y2_pos, vx, vy)
	if(bRet == true)
	{
		vy := vy + 32
	}
	return bRet
}

Nox_FastImgSearch(imgPath, x1, y1, x2, y2, byref vx, byref vy)
{
	y1_pos := y1 - 32
	y2_pos := y2 - 32
	bRet := Adb_FastImgSearch(imgPath, x1, y1_pos, x2, y2_pos, vx, vy)
	if(bRet == true)
	{
		vy := vy + 32
	}
	return bRet
}

; adb click(Nox Window position)
NoxClick(x, y)
{
	pos_y := y - 32
	ADBClick(x, pos_y)
}

NoxClickF(x, y)
{
	pos_y := y - 32
	ADBClickF(x, pos_y)
}

NoxLongPress(x, y, duration)
{
	pos_y := y - 32
	ADBLongPress(x, pos_y, duration)
}
NoxSwipe(x1, y1, x2, y2, duration)
{
	y1_pos := y1 - 32
	y2_pos := y2 - 32
	ADBSwipe(x1, y1_pos, x2, y2_pos, duration)
}

/*
0 -->  "KEYCODE_UNKNOWN" 
1 -->  "KEYCODE_MENU" 
2 -->  "KEYCODE_SOFT_RIGHT" 
3 -->  "KEYCODE_HOME" 
4 -->  "KEYCODE_BACK" 
5 -->  "KEYCODE_CALL" 
6 -->  "KEYCODE_ENDCALL" 
7 -->  "KEYCODE_0" 
8 -->  "KEYCODE_1" 
9 -->  "KEYCODE_2" 
10 -->  "KEYCODE_3" 
11 -->  "KEYCODE_4" 
12 -->  "KEYCODE_5" 
13 -->  "KEYCODE_6" 
14 -->  "KEYCODE_7" 
15 -->  "KEYCODE_8" 
16 -->  "KEYCODE_9" 
17 -->  "KEYCODE_STAR" 
18 -->  "KEYCODE_POUND" 
19 -->  "KEYCODE_DPAD_UP" 
20 -->  "KEYCODE_DPAD_DOWN" 
21 -->  "KEYCODE_DPAD_LEFT" 
22 -->  "KEYCODE_DPAD_RIGHT" 
23 -->  "KEYCODE_DPAD_CENTER" 
24 -->  "KEYCODE_VOLUME_UP" 
25 -->  "KEYCODE_VOLUME_DOWN" 
26 -->  "KEYCODE_POWER" 
27 -->  "KEYCODE_CAMERA" 
28 -->  "KEYCODE_CLEAR" 
29 -->  "KEYCODE_A" 
30 -->  "KEYCODE_B" 
31 -->  "KEYCODE_C" 
32 -->  "KEYCODE_D" 
33 -->  "KEYCODE_E" 
34 -->  "KEYCODE_F" 
35 -->  "KEYCODE_G" 
36 -->  "KEYCODE_H" 
37 -->  "KEYCODE_I" 
38 -->  "KEYCODE_J" 
39 -->  "KEYCODE_K" 
40 -->  "KEYCODE_L" 
41 -->  "KEYCODE_M" 
42 -->  "KEYCODE_N" 
43 -->  "KEYCODE_O" 
44 -->  "KEYCODE_P" 
45 -->  "KEYCODE_Q" 
46 -->  "KEYCODE_R" 
47 -->  "KEYCODE_S" 
48 -->  "KEYCODE_T" 
49 -->  "KEYCODE_U" 
50 -->  "KEYCODE_V" 
51 -->  "KEYCODE_W" 
52 -->  "KEYCODE_X" 
53 -->  "KEYCODE_Y" 
54 -->  "KEYCODE_Z" 
55 -->  "KEYCODE_COMMA" 
56 -->  "KEYCODE_PERIOD" 
57 -->  "KEYCODE_ALT_LEFT" 
58 -->  "KEYCODE_ALT_RIGHT" 
59 -->  "KEYCODE_SHIFT_LEFT" 
60 -->  "KEYCODE_SHIFT_RIGHT" 
61 -->  "KEYCODE_TAB" 
62 -->  "KEYCODE_SPACE" 
63 -->  "KEYCODE_SYM" 
64 -->  "KEYCODE_EXPLORER" 
65 -->  "KEYCODE_ENVELOPE" 
66 -->  "KEYCODE_ENTER" 
67 -->  "KEYCODE_DEL" 
68 -->  "KEYCODE_GRAVE" 
69 -->  "KEYCODE_MINUS" 
70 -->  "KEYCODE_EQUALS" 
71 -->  "KEYCODE_LEFT_BRACKET" 
72 -->  "KEYCODE_RIGHT_BRACKET" 
73 -->  "KEYCODE_BACKSLASH" 
74 -->  "KEYCODE_SEMICOLON" 
75 -->  "KEYCODE_APOSTROPHE" 
76 -->  "KEYCODE_SLASH" 
77 -->  "KEYCODE_AT" 
78 -->  "KEYCODE_NUM" 
79 -->  "KEYCODE_HEADSETHOOK" 
80 -->  "KEYCODE_FOCUS" 
81 -->  "KEYCODE_PLUS" 
82 -->  "KEYCODE_MENU" 
83 -->  "KEYCODE_NOTIFICATION" 
84 -->  "KEYCODE_SEARCH" 
85 -->  "TAG_LAST_KEYCODE"
*/