

vInitDialog:
{	
	Gui, Add, Checkbox, x10 y10 w80 h20 vChk gChk, 체크박스:	

	;GUI Show
	Gui, Show, w250 h50, 체크박스 클릭예제
		
	return
}


Chk:

	Gui, Submit, NoHide
	
	if(Chk = 1)
		MsgBox checked
	else
		MsgBox not checked

return

GuiClose:
	ExitApp
