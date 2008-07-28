@echo off

:: kill analyze
taskkill /IM analyze.exe
IF "%errorlevel%" == "0" (
:: unlock VSS repository
echo Please Unlock VSS Database >> Please_Unlock_VSS_Database.txt
)
:END
