@echo off
title Networking tool
if not exist Resources\ (
echo Could not find the Resources folder.
echo Without it the program cannot run.
echo Make sure the folder is named Resources and it is in the same folder as this file.
echo If you cannot find the Resources folder, reinstall the program from GitHub.
pause
exit
)
echo.
echo Welcome to the CMD networking tool.
echo.
if not exist SavedResults\ 
(
mkdir SavedResults
echo SavedResults folder created.
)
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
set /p input=
echo.
if %input%==1 call :testprep
if %input%==2 call :tracerouteprep
if %input%==3 goto nstprep
if %input%==4 call :ipcfg
if %input%==5 call :help
if %input%==6 call :clearsaves
if %input%==7 exit
echo.
goto start
:: Features ˇˇ
:tracerouteprep
start Resources\Traceroute.cmd
echo Opened route tracer.
goto :eof
:testprep
start Resources\Pingtest.cmd
echo Opened connection tester.
goto :eof
:: Netstat ˇˇ
:nstprep
echo How would you like to netstat?
echo 1) Check all connections and listening ports
echo 2) Check Ethernet statistics
echo 3) Check the routing table
echo 4) Check current connection offload state
echo.
set /p nsinput=
if %nsinput%==1 call :nst
if %nsinput%==2 call :nste
if %nsinput%==3 call :nstrt
if %nsinput%==4 call :nstt
echo.
goto start
:nst
netstat -a
echo Netstat completed.
goto :eof
:nste
netstat -e
echo.
echo Netstat completed.
goto :eof
:nstrt
start Resources\NetstatR.cmd
echo.
echo Opened Netsat-R module.
goto :eof
:nstt
netstat -t
echo Netstat completed.
goto :eof
:: Netstat ^^
:ipcfg
start Resources\Ipconfig.cmd
echo Opened Ipconfig module.
goto :eof
:: Features ^^
:clearsaves
echo This will permanently delete ALL saved results.
del SavedResults\*
goto :eof
:help
start README.md -n12
echo Opened help file.
goto :eof
