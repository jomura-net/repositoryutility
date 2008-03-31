@echo off

SET REPOS_NAME=%~nx1
SET REVISON=%2

IF "%REPOS_NAME%" == "" EXIT 1

SET XML_FILENAME=D:\Inetpub\apache_htdocs\svnlog\%REPOS_NAME%.xml

"C:\Program Files\Subversion\bin\svn.exe" log http://jomora.net/svn/%REPOS_NAME%/ --xml --limit 30 --verbose > %XML_FILENAME%
