@echo off
::@pushd "%~dp0"
::@set path=%~dp0
@7z.exe x -o"%~dp0" -y d:\_SOFTWARE\nircmd.zip nircmd.exe
@start "" %~dp0\nircmd.exe changebrightness -50
exit
