@echo off
setlocal

:menu
cls
echo 1. Get user ID by name
echo 2. Send a message to the user
echo 3. Follow a user and send a message
echo 4. Subscribe to the user's followers and send a message
echo 5. Sort user subscriptions by name
echo 6. Exit

set /p choice=Choose an action: 

if "%choice%"=="1" goto get_user_id
if "%choice%"=="2" goto send_message
if "%choice%"=="3" goto follow_and_message
if "%choice%"=="4" goto follow_followers_and_message
if "%choice%"=="5" goto sort_followings_by_username
if "%choice%"=="6" goto end

:get_user_id
set /p login="Enter your Instagram login: "
set /p password="Enter your Instagram password: "
set /p target_username="Enter your Instagram username: "

cd /d %~dp0
for /f "tokens=*" %%i in ('where python.exe') do set PYTHON_PATH=%%i

%PYTHON_PATH% %~dp0id.py %login% %password% %target_username%
pause
goto menu

:send_message
set /p login="Enter your Instagram login: "
set /p password="Enter your Instagram password: "
set /p target_user_id="Enter your Instagram user ID: "
set /p message="Enter your message: "

cd /d %~dp0
for /f "tokens=*" %%i in ('where python.exe') do set PYTHON_PATH=%%i

%PYTHON_PATH% %~dp0id.py %login% %password% %target_user_id% %message%
pause
goto menu

:follow_and_message
set /p login="Enter your Instagram login: "
set /p password="Enter your Instagram password: "
set /p target_user_id="Enter your Instagram user ID: "
set /p message="Enter your message: "

cd /d %~dp0
for /f "tokens=*" %%i in ('where python.exe') do set PYTHON_PATH=%%i

%PYTHON_PATH% %~dp0id.py %login% %password% %target_user_id% %message%
pause
goto menu

:follow_followers_and_message
set /p login="Enter your Instagram login: "
set /p password="Enter your Instagram password: "
set /p target_user_id="Enter your Instagram user ID: "
set /p message="Enter your message: "

cd /d %~dp0
for /f "tokens=*" %%i in ('where python.exe') do set PYTHON_PATH=%%i

%PYTHON_PATH% %~dp0id.py %login% %password% %target_user_id% %message%
pause
goto menu

:sort_followings_by_username
set /p login="Enter your Instagram login: "
set /p password="Enter your Instagram password: "
set /p target_user_id="Enter your Instagram user ID: "

cd /d %~dp0
for /f "tokens=*" %%i in ('where python.exe') do set PYTHON_PATH=%%i

%PYTHON_PATH% %~dp0id.py %login% %password% %target_user_id%
pause
goto menu

:end
endlocal
