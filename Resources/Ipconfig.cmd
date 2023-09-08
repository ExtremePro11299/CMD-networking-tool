@echo off
title Ipconfig module
color 2
:start
cd.. 
ipconfig >> SavedResults\Ipconfig-%RANDOM%.txt
echo Ipconfig results saved.
echo.
:endChoice
echo What do you want to do? (type the number)
echo 1) Ipconfig again
echo 2) Exit
set /p input=
if %input%==1 goto start
if %input%==2 exit
goto endChoice
