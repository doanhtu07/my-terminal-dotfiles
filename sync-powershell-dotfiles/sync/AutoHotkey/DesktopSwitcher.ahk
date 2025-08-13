; Cool alternative solutions:
; - https://github.com/dankrusi/WindowsVirtualDesktopHelper

; References:
; - https://github.com/Ciantic/VirtualDesktopAccessor
; - https://github.com/pmb6tz/windows-desktop-switcher

#Requires AutoHotkey v2.0

; Load the helper DLL
DllCall("LoadLibrary", "Str", ".\utils\VirtualDesktopAccessor.dll")

; Map Alt + 1..9 to switch desktops
!1:: SwitchDesktop(1)
!2:: SwitchDesktop(2)
!3:: SwitchDesktop(3)
!4:: SwitchDesktop(4)
!5:: SwitchDesktop(5)
!6:: SwitchDesktop(6)
!7:: SwitchDesktop(7)
!8:: SwitchDesktop(8)
!9:: SwitchDesktop(9)

SwitchDesktop(num) {
    ; Windows virtual desktops are zero-indexed
    DllCall("VirtualDesktopAccessor\GoToDesktopNumber", "Int", num - 1)
}