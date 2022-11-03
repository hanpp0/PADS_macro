; PADS macro
; Auther : HMS
; Start Date : 22.09.28
; Ver : 1.0
;
;CoordMode, Mouse, Screen	; Mouse Absolute coordinate mode
;
PADS_Chk:		; Pads is  already Running..?
IfWinExist, ahk_exe powerpcb.exe	; If PADS is running..?
goto PADS_Ok

PSDS_Run:		; PADS Find&Run
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
PADS_Ok:
help()	; Help window

; macro is running only main program window & Disable in sub-window
#SingleInstance force
SetTitleMatchMode, 2
#IfWinActive,PADS Layout		; Activate when sentence in the window title
;
#MaxThreadsPerHotkey 2			; Toggle
; shft - +
; Alt - !
; Cntl - ^
; Win - #
;/////////////////////////////////////////////////////////////////////////////////
;
;/////////////////////////////////////////////////////////////////////////////////
global DelayIn  = 100			; default delay time for Key/mouse in
; Select Layer
Cmd_Set_L1 = l1{Enter}
Cmd_Set_L2 = l2{Enter}
Cmd_Set_L3 = l3{Enter}
Cmd_Set_L4 = l4{Enter}
Cmd_Set_L5 = l5{Enter}
Cmd_Set_L6 = l6{Enter}
Cmd_Set_L7 = l7(Enter}
Cmd_Set_L8 = l8{Enter}
;
;with alt
Cmd_Disp_1 = z1{Enter}
Cmd_Disp_2 = z2{Enter}
Cmd_Disp_3 = z3{Enter}
Cmd_Disp_4 = z4{Enter}
Cmd_Disp_5 = z5{Enter}
Cmd_Disp_6 = z6{Enter}
Cmd_Disp_i = zi{Enter}
Cmd_Disp_e = ze{Enter}
Cmd_Disp_o = zo{Enter}
Cmd_Dispall_off = z-z{Enter}
Cmd_Dispall_on = zz{Enter}

;with cntl
Cmd_Dispadd_1 = z{+}1{Enter}
Cmd_Dispadd_2 = z{+}2{Enter}
Cmd_Dispadd_3 = z{+}3{Enter}
Cmd_Dispadd_4 = z{+}4{Enter}
Cmd_Dispadd_5 = z{+}5{Enter}
Cmd_Dispadd_6 = z{+}6{Enter}
;
Cmd_ColorSet = ^!c			;color set - ctl+alt+c
Cmd_Rotate = ^r				;rotate - ctl+r
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
Cmd_Outline = o{Enter}		;Outline view
;
Cmd_U_mm = umm{Enter}
Cmd_U_mil = um{Enter}
; Grid toggle when unit toggle
Cmd_G_mm = g0.1{Enter}
Cmd_G_mil = g5{Enter}
Cmd_Gd_mm = gd0.5{Enter}
Cmd_Gd_mil = gd25{Enter}
;
;Angle
Cmd_A_Any = AA{Enter}		;Any angle
Cmd_A_Dia = AD{Enter}		;Diagonal
;
Menu_File = !f
Menu_Edit = !e
Menu_View = !v
Menu_Setup = !s
Menu_Tools = !t
Sub_Origin = O				; Origin
Sub_Layer = L				; Layer
Sub_Plane = p				; Plane
;

;/////////////////////////////////////////////////////////////////////////////////
;
;/////////////////////////////////////////////////////////////////////////////////
; Key remapping 은 단순히 키입력을 치환
; Macro는 두가지 이상의 조합

;Key Remapping
; no - layer Active
:*:0::z-z{Enter}					; Display All Off
:*:1::L1{Enter}
:*:2::L2{Enter}
:*:3::L3{Enter}
:*:4::L4{Enter}
:*:5::L5{Enter}
:*:6::L6{Enter}
:*:7::L7{Enter}
:*:8::L8{Enter}
`::send, z{+}z{Enter}				; Display All On
;
; Cntl + no - layer only
^1::send, z1{Enter}
^2::send, z2{Enter}
^3::send, z3{Enter}
^4::send, z4{Enter}
^5::send, z5{Enter}
^6::send, z6{Enter}
^7::send, z7{Enter}
^8::send, z8{Enter}
^9::send, z{+}e{Enter}
; Cntl +
;
; Alt + no - Add Layer
!1::send, z{+}1{Enter}
!2::send, z{+}2{Enter}
!3::send, z{+}3{Enter}
!4::send, z{+}4{Enter}
!5::send, z{+}5{Enter}
!6::send, z{+}6{Enter}
!7::send, z{+}7{Enter}
!8::send, z{+}8{Enter}
; Alt +
;
;* Shortcut
:*:f::^f							;Cntl + F - Flip Side
:*:i::{PGUP}						;zoom in
:*:o::{pgdn}						;zoom out
:*:r::^r							;Rotate
:*:m::q{Enter}						;Measure
:*:t::t{Enter}						;Transparent
^f::CMD_SEND(Cmd_Filter)			;Cntl+ALT+F - Filter
!o::CMD_SEND(Cmd_Outline)			;modeless: O - Outline View
;$c::CMD_SEND(Cmd_ColorSet)			;Cntl+ALT+C - Color setting
c::CMD_SEND(Cmd_ColorSet)			;Cntl+ALT+C - Color setting
;
; Macro
e::	;Cntl + E - move
;	MouseClick						;선택후 ? or 선택과 동시 ?
	CMD_SEND(Cmd_Move)
	return
h::	; high light net
	send, {Esc}
	Context(5,"DOWN")			; Select Net
;	Sleep, DelayIn
	MouseClick
	CMD_SEND(Cmd_HighLight)			;High light
	return
!h:: ;unhigh light Net
	send, {Esc}
	Context(5,"DOWN")			; Select Net
;	Sleep, DelayIn
	MouseClick
	CMD_SEND(Cmd_UnHighLight)		;UnHigh light
	return
n:: ;View - Net
	CMD_SEND(Cmd_ViewNet)
	return
q::	;Cntl + Q - Properties
	MouseClick
	CMD_SEND(Cmd_Properties)
	return
s::	;Shift + S - stretch segment
	send, {Esc}
	MouseClick
	CMD_SEND(Cmd_StretchSeg)
	return
;Context menu control
!a:: ;Select anything - Right click + down 1 time
	Context(1,"DOWN")			; Select
	return
!c:: ;Select Component - Right click + down 2 time
	Context(2,"DOWN")			; Select
	return
!n:: ;Select Net - Right click + down 5 time
	Context(5,"DOWN")			; Select
	return
!s:: ;Select Shape - Right click + down 12 time
	Context(12,"DOWN")			; Select
	return
!d:: ;Select Document - Right click + down 13 time
	Context(13,"DOWN")			; Select
	return
!b:: ;Select Board - Right click + down 14 time
	Context(14,"DOWN")			; Select
	return
;
a:: ;move miter
	MouseClick
	Context(8,"DOWN")			;
	return
x:: ;swap segment end
	Context(8,"DOWN")
	return
;
; Macro - Cntl
^l:: ;Setup  - Layer
	MENU_CMD(Menu_Setup, Sub_Layer)
	return
^o:: ;New origin
	MENU_CMD(Menu_Setup, Sub_Origin)
	return
^p:: ;copper plane manager
	MENU_CMD(Menu_Tools, Sub_Plane)
	return
!p:: ;Flood All
	MENU_CMD(Menu_Tools, Sub_Plane)
	send, {Enter}{Enter}
	sleep, 1000
	WinClose Pour					; Pour manager 창 닫기 - 창제목 일부 - V9.5
	WinClose Copper					; Copper manager 창 닫기 - 창제목 일부 - VX
	return
;
; Toggle
;Toggle Angle Any <> Dia
k::
	Toggle_Angle := !Toggle_Angle
	If Toggle_Angle
	{
	CMD_SEND(Cmd_A_Any)
	return
	}
	CMD_SEND(Cmd_A_Dia)
	return
;unit toggle
u::
	Toggle_unit := !Toggle_unit
	If Toggle_unit
	{
	CMD_SEND(Cmd_U_mm)
	CMD_SEND(Cmd_G_mm)
	CMD_SEND(Cmd_Gd_mm)
	return
	}
	CMD_SEND(Cmd_U_mil)
	CMD_SEND(Cmd_G_mil)
	CMD_SEND(Cmd_Gd_mil)
	return
;
;* Modeless Command
lshift::
	if (A_IsSuspended)								; Suspend?
	{
	return											; exit
	}
	Suspend											; Suspend!
	while GetKeyState("lshift", "p")				; Key Up 대기
	{
	send, {shift Up}								; shift 누르기
	}
	send, {shift Up}								; shift 떼기
	Suspend											; Replay!
	return
;
;* Main Control
F12::
	Suspend
	if (A_IsSuspended)
		MsgBox 16,PADS Macro,Macro Pause!,0.5
	else
		MsgBox 64,PADS Macro,Macro Running!,0.5
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
;Cnt_Typing(cnt, cmd)				; 마우스 우측클릭, DN key로 select
Context(cnt, cmd)				; 마우스 우측클릭, DN key로 select
{
	send, {Esc}						; nothing
	MouseClick, Right
	loop %cnt%
	{
	Send, {%cmd%}
	}
	Send, {enter}
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
 Date : 22.10.13
 Ver : 1.32b
==================================
*LAYER Control(Visible/Over Lab/Active)
 0 - Invisible All Layer - Z-Z
 ` - Visible All Layer - ZZ
 ^1~^8 - Visible Layer only - Zn
 ^9 - Visible All Electrical only - ZE

 !1~!8 - Overlap Layer - Z+n

 1~8 - Active Layer - Ln

*EDIT
 E - Move - ^E
 F - Flip Side - ^F
 I - Zoom in - PgUp
 O - Zoom out - PgDn
 R - Rotate - ^R
 S - Stretch Segment(non click) - +S
 A - Move Miter(non click)
 X - Swap End

*SETUP/MODE/TOOL
 C - Color setting - ^!C
 N - View Nets
 ^L - Setup Layers
 ^P - Setup Plane
 ^O - Set New Origin
 ^F - Filter - ^!F
 Q - Properties(non click) - ^Q or !{Enter}

 H - high Light Net(non click)
 !H - UnHigh Light Net(non click)
 !P - Flood All
 M - Measure(non click)

*FILTER
 !A - Select Anything
 !C - Select Component
 !N - Select Net
 !S - Select Shape
 !D - Select Document
 !B - Select Board

*MODE TOGGLE
 !O - Outline view - Modeless: O
 K - Any angle <> Diagonal - AA/AD
 T - Transparent View On <> Off
 U - mm <> mil toggle & grid set - UM/UMM

*MODELESS COMMAND
 L Shift Down/Up - Macro Pause/Replay

*MAIN CONTROL
 F12 - Macro Pause/Replay Toggle
 ^F12 - Exit
 F1 - Help
)
}

/* 특정 프로그램에서만 동작
#IfWinActive ahk_exe SubtitleEdit.exe
`::F18
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