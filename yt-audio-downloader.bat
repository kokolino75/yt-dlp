@echo off
:title
title YouTube Audio Downloader
color 0A

:: Large title section
echo ==================================================
echo             YOUTUBE AUDIO DOWNLOADER
echo ==================================================
echo                   by kokolino75
echo.       (Plugin for yt-dlp created by kokolino75)
echo ==================================================
echo.

:start
:: Change color for user prompts - yellow color
color 0E
set /p filename="Enter the desired file name (default is 'audio_output'): "
if "%filename%"=="" set filename=audio_output

echo.
set /p url="Enter the audio URL: "
if "%url%"=="" (
    color 0C
    echo ERROR: No URL provided. Please enter a valid URL.
    echo.
    goto start
)

:: Change color for download start message - light green color
color 0A
echo Downloading audio...

:: Attempt to download audio
yt-dlp -f bestaudio --extract-audio --audio-format mp3 --audio-quality 0 -o "G:\YOTUBE DOUNLOAD MOI\%filename%.mp3" %url%
if errorlevel 1 (
    color 0C
    echo.
    echo ==================================================
    echo           ERROR: An error occurred during download.
    echo           Please check the URL and try again.
    echo ==================================================
    echo.
    goto start
)

:: Change color for completion message - blue color
color 09
echo.
echo ==================================================
echo         Download completed! Saved as: %filename%.mp3
echo ==================================================
pause