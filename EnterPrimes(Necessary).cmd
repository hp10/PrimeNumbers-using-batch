@echo off & title PrimeList & color 0a
if not exist "PrimesTo10M" goto download
:a
cls
echo Primes above ten million are not accepted
set /p checkifprime=Prime to be checked:
findstr "^%checkifprime%$" PrimesTo10M >nul
if %errorlevel%==1 echo %checkifprime% is not a prime
if %errorlevel%==0 echo %checkifprime% is a prime
pause>nul
goto a

:download
echo It looks like you don't have "PrimesTo10M" downloaded!
choice /c de /n /m "You can press d to download the file, or, press e to exit this program:"
if %errorlevel%==2 exit
if %errorlevel%==1 goto d
exit

:d
echo A new window will pop up, closing this window will result in the file not being complete.  You will know when the process is done once a blank command line appears.
timeout /t 5 /nobreak>nul
start cmd /k powershell -Command "Invoke-WebRequest https://raw.githubusercontent.com/hp10/PrimeNumbers-using-batch/main/PrimesTo10M -Outfile PrimesTo10M"
exit
