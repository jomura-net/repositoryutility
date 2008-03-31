@echo off

rem 1“ú‘O‚Ì“ú•t‚ðŒvŽZ‚·‚é

set yy=%date:~0,4%
set mm=%date:~5,2%
set dd=%date:~8,2%

set /a dd=dd-1
set dd=00%dd%
set dd=%dd:~-2%
set /a ymod=yy %% 4

if %dd%==00 (
if %mm%==01 (set mm=12&& set dd=31&& set /a yy=yy-1)
if %mm%==02 (set mm=01&& set dd=31)
if %mm%==03 (set mm=02&& set dd=28&& if %ymod%==0 (set dd=29))
if %mm%==04 (set mm=03&& set dd=31)
if %mm%==05 (set mm=04&& set dd=30)
if %mm%==06 (set mm=05&& set dd=31)
if %mm%==07 (set mm=06&& set dd=30)
if %mm%==08 (set mm=07&& set dd=31)
if %mm%==09 (set mm=08&& set dd=31)
if %mm%==10 (set mm=09&& set dd=30)
if %mm%==11 (set mm=10&& set dd=31)
if %mm%==12 (set mm=11&& set dd=30)
)

set yesterday=%yy%/%mm%/%dd%
set yesterday_yymmdd=%yy%%mm%%dd%

rem ŠÂ‹«•Ï”‚ÌÝ’è
set SSDIR=\\10.130.208.37\vssdata\CITY-2e_1.1.1
set ssUser=build
set ssPwd=

rem ‚P“ú‘O‚Ì—š—ð
"C:\Program Files\Microsoft Visual SourceSafe\2005\ss.exe" History $/@Head -R -Vd%yesterday%;23:59~%yesterday%;00:00 > vss_history_%yesterday_yymmdd%.txt

echo --end  >> vss_history_%yesterday_yymmdd%.txt
