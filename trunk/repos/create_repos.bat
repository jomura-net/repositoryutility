@ECHO OFF
SET REPOS_NAME=SubversionUtility

IF NOT "%1" == "" SET REPOS_NAME=%1
IF EXIST D:\Inetpub\svn\%REPOS_NAME% (
ECHO already exists !
PAUSE
EXIT 1
)
svnadmin create D:\Inetpub\svn\%REPOS_NAME%
copy D:\Inetpub\svn\post-commit.bat D:\Inetpub\svn\%REPOS_NAME%\hooks\
svn mkdir file://localhost/d:/Inetpub/svn/%REPOS_NAME%/trunk    -m "trunk�f�B���N�g���쐬"
svn mkdir file://localhost/d:/Inetpub/svn/%REPOS_NAME%/tags     -m "tags�f�B���N�g���쐬"
svn mkdir file://localhost/d:/Inetpub/svn/%REPOS_NAME%/branches -m "branches�f�B���N�g���쐬"
