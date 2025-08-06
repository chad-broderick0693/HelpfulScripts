; ================================
; Vim-style count prefix for Alt+j/k (with optional highlighting when Shift is held)
; ================================
#NoEnv                       ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn                        ; Enable warnings to assist with detecting common errors.
SendMode Input               ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

global VimCount := ""        ; Holds the numeric prefix

; ——— Collect numeric prefix when Alt+digit is pressed ———
!0::CollectCount("0")
!1::CollectCount("1")
!2::CollectCount("2")
!3::CollectCount("3")
!4::CollectCount("4")
!5::CollectCount("5")
!6::CollectCount("6")
!7::CollectCount("7")
!8::CollectCount("8")
!9::CollectCount("9")

CollectCount(digit) {
    global VimCount
    VimCount .= digit
    Return
}

; ——— Helper to fetch and reset the count (defaulting to 1) ———
GetCount() {
    global VimCount
    if (VimCount = "")
        count := 1
    else
        count := VimCount

    ; Prevent accidental typing of large number that locks the system
    if (count > 200)
        count := 1

    VimCount := ""
    return count
}

; ——— Vim‐style motions ———
!j::  ; Alt + j → move down by count
    {
        c := GetCount()
        Loop %c%
            Send {Down}
    }
Return

!k::  ; Alt + k → move up by count
    {
        c := GetCount()
        Loop %c%
            Send {Up}
    }
Return

; ——— Vim‐style highlight motions (when Shift is held) ———
!+j::  ; Alt+Shift + j → highlight down by count
    {
        c := GetCount()
        Loop %c%
            Send +{Down}
    }
Return

!+k::  ; Alt+Shift + k → highlight up by count
    {
        c := GetCount()
        Loop %c%
            Send +{Up}
    }
Return

; ================================
; Normal Vim Motions Style Mapping
; ================================
; ALT Keypress Implied for all below
!h::Send {LEFT}     ; h ←
!l::Send {RIGHT}    ; l →
!g::Send {HOME}     ; g ↖ (start of line)
!;::Send {END}      ; ; ↘ (end of line)
!u::Send ^{HOME}    ; u Ctrl+Home (start of document)
!o::Send ^{END}     ; o Ctrl+End  (end of document)

; CTRL + ALT Keypress Implied for all below
!^h::Send ^{LEFT}   ; Alt+Ctrl+h ← (by word)
!^l::Send ^{RIGHT}  ; Alt+Ctrl+l → (by word)

; SHIFT + ALT Keypress Implied for all below (excluding j/k which are now overridden)
!+h::Send +{LEFT}   ; Alt+Shift+h highlight ←
!+l::Send +{RIGHT}  ; Alt+Shift+l highlight →
!+g::Send +{HOME}   ; Alt+Shift+g highlight to start of line
!+;::Send +{END}    ; Alt+Shift+; highlight to end of line
!+u::Send ^+{HOME}  ; Alt+Shift+u highlight to start of document
!+o::Send ^+{END}   ; Alt+Shift+o highlight to end of document

; SHIFT + CTRL + ALT Keypress Implied for all below
!+^h::Send +^{LEFT}  ; Alt+Ctrl+Shift+h highlight by word left
!+^l::Send +^{RIGHT} ; Alt+Ctrl+Shift+l highlight by word right
!+^k::Send +!{UP}    ; Alt+Ctrl+Shift+k multiply cursor up
!+^j::Send +!{DOWN}  ; Alt+Ctrl+Shift+j multiply cursor down

; CTRL + SHIFT Keypress Implied for all below
+^k::Send +^{UP}      ; Ctrl+Shift+k scroll up
+^j::Send +^{DOWN}    ; Ctrl+Shift+j scroll down

; ================================
; End of script
; ================================
