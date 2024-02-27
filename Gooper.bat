@echo off
:START
echo Gooper 1.0 - made by randomuser691337 :3
set /p extension="- Username and repository (e.g. user/repo)? "
set /p location="- Location? (e.g. Desktop)?"
set "location=%location:\=/%"
@cd "%USERPROFILE%\%location%"
if exist "%USERPROFILE%\%location%\%extension%" (
    echo Removing existing directory...
    rd /s /q "%USERPROFILE%\%location%\%extension%"
)
git clone --no-checkout https://github.com/%extension%
@cd "%USERPROFILE%\%location%\%extension%"
if %errorlevel% equ 0 (
    icacls "%USERPROFILE%\%location%\%extension%" /grant "%USERNAME%:(OI)(CI)F" /T
    start /B "Visual Studio Code" code .
) else (
    echo "Something fucked up, going to the start >_<"
    goto START
)

:EOF
pause
