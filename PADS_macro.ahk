; PADS macro
; Auther : HMS
; Date : 22.09.28
; Ver : 1.1
;
help()
PADS_Chk:		; Pads is  already Running.. ?
IfWinExist, ahk_exe powerpcb.exe
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
;
PADS_Ok:
; macro is running only main program window 
#SingleInstance force
SetTitleMatchMode, 2
#IfWinActive,PADS Layout
;
;
#MaxThreadsPerHotkey 2
;
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
Cmd_Qmeasure = q{Enter}
Cmd_U_mm = umm{Enter}
Cmd_U_mil = um{Enter}
Cmd_G_mm = g0.1{Enter}
Cmd_G_mil = g5{Enter}
Cmd_Gd_mm = gd0.5{Enter}
Cmd_Gd_mil = gd25{Enter}
;
Cmd_ColorSet = ^!c	;color set - ctl+alt+c
Cmd_Rotate = ^r		;rotate - ctl+r
Cmd_Filter = ^!f	;filter - ctl+alt+f
Cmd_StretchSeg = +s	;strech - shift+s
Cmd_Properties = ^q ;Properties - ^q or alt+enter
Cmd_Move = ^e		;Move

;
F1::help()
	return
1::CMD_SEND(1, Cmd_Set_L1)
	return
2::CMD_SEND(1, Cmd_Set_L2)
	return
3::CMD_SEND(1, Cmd_Set_L3)
	return
4::CMD_SEND(1, Cmd_Set_L4)
	return
5::CMD_SEND(1, Cmd_Set_L5)
	return
6::CMD_SEND(1, Cmd_Set_L6)
	return
7::CMD_SEND(1, Cmd_Set_L7)
	return
8::CMD_SEND(1, Cmd_Set_L8)
	return
;
`::CMD_SEND(0, Cmd_Dispall_on)
	return
!1::CMD_SEND(1, Cmd_Dispadd_1)
	return
!2::CMD_SEND(2, Cmd_Dispadd_2)
	return
!3::CMD_SEND(3, Cmd_Dispadd_3)
	return
!4::CMD_SEND(4, Cmd_Dispadd_4)
	return
!5::CMD_SEND(5, Cmd_Dispadd_5)
	return
!6::CMD_SEND(6, Cmd_Dispadd_6)
	return
0::CMD_SEND(0, Cmd_Dispall_off)
	return

; Cntl + no - layer only
^1::CMD_SEND(1, Cmd_Disp_1)
	return
^2::CMD_SEND(2, Cmd_Disp_2)
	return
^3::CMD_SEND(3, Cmd_Disp_3)
	return
^4::CMD_SEND(4, Cmd_Disp_4)
	return
^5::CMD_SEND(5, Cmd_Disp_5)
	return
^6::CMD_SEND(6, Cmd_Disp_6)
	return
^7::CMD_SEND("i", Cmd_Disp_i)
	return
^8::CMD_SEND("o", Cmd_Disp_o)
	return
^9::CMD_SEND("e", Cmd_Disp_e)
	return

; Toggle
;unit toggle
u::
Toggle_unit := !Toggle_unit
If Toggle_unit
	{
		CMD_SEND("u", Cmd_U_mm)
;		CMD_SEND(0, Cmd_G_mm)
;		CMD_SEND(0, Cmd_Gd_mm)
		send, %Cmd_G_mm%
		send, %Cmd_Gd_mm%
		return
	}
		CMD_SEND("u", Cmd_U_mil)
		send, %Cmd_G_mil%
		send, %Cmd_Gd_mil%
return
;
; Shortcut
r:: CMD_SEND("r", Cmd_Rotate)		;rotate
	return
m:: CMD_SEND("r", Cmd_Move)			;move
	return
f:: CMD_SEND("f", Cmd_Filter)		;filter
	return
c:: CMD_SEND("c", Cmd_ColorSet)		;Color
	return
s:: CMD_SEND("s", Cmd_StretchSeg)	;stretch segment
	return
e:: CMD_SEND("e", Cmd_Properties)	;Properties
	return
q:: CMD_SEND("q", Cmd_Qmeasure)		;Quick measure
	return
i:: send, {PGUP}					;zoom in
	return
o:: send, {PGDN}					;zoom in
	return
;
; Macro
a:: ;select anything - Right click + down 1 time
	MouseClick, Right
	Cnt_Typing(1,"DOWN")
	return

x:: ;swap segment end 
	MouseClick, Right
	Cnt_Typing(8,"DOWN")
	return
!o:: ;New origin 
	send, !s
	send, {home}
	Cnt_Typing(7,"DOWN")
;	MouseClick, Left
	return
;
; User Function
CMD_SEND(skip, cmd)
{
	Hotkey, %skip%, Off
	send, %cmd%
	Hotkey, %skip%, On
	return
}
;
Cnt_Typing(cnt, cmd)
{
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
PADS macro
 Auther : HMS
 Date : 22.10.04
 Ver : 1.2

 F1 - Help
* Layer Visible
 ` - Visible All Layer
 0 - Invisible All Layer 
 
 !1~!6 - Visible Layer(Add)

 ^1~^6 - Visible Layer only
 ^7 - Visible Inner only
 ^8 - Visible Outside only
 ^9 - Visible Electrical only
 
 1~8 - Layer Active

* Shortcut 
 U - mm <> mil
 R - Rotate
 F - Filter
 C - Color setting
 S - Stretch Segment
 E - Properties
 M - Move
 I - Zoom in
 O - Zoom out
 !O - Set Orign

* Macro
 A - Select Anything
 X - Swap End 

* Macro Control
F12 - Pause/Run
^F12 - Exit
)
}

;
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