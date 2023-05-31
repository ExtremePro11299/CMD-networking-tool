@echo off
title Netstat module
color 2
:start
echo Would you like to save the results to a file?
echo 1) No
echo 2) Yes
set /p savetype=
goto testprep
:testprep
echo Choose your Netstat mode.
echo 1) Check all active connections and listening 
goto test

:nst
netstat -a
echo.
echo Netstat completed.
goto start
:nste
netstat -e
echo.
echo Netstat completed.
goto start
:nstrt
netstat -r
echo.
echo Netstat completed.
goto start
:nstt
netstat -t
echo.
echo Netstat completed.
goto start
echo What do you want to do? (type the number)
echo 1) Netstat again
echo 2) Change mode
echo 3) Exit
set /p input=
if %input%==1 goto testprep
if %input%==2 goto start
if %input%==3 exit
