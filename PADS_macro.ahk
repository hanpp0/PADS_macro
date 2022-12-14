; PADS macro
; Auther : HMS
; Start Date : 22.09.28
; Ver : 1.0
;
;CoordMode, Mouse, Screen	; Mouse Absolute coordinate mode
;
PADS_Chk:		; Pads is  already Running..?
;IfWinExist, ahk_exe powerpcb.exe	; If PADS is running..?
goto INIT

APP_Run:		; PADS Find&Run
if(FileExist("C:\MentorGraphics\PADSVX.2.7\SDD_HOME\common\win32\bin\powerpcb.exe"))
	Run, powerpcb.exe, C:\MentorGraphics\PADSVX.2.7\SDD_HOME\common\win32\bin\
if(FileExist("D:\MentorGraphics\PADSVX.2.7\SDD_HOME\common\win32\bin\powerpcb.exe"))
	Run, powerpcb.exe, D:\MentorGraphics\PADSVX.2.7\SDD_HOME\common\win32\bin\
if(FileExist("C:\MentorGraphics\PADSVX.2.11\SDD_HOME\common\win32\bin\powerpcb.exe"))
	Run, powerpcb.exe, C:\MentorGraphics\PADSVX.2.11\SDD_HOME\common\win32\bin\
if(FileExist("D:\MentorGraphics\PADSVX.2.11\SDD_HOME\common\win32\bin\powerpcb.exe"))
	Run, powerpcb.exe, D:\MentorGraphics\PADSVX.2.11\SDD_HOME\common\win32\bin\
if(FileExist("C:\MentorGraphics\9.5PADS\SDD_HOME\Programs\powerpcb.exe"))
	Run, powerpcb.exe, C:\MentorGraphics\9.5PADS\SDD_HOME\Programs\
if(FileExist("D:\MentorGraphics\9.5PADS\SDD_HOME\Programs\powerpcb.exe"))
	Run, powerpcb.exe, D:\MentorGraphics\9.5PADS\SDD_HOME\Programs\
;
INIT:
;help()	; Help window
;SetCapsLockState, AlwaysOff
SetScrollLockState, AlwaysOff
; macro is running only main program window & Disable in sub-window
#SingleInstance force
SetTitleMatchMode, 2
GroupAdd PADS, PADS Layout
GroupAdd PADS, PADS Logic
GroupAdd PADS, PADS Router
#IfWinActive ahk_group PADS
;
#MaxThreadsPerHotkey 2			; Toggle
;
;
; shft - +
; Alt - !
; Cntl - ^
; Win - #
;/////////////////////////////////////////////////////////////////////////////////
;PADS Internal Macro
;///////PADS custumize //////////////////
; +S >> S -- Other Command - Stretch
; !R -- Design Tool bar - Move Ref.des
;
;////////////////////////////////////////

;G - Glue
;!G - UnGlue
;H - Highlight
;!H - UnHighlight
;Select Filter setting
;+A - Select Any
;+C - Select Componant
;+S - Select Shape
;+D - Select Document
;
;/////////////////////////////////////////////////////////////////////////////////
;// INIT Var
;/////////////////////////////////////////////////////////////////////////////////
global DelayIn  = 100			; default delay time for Key/mouse in
global val_miter = 0
global val_G_mm = 0
global val_G_mil = 0
global val_GD_mm = 0
global val_GD_mil = 0
;/////////////////////////////////////////////////////////////////////////////////
;PADS Custom Macro Relative
;/////////////////////////////////////////////////////////////////////////////////
;PADS MACRO
; Quick Select Filter
Sel_Any = !+a
Sel_Comp = !+b
Sel_Doc = !+c
Sel_Net = !+d
Sel_Shape = !+e
Sel_Trace = !+f
Cmd_Glue = !+g
Cmd_RouteSplit = !+h
Cmd_RouteSwapEnd = !+i
Cmd_ShapeAddCorner = !+j
;Cmd_ShapeAddMiter = !+k
Cmd_ShapeANBC = !+l
Cmd_ShapeMoveMiter = !+m
Cmd_ShapeSplit = !+n
Cmd_UnGlue = !+o
/*
+a::CMD_SEND(Sel_Any) 				;!+a
+c::CMD_SEND(Sel_Comp)				;!+b
+d::CMD_SEND(Sel_Doc)				;!+c
+n::CMD_SEND(Sel_Net)				;!+d
;+s::CMD_SEND(Sel_Shape)			;!+e
+t::CMD_SEND(Sel_Trace)				;!+f
[::CMD_SEND(Cmd_Glue)				;!+g
a::CMD_SEND(Cmd_RouteSplit)			;!+h
x::CMD_SEND(Cmd_RouteSwapEnd)		;!+i
;::CMD_SEND(Cmd_ShapeAddCorner)		;!+j - Not used
;::CMD_SEND(Cmd_ShapeAddMiter)		;!+k - use in N
;::CMD_SEND(Cmd_ShapeANBC)			;!+l - use in J
+s::CMD_SEND(Cmd_ShapeMoveMiter) 	;!+m - Not used
!a::CMD_SEND(Cmd_ShapeSplit)		;!+n
]::CMD_SEND(Cmd_UnGlue)				;!+o
*/
; ** PADS Layout only
Cmd_SetColor = ^!c			;color set - ctl+alt+c
;Cmd_Rotate = ^r				;rotate - ctl+r
Cmd_Filter = ^!f			;filter - ctl+alt+f
Cmd_StretchSeg = +s			;strech - shift+s
Cmd_Properties = ^q 		;Properties - ^q or alt+enter
Cmd_Move = ^e				;Move
Cmd_Flip = ^f				;Flip side
Cmd_HighLight = ^h			;High light
Cmd_UnHighLight = ^u		;High light
;Cmd_Menu = M				;Mouse Right Click!
;Cmd_SelectNet = {F6}		;Select Net
;Cmd_SelectNet = !n			;Select Net
Cmd_ViewNet = ^!n			;View Net
Menu_File = !f
Menu_Edit = !e
Menu_View = !v
Menu_Setup = !s
Menu_Tools = !t
Sub_Origin = O				; Origin
Sub_Layer = L				; Layer
Sub_Plane = p				; Plane
;
; Modeless Emulate
;Angle
MCmd_A_Any = z{Backspace}AA{Enter}		;Any angle
MCmd_A_Dia = z{Backspace}AD{Enter}		;Diagonal
MCmd_A_Orth = z{Backspace}AO{Enter}		;Orthogonal
MCmd_DRC_On = z{Backspace}DRP{Enter}	;DRC On
MCmd_DRC_Off = z{Backspace}DRO{Enter}	;DRC Off
Cmd_Outline = o{Enter}		;Outline view
Cmd_EOV = e{Enter}			;End of Via
Cmd_U_mm = umm{Enter}
Cmd_U_mil = umm{Backspace}{Enter}	; UM for layout & router
Cmd_Via_Sel= v{Enter}
;/////////////////////////////////////////////////////////////////////////////////
;Layer control
;/////////////////////////////////////////////////////////////////////////////////
; no - layer Add
`::send, z{+}z{Enter}{Home}			; Display All On
0::send, z-z{Enter}					; Display All Off
1::send, l 1{Enter}
2::send, l 2{Enter}
3::send, l 3{Enter}
4::send, l 4{Enter}
5::send, l 5{Enter}
6::send, l 6{Enter}
7::send, l 7{Enter}
8::send, l 8{Enter}
;
; Alt + no - Layer Add
!1::send, z{+}1{Enter}
!2::send, z{+}2{Enter}
!3::send, z{+}3{Enter}
!4::send, z{+}4{Enter}
!5::send, z{+}5{Enter}
!6::send, z{+}6{Enter}
!7::send, z{+}7{Enter}
!8::send, z{+}8{Enter}
;
; Cntl + no - Layer only
^1::Send, z 1{Enter}
^2::Send, z 2{Enter}
^3::Send, z 3{Enter}
^4::Send, z 4{Enter}
^5::Send, z 5{Enter}
^6::Send, z 6{Enter}
^7::Send, z 7{Enter}
^8::Send, z 8{Enter}
^9::send, z e{Enter}
;
;==================================================================================================
; Edit
;==================================================================================================
 Esc::
	KeyWait, Esc					; 원래 2번 누르면 동작해야 되지만..
	KeyWait, Esc, D, T0.2			; SetTitleMatchMode를 사용하면 3번 연타해야 됨
	If ErrorLevel
		Send, {Esc}
	Else
		Send, {Esc}{Esc}{Esc}				; 3번 누르면..
		CMD_SEND(Sel_Any)
	Return
;
+Esc::
	Send, {Esc}{Esc}
	CMD_SEND(Sel_Any)
;
 a::CMD_SEND(Cmd_RouteSplit)			;!+h
!a::CMD_SEND(Cmd_ShapeSplit)		;!+n
;
e::^e ;Cmd_Move	;Cntl + E - move
f::^f ;Cmd_flip	;Cntl + F - Flip side
;
i::PGUP								;zoom in
;
/*
j:: ; Add miter - mm
	CMD_SEND(Sel_Shape)				; select filter shape, PADS macro set first
	sleep, 200
	MouseClick						; select shape
	if (val_miter = 0)
	{
		InputBox, val_miter,Default Miter,Value of Miter?,,200,150,,, ,,%val_miter%
		return
	}
;	sleep, 200
;	Send, +!m						; Add Miter, PADS macro set first
	CMD_SEND(Cmd_ShapeAddMiter)		; Add Miter, PADS macro set first
	sleep, 300
	Send, %val_miter%{Enter}		; miter value
	return
;
*/
n::	; Assign Copper Net by Click(With PADS Macro)
	CMD_SEND(Sel_Shape)				; select filter shape, PADS macro set first
	sleep, 200
	MouseClick						; select shape
;	sleep, 100
	CMD_SEND(Cmd_ShapeANBC)			; Assign Net By Click, PADS macro set first
	sleep, 500
	MouseClick						; Assign Net By Click
	return
;
o::pgdn								;zoom out
;
!p:: ;Flood All
	MENU_CMD(Menu_Tools, Sub_Plane)
	send, {Enter}{Enter}
	sleep, 500
	WinClose Pour					; Pour manager 창 닫기 - 창제목 일부 - V9.5
	WinClose Copper					; Copper manager 창 닫기 - 창제목 일부 - VX
	return
;
r::^r								;Rotate
;
s:: ; Stretch Segment
	CMD_SEND(Sel_Trace)				;f
	CMD_SEND(Cmd_StretchSeg)
	return
;
+s::CMD_SEND(Cmd_ShapeMoveMiter) 	;!+m - Not used
;
x::CMD_SEND(Cmd_RouteSwapEnd)		;!+i
[::CMD_SEND(Cmd_Glue)				;!+g
]::CMD_SEND(Cmd_UnGlue)				;!+o
;==================================================================================================
; Setup
;==================================================================================================
 c::CMD_SEND(Cmd_SetColor) 				;Set Color
^f::CMD_SEND(Cmd_Filter)				;Cntl+ALT+F - Filter
^l::MENU_CMD(Menu_Setup, Sub_Layer)		;Setup  - Layer
^n::CMD_SEND(Cmd_ViewNet) 				;View - Net
^o::MENU_CMD(Menu_Setup, Sub_Origin) 	;New origin
^p::MENU_CMD(Menu_Tools, Sub_Plane) 	;copper plane manage
 q::^q 									;Cmd_Move	;Cntl + Q - Properties
 v::CMD_SEND(Cmd_Via_Sel)				;Via select
;==================================================================================================
; Tool/Mode
;==================================================================================================
^d:: ;Toggle DRC On <> Off
	Toggle_DRC := !Toggle_DRC
	If Toggle_DRC
		CMD_SEND(MCmd_DRC_On)
	else
		CMD_SEND(MCmd_DRC_Off)
	return
;
h::^h				; high light net
;
!h::Send, ^u{Esc} 	;unhigh light Net
;
k:: ;Toggle Angle Any <> Dia
	Toggle_Angle := !Toggle_Angle
	If Toggle_Angle
		CMD_SEND(MCmd_A_Orth)
	else
		CMD_SEND(MCmd_A_Dia)
	return
;
m::Send, q{Enter}					;Measure
;
!o::CMD_SEND(Cmd_Outline)			;modeless: O - Outline View
;
t::Send, t{Enter}					;Transparent
;
u:: ;unit toggle
	Toggle_unit := !Toggle_unit
	If Toggle_unit
	{
		CMD_SEND(Cmd_U_mm)			; set mm
		if (val_GD_mm == 0)			; GD 설정한적이 없으면..?
			InputBox, val_GD_mm,Default Display Grid of mm,Display Grid mm?(Disable:"-"),,200,150,,, ,,%val_GD_mm%
		if (val_G_mm == 0) 			; 자동설정 사용하지 않는다면 skip
			InputBox, val_G_mm,Default Grid of mm,Grid mm?,,200,150,,, ,,%val_G_mm%
;
		if (val_GD_mm != "-")		; 자동 설정 On?
			Send, gd %val_GD_mm%{Enter}
		if (val_G_mm != "-")		; 자동 설정 On?
			Send, g %val_G_mm%{Enter}
		return
	}
	else
	{
		CMD_SEND(Cmd_U_mil)				; set mil
		if (val_GD_mil == 0)			; GD 설정한적이 없으면..?
			InputBox, val_GD_mil,Default Display Grid of mil,Display Grid mil?(Disable:"-"),,200,150,,, ,,%val_GD_mil%
		if (val_G_mil == 0)				; GD 설정한적이 없으면..?
			InputBox, val_G_mil,Default Grid of mm,Grid mil?,,200,150,,, ,,%val_G_mil%
;
		if (val_GD_mil != "-")			; 자동 설정 On?
			Send, gd %val_GD_mil%{Enter}
		if (val_GD_mm != "-")
			Send, g %val_G_mil%{Enter}
	return
	}
;
!v:: ;End of via Mode
	CMD_SEND(Cmd_EOV)
	return
;==================================================================================================
; Select
;==================================================================================================
+a::CMD_SEND(Sel_Any) 				;!+a
+c::CMD_SEND(Sel_Comp)				;!+b
+d::CMD_SEND(Sel_Doc)				;!+c
+f::CMD_SEND(Sel_Shape)				;!+e
+n::CMD_SEND(Sel_Net)				;!+d
+t::CMD_SEND(Sel_Trace)				;!+f
;==================================================================================================
; Macro Control
;==================================================================================================
+CapsLock::CapsLock
;
CapsLock::
	Caps_state := GetKeyState("CapsLock", "T") 		; CapsLock이 켜져 있으면 참, 그렇지 않으면 거짓
	if (!A_IsSuspended)								; Not Suspend?
	{
		Suspend										; Pause!
		while GetKeyState("CapsLock", "p")			; Key Up 대기
		{
		}
	}
;	Sleep, 500
	SetCapsLockState, % (Caps_State) ? "On" : "Off"
	Suspend											; Run!
	return
;
F12::
	Suspend
	if (A_IsSuspended)
	{
		MsgBox 16,PADS Macro,Pause!,0.5
	}
	else
	{
		MsgBox 64,PADS Macro,Reloading!,0.5
		Reload
	}
	return
;
^F12::
	Suspend
	MsgBox 20,PADS Macro,Exit?
	IfMsgBox,  Yes
		ExitApp
	return
;
F1::help()
	return
;
;/////////////////////////////////////////////////////////////////////////////////
;User Function
;/////////////////////////////////////////////////////////////////////////////////
MENU_CMD(mnu, cmd)					; 메뉴호출 + 단축키
{
;	DelayIn = 100
	send, {Esc}						; nothing
	sleep, DelayIn					; Need delay time
	send, %mnu% 					; Menu_Tools
	sleep, DelayIn					; Need delay time
	send, %cmd%
	return
}
;
CMD_SEND(cmd)						; 상수/변수를 %%없이 바로 send
{
	send, %cmd%
	return
}
;
help()
{
MsgBox 48,PADS Macro,
(
==================================
 PADS macro
 Auther : HMS
 Date : 22.11.18
 Ver : 1.50f
==================================
V.1.50f
- Grid Auto setting

*LAYER Control(Visible/Over Lab/Active)
 0 - Invisible All Layer - Z-Z
 `` - Visible All Layer - ZZ
!9 - Visible All Electrical only - ZE
 1~8 - Overlap Layer - Z+n
!1~!8 - Visible Layer only - Zn
^1~^8 - Active Layer - Ln

 ESC 3 Click - ESC+ESC+ESC+Selece All
+ESC - ESC+ESC+Selece All

*Edit
 A - RouteSplit (with PADS Macro)
!A - ShapeSplit (with PADS Macro)
 E - Move - ^E
 F - Flip side
 I - Zoom in - PgUp
 N - Assign Net By Click (with PADS Macro)
 O - Zoom out - PgDn
!P - Flood All
 R - Rotate - ^R
 S - Route Stretch Segment - +S
+S - Shape Move Miter (with PADS Macro)
 X - RouteSwapEnd (with PADS Macro)
 [ - Glue (with PADS Macro)
 ] - UnGlue (with PADS Macro)

*SETUP
 C - Color setting - ^!C
^F - Select Filter - !^F
^L - Setup Layers
^N - Setup Net
^O - Set New Origin
^P - Setup Plane
 Q - Properties - ^Q or !{Enter}
 V - Via Select

*Tool/Mode
^D - DRC On/Off
 H - high Light Net
!H - UnHigh Light Net
 K -Orthogonal <> Diagonal - AO/AD
 M - Measure(clickless)
!O - Outline view - Modeless: O
 T - Transparent View On <> Off
 U - mm <> mil toggle & grid Auto setting - UM/UMM
!V - End of Via mode

*Select
+A - SelAny	(with PADS Macro)
+C - SelComp (with PADS Macro)
+D - SelDoc	(with PADS Macro)
+F - SelShape (with PADS Macro)
+N - SelNet	(with PADS Macro)
+T - SelTrace (with PADS Macro)

*Macro CONTROL
 CapsLock - Instant Macro Pause/Replay
 F12 - Macro Pause/Reload Toggle
^F12 - Exit
 F1 - This Help

=================================================
 PADS Custum Macro(Must Preset!)
=================================================
Function  		PADS			ROUTER
-------------------------------------------------
SelAny			(PADS-!+a)
SelComp			(PADS-!+b)
SelDoc			(PADS-!+c)
SelNet			(PADS-!+d)
SelShape		(PADS-!+e)
SelTrace		(PADS-!+f)
Glue			(PADS-!+g)
RouteSplit		(PADS-!+h)
RouteSwapEnd	(PADS-!+i)
;ShapeAddCorner	(PADS-!+j) - 자주사용하지 않으니..
ShapeANBC		(PADS-!+l) - use in N
ShapeMoveMiter	(PADS-!+m)
ShapeSplit		(PADS-!+n)
UnGlue			(PADS-!+o)
)
}
/* 특정 프로그램에서만 동작
#IfWinActive ahk_exe SubtitleEdit.exe
`::F18A
!Tab::!Tab
Tab::F19
[::F20
]::F21
\::F22
#IfWinActive
*/
/* macro가 동작중일때 R shift를 누르면 macro가 일시정지되고 shift 키를 돌려줌
rshift::
	if (A_IsSuspended)
	{
	return
	}
	Suspend											; pause
	if (A_IsSuspended)
		MsgBox 16,PADS Macro,Macro Pause!,0.5
	else
		MsgBox 64,PADS Macro,Macro Running!,0.5
;
	while GetKeyState("Rshift", "p")				; Key Up 대기
	{
	send, {shift Down}
	}
	send, {shift Up}
;
	Suspend											; Go11aaa!!!!1111qaq111231212!@aaaaaa@!@!@!@!
	if (A_IsSuspended)
		MsgBox 16,PADS Macro,Macro Pause!,0.5
	else
		MsgBox 64,PADS Macro,Macro Running!,0.5
	return
*/
/* TOGGLE
SetCapsLockState, % (State:=!State) ? "On" : "Off"
*/
/* 더블 키인
CapsLock::
KeyWait, CapsLock
KeyWait, CapsLock, D T0.2
If ErrorLevel
	Send, {vk15}
Else
	SetCapsLockState, % (State:=!State) ? "On" : "Off"
Return
*/
/* 복합키
#if GetKeyState("RWin", "P") and GetKeyState("AppsKey", "P")
F1 & F2::MsgBox F1 & F2 Hotkey activated.
F2 & F3::MsgBox F2 & F3 Hotkey activated.
F3 & F4::MsgBox F3 & F4 Hotkey activated.
F4 & F5::MsgBox F4 & F5 Hotkey activated.
F5 & F6::MsgBox F5 & F6 Hotkey activated.

#if
*/

/* 키맵핑 메뉴얼

::hm::hanmadam@gmail.com	; hm 후 종료문자(enter, space, -, .등) 입력하면 우측 문자열로 치환됨
:*:hm::hanmadam@gmail.com	; 종료문자없이 바로 치환

*/