#SingleInstance force
#Persistent
#MaxHotkeysPerInterval 200
#HotkeyInterval 0
#InstallKeybdHook
#NoTrayIcon
#UseHook On
SendMode Input

;=== Any Game Borderless Windowed ==;
^+b::
#Include C:\Portable\Autohotkey\Lib\borderless.ahk

;======  Reload ======;
+^R::
SplashTextOn, , , Script Reloaded
Sleep, 300
SplashTextOff
Reload
return

;======= Change Power Plan ======;
#p::
SetWorkingDir C:\Portable\Autohotkey
RunWait %comspec% /k powercfg /getactivescheme > power.txt &&exit , , hide
FileRead, cfg, power.txt
if not ErrorLevel ;Successfully loaded

{
IfInString, cfg, Equilibrado
{
SplashTextOn, , , Modo de Energia: Alto Desempenho
Sleep, 300
SplashTextOff
RunWait, %comspec% /k powercfg /setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c &&exit , , hide ;guid for "Alto Desempenho"
}

IfInString, cfg, Alto Desempenho
{
SplashTextOn, , , Modo de Energia: Equilibrado
Sleep, 300
SplashTextOff
RunWait, %comspec% /k powercfg /setactive 381b4222-f694-41f0-9685-ff5bb260df2e &&exit , , hide ;guid for "Equilibrado"
}

cfg = ;Free the memory

}

;======= Mixer Volume Control for Focused Application =======;

; "CTRL + SHIFT  INSERT"  for volume up
+^Insert::run C:\nircmd-x64\NirCmd.exe changeappvolume focused 0.02,,hide


; "CTRL + SHIFT HOME"  for volume down
+^Home::run C:\nircmd-x64\NirCmd.exe changeappvolume focused -0.02,,hide


; "CTRL + SHIFT END"  for mute
+^End::run C:\nircmd-x64\NirCmd.exe muteappvolume focused 2,,hide


; =========== Spotify / Foobar2k ========= ;

; "CTRL + Numpad4"  for previous 
^Numpad4::Media_Prev


; "CTRL + Numpad6"  for next 
^Numpad6::Media_Next


; "CTRL + SHIFT + P"  for pause
+^P::Media_Play_Pause

; "CTRL + Insert"  for volume up
^Insert::
run C:\nircmd-x64\NirCmd.exe changeappvolume spotify.exe 0.01,,hide
run C:\nircmd-x64\NirCmd.exe changeappvolume foobar2000.exe 0.01,,hide
run C:\nircmd-x64\NirCmd.exe changeappvolume gmusic.exe 0.01,,hide
Return


; "CTRL + Home"  for volume down
^Home::
run C:\nircmd-x64\NirCmd.exe changeappvolume spotify.exe -0.01,,hide
run C:\nircmd-x64\NirCmd.exe changeappvolume foobar2000.exe -0.01,,hide
run C:\nircmd-x64\NirCmd.exe changeappvolume gmusic.exe -0.01,,hide
Return


; "CTRL + END"  for mute
^End::
run C:\nircmd-x64\NirCmd.exe muteappvolume spotify.exe 2,,hide
run C:\nircmd-x64\NirCmd.exe muteappvolume foobar2000.exe 2,,hide
run C:\nircmd-x64\NirCmd.exe muteappvolume gmusic.exe 2,,hide
Return

; "CTRL + SHIFT + M" mute mic
+^M::
mute := VA_GetMasterMute("WO Mic Device")
VA_SetMasterMute(!mute, "WO Mic Device")
if mute = 1 
{
Soundset, 60
SoundPlay, C:\Portable\Autohotkey\unmuted.mp3
Sleep, 500
Soundset, 100
}
else
{
Soundset, 60
SoundPlay, C:\Portable\Autohotkey\muted.mp3
Sleep, 500
Soundset, 100
}
return

; ====== Sharex ====== ;
ProcessExist(Name){
	Process,Exist,%Name%
	return Errorlevel
}

~$PrintScreen::
If !ProcessExist("Sharex.exe")
{
run C:\portable\ShareX\ShareX.exe -p -PrintScreen -autoclose,,hide
Return
}

~^PrintScreen::
If !ProcessExist("Sharex.exe")
{
run C:\portable\ShareX\ShareX.exe -p -RectangleRegion -autoclose,,hide
Return
}

~+PrintScreen::
If !ProcessExist("Sharex.exe")
{
run C:\portable\ShareX\ShareX.exe -p -ScreenRecorder -autoclose,,hide
Return
}

; ======== Path of Exile =======;

#IfWinActive Path Of Exile
#IfWinActive ahk_class POEWindowClass
#MaxThreadsPerHotkey 2
{
!F5:: ;toggle poehud
{
++z
if z = 3 ; The number of actions plus 1.
z = 1
if z=1
{
	SplashTextOn, , , PoEHud Enabled
	Sleep, 300
	SplashTextOff
	Runwait, C:\Portable\poe\PoEHUD-x64_3.0.0b\startpoe.lnk,,hide
}
if z=2
{
	SplashTextOn, , , PoEHud Disabled
	Sleep, 300
	SplashTextOff
	Runwait, C:\Portable\poe\PoEHUD-x64_3.0.0b\close.vbs,,hide

}
}
Return

!F7:: ;toggle poetrademacro
{
++p
if p = 3 ; The number of actions plus 1.
p = 1
if p=1
{
	Run, C:\Portable\poe\POE-TradeMacro\Run_TradeMacro.ahk,,hide
}
if p=2
{
	fullScriptPath = C:\Portable\poe\POE-TradeMacro\Run_TradeMacro.ahk
	DetectHiddenWindows, On 
	WinClose, %fullScriptPath% ahk_class AutoHotkey
}
}
Return


!h::
x:= 1135 ;x coordinate of pixel to check.
y:= 690 ;y coordinate of pixel to check.
targetcolor:= 0x110ED7 ;color to be matched in hexadecimal blue-green-red (BGR) format.
toggle := !toggle
 if (toggle) {
SplashTextOn, 135, 0, Auto Haste Enabled,
Sleep, 1000
SplashTextOff
 }
Loop
{
	If (toggle) {
	PixelGetColor, currentcolor, x, y
    if (currentcolor=targetcolor)
    {
	Sleep, 50
	BlockInput On
	Sendinput {A}
	BlockInput Off
	continue
		}
			}
	Else {	
	SplashTextOn, 135, 0, Auto Haste Disabled,
	Sleep, 500
	SplashTextOff
	break
	}
}
Return

;====== Whisper MESSAGE 1 ======
!z::
	BlockInput On
	SendInput ^{Enter}Prices are fixed thanks for interest though.{Enter}
	BlockInput Off
	return	
;====== Whisper MESSAGE 2 ======
!x::
	BlockInput On
	SendInput ^{Enter}Sold, thanks for interest though.{Enter}
	BlockInput Off
	return		
;====== Whisper MESSAGE 3 ======
!e::
	BlockInput On
	SendInput ^{Enter}ty{Enter}
	BlockInput Off
	return
;====== INVITE WHISPERER ======
!q::
	BlockInput On
	SendInput ^{Enter}{Home}{Delete}/invite {Enter}{enter}{up}{up}{escape}
	BlockInput Off
	return
;====== TRADE WHISPERER ======
!w::
	BlockInput On
	SendInput ^{Enter}{Home}{Delete}/tradewith {Enter}{enter}{up}{up}{escape}
	BlockInput Off
	return
;====== Kick WHISPERER ======
!r::
	BlockInput On
	SendInput ^{Enter}{Home}{Delete}/kick {Enter}{enter}{up}{up}{escape}
	BlockInput Off
	return
;====== Kick Me ======
!t::
	BlockInput On
	SendInput ^{Enter}/kick Chill_Penguin{Enter}
	SendInput ^{Enter}/kick zzTenActs{Enter}
	BlockInput Off
	return
;====== GO TO MY HIDEOUT ======	
!f::
	BlockInput On
	SendInput {Enter}/hideout{Enter}{enter}{up}{up}{escape}
	BlockInput Off
	return
}
;====== GO TO WHISPERER HIDEOUT ======
!a::
	BlockInput On
	SendInput ^{Enter}{Home}{Delete}/hideout {Enter}{enter}{up}{up}{escape}
	BlockInput Off
	return
;====== Paste Clipboard ======
!s::
	Sleep 30
	BlockInput On
	SendInput {Enter}/{Home}{Delete}%clipboard%{Enter}
	BlockInput Off
	return
	
;====== Paste Ruby ======
F16::
	Sleep 20
	BlockInput On
	SendInput {Enter}/{Home}{Delete}%clipboard%{Enter}
	BlockInput Off
	return	
	
;====== Vaal Spark =======;
~$Capslock::
PixelGetColor, color, 1131, 693
IfEqual, color, 0x3F3EDD
{
	Sleep 20
	BlockInput On
	Sleep, 20
	SendInput {1}{2}{3}
	Sleep, 20
	SendInput {F}
	Sleep, 20
	SendInput {D}
	BlockInput Off
	Sleep, 1250
	BlockInput On
	SendInput {1}
	BlockInput Off
	return
}
return
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