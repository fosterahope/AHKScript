
;Postmessage, msg, wparam, lparam, classNN, 프로그램명[타이틀]

;///////////////////////////////////////////
; [Msg]
;///////////////////////////////////////////
;global WM_KEYFIRST         := 0x100
global WM_KEYDOWN			:= 0x100
global WM_KEYUP				:= 0x101
;global WM_CUT := 0x300
;WM_COPY = 0x301
;WM_PASTE = 0x302
;WM_CLEAR = 0x303
;WM_MOUSEMOVE = 0x200
;WM_LBUTTonDOWN = 0x201
;WM_LBUTTonUP = 0x202
;WM_LBUTTonDBLCLK = 0x203
;WM_RBUTTonDOWN = 0x204
;WM_RBUTTonUP = 0x205
;WM_RBUTTonDBLCLK = 0x206
;WM_COMMAND = 0x111
;WM_SYSCOMMAND = 0x112

;///////////////////////////////////////////
; [wParam]
;///////////////////////////////////////////


;///////////////////////////////////////////
; [lParam]
;///////////////////////////////////////////
global L_CHAR_X := 0x2D0001 ;'x' 2949121	

GetKeyInfo(_char)
{
	if ( _char = 1)
		return 0x020001
	else if( _char = 2)
		return 0x030001
	else if( _char = 3)
		return 0x040001
	else if( _char = 4)
		return 0x050001
	else if( _char = 5)
		return 0x060001
	else if( _char = 6)
		return 0x070001
	else if( _char = 7)
		return 0x080001
	else if( _char = 8)
		return 0x090001
	else if( _char = 9)
		return 0x0a0001
	else if( _char = 0)
		return 0x0b0001
	else if( _char = a || _char = A)
		return 0x1e0001
	else if( _char = b || _char = B)
		return 0x300001
	else if( _char = c || _char = C)
		return 0x2e0001
	else if( _char = d || _char = D)
		return 0x200001
	else if( _char = e || _char = E)
		return 0x120001
	else if( _char = f || _char = F)
		return 0x210001
	else if( _char = g || _char = G)
		return 0x220001
	else if( _char = h || _char = H)
		return 0x230001
	else if( _char = i || _char = I)
		return 0x170001
	else if( _char = j || _char = J)
		return 0x240001
	else if( _char = k || _char = K)
		return 0x250001
	else if( _char = l || _char = L)
		return 0x260001		
	else if( _char = m || _char = M)
		return 0x320001
	else if( _char = n || _char = N)
		return 0x310001
	else if( _char = o || _char = O)
		return 0x180001
	else if( _char = p || _char = P)
		return 0x190001
	else if( _char = q || _char = Q)
		return 0x100001
	else if( _char = r || _char = R)
		return 0x130001
	else if( _char = s || _char = S)
		return 0x1f0001
	else if( _char = t || _char = T)
		return 0x140001
	else if( _char = u || _char = U)
		return 0x160001
	else if( _char = v || _char = V)
		return 0x2f0001
	else if( _char = w || _char = W)
		return 0x110001
	else if( _char = x || _char = X)
		return 0x2d0001
	else if( _char = y || _char = Y)
		return 0x150001
	else if( _char = z || _char = Z)
		return 0x2c0001
	else if( _char = `)
		return 0x290001
	else if( _char = -)
		return 0x0c0001
	else if( _char = =)
		return 0x0d0001
	;else if( _char = [)
	;	return 0x1a0001
	;else if( _char = ])
	;	return 0x1b0001
	;else if( _char = [)
	;	return 0x1a0001
	;else if( _char = ;)
	;	return 0x270001
	;else if( _char = ')
	;	return 0x280001
	else if( _char = ,)
		return 0x330001	
	else if( _char = .)
		return 0x340001	
	else if( _char = /)
		return 0x350001	
		
	return
}