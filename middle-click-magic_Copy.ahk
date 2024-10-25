#Requires AutoHotkey v2.0

MButton::
{
    ; Check if the cursor is over an edit control or other text input
    if (A_Cursor = "IBeam")
    {
        ; Current functionality for text selection
        prevClipboard := A_Clipboard
        A_Clipboard := ""
        Send("^c")
        ClipWait(0.1)
        
        if (A_Clipboard != "")
        {
            ; Text was selected, keep it in clipboard
            return
        }
        
        ; No text was selected, paste the previous clipboard content
        A_Clipboard := prevClipboard
        Send("^v")
    }
    else
    {
        ; Not over a text input, send normal middle click
        Send("{MButton}")
    }
}