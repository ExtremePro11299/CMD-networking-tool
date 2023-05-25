@echo off
title Networking tool
echo.
echo Welcome to the Batch networking tool.
echo.
if not exist SavedResults\ mkdir SavedResults
:start
color 2
echo What do you want to do? (type the number)
echo 1) Ping (test connection)
echo 2) Tracert (trace route)
echo 3) Help (open README)
echo 4) Clear saved results
echo 5) Exit
echo 6) Uninstall
set /p input=
echo.
if %input%==1 goto testprep
if %input%==2 goto tracerouteprep
if %input%==3 goto help
if %input%==4 goto clearsaves
if %input%==5 exit
if %input%==6 goto uninstall
:tracerouteprep
start Resources\Traceroute.cmd
echo Opened route tracer.
goto start
:testprep
start Resources\Pingtest.cmd
echo Opened connection tester.
echo.
goto start
:clearsaves
echo This will permanently delete ALL saved results.
del SavedResults\*
echo.
goto start
:uninstall
color 6
echo Are you sure you want to uninstall the tool? (type the number)
echo 1) Yes
echo 2) No
set /p sinput=
if %sinput%==1 goto sdfull
if %sinput%==2 goto sdcancel
:sdfull
echo Stopping tasks...
taskkill /F /IM Resources\Pingtest.cmd
taskkill /F /IM Resources\Traceroute.cmd
taskkill /F /IM Resources\Attack.cmd
del /F
goto start
:sdcancel
echo.
echo Uninstall cancelled.
echo.
goto start
:help
start README.md -n12
echo Opened help file.
echo.
goto start
