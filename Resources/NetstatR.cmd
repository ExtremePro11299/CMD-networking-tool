@echo off
title Netstat -r module
color 2
:start
echo Would you like to save the results to a file?
echo 1) No
echo 2) Yes
set /p savetype=
if %savetype%==1 goto tsoff

:tsoff
netstat -r
echo Netstat completed.
goto endChoice
:tson
cd..
netstat -r >> SavedResults\NetstatRResult-%RANDOM%.txt
echo Netstat completed.
:endChoice
echo What do you want to do? (type the number)
echo 1) Netstat again
echo 2) Exit
set /p input=
if %input%==1 goto testprep
if %input%==2 exit
if %input%==3 goto endChoice
