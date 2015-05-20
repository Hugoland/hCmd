Calcul de la r&eacute;sistance.
::Compatible avec hCmd version 1.7.7 uniquement.
color f
DEL session.lock
if not exist batbox.exe goto eb

set 1=Indef
set 2=Indef
set 3=Indef
set 4=Indef
cls
echo.
echo Couleurs disponnibles
batbox /d "N" /c 0x04 /d "M" /c 0x0c /d "R" /c 0x06 /d "O" /c 0x0e /d "J" /c 0x0a /d "V" /c 0x01 /d "B" /c 0x05 /d "VI" /c 0x08 /d "G" /c 0x0f /d "BL" /c 0x06 /d "OR" /c 0x70 /d "AR" /c 0x0f
echo La premiere lettre de la couleur, en majuscule, B pour bleu BL pour blanc.
set/p a=Premiere bande: 
set/p b=Deuxieme bande: 
set/p c=Troisieme bande: 
set/p d=Quatrieme bande: 

pause
set dizaines=rcs%a%
set unites=rcs%b%
set multiplicateur=rm%c%
for /f "tokens=1,2 delims=:" %%R in ('type Resistance.bat ^| Find /i "%dizaines%"') do (
set a=%%S
)
for /f "tokens=1,2 delims=:" %%R in ('type Resistance.bat ^| Find /i "%unites%"') do (
set b=%%S
)
set cs=%a%%b%

pause
for /f "tokens=1,2 delims=:" %%M in ('type Resistance.bat ^| Find /i "%multiplicateur%"') do (
set c=%%N
)
pause
if/i %d%==or (
set d=5
goto resultatohm
)
if/i %d%==ar (
set d=10
goto resultatohm
)
goto ers
exit
:ifohm
::-- Chiffre Significatif
rcsN:0
rcsM:1
rcsR:2
rcsO:3
rcsJ:4
rcsV:5
rcsB:6
rcsVI:7
rcsG:8
rcsBL:9
::-- Multiplicateur
rmN:1
rmM:10
rmR:100
rmO:1000
rmJ:10000
rmV:100000
rmB:1000000
rmVI:10000000
rmG:i
rmBL:i
rmor:0,1
rmargent:0,01
goto :eof
:: --
:resultatohm
set/a ohm=%cs%*%c%
if %ohm%==0 goto ers
cls
echo.&echo.
echo    R‚sultat: %ohm% ohm(s), avec une tol‚rance de %d% pour cent.
pause
exit
:ers
cls
echo.
echo    Vous avez saisi un truc impossible!
echo         Verifiez l'orthographe.
REM goto ok
pause 
exit
:eb
cls
echo.
echo       Veuillez t‚l‚charger Batbox ou taper 'bb' dans hCmd.
REM goto ok
pause
exit
:ev
cls
echo.
echo   Vous ne pouvez pas utiliser ceci dans votre version de hCmd.
echo             T‚l‚chargez la version officielle 1.7.7.
REM goto ok
pause
exit