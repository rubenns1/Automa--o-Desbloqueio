#NoTrayIcon
#include <File.au3>
#include <Misc.au3>

HotKeySet("{ESC}", "Close")
HotKeySet("{F2}", "_Pause")

$hFile = FileOpen(@Desktopdir & "\wSaídas.txt", 0)

While 1
	$hLine = FileReadLine($hFile)
	If @error = -1 Then ContinueLoop
	ClipPut($hLine)
	;ConsoleWrite($hLine & @CRLF)
	WinActivate("NoxPlayer")
	Local $hWnd = WinWait("[CLASS:Qt5QWindowIcon]", "", 0)
	ControlFocus($hWnd, "[CLASS:subWin; INSTANCE:1]", "")
	Send("^v")
	Send("{ENTER}")
	$a = InputBox("Debloqueio Coletor", "Entre com a posição a ser desbloqueada.", "...")
	ClipPut($a)
	Send("^v")
	;Send("{ENTER}{ENTER}")
	_Pause()
WEnd

FileClose($hFile)

Func Close()
	Exit
EndFunc

Func _Pause()
    If MsgBox(4+32, "Pause", "Pretende continuar?") = 7 Then
		Exit
	EndIf
EndFunc