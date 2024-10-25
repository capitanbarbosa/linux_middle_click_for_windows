#Requires AutoHotkey v2.0

MButton::
{
    prevClipboard := A_Clipboard
    A_Clipboard := ""

    if (A_Cursor = "IBeam")
    {
        ; Over a text input, attempt to cut
        Send("^x")
    }
    else
    {
        ; Not over a text input, attempt to copy
        Send("^c")
    }

    ClipWait(0.1)
    
    if (A_Clipboard != "")
    {
        ; Text was selected and copied/cut, keep it in clipboard
        return
    }
    
    if (A_Cursor = "IBeam")
    {
        ; No text was selected in a text input, paste the previous clipboard content
        A_Clipboard := prevClipboard
        Send("^v")
    }
    else
    {
        ; No text was selected outside of a text input, send normal middle click
        Send("{MButton}")
    }
}