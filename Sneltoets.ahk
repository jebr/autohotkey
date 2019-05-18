;____________________________________
;_____SYMBOL EXPLANATION_____________
; "!" = ALT
; "^" = CTRL

;____________________________________
;_____MENU SETTINGS__________________

#SingleInstance,Force

applicationname=JBS-Tools
root=C:\windows\system32

;Gosub,READINI
Gosub,TRAYMENU
Gosub,GUI
Return

;____________________________________
;_____GUI____________________________

GUI:
;GUI, Destroy
;Gui, +Resize

;____________________________________
;_____INPUTS_________________________
;Gui, Add, Slider, vMySlider, 50
;Gui, Add, GroupBox, w200 h150, Geographic Criteria
;Gui, Font, s10, Verdana
;Gui, Add, Text, x20 y10 , Change Brightness Monitor'
;Gui, Add, Picture, x10 y25 gBrightDown w64 h64, back.ico
;Gui, Add, Picture, x80 y25 gBrightUp w64 h64, forward.ico


Gui, Add, TAB2, x0 y+2 w502, Network|Windows|Programs|Hotkey List

Gui, Tab, Network
Gui, Font, s10 normal,
Gui, Add, Picture,x10 y+10 w32 h32 gNetworkAdapters, test.ico
Gui, Font, bold
Gui, Add, Text,x+10 gNetworkAdapters, Network Adapters

Gui, Tab, Windows
Gui, Font, s10 normal,
Gui, Add, Picture, x10 y+10 w32 h32 gTelnet, test.ico
Gui, Add, Picture, x10 y+10 w32 h32 gRemoteDesktop, test.ico
Gui, Add, Picture, x10 y+10 w32 h32 gRemoteDesktop, test.ico
Gui, Font, bold
Gui, Add, Text, x+10 gTelnet, Telnet
Gui, Add, Text, x+10 gRemoteDesktop, Remote-Desktop
Gui, Add, Text, x+10 gSerialConnection, Serial-Connection

Gui, Tab, Programs
Gui, Font, s10
Gui, Add, Text, x+10 y+10 gPutty, Putty

;Gui, Add, Tab2,, Brightness|Network|View|Hotkeys

;TAB 1 Brightness
;Gui, Tab, Brightness
;Gui, Font, s24 bold, Verdana
;Gui, Add, Picture, x80 y100 gbrightUp w128 h128, Up.ico
;Gui, Add, Picture, x210 y100 gbrightDown w128 h128, Down.ico

;TAB 2 Network
;Gui, Tab, Network
;Gui, Font, s8, Verdana
;Gui, Font, s10 normal, Verdana
;Gui, Add, Picture, x20 y50 gNetworkSettings w32 h32 , Network.ico
;Gui, Add, Text, x60 y60, Network Settings

;Gui, Add, Picture, x20 y80 gPortActivity w32 h32 , Network.ico
;Gui, Add, Text, x60 y90, Port Activity

;Gui, Add, Picture, x20 y110 gPortActivity w32 h32 , Network.ico
;Gui, Add, Text, x60 y120, Port Activity

;Gui, Add, Picture, x20 y140 gPortActivity w32 h32 , Network.ico
;Gui, Add, Text, x60 y150, Port Activity

;Gui, Add, Picture, x20 y170 gPortActivity w32 h32 , Network.ico
;Gui, Add, Text, x60 y180, Port Activity

;=====Column 2=======
;Gui, Add, Picture, x200 y50  gPingHost  ww32 h32 , Network.ico
;Gui, Add, Text, x240 y60, Ping Host
;Gui, Add, Edit,, 
;Gui, Add, Button, gPingHost Default, OK

;PingHost:
;Gui, Submit, NoHide
;Run cmd.exe
;Sleep 200
;SetEnv,PingHost
;Send {Enter}
;Return

;Gui, Add, Picture, x200 y80 gPortActivity w32 h32 , Network.ico
;Gui, Add, Text, x240 y90, Port Activity

;Gui, Add, Picture, x200 y110 gPortActivity w32 h32 , Network.ico
;Gui, Add, Text, x240 y120, Port Activity

;Gui, Add, Picture, x200 y140 gPortActivity w32 h32 , Network.ico
;Gui, Add, Text, x240 y150, Port Activity

;Gui, Add, Picture, x200 y170 gPortActivity w32 h32 , Network.ico
;Gui, Add, Text, x240 y180, Port Activity


;TAB 3 View
;Gui, Tab, View
;Gui, Font, s10 normal, Verdana
;Gui, Add, Picture, x20 y50 gNetworkSettings w32 h32 , Network.ico
;Gui, Add, Text, x60 y60, Network Settings

;Gui, Add, Picture, x20 y80 gPortActivity w32 h32 , Network.ico
;Gui, Add, Text, x60 y90, Port Activity

;Gui, Add, Picture, x20 y110 gPortActivity w32 h32 , Network.ico
;Gui, Add, Text, x60 y120, Port Activity

;Gui, Add, Picture, x20 y140 gPortActivity w32 h32 , Network.ico
;Gui, Add, Text, x60 y150, Port Activity

;Gui, Add, Picture, x20 y170 gPortActivity w32 h32 , Network.ico
;Gui, Add, Text, x60 y180, Port Activity
;Gui, Add, Text, x20 y50 gNetworkSettings w100 h50, Network Settings

;TAB 4 Hotkeys
;Gui, Tab, Hotkeys
;Gui, Font, s8 normal, Verdana
;Gui, Add, Text, x20 y50, Brightness Up %A_Tab% %A_Tab% = RControl + Numpad2|MouseWheel Up
;Gui, Add, Text, x20 y65, Brightness Down %A_Tab% = RControl + Numpad1|MouseWheel Down
;Gui, Add, Text, x20 y80, Google %A_Tab% %A_Tab% %A_Tab% = ALT + G
;Gui, Add, Text, x20 y140, Firefox %A_Tab% %A_Tab% %A_Tab% = ALT + F 
;Gui, Add, Text, x20 y95, Notepad++ %A_Tab% %A_Tab% = ALT + N
;Gui, Add, Text, x20 y110, Enable/Disable AHK %A_Tab% = CTRL + ALT + S
;Gui, Add, Text, x20 y125, Show Window %A_Tab% %A_Tab% = ALT + W
;Gui, Add, Text, x20 y140, AHK Help %A_Tab% %A_Tab% = ALT + /

;Gui, Add, StatusBar,,%A_Tab%Copyright 2014 | Jeroen Brauns
Gui, Show, W500 H250 Hide, %applicationname%
Return

;_____________________________________
;_____OUTPUTS_________________________

BrightUp:
Gui, Submit, NoHide
Run changeBrightnessUp.bat
Return

BrightDown:
Gui, Submit, NoHide
Run changeBrightnessDown.bat
Return

;Network Tab
NetworkSettings:
Gui, Submit, Hide
Run %root%\ncpa.cpl
Return

PortActivity:
Gui, Submit, Hide
Run %root%\netstat -a -b -n -t
Return

NetworkAdapters:
Gui, Submit, Minimize
Run RunDll32.exe shell32.dll Control_RunDLL ncpa.cpl
;Run RunDll32.exe keymgr.dll KRShowKeyMgr
Return

;Windows Tab
Telnet:
Gui, Submit, Minimize
Run %ProgramFiles%\Putty\Putty.exe -telnet
Return

RemoteDesktop:
Gui, Submit, Minimize
Run mstsc.exe
Return

SerialConnection:
Gui, Submit, NoHide
Run %ProgramFiles%\Putty\Putty.exe -serial
Return

;Program Tab
Putty:
Gui, Submit, NoHide
Run %ProgramFiles%\Putty\Putty.exe
Return



;!F6::
;{
;	DetectHiddenWindows, On
;	Winget, Winlist, List
;	loop, %Winlist%
;	{
;		WinToMin := Winlist%A_Index%
;		WinMinimize, ahk_id %WinToMin%
;	}
;	WinActivate, ahk_class Progman
;	
;	;WinHide, ahk_class Chrome_WidgetWin_1
;	Return
;}

;!F7::
;{
;	DetectHiddenWindows, On 
;	Winget, HiddenList, List
;	loop, %HiddenList%
;	{
;		GetWin := HiddenList%A_Index%
;		WinShow, ahk_id %GetWin%
;	}
;	;WinShow, ahk_class Chrome_WidgetWin_1
;	Return
;}

;PingHost:
;Gui, Submit, NoHide
;Run cmd.exe
;sleep 200
;Send Ping 10.11.1.1 
;Send {Enter}
;Return

TRAYMENU:
Menu,Tray,NoStandard 
Menu,Tray,DeleteAll 
Return

;_____________________________________
;___________ LOG SCRIPT ______________
!l::
current=%A_DD%/%A_MM%/%A_YYYY% %A_Hour%:%A_Min% 
InputBox, inputProject, Log Werkzaamheden, Project?, , 380, 170
InputBox, inputWork, Log Werkzaamheden, Welke werkzaamheden uitgevoerd?, , 380, 170
InputBox, inputstart, Log Werkzaamheden, Starttijd, , 380, 170
InputBox, inputStop, Log Werkzaamheden, Eindtijd, , 380, 170
InputBox, inputContact, Log Werkzaamheden, Contactpersoon, , 380, 170
InputBox, inputTel, Log Werkzaamheden, Telefoonnummer, , 380, 170
If Not ErrorLevel
{
FileAppend,`n Datum: %current%`n Project: %inputProject%`n Werkzaamheden: %inputWork%`n Tijd aanvang: %inputstart%`n Tijd einde: %inputStop%`n Contactpersoon: %inputContact%`n Telefoonnummer: %inputTel%`n, C:\Users\Administrator\Desktop\Helpdesk.txt
FileAppend,`n, C:\Users\Administrator\Desktop\Helpdesk.txt

}
return

^!l:: Run D:\Network_Settings\Log.txt



EXIT:
ExitApp