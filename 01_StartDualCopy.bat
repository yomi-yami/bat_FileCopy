@echo off
rem ############################################
rem  File Copy to Network(Windows2Linux��Windows2Windows���Ăяo��)
rem  windows����Q��̊��փt�@�C����z�u����B
rem    �����҂�������F
rem      %1�F�R�s�[�������t�@�C���i���h���b�O���h���b�v�j
rem          1������z��
rem ############################################

rem �{bat�̋N���f�B���N�g�����J�����g�f�B���N�g���ɂ���
cd /d %~dp0

rem WinSCP Path
set WinSCP_Exe="C:\Program Files (x86)\WinSCP\WinSCP.exe"

rem ������
set TARGET_FILE=
rem ���͗v��(�h���b�O�E�A���h�E�h���b�v�œ��͑z��)
set /P TARGET_FILE="�R�s�[�������t�@�C���̃t���p�X����͂��Ă�������: "

rem linux��put����
rem call "Windows2Linux\Windows2Linux.bat" %TARGET_FILE%
rem �{bat�̋N���f�B���N�g�����J�����g�f�B���N�g���ɖ߂�
rem cd /d %~dp0

rem linux��put����
call "Windows2Windows\Windows2Windows.bat" %TARGET_FILE%
rem �{bat�̋N���f�B���N�g�����J�����g�f�B���N�g���ɖ߂�
cd /d %~dp0


exit /b 0