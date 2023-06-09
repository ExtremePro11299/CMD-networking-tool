@echo off
title Ipconfig module
color 2
:start
echo Would you like to save the results to a file?
echo 1) No
echo 2) Yes
set /p savetype=
if %savetype%==1 (ping %ip% -f -l %mtu%
)elseif %savetype%==2 ( 
cd.. 
ping %ip% -f -l %mtu% >> SavedResults\Ipconfig-%RANDOM%.txt
)
echo What do you want to do? (type the number)
echo 1) Go back to beginning
echo 2) Exit
set /p input=
if %input%==1 goto start
if %input%==2 exit

