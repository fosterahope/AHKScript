

;----------------------------------
;Gui, Show, Xn Yn Wn Hn, Title 예제
;----------------------------------
F1::
Gui, Show, X20 Y40 W300 H100, AutoLabEx
Return

;-------------------------------------
;Gui, Show, Xn Yn AutoSize, Title 예제
;-------------------------------------
F2::
Gui, Add, Edit, W300 H20
Gui, Show, X20 Y40 AutoSize, AutoLabEx
Return
 

;---------------------------------------
;Gui, Show, XCenter Yn Wn Hn, Title 예제
;---------------------------------------
F3::
Gui, Show, XCenter Y20 W300 H100, AutoLabEx
Return

;---------------------------------------
;Gui, Show, Xn YCenter Wn Hn, Title 예제
;---------------------------------------
F4::
Gui, Show, X20 YCenter W300 H100, AutoLabEx
Return

;---------------------------------------
;Gui, Show, Center Wn Hn, Title 예제
;---------------------------------------
F5::
Gui, Show, Center W300 H100, AutoLabEx
Return

;---------------------------------------
;Gui, Show, Center AutoSize, Title 예제
;---------------------------------------
F6::
Gui, Add, Edit, W300 H22     ;AutoSize를 위해 Edit 추가
Gui, Show, Center AutoSize, AutoLabEx
Return
 
F7::
exitapp
