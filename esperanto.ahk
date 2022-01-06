#SingleInstance force
#CommentFlag //
#Hotstring c ? z * o

// Esperanto Orthography Script
// Version 1.0
// Converts the "x" system into the correct letters
// Written by Winggar

// Lowercase

:*:Cx::
SendUnicodeChar(0x108)
Return

:*:Hx::
SendUnicodeChar(0x124)
Return

:*:Gx::
SendUnicodeChar(0x11C)
Return

:*:Jx::
SendUnicodeChar(0x134)
Return

:*:Sx::
SendUnicodeChar(0x15C)
Return

:*:Ux::
SendUnicodeChar(0x16C)
Return

// Uppercase

:*:cx::
SendUnicodeChar(0x109)
Return

:*:hx::
SendUnicodeChar(0x125)
Return

:*:gx::
SendUnicodeChar(0x11D)
Return

:*:jx::
SendUnicodeChar(0x135)
Return

:*:sx::
SendUnicodeChar(0x15D)
Return

:*:ux::
SendUnicodeChar(0x16D)
Return

// Cyrillic

:*:Уе::
SendUnicodeChar(0x40e)
return
:*:Дж::
SendUnicodeChar(0x40f)
return


:*:уе::
SendUnicodeChar(0x45e)
return
:*:дж::
SendUnicodeChar(0x45f)
return

// Bypass

:*:'x::x
:*:'ж::ж
:*:'е::е

// Functions

SendUnicodeChar(charCode)

{
	VarSetCapacity(ki, 28 * 2, 0)
	EncodeInteger(&ki + 0, 1)
	EncodeInteger(&ki + 6, charCode)
	EncodeInteger(&ki + 8, 4)
	EncodeInteger(&ki +28, 1)
	EncodeInteger(&ki +34, charCode)
	EncodeInteger(&ki +36, 4|2)

	DllCall("SendInput", "UInt", 2, "UInt", &ki, "Int", 28)
}

EncodeInteger(ref, val)
{
	DllCall("ntdll\RtlFillMemoryUlong", "Uint", ref, "Uint", 4, "Uint", val)
}



