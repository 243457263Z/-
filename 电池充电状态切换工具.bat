@ECHO OFF

TITLE ��س��״̬�л����� 

:MENU
CLS
ECHO.
ECHO.            ��س��״̬�л�����
ECHO.***********************************************
ECHO.               ѡ�������
ECHO.
ECHO.              1.��ʼ�л�
ECHO.
ECHO.              2.�˳��ű�
ECHO.
ECHO.
ECHO.***********************************************
ECHO.
set choice=
set /p choice=��ֱ�������Ӧ���ֻس���
if not "%choice%"=="" set choice=%choice:~0,1%
if /i "%choice%"=="1" goto DEVICE_ID
if /i "%choice%"=="2" EXIT
ECHO.
ECHO.������Ч������������...
timeout /t 2 /nobreak >NUL
ECHO.
goto MENU

:DEVICE_ID
CLS
ECHO.
ECHO.            ��س��״̬�л�����
ECHO.*********************************************** 
ECHO.
ECHO.                 
ECHO.               ���ڼ���豸...
ECHO.             
ECHO.
ECHO.***********************************************
ECHO.
adb devices
set DEVICE_ID=
set /p DEVICE_ID=��ֱ�������Ӧ�豸���룺
echo.

ECHO.
ECHO.            ��س��״̬�л�����
ECHO.***********************************************
ECHO.               ѡ�������
ECHO.
ECHO.              1.�ָ����
ECHO.
ECHO.              2.ֹͣ���
ECHO.
ECHO.
ECHO.***********************************************
ECHO.
set choice=
set /p choice=��ֱ�������Ӧ���ֻس���
if not "%choice%"=="" set choice=%choice:~0,1%
if /i "%choice%"=="1" goto SWITCH_RESET
if /i "%choice%"=="2" goto SWITCH_UNPLUG
ECHO.
pause>nul

:SWITCH_RESET
CLS
ECHO.
ECHO.          ��س��״̬�л�����
ECHO.***********************************************
ECHO.
ECHO.
ECHO.             ���ڻָ����...
ECHO.
ECHO.
ECHO.***********************************************
ECHO.
ECHO.   ������ʱ��ͣ���ڴ˽��棬�������ù��ߣ�
ECHO.
timeout /t 2 /nobreak >NUL
adb -s %DEVICE_ID% shell dumpsys battery reset
goto SWITCH_OVER

:SWITCH_UNPLUG
CLS
ECHO.
ECHO.          ��س��״̬�л�����
ECHO.***********************************************
ECHO.
ECHO.
ECHO.             ����ֹͣ���...
ECHO.
ECHO.
ECHO.***********************************************
ECHO.
ECHO.   ������ʱ��ͣ���ڴ˽��棬�������ù��ߣ�
ECHO.
timeout /t 2 /nobreak >NUL
adb -s %DEVICE_ID% shell dumpsys battery unplug
goto SWITCH_OVER

:SWITCH_OVER
CLS
ECHO.
ECHO.           ��س��״̬�л�����
ECHO.***********************************************
ECHO.
ECHO.            ��س��״̬�л����
ECHO.
ECHO.
ECHO.
ECHO.             ��л��ʹ�ñ�����
ECHO.
ECHO.           ����������ص���ҳ��
ECHO.***********************************************
ECHO.               ��ǰ���״̬:
adb -s %DEVICE_ID% shell dumpsys battery
pause >NUL

goto MENU

