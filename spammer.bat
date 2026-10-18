@echo off
setlocal enabledelayedexpansion
title Webhook Spammer
color a

set /p "DISCORD_WEBHOOK=Discord Webhook:"

set /p "MAX_ALERTS=Amount of messages:"
set "DELAY_SECONDS=0"

echo Sending spam
echo.

for /l %%i in (1,1,%MAX_ALERTS%) do (
    echo Sending message %%i of %MAX_ALERTS%...
    
    curl -s -H "Content-Type: application/json" -X POST -d "{\"username\": \"Server Monitor\", \"content\": \"@everyone\"}" "%DISCORD_WEBHOOK%"
    
    if %%i LSS %MAX_ALERTS% (
        timeout /t %DELAY_SECONDS% >nul
    )
)

echo.
echo Complete.
pause
