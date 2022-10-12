; PADS Logic macro
; Auther : HMS
; Start Date : 22.10.10
; Ver : 1.0
;
;CoordMode, Mouse, Screen	; Mouse Absolute coordinate mode
;
PADS_Chk:		; Pads is  already Running..?
IfWinExist, ahk_exe powerlogic.exe	; If PADS is running..?
goto PADS_Ok

PSDS_Run:		; PADS Find&Run
if(FileExist("C:\MentorGraphics\PADSVX.2.7\SDD_HOME\common\win32\bin\powerlogic.exe"))
	Run, powerlogic.exe, C:\MentorGraphics\PADSVX.2.7\SDD_HOME\common\win32\bin\
if(FileExist("D:\MentorGraphics\PADSVX.2.7\SDD_HOME\common\win32\bin\powerlogic.exe"))
	Run, powerlogic.exe, D:\MentorGraphics\PADSVX.2.7\SDD_HOME\common\win32\bin\
if(FileExist("C:\MentorGraphics\PADSVX.2.11\SDD_HOME\common\win32\bin\powerlogic.exe"))
	Run, powerlogic.exe, C:\MentorGraphics\PADSVX.2.11\SDD_HOME\common\win32\bin\
if(FileExist("D:\MentorGraphics\PADSVX.2.11\SDD_HOME\common\win32\bin\powerlogic.exe"))
	Run, powerlogic.exe, D:\MentorGraphics\PADSVX.2.11\SDD_HOME\common\win32\bin\
if(FileExist("C:\MentorGraphics\9.5PADS\SDD_HOME\Programs\powerlogic.exe"))
	Run, powerlogic.exe, C:\MentorGraphics\9.5PADS\SDD_HOME\Programs\
if(FileExist("D:\MentorGraphics\9.5PADS\SDD_HOME\Programs\powerlogic.exe"))
	Run, powerlogic.exe, D:\MentorGraphics\9.5PADS\SDD_HOME\Programs\
;
PADS_Ok:
help()	; Help window

; macro is running only main program window & Disable in sub-window
#SingleInstance force
SetTitleMatchMode, 2
#IfWinActive,PADS Logic		; Activate when sentence in the window title
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
;
Cmd_ColorSet = ^!c			;color set - ctl+alt+c
Cmd_Rotate = ^r				;rotate - ctl+r
Cmd_StretchSeg = +s			;strech - shift+s
Cmd_Properties = ^q 		;Properties - ^q or alt+enter
Cmd_Move = ^e				;Move
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
/*
; Key remapping 은 단순히 키입력을 치환
; Macro는 두가지 이상의 조합
*/
;Key Remapping
:*:i::{PGUP}						;zoom in
:*:o::{pgdn}						;zoom out
:*:r::^r							;Rotate
:*:e::^e							;Move
c::CMD_SEND(Cmd_ColorSet)			;Cntl+ALT+C - Color setting
;
; Macro
!e::	;Cntl + E - move
	send,^x							; 자르기
	send,^v							; 붙이기
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
;
; Macro - Cntl
^l:: ;Setup  - Layer
	MENU_CMD(Menu_Setup, Sub_Layer)
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
 PADS Logic macro
 Auther : HMS
 Date : 22.10.10
 Ver : 1.00
==================================
*EDIT
 E - Move - ^E
 I - Zoom in - PgUp
 O - Zoom out - PgDn
 R - Rotate - ^R
 S - Stretch Segment(non click) - +S
 A - Move Miter(non click)

*SETUP/MODE/TOOL
 C - Color setting - ^!C
 N - View Nets
 ^L - Setup Layers
 ^P - Setup Plane
 ^O - Set New Origin
 ^F - Filter - ^!F
 Q - Properties(non click) - ^Q or !{Enter}

*MODE TOGGLE
 K - Any angle <> Diagonal - AA/AD

*MODELESS COMMAND
 L Shift Down/Up - Macro Pause/Replay

*MAIN CONTROL
 F12 - Macro Pause/Replay Toggle
 ^F12 - Exit
 F1 - Help
)
}