IF "%1" == "" (
echo %DATE% %TIME% no repos name
GOTO END
)

SET REPOS_NAME=%1

:: unlock VSS files
"C:\Program Files\Unlocker\Unlocker.exe" d:\vssdata\%REPOS_NAME% /S /O
copy "C:\Program Files\Unlocker\Unlocker-Log.txt" Unlocker-Log_%REPOS_NAME%_%yyyyMMdd%_%HHmm%.txt > nul

:: folder for results of analyze
SET resultdir=d:\vssdata\@analyze\%REPOS_NAME%_%yyyyMMdd%_%HHmm%
md %resultdir%

:: analyze
"C:\Program Files\Microsoft Visual SourceSafe\analyze.exe" -D -F -I- -refv6 -S -V4 -DB -B%resultdir% d:\vssdata\%REPOS_NAME%\data 2>&1

IF NOT "%errorlevel%" == "0" (
echo %DATE% %TIME% [%REPOS_NAME%] analyze error[%errorlevel%]
GOTO END
)

echo %DATE% %TIME% [%REPOS_NAME%] end normally

:END
