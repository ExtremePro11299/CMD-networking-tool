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
:: color "%~1"
color 2
echo What do you want to do? (type the number)
echo 1) Ping (test connection)
echo 2) Tracert (trace route)
echo 3) Netstat (check active connections)
echo 4) Ipconfig
echo 5) Help (open README)
echo 6) Clear saved results
echo 7) Exit
echo 8) Uninstall
set /p input=
echo.
if %input%==1 call :testprep
if %input%==2 call :tracerouteprep
if %input%==3 goto nstprep
if %input%==4 call :ipcfg
if %input%==5 call :help
if %input%==6 call :clearsaves
if %input%==7 exit
if %input%==8 goto uninstall
echo.
goto start
:: Features ˇˇ
:tracerouteprep
start Resources\Traceroute.cmd
echo Opened route tracer.
:testprep
start Resources\Pingtest.cmd
echo Opened connection tester.
echo.
goto start
:: Netstat ˇˇ
:nstprep
echo How would you like to netstat?
echo 1) Check all connections and listening ports
echo 2) Check Ethernet statistics
echo 3) Check the routing table
echo 4) Check current connection offload state
set /p nsinput=
if %nsinput%==1 call :nst
if %nsinput%==2 call :nste
if %nsinput%==3 call :nstrt
if %nsinput%==4 call :nstt
echo.
goto start
:nst
netstat -a
echo.
echo Netstat completed.
:nste
netstat -e
echo.
echo Netstat completed.
:nstrt
start Resources\NetstatR.cmd
echo.
echo Opened Netsat-R module.
:nstt
netstat -t
echo.
echo Netstat completed.
:: Netstat ^^
:ipcfg
start Resources\Ipconfig.cmd
echo Opened Ipconfig module.
:: Features ^^
:clearsaves
echo This will permanently delete ALL saved results.
del SavedResults\*
:uninstall
color 6
echo Are you sure you want to uninstall the tool? (type the number)
echo 1) Yes
echo 2) No
set /p sinput=
if %sinput%==1 goto sdfull
if %sinput%==2 goto sdcancel
:sdfull
echo Stopping tasks..
taskkill /F /IM Resources\Pingtest.cmd
taskkill /F /IM Resources\Traceroute.cmd
taskkill /F /IM Resources\NetstatR.cmd
taskkill /F /IM Resources\Ipconfig.cmd
del /F
:sdcancel
echo.
echo Uninstall cancelled.
echo.
goto start
:help
start README.md -n12
echo Opened help file.
