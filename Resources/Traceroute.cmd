@echo off
title Route tracer
color 2
:start
cls
echo Would you like to save the results to a file?
echo 1) No
echo 2) Yes
set /p savetype=
echo Please enter the IP address you would like to trace the route to.
set /p ip=
echo.
goto test
:test
cd /d "%~dp0"
cd..
if %savetype%==1 tracert %ip%
if %savetype%==2 tracert %ip% > SavedResults\TraceResult-%RANDOM%.txt
echo What do you want to do? (type the number)
echo 1) Trace again
echo 2) Exit
set /p input=
if %input%==1 goto start
if %input%==2 exit
