

;----------------------------------
;Gui, Show, Xn Yn Wn Hn, Title ����
;----------------------------------
F1::
Gui, Show, X20 Y40 W300 H100, AutoLabEx
Return

;-------------------------------------
;Gui, Show, Xn Yn AutoSize, Title ����
;-------------------------------------
F2::
Gui, Add, Edit, W300 H20
Gui, Show, X20 Y40 AutoSize, AutoLabEx
Return
 

;---------------------------------------
;Gui, Show, XCenter Yn Wn Hn, Title ����
;---------------------------------------
F3::
Gui, Show, XCenter Y20 W300 H100, AutoLabEx
Return

;---------------------------------------
;Gui, Show, Xn YCenter Wn Hn, Title ����
;---------------------------------------
F4::
Gui, Show, X20 YCenter W300 H100, AutoLabEx
Return

;---------------------------------------
;Gui, Show, Center Wn Hn, Title ����
;---------------------------------------
F5::
Gui, Show, Center W300 H100, AutoLabEx
Return

;---------------------------------------
;Gui, Show, Center AutoSize, Title ����
;---------------------------------------
F6::
Gui, Add, Edit, W300 H22     ;AutoSize�� ���� Edit �߰�
Gui, Show, Center AutoSize, AutoLabEx
Return
 
F7::
exitapp
