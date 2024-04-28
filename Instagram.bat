@echo off
setlocal

:menu
cls
echo 1. Получить ID пользователя по его имени
echo 2. Отправить сообщение пользователю
echo 3. Подписаться на пользователя и отправить сообщение
echo 4. Подписаться на подписчиков пользователя и отправить сообщение
echo 5. Отсортировать подписки пользователя по имени
echo 6. Выход

set /p choice=Выберите действие: 

if "%choice%"=="1" goto get_user_id
if "%choice%"=="2" goto send_message
if "%choice%"=="3" goto follow_and_message
if "%choice%"=="4" goto follow_followers_and_message
if "%choice%"=="5" goto sort_followings_by_username
if "%choice%"=="6" goto end

:get_user_id
set /p login="Введите логин Instagram: "
set /p password="Введите пароль Instagram: "
set /p target_username="Введите имя пользователя Instagram: "

cd /d %~dp0
for /f "tokens=*" %%i in ('where python.exe') do set PYTHON_PATH=%%i

%PYTHON_PATH% %~dp0id.py %login% %password% %target_username%
pause
goto menu

:send_message
set /p login="Введите логин Instagram: "
set /p password="Введите пароль Instagram: "
set /p target_user_id="Введите ID пользователя Instagram: "
set /p message="Введите сообщение: "

cd /d %~dp0
for /f "tokens=*" %%i in ('where python.exe') do set PYTHON_PATH=%%i

%PYTHON_PATH% %~dp0id.py %login% %password% %target_user_id% %message%
pause
goto menu

:follow_and_message
set /p login="Введите логин Instagram: "
set /p password="Введите пароль Instagram: "
set /p target_user_id="Введите ID пользователя Instagram: "
set /p message="Введите сообщение: "

cd /d %~dp0
for /f "tokens=*" %%i in ('where python.exe') do set PYTHON_PATH=%%i

%PYTHON_PATH% %~dp0id.py %login% %password% %target_user_id% %message%
pause
goto menu

:follow_followers_and_message
set /p login="Введите логин Instagram: "
set /p password="Введите пароль Instagram: "
set /p target_user_id="Введите ID пользователя Instagram: "
set /p message="Введите сообщение: "

cd /d %~dp0
for /f "tokens=*" %%i in ('where python.exe') do set PYTHON_PATH=%%i

%PYTHON_PATH% %~dp0id.py %login% %password% %target_user_id% %message%
pause
goto menu

:sort_followings_by_username
set /p login="Введите логин Instagram: "
set /p password="Введите пароль Instagram: "
set /p target_user_id="Введите ID пользователя Instagram: "

cd /d %~dp0
for /f "tokens=*" %%i in ('where python.exe') do set PYTHON_PATH=%%i

%PYTHON_PATH% %~dp0id.py %login% %password% %target_user_id%
pause
goto menu

:end
endlocal
