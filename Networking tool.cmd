@echo off
title Networking tool
if not exist Resources\ (
echo Could not find the Resources folder.
echo Without it the program cannot run.
echo Make sure the folder is named Resources and it is in the same folder as this file.
echo If you cannot find the Resources folder, reinstall the tool from GitHub.
pause
exit
)
echo.
echo Welcome to the Batch networking tool.
echo.
if not exist SavedResults\ mkdir SavedResults
:start
color 2
echo What do you want to do? (type the number)
echo 1) Ping (test connection)
echo 2) Tracert (trace route)
echo 3) Netstat (check active connections)
echo 4) Help (open README)
echo 5) Clear saved results
echo 6) Exit
echo 7) Uninstall
set /p input=
echo.
if %input%==1 goto testprep
if %input%==2 goto tracerouteprep
if %input%==3 goto nstprep
if %input%==4 goto help
if %input%==5 goto clearsaves
if %input%==6 exit
if %input%==7 goto uninstall
:tracerouteprep
start Resources\Traceroute.cmd
echo Opened route tracer.
goto start
:testprep
start Resources\Pingtest.cmd
echo Opened connection tester.
echo.
goto start
:nstprep
echo How would you like to netstat?
echo 1) Check all connections and listening ports
echo 2) Check Ethernet statistics
set /p nsinput=
if %nsinput%==1 goto nst
if %nsinput%==2 goto nste
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
