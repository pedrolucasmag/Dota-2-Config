#SingleInstance force
#Persistent
#NoTrayIcon
SendMode Input ; Recommended for new scripts due to its superior speed and reliability.
Run, C:\Program Files (x86)\Steam\Steam.exe

SetTimer process_watcher, 90000

process_watcher:
	Process Exist, Steam.exe
	If ErrorLevel = 0
		Exitapp
Return

#IfWinActive Dota 2
#IfWinActive ahk_class SDL_app

Space & a:: send {Blind}{F10} ;Move
Space & q::	send {Blind}{F6}  ;Item quick-cast
Space & w:: send {Blind}{F7}	;Item quick-cast
Space & e:: send {Blind}{F8} ;Item quick-cast
Space & d:: send {Blind}{Numpad3}{Numpad9}{Numpad3}  ;Item quick-cast
Space & f:: send {Numpad1} ;Scan
Space & r:: send {9}{9}{0}{0} ;Self-cast (D & F)
Space & g:: send {F3}{Numpad4} ;Courier Deliver + Speed Burst
Space & F1::Send,{F1 down} ;Camera on Hero
Space & sc029::Send,{F15 down}  ;Chat Wheel
Space & sc029 up::Send,{F15 up} ;Chat Wheel
~$Space::
KeyWait, Space, L D T3
Send {F18}
KeyWait, Space
Send {F18}

~space::space ; allow spaces still

t:: ;toggle runes
++t
if t = 4 ; The number of actions plus 1.
t = 1
if t=1
{
	Send, {F4}
}
if t=2
{
	Send, {F5}
}
if t=3
{
	Send, {F1}
}
~t::t ;allow t still

m:: ;Mute + Disable Voip Sound
Send, {F13}{Sleep 50}{F14}
~m::m ;allow m still