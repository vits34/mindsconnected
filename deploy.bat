@echo off
echo.
echo  Deploying Minds Connected website...
echo.

cd /d "%~dp0"

git add -A

set /p MSG="Commit message (or press Enter for 'Update website'): "
if "%MSG%"=="" set MSG=Update website

git commit -m "%MSG%"

git pull --rebase origin master

git push origin master

echo.
echo  Done! Your changes are live at https://vits34.github.io/mindsconnected/
echo.
pause
