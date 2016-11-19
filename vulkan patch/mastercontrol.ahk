#SingleInstance force
#Persistent
#MaxHotkeysPerInterval 200
#HotkeyInterval 0
#InstallKeybdHook
#NoTrayIcon
#UseHook On
SendMode Input

;======= Mixer Volume Control for Focused Application =======;

; "CTRL + SHIFT  INSERT"  for volume up
+^Insert::run C:\nircmd-x64\NirCmd.exe changeappvolume focused 0.02


; "CTRL + SHIFT HOME"  for volume down
+^Home::run C:\nircmd-x64\NirCmd.exe changeappvolume focused -0.02


; "CTRL + SHIFT END"  for mute
+^End::run C:\nircmd-x64\NirCmd.exe muteappvolume focused 2


; =========== Spotify / Foobar2k ========= ;

; "CTRL + Numpad4"  for previous 
^Numpad4::Media_Prev


; "CTRL + Numpad6"  for next 
^Numpad6::Media_Next


; "CTRL + P"  for pause
+^P::Media_Play_Pause

; "CTRL + Insert"  for volume up
^Insert::
run C:\nircmd-x64\NirCmd.exe changeappvolume spotify.exe 0.01
run C:\nircmd-x64\NirCmd.exe changeappvolume foobar2000.exe 0.01
Return


; "CTRL + Home"  for volume down
^Home::
run C:\nircmd-x64\NirCmd.exe changeappvolume spotify.exe -0.01
run C:\nircmd-x64\NirCmd.exe changeappvolume foobar2000.exe -0.01
Return


; "CTRL + END"  for mute
^End::
run C:\nircmd-x64\NirCmd.exe muteappvolume spotify.exe 2
run C:\nircmd-x64\NirCmd.exe muteappvolume foobar2000.exe 2
Return


; ====== Sharex ====== ;
ProcessExist(Name){
	Process,Exist,%Name%
	return Errorlevel
}

~$PrintScreen::
If !ProcessExist("Sharex.exe")
{
run C:\portable\ShareX\ShareX.exe -p -PrintScreen -autoclose
Return
}

~^PrintScreen::
If !ProcessExist("Sharex.exe")
{
run C:\portable\ShareX\ShareX.exe -p -RectangleRegion -autoclose
Return
}

~+PrintScreen::
If !ProcessExist("Sharex.exe")
{
run C:\portable\ShareX\ShareX.exe -p -ScreenRecorder -autoclose
Return
}

; ======== Path of Exile =======;

#IfWinActive Path Of Exile
#IfWinActive ahk_class Direct3DWindowClass
{
!F5:: ;toggle runes
++z
if z = 3 ; The number of actions plus 1.
z = 1
if z=1
{
	Run, C:\Portable\poe\PoEHUD-2.4.0g\poehud.lnk
}
if z=2
{
	Run, C:\Portable\poe\PoEHUD-2.4.0g\killprocess.vbs
}
Return
}

; ============ Dota 2 ======== ;

#IfWinActive Dota 2
#IfWinActive ahk_class SDL_app
{

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
Send {F18} ;Toggle Mouse Repeat
KeyWait, Space
Send {F18} ;Toggle Mouse Repeat
Return

~F2::
t = 4
return

~F1::
t = 1
return

~t:: ;toggle runes
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
Return

~m:: ;Mute + Disable Voip Sound
Send, {F13}{Sleep 50}{F14}
Return
}