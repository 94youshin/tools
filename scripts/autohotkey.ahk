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

; 打开软件
!\::OpenAll()
!w::ActivateAndOpen("WeChat.exe", "D:\app\WeChat\WeChat.exe")
!y::ActivateAndOpen("语雀.exe", "D:\app\yuque-desktop\语雀.exe")
!x::ActivateAndOpen("Xshell.exe","D:\app\NetSarang\Xshell 7\Xshell.exe")
!t::ActivateAndOpen("sublime_text.exe", "D:\app\Sublime Text\sublime_text.exe")
!n::ActivateAndOpen("navicat.exe", "D:\app\Navicat Premium 15\navicat.exe")
!e::ActivateAndOpen("msedge.exe", "C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe")

; 发送内容到粘贴板
#1::SendToClipBoard("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")
#2::SendToClipBoard("sudo route add 172.27.0.0/16 10.122.103.1")
#3::SendToClipBoard("sudo route add 172.31.0.0/16 192.168.100.0")
#4::SendToClipBoard("2w#E4r%T^Y7uqwas")

; 打开文件夹
+s::Run,D:\data\工作文档
