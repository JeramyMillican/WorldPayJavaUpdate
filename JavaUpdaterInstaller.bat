@ECHO OFF
:: Set Colors: Background-Blue Text-White 
COLOR 1F
ECHO ********************************************************************************
ECHO                          Draeger WorldPay Java Update
ECHO.
ECHO.
ECHO          This window will close automatically once installation is complete
ECHO.
ECHO ********************************************************************************
:: Close Internet Explorer
	echo f | TASKKILL /F /IM iexplore.exe
:: Close Java Update Checker
	echo f | TASKKILL /F /IM jucheck.exe
:: Remove old files
	RD /S /Q "C:\Program Files (x86)\Java"
	RD /S /Q "C:\Program Files\Java"
	RD /S /Q "C:\ProgramData\Oracle"
:: Copy the JavaUpdater.exe file to local directory.
	MKDIR C:\DISC\Java
	xcopy /y %myfiles%\JavaUpdater.exe C:\DISC\Java
:: Delete any any old scheduled tasks by the same name to prevent multiple tasks.
	SCHTASKS /Delete /TN "JavaUpdate" /F
:: Create scheduled task (for more information run schtasks /? in command prompt)
	schtasks /create /TN JavaUpdate /xml %MYFILES%\JavaUpdate.xml
:: Run Java Update
	start /wait C:\DISC\Java\JavaUpdater.exe
:: Close Program
EXIT