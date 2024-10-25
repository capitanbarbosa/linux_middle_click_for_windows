#Requires AutoHotkey v2.0

MButton::
{
    ; Check if the cursor is over an edit control or other text input
    if (A_Cursor = "IBeam")
    {
        prevClipboard := A_Clipboard
        A_Clipboard := ""
        
        ; Try to copy any selected text
        Send("^c")
        ClipWait(0.5)
        
        if (A_Clipboard != "")
        {
            ; Text was selected and copied, keep it in clipboard
            return
        }
        
        ; If no text was copied and no text is selected, paste the previous clipboard content
        if (A_Clipboard == "")
        {
            A_Clipboard := prevClipboard
            Send("^v")
            return
        }
        
        ; If no text was copied, try to select all text and copy
        Send("^a^c")
        ClipWait(0.5)
        
        if (A_Clipboard != "")
        {
            ; Text was copied after selecting all, keep it in clipboard
            Send("{Right}")  ; Move cursor to end of text
            return
        }
        
        ; If still no text, paste the previous clipboard content
        A_Clipboard := prevClipboard
        Send("^v")
    }
    else
    {
        ; Not over a text input, send normal middle click
        Send("{MButton}")
    }
}