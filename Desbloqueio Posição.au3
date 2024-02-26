#NoTrayIcon
#include <File.au3>
#include <Misc.au3>

Global Const $app = "App v0.1"
Global Const $hFile = FileOpen(@Desktopdir & "\wSaídas.txt", 0)

HotKeySet("{ESC}", "Close")
HotKeySet("{F2}", "_Pause")

Main()

Func Main()
	If (MsgBox(4+32, $app, "Deseja realizar o download dos relatórios (*.PDF)?") = 6) Then
		$getUrl = InputBox($app, "Informe a URL da base:", null)
		$fmtUrl = $getUrl & "/Relsaidas/pickingacompanhamento/"
		$countLines = _FileCountLines($hFile)

		For $i = 1 To $countLines
			$fmtLines = FileReadLine($hFile, $i)
			ConsoleWrite($fmtUrl & $fmtLines & @CRLF)
			ShellExecute($fmtUrl & $fmtLines)
		Next
	Else
		Exit
	EndIf
EndFunc

Func Funcs()
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
EndFunc

Func Close()
	FileClose($hFile)
	Exit
EndFunc

Func _Pause()
    If MsgBox(4+32, "Pause", "Pretende continuar?") = 7 Then
		Exit
	EndIf
EndFunc