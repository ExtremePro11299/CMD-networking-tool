@echo off
title Connection tester (pinger)
color 2
:start
set mtu=32
echo Choose your MTU (type the number)
echo 1) Default MTU (32 bytes)
echo 2) Custom MTU
set /p mtutype=
if %mtutype%==1 goto chSave
if %mtutype%==2 goto setmtu
:setmtu
echo Set your MTU.
set /p mtuinput=
set mtu=%mtuinput%
goto chSave
:chSave
echo Would you like to save the results to a file?
echo 1) No
echo 2) Yes
set /p savetype=
goto testprep
:testprep
echo Please enter the IP address you would like to ping.
set /p ip=
echo.
goto test
:test
cd..
if %savetype%==1 ping %ip% -f -l %mtu%
if %savetype%==2 ping %ip% -f -l %mtu% >> SavedResults\PingResult-%RANDOM%.txt
echo What do you want to do? (type the number)
echo 1) Test again
echo 2) Change settings
echo 3) Exit
set /p input=
if %input%==1 goto testprep
if %input%==2 goto start
if %input%==3 exit