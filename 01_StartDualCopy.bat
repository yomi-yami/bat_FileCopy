@echo off
rem ############################################
rem  File Copy to Network(Windows2LinuxとWindows2Windowsを呼び出し)
rem  windowsから２種の環境へファイルを配置する。
rem    ◆期待する引数：
rem      %1：コピーしたいファイル（←ドラッグ＆ドロップ）
rem          1個だけを想定
rem ############################################

rem 本batの起動ディレクトリをカレントディレクトリにする
cd /d %~dp0

rem WinSCP Path
set WinSCP_Exe="C:\Program Files (x86)\WinSCP\WinSCP.exe"

rem 初期化
set TARGET_FILE=
rem 入力要求(ドラッグ・アンド・ドロップで入力想定)
set /P TARGET_FILE="コピーしたいファイルのフルパスを入力してください: "

rem linuxへput処理
rem call "Windows2Linux\Windows2Linux.bat" %TARGET_FILE%
rem 本batの起動ディレクトリをカレントディレクトリに戻る
rem cd /d %~dp0

rem linuxへput処理
call "Windows2Windows\Windows2Windows.bat" %TARGET_FILE%
rem 本batの起動ディレクトリをカレントディレクトリに戻る
cd /d %~dp0


exit /b 0