; Make sure scroll lock is off by default
SetScrollLockState, AlwaysOff

; --------------------------------------------------------------
; NOTES
; --------------------------------------------------------------
; ! = ALT
; ^ = CTRL
; + = SHIFT
; # = WIN

; Swap left cmd key with left alt - puts the Windows key in right place
;LWin::LAlt
;LAlt::LWin

; Remap cmd+Tab to Alt+Tab
;LWin & Tab::AltTab

; Media keys
LWin & F7::SendInput {Media_Prev}
LWin & F8::SendInput {Media_Play_Pause}
LWin & F9::SendInput {Media_Next}
LWin & F10::SendInput {Volume_Mute}
LWin & F11::SendInput {Volume_Down}
LWin & F12::SendInput {Volume_Up}
LWin & F13::SendInput {PrintScreen}

; Eject Key
F20::SendInput {Insert}

; Extra F keys
F16::Run calc

;Set € on key 5
RAlt & 2:: Send {LAlt Down}{NumPad0}{Numpad1}{numpad2}{numpad8}{LAlt Up}

; System shortcuts - because we have swapped alt and cmd we need to re-map some standard shortcuts
LAlt & E::Send #e ;explorer
LAlt & D::Send #d ;hide all
LAlt & M::Send #m ;minimise all
LAlt & L::DllCall("LockWorkStation") ;lock machine
;LAlt & R::Send #r ;run command

;_____________________________________
;_____HOTKEYS APPLICATIONS____________

!g::Run chrome.exe
!f::Run, firefox.exe, C:\Program Files (x86)\Mozilla Firefox\firefox.exe, max
!e::Run, iexplore.exe
!n::Run %ProgramFiles%\notepad++\Notepad++.exe, max
!p:: Run Powershell.exe
!c::Run control.exe
^!p::Run %ProgramFiles%\Putty\Putty.exe
!w::Run C:\Werk

!r::
Run, Network-Settings.cmd
return
!t::Run JBS-Projects/NirLauncher.exe
!o:: Run Outlook.exe, C:\Program Files (x86)\Microsoft Office\root\Office16\OUTLOOK.EXE, max
^!Numpad0::Shutdown, 1+8+4
RAlt::MsgBox You pressed the right ALT key.
return

!/::Run %ProgramFiles%\AutoHotkey\AutoHotkey.chm

;_____________________________________
;___________VERACRYPT CODE____________

;MOUNT
!v::run C:\Program Files\VeraCrypt\VeraCrypt.exe /q /b /l A /v e:\VirtualBox /m label=VirtualBox
!s::run C:\Program Files\VeraCrypt\VeraCrypt.exe /q /b /v e:\Software /e /m label=Software
^+s::run C:\Program Files\VeraCrypt\VeraCrypt.exe /q /b /v d:\Software /e /m label=Software /m readonly

;DISMOUNT
#l::run C:\Program Files\VeraCrypt\VeraCrypt.exe /q /b /d /f /w /s
!,::run C:\Program Files\VeraCrypt\VeraCrypt.exe /q /b /d /f /w /s


;_____________________________________
;_____HOTKEYS SYSTEM SETTINGS_________
;Disable AutoHotkey
^!s::
Suspend  ;Assign the toggle-suspend function to a hotkey.
msgbox AHK is nu omgeschakeld. Opnieuw inschakelen CTRL + ALT + S
return

;Reload AHK script
^!R::
msgbox AHK is reloaded
Reload
Return

^!Numpad1::ListHotkeys		;Geeft een overzicht van de gebruikte hotkeys (zonder acties)
