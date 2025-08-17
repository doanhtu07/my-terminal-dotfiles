; Cool alternative solutions:
; - https://github.com/dankrusi/WindowsVirtualDesktopHelper

; References:
; - https://github.com/Ciantic/VirtualDesktopAccessor
; - https://github.com/pmb6tz/windows-desktop-switcher

#Requires AutoHotkey v2.0

; ================================
; Constants
; ================================
WM_ACTIVATE := 0x0006
WA_ACTIVE := 1
WA_CLICKACTIVE := 2

; ================================
; Load DLL + Imports
; ================================
DllCall("LoadLibrary", "str", ".\utils\VirtualDesktopAccessor.dll")

; function exports we'll need
GoToDesktopNumber := DllCall("GetProcAddress", "ptr", DllCall("GetModuleHandle", "str", "VirtualDesktopAccessor.dll", "ptr"), "astr", "GoToDesktopNumber", "ptr")
GetCurrentDesktop := DllCall("GetProcAddress", "ptr", DllCall("GetModuleHandle", "str", "VirtualDesktopAccessor.dll", "ptr"), "astr", "GetCurrentDesktopNumber", "ptr")
IsWindowOnDesktopNumber := DllCall("GetProcAddress", "ptr", DllCall("GetModuleHandle", "str", "VirtualDesktopAccessor.dll", "ptr"), "astr", "IsWindowOnDesktopNumber", "ptr")

; ================================
; Find the foremost window on a desktop
; ================================
FindForemostWindowOnDesktop(desktopNum) {
    targetDesktop := desktopNum - 1
    winList := WinGetList()
    for hwnd in winList {
        if DllCall(IsWindowOnDesktopNumber, "ptr", hwnd, "int", targetDesktop) {
            return hwnd
        }
    }
    return 0
}

; ================================
; Switch + Focus Function
; ================================
SwitchDesktop(num) {
    ; switch to desktop
    DllCall(GoToDesktopNumber, "int", num - 1)

    ; find and activate the foremost window on that desktop
    hwnd := FindForemostWindowOnDesktop(num)
    if hwnd {
        DllCall("SetForegroundWindow", "uptr", hwnd)
    }
}

; ================================
; Hotkeys: Alt+Number
; ================================
!1:: SwitchDesktop(1)
!2:: SwitchDesktop(2)
!3:: SwitchDesktop(3)
!4:: SwitchDesktop(4)
!5:: SwitchDesktop(5)
!6:: SwitchDesktop(6)
!7:: SwitchDesktop(7)
!8:: SwitchDesktop(8)
!9:: SwitchDesktop(9)