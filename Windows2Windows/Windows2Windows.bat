@echo off
rem ############################################
rem  File Copy to Network(Windows����Windows��)
rem    �����҂�������F
rem      %1�F�R�s�[�������t�@�C���i���h���b�O���h���b�v�j
rem          1������z��
rem ############################################

rem ############################################
rem �l�b�g���[�N�h���C�u��
set NETWORKDRIVE=X:
set NETWORKDIR="\\192.168.11.12\test2"
set NETWORKDIR_USER="win10"
set NETWORKDIR_PASSWORD="wizlife"
rem ############################################
rem �R�}���h���C��������1��n���Ă��Ȃ��ƏI������
if "%1" neq "1" (
    exit /b
)
rem �{bat�̋N���f�B���N�g�����J�����g�f�B���N�g���ɂ���
cd /d %~dp0

rem �R�s�[�������t�@�C���̃t���p�X
set TARGET_FILE=%1
rem �R�s�[�������t�@�C�����{�g���q�̂�
set TARGET_FILE_NAME=%~n1%~x1

set YYMMDD=%date:~2,2%%date:~5,2%%date:~8,2%

set NET_USE_CMD=net use %NETWORKDRIVE%

rem /Y �I�v�V�����͏㏑���m�F
rem set COPY_CMD=copy /Y %TARGET_FILE% %NETWORKDRIVE%\.
set COPY_CMD=copy /-Y %TARGET_FILE% %NETWORKDRIVE%\.


rem ############################################
rem ���C������
rem ############################################
rem 1.�}�E���g
%NET_USE_CMD% %NETWORKDIR% /user:%NETWORKDIR_USER% %NETWORKDIR_PASSWORD%

rem 2.�R�s�[��Ƀt�@�C�����L��ꍇ�́A�o�b�N�A�b�v�t�@�C�����쐬
rem �󔒂�����ƃo�b�N�A�b�v���s����B
set SERVER_FILE=%NETWORKDRIVE%\%TARGET_FILE_NAME%
if not exist %SERVER_FILE%.%YYMMDD% (
    copy %SERVER_FILE% %SERVER_FILE%.%YYMMDD% 
)
rem 3.�R�s�[
%COPY_CMD%

rem 4.�A���}�E���g
%NET_USE_CMD% /delete

exit /b 0