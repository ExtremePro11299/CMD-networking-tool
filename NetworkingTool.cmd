@echo off
title Networking tool
cd /d "%~dp0"
:: Resources checker ˇˇ
set resourcesnf=false
if exist Resources\ (
goto start
)
:: Resources checker ^^
:: Resources not found screen ˇˇ
:rnnf
set resourcesnf=true
color 0
echo.
echo Could not find the Resources folder.
echo Without it the program cannot run.
echo Make sure the folder is named Resources and it is in the same folder as this file.
echo If you cannot find the Resources folder, reinstall the program from GitHub.
echo What do you want to do?
echo 1) Exit
echo 2) Open Help (README)
set /p rntin=
if %rntin%==1 exit
if %rntin%==2 call :help
goto rnnf
:: Resources not found screen ^^
echo.
echo Welcome to the CMD networking tool.
echo.
if not exist SavedResults\ (
mkdir SavedResults
echo SavedResults folder created.
echo.
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
if %input%==3 call :nstprep
if %input%==4 call :ipcfg
if %input%==5 call :help
if %input%==6 call :clearsaves
if %input%==7 exit
echo.
goto start
:: Features ˇˇ
:tracerouteprep
start Resources\Traceroute.cmd
cls
echo Opened route tracer.
goto :eof
:testprep
start Resources\Pingtest.cmd
cls
echo Opened connection tester.
goto :eof
:: Netstat ˇˇ
:nstprep
cls
echo How would you like to netstat?
echo 1) Check all connections and listening ports
echo 2) Check Ethernet statistics
echo 3) Check the routing table
echo 4) Check current connection offload state
echo.
set /p nsinput=
cls
if %nsinput%==1 call :nst
if %nsinput%==2 call :nste
if %nsinput%==3 call :nstrt
if %nsinput%==4 call :nstt
echo.
goto :eof
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
cls
echo.
echo Opened Netsat-R module.
goto :eof
:nstt
netstat -t
echo Netstat completed.
goto :eof
:: Netstat ^^
:ipcfg
start Resources\Ipconfig.cmd true
cls
echo Opened Ipconfig module.
goto :eof
:: Features ^^
:clearsaves
echo This will permanently delete ALL saved results.
del SavedResults\*
cls
goto :eof
:help
start README.md -n12
cls
echo Opened help file.
goto :eof

