#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
SetTitleMatchMode 2
#WinActivateForce

SetControlDelay 0

ActivateAndOpen(t,p)
{
    IfWinNotExist,ahk_exe %t%
    Run, %p%
    Else 
    {
        IfWinActive, ahk_exe %t%
            WinMinimize
        Else
            WinActivate,				
    }
    return 0
}

;一键打开所有软件
OpenAll()
{
    IfWinNotExist,ahk_exe "Xshell.exe"
    Run, "D:\app\NetSarang\Xshell 7\Xshell.exe"
}

SendToClipBoard(t)
{
    ;清空剪切板
    clipboard =
    clipboard = %t%
    return 0
}

;
!\::OpenAll()
!x::ActivateAndOpen("Xshell.exe","D:\app\NetSarang\Xshell 7\Xshell.exe")
!w::ActivateAndOpen("WeChat.exe", "D:\app\WeChat\WeChat.exe")
!y::ActivateAndOpen("语雀.exe", "D:\app\yuque-desktop\语雀.exe")
!e::ActivateAndOpen("msedge.exe", "C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe")


#1::SendToClipBoard("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")
#2::SendToClipBoard("sudo route add 172.27.0.0/16 10.122.103.1")
#3::SendToClipBoard("sudo route add 172.31.0.0/16 192.168.100.0")
