@ECHO OFF
:: Close Internet Explorer
	echo f | TASKKILL /F /IM iexplore.exe
:: Close Java Update Checker
	echo f | TASKKILL /F /IM jucheck.exe
::Start Autoit script that will run the Java Ninite installer silently
	Start /Wait %MYFILES%\ninite-silent.exe
:: Add exception for WorldPay Site in Security
	echo f | xcopy /Y /E %MYFILES%\ruleset.xml C:\Windows\Sun\Java\Deployment\*
:: Add rxtxserial.dll file needed for WorldPay
	echo f | xcopy /Y /E %MYFILES%\rxtxSerial.dll C:\java\jre\bin\*
	for /r "C:\Program Files (x86)\Java" %%a in ("bin") do @if exist %%a copy %MYFILES%\rxtxSerial.dll "%%a"
	for /r "C:\Program Files\Java" %%a in ("bin") do @if exist %%a copy %MYFILES%\rxtxSerial.dll "%%a"
EXIT	
