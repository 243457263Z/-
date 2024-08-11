@ECHO OFF

TITLE 电池充电状态切换工具 

:MENU
CLS
ECHO.
ECHO.            电池充电状态切换工具
ECHO.***********************************************
ECHO.               选择操作：
ECHO.
ECHO.              1.开始切换
ECHO.
ECHO.              2.退出脚本
ECHO.
ECHO.
ECHO.***********************************************
ECHO.
set choice=
set /p choice=请直接输入对应数字回车：
if not "%choice%"=="" set choice=%choice:~0,1%
if /i "%choice%"=="1" goto DEVICE_ID
if /i "%choice%"=="2" EXIT
ECHO.
ECHO.输入无效，请重新输入...
timeout /t 2 /nobreak >NUL
ECHO.
goto MENU

:DEVICE_ID
CLS
ECHO.
ECHO.            电池充电状态切换工具
ECHO.*********************************************** 
ECHO.
ECHO.                 
ECHO.               正在检测设备...
ECHO.             
ECHO.
ECHO.***********************************************
ECHO.
adb devices
set DEVICE_ID=
set /p DEVICE_ID=请直接输入对应设备代码：
echo.

ECHO.
ECHO.            电池充电状态切换工具
ECHO.***********************************************
ECHO.               选择操作：
ECHO.
ECHO.              1.恢复充电
ECHO.
ECHO.              2.停止充电
ECHO.
ECHO.
ECHO.***********************************************
ECHO.
set choice=
set /p choice=请直接输入对应数字回车：
if not "%choice%"=="" set choice=%choice:~0,1%
if /i "%choice%"=="1" goto SWITCH_RESET
if /i "%choice%"=="2" goto SWITCH_UNPLUG
ECHO.
pause>nul

:SWITCH_RESET
CLS
ECHO.
ECHO.          电池充电状态切换工具
ECHO.***********************************************
ECHO.
ECHO.
ECHO.             正在恢复充电...
ECHO.
ECHO.
ECHO.***********************************************
ECHO.
ECHO.   （若长时间停留在此界面，请重启该工具）
ECHO.
timeout /t 2 /nobreak >NUL
adb -s %DEVICE_ID% shell dumpsys battery reset
goto SWITCH_OVER

:SWITCH_UNPLUG
CLS
ECHO.
ECHO.          电池充电状态切换工具
ECHO.***********************************************
ECHO.
ECHO.
ECHO.             正在停止充电...
ECHO.
ECHO.
ECHO.***********************************************
ECHO.
ECHO.   （若长时间停留在此界面，请重启该工具）
ECHO.
timeout /t 2 /nobreak >NUL
adb -s %DEVICE_ID% shell dumpsys battery unplug
goto SWITCH_OVER

:SWITCH_OVER
CLS
ECHO.
ECHO.           电池充电状态切换工具
ECHO.***********************************************
ECHO.
ECHO.            电池充电状态切换完成
ECHO.
ECHO.
ECHO.
ECHO.             感谢您使用本工具
ECHO.
ECHO.           （按任意键回到主页）
ECHO.***********************************************
ECHO.               当前电池状态:
adb -s %DEVICE_ID% shell dumpsys battery
pause >NUL

goto MENU

