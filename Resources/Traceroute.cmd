@echo off
title Route tracer
color 2
:start
echo Would you like to save the results to a file?
echo 1) No
echo 2) Yes
set /p savetype=
goto testprep
:testprep
echo Please enter the IP address you would like to trace the route to.
set /p ip=
echo.
goto test
:test
cd..
if %savetype%==1 ping %ip% -f -l %mtu%
if %savetype%==2 ping %ip% -f -l %mtu% >> SavedResults\TraceResult-%RANDOM%.txt
echo What do you want to do? (type the number)
echo 1) Test again
echo 2) Change saving settings
echo 3) Exit
set /p input=
if %input%==1 goto testprep
if %input%==2 goto start
if %input%==3 exit