@echo off

adb disconnect

FOR /F "tokens=9 delims= " %%a in ('adb shell ip route') do (
	set ip=%%a
)

adb tcpip 5555

set ipwithport=%ip%:5555
echo Device Found: %ipwithport%

echo Press any key to connect with %ip% . . .
pause>nul

adb connect %ipwithport%

TIMEOUT /T 1 >nul