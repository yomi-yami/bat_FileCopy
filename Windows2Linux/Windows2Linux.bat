@echo off
rem ############################################
rem  File Copy to Network(Windows����Linux��)
rem    �����҂�������F
rem      %1�F�R�s�[�������t�@�C���i���h���b�O���h���b�v�j
rem          1������z��
rem ############################################

rem �R�}���h���C��������1��n���Ă��Ȃ��ƏI������
if "%1" neq "1" (
    exit /b
)
rem �{bat�̋N���f�B���N�g�����J�����g�f�B���N�g���ɂ���
cd /d %~dp0

rem WinSCP Path
set WinSCP_Exe="C:\Program Files (x86)\WinSCP\WinSCP.exe"


rem �R�s�[�������t�@�C���̃t���p�X
set TARGET_FILE=%1

rem linux��put����
%WinSCP_Exe% /console /script="putscript.txt" /parameter %TARGET_FILE%


exit /b 0