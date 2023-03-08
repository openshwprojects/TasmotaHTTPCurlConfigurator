
@echo off
setlocal EnableDelayedExpansion

set my_variable=

for /f "Tokens=* Delims=" %%x in (my_cfg.txt) do set my_variable=!my_variable!;%%x

set a=%my_variable%
set b= 
set c=%%20

set "result=!a:%b%=%c%!"

set result=!result:~1!

echo Full command is:
echo %result%

for /f "Tokens=* Delims=" %%x in (my_ips.txt) do (
  set ip=%%x
  echo Will now process sending to !ip!
  set fin=http://!ip!/cm?cmnd=BACKLOG%c%%result%
  echo !fin!
  curl !fin!
)
