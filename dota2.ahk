#SingleInstance force
#Persistent
#MaxHotkeysPerInterval 200
#HotkeyInterval 0
#InstallKeybdHook
#NoTrayIcon
#UseHook On
SendMode Input

; ============ Dota 2 ======== ;

#IfWinActive Dota 2
#IfWinActive ahk_class SDL_app
{

Space & a:: send {Blind}{F10} ;Move
Space & q::	send {Blind}{F6}  ;Item quick-cast
Space & w:: send {Blind}{F7}	;Item quick-cast
Space & e:: send {Blind}{F8} ;Item quick-cast
Space & d:: send {Blind}{F17}{F16}{F17}  ;Item quick-cast
Space & f:: send {Numpad1} ;Scan
Space & r:: send {9}{9}{0}{0} ;Self-cast (D & F)
Space & g:: send {F3}{Numpad4} ;Courier Deliver + Speed Burst
Space & F1::Send,{F1 down} ;Camera on Hero
Space & sc029::Send,{F15 down}  ;Chat Wheel
Space & sc029 up::Send,{F15 up} ;Chat Wheel

~$Space::
KeyWait, Space, L D T3
Send {F18} ;Toggle Mouse Repeat
KeyWait, Space
Send {F18} ;Toggle Mouse Repeat
Return


!F7:: ;toggle dotabuddy
{
++p
if p = 3 ; The number of actions plus 1.
p = 1
if p=1
{
	SplashTextOn, , , DotaBuddy Enabled
	Sleep, 300
	SplashTextOff
	Run, C:\Portable\dotabuddy\dotabuddy.exe
}
if p=2
{
	SplashTextOn, , , DotaBuddy Disabled
	Sleep, 300
	SplashTextOff
	Process, Close, dotabuddy.exe
}
}
Return


;~F2::
;t = 4
;return

;~F1::
;t = 1
;return


;~t:: ;toggle runes
;++t
;if t = 4 ; The number of actions plus 1.
;t = 1
;if t=1
;{
;	Send, {F4}
;}
;if t=2
;{
;	Send, {F5}
;}
;if t=3
;{
;	Send, {F1}
;}
;Return

;~m:: ;Mute + Disable Voip Sound
;Send, {F13}{Sleep 50}{F14}
;Return
}