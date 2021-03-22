@echo off
rem ############################################
rem  File Copy to Network(WindowsからLinuxへ)
rem    ◆期待する引数：
rem      %1：コピーしたいファイル（←ドラッグ＆ドロップ）
rem          1個だけを想定
rem ############################################

rem コマンドライン引数に1を渡していないと終了する
if "%1" neq "1" (
    exit /b
)
rem 本batの起動ディレクトリをカレントディレクトリにする
cd /d %~dp0

rem WinSCP Path
set WinSCP_Exe="C:\Program Files (x86)\WinSCP\WinSCP.exe"


rem コピーしたいファイルのフルパス
set TARGET_FILE=%1

rem linuxへput処理
%WinSCP_Exe% /console /script="putscript.txt" /parameter %TARGET_FILE%


exit /b 0