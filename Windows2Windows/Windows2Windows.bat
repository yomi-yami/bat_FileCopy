@echo off
rem ############################################
rem  File Copy to Network(WindowsからWindowsへ)
rem    ◆期待する引数：
rem      %1：コピーしたいファイル（←ドラッグ＆ドロップ）
rem          1個だけを想定
rem ############################################

rem ############################################
rem ネットワークドライブ名
set NETWORKDRIVE=X:
set NETWORKDIR="\\192.168.11.12\test2"
set NETWORKDIR_USER="win10"
set NETWORKDIR_PASSWORD="wizlife"
rem ############################################
rem コマンドライン引数に1を渡していないと終了する
if "%1" neq "1" (
    exit /b
)
rem 本batの起動ディレクトリをカレントディレクトリにする
cd /d %~dp0

rem コピーしたいファイルのフルパス
set TARGET_FILE=%1
rem コピーしたいファイル名＋拡張子のみ
set TARGET_FILE_NAME=%~n1%~x1

set YYMMDD=%date:~2,2%%date:~5,2%%date:~8,2%

set NET_USE_CMD=net use %NETWORKDRIVE%

rem /Y オプションは上書き確認
rem set COPY_CMD=copy /Y %TARGET_FILE% %NETWORKDRIVE%\.
set COPY_CMD=copy /-Y %TARGET_FILE% %NETWORKDRIVE%\.


rem ############################################
rem メイン処理
rem ############################################
rem 1.マウント
%NET_USE_CMD% %NETWORKDIR% /user:%NETWORKDIR_USER% %NETWORKDIR_PASSWORD%

rem 2.コピー先にファイルが有る場合は、バックアップファイルを作成
rem 空白があるとバックアップ失敗する。
set SERVER_FILE=%NETWORKDRIVE%\%TARGET_FILE_NAME%
if not exist %SERVER_FILE%.%YYMMDD% (
    copy %SERVER_FILE% %SERVER_FILE%.%YYMMDD% 
)
rem 3.コピー
%COPY_CMD%

rem 4.アンマウント
%NET_USE_CMD% /delete

exit /b 0