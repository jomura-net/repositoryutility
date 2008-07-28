@echo off

set LOGFILENAME=analyze2e.log
echo %DATE% %TIME% start >> %LOGFILENAME%

SET DT=%date%
SET yyyyMMdd=%DT:~0,4%%DT:~5,2%%DT:~8,2%
SET time2=%time: =0%
SET HHmm=%time2:~0,2%%time2:~3,2%

:: log remote desktop
query session /COUNTER > session_%yyyyMMdd%_%HHmm%.txt

:: log net file
net file > net_file_%yyyyMMdd%_%HHmm%.txt

:: log netstat
netstat -a -b -v -o > netstat_%yyyyMMdd%_%HHmm%.txt

call analyze2e_sub.bat repository01 >> %LOGFILENAME%
call analyze2e_sub.bat repository02 >> %LOGFILENAME%
call analyze2e_sub.bat repository03 >> %LOGFILENAME%

::call show_vss_history_of_yesterday.bat
