@echo off
echo.
echo  Deploying Minds Connected website...
echo.

cd /d "%~dp0"

git add -A

set /p MSG="Commit message (or press Enter for 'Update website'): "
if "%MSG%"=="" set MSG=Update website

git commit -m "%MSG%"
if %ERRORLEVEL% NEQ 0 if %ERRORLEVEL% NEQ 1 (
  echo  ERROR: commit failed.
  pause
  exit /b 1
)

git pull --no-rebase origin main
if %ERRORLEVEL% NEQ 0 (
  echo  ERROR: pull failed. Fix any conflicts and try again.
  pause
  exit /b 1
)

git push origin HEAD:main
if %ERRORLEVEL% NEQ 0 (
  echo  ERROR: push failed.
  pause
  exit /b 1
)

echo.
echo  Done! Your changes are live at https://www.mindsconnected.org/
echo.
pause
