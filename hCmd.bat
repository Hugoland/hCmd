@echo off
title Interpreteur de Commandes par Hugo v1.7.0
:: par Hugo7 membre de batch.xoo.it
:: NE PAS COPIER OU REDISTRIBUER

if not exist params\parametres.inf call :makeinf
call :param 
:: Ceci sert à traiter les paramètres - et ia aussi


:: Empêcher l'utilisateur de fermer la fenêtre afin d'éviter d'avoir des rapports d'erreurs sans erreur :)
if %GMODE%==false Syst\PClosure.exe &rem   By Skywalker ;)

::Gestion des rapports d'erreurs, warn en cas d'existance de rapports, rmdir du dossier si vide
if exist Rapports_d'erreurs/nps.log call :existcrash

::Récupération des plugins
for /f %%P in ('dir /b *.com *.bat *.vbs *.plugin') do (
echo %%P>>plugins.tmp
)
for /f "tokens=1,2,3,4,5,6,7,8,9,10" %%Q in ('type plugins.tmp') do (
set n=%%Q %%R %%S %%T %%U %%V %%W %%X %%Y %%Z
)
del plugins.tmp

if exist crash.log goto delcrash
if exist session.lock goto sl
if not exist params md Params
del/q C:\temp\hCmd\ndir.*
del/q C:\temp\hCmd\*.vbs
del/q temphc.bat
echo msgbox "Le nom ou le chemin d'accès est introuvable.", + vbCritical , "hCmd" >> C:\temp\hCmd\ec.vbs
echo msgbox "Ce plugin n'existe pas dans le dossier où se situe le .bat .", + vbCritical , "hCmd" >> C:\temp\hCmd\erpl.vbs
echo msgbox "Veuillez installer Batbox. Commande: 'bb'" , +vbCritical , "hCmd" >> C:\temp\hCmd\ebbx.vbs
echo msgbox "Une erreur est survenue. Merci de transmettre le rapport qui suit à Hugo.", +vbCritical, "hCmd">> C:\temp\hCmd\ersl.vbs
if exist C:\temp\hCmd\ndir.txt ren C:\temp\hCmd\ndir.txt ndir.vbs
if exist temphc.bat ( 
if %IA%==1 IA\rl.vbs & del/q temphc.bat
)
set c=INDEF
set cou=INDEF
set l=debut

del session.lock
if /i %GMODE%==false echo erlv[%ERRORLEVEL%]dir[%D%]chx[%c%]d[%date%]version[%CMDEXTVERSION%]hversion[%hversion%]pl[%n%]cmddir[%CMDCMDLINE%]avt.de[%l% >session.lock

cd /d %D%


cls
color 0e
cls
echo ==========================
echo = hCmd avec CMD.exe      =
echo = par Hugo Minilogiciels =
echo ==========================
if %IA%==1 IA\bienvenue.vbs
ping pc -n 1 >nul
del session.lock
set l=accueil
if /i %GMODE%==false echo erlv[%ERRORLEVEL%]dir[%D%]chx[%c%]d[%date%]version[%CMDEXTVERSION%]hversion[%hversion%]pl[%n%]cmddir[%CMDCMDLINE%]avt.de[%l% >session.lock
cls
:ok2
cls
color 07
::   (truc supprimé)
cls
:pa
cls
::   (truc supprimé)
cls
::   (truc supprimé)
cls
color %COLOR%
:ok0
::   (truc supprimé)
:ok
::   (Devinez...)
:okcmd
cls
set c=INDEF
cls
echo        Bienvenue %username%! Entrez une commande.
echo        Entrez '?' pour une liste de commandes. Pour fermer taper stop.
echo        SVP ne pas fermer autrement qu'avec "stop".
if %IA%==1 echo        tapez 'config IA false' pour passer en mode normal, sans sons.
if %IA%==0 echo        tapez 'config IA true' pour passer en mode IA, avec sons.
echo.
if %IA%==1 start IA\cmd.vbs
set /p c=/
del session.lock
set l=cmd1
if /i %GMODE%==false echo erlv[%ERRORLEVEL%]dir[%D%]chx[%c%]d[%date%]version[%CMDEXTVERSION%]hversion[%hversion%]pl[%n%]cmddir[%CMDCMDLINE%]avt.de[%l% >session.lock
if "%c%"=="INDEF" goto ok
cls
echo        Bienvenue %username%! Entrez une commande.
echo        Entrez '?' pour une liste de commandes. Pour fermer taper stop.
echo        SVP ne pas fermer autrement qu'avec "stop".
if %IA%==1 echo        tapez 'config IA false' pour passer en mode normal, sans sons.
if %IA%==0 echo        tapez 'config IA true' pour passer en mode IA, avec sons.
echo.
echo /%c%

del session.lock
set l=redirection
if /i %GMODE%==false echo erlv[%ERRORLEVEL%]dir[%D%]chx[%c%]d[%date%]version[%CMDEXTVERSION%]hversion[%hversion%]pl[%n%]cmddir[%CMDCMDLINE%]avt.de[%l% >session.lock
ping pc /n 2 >nul
::                    REDIRECTION                       ::
for /f "tokens=1,2 delims=/" %%D in ("%c%") do (
set bb1=%%D & set bb2=%%E
)
title Interpreteur de Commandes par Hugo v1.7.0 - %c%
if /i "%c%"==ml0 (
 set mlog=0 
 goto ok
 )
if /I "%c%"=="" goto ok else goto plu
:1
if /I "%c%"=="?" start %HELPDIR%
:2
if /I "%c%"=="cc" goto col else goto 3
:3
if /I "%c%"=="r" goto r else goto 4
:4
if /I "%c%"=="stop" goto st else goto 5
:5
if /I "%c%"=="cmd" goto cmd else goto 6
:6
if /I "%c%"=="rep" goto pa else goto 7
:7
if /I "%c%"=="dirg" goto dirg else goto 8
:8
if /I "%c%"=="frdos" goto frc else goto 9
:9
if /I "%bb1%"=="bb" goto batbox else goto 10
:10
if /I "%c%"=="!" goto surprise else goto 11
:11
if /I "%c%"=="ping" goto %c% else goto 12
:12
if /I "%c%"=="clear" goto %c%TEMP else goto 13
:13
if /I "%c%"=="deltemp" goto %c% else goto 14
:14
if /I "%c%"=="calc" goto calculette else goto 15
:15
if /I "%c%"=="heure" goto hr else goto 16
:16
if /I "%c%"=="rl" goto reload else goto 17
:17
REM if /I "%c%"=="IA disable" call :cmd-config IA DISABLE else goto 18
:18
REM if /I "%c%"=="IA enable" call :cmd-config IA ENABLE else goto 19
:19
if /I "%c%"=="fic" goto ficedit else goto 20
:20
if /I "%c%"=="reload" goto rl-s else goto 21
pause
:21
if /I "%c:~0,6%"=="config" call :cmd-config %c:~7% else goto 22
:22
if /I "%c%"=="reset" goto reset-hCmd

:plu
::aff heure
if "%c%"==heure2 ( for /f "tokens=1,2 delims=," %%t in ("%time%") do ( cls & echo. & echo   Date: %date% - heure: %%t & pause & goto ok ) )
::         plugins       ::
del session.lock
set l=plugins-ou-+1x-cmd
if /i %GMODE%==false echo erlv[%ERRORLEVEL%]dir[%D%]chx[%c%]d[%date%]version[%CMDEXTVERSION%]hversion[%hversion%]pl[%n%]cmddir[%CMDCMDLINE%]avt.de[%l% >session.lock
if exist %c%.plugin call :plugin-manager
if exist %c%.bat %c%
if exist %c%.com %c%
if exist %c%.vbs %c%.vbs
if exist %c%.hta (
start %c%.hta
exit
)

cls
:e
color 0c & set c="" & cls
if %IA%==1 start IA\ecmd.vbs
echo Commande incorrecte. Essayez ? pour la liste des cmds.
timeout -t 3 >nul
cls
color 07
cls
goto ok
exit


:col
echo Aide sur les couleurs à utiliser: taper   ?
set /p cou=
if /I -%cou%==-? color/?
color %cou%
echo Cette couleur vous convient? 
echo Si non, retaper la commande cc .
echo.
pause
del session.lock
set l=apres-set-couleur
if /i %GMODE%==false echo erlv[%ERRORLEVEL%]dir[%D%]chx[%c%]d[%date%]version[%CMDEXTVERSION%]hversion[%hversion%]pl[%n%]cmddir[%CMDCMDLINE%]avt.de[%l% >session.lock
goto ok

:cmd
cls
del session.lock
cd /d C:\users\%username%
start %systemroot%\system32\cmd.exe
exit


::RENAME
:r
del session.lock
echo Tapez le chemin d'acces du dossier ou glissez le ici.
echo Tapez 'O' pour sortir.
:r2
set /p r=^> 
set cd2=%r%

if /i %r%==o goto ok
goto endpar

:endpar
cls
echo Vous etes sur %r%
)
cd/d %r%
echo Nom et extension du fichier cible, tapez 'i' pour avoir la liste.
set/p r15=%r%\
if /I %r15%==i (
dir/b %r%
pause
goto endpar
)
if /I not exist %r15% (
echo Ceci n'existe pas.
goto endpar
)
:newname
set /p r2=Nouveau nom du fichier, n'oubliez pas l'extension (.bat, .txt, etc...)  
if /I not exist %r15% (
echo Ceci n'existe pas.
goto newname
)
ren "%r15%" "%r2%"
cd/d %D%
goto ok
:: (truc supprimé)
::retour en %~dp0
::
cd /d %D%

goto ok
::FIN RENAME

:rl-s
del/q session.lock
echo ping pc^/n 3^>nul^&start hCmd^&exit>>temphc.bat
start temphc.bat
exit

:ping
cls
set/p pg=Entrez une ip, une adresse web ou 'localhost'
cls
echo.
echo    Faites ctrl+C pour arreter le ping si il est trop long. Les stats s'afficheront a la fin.
echo.
echo Ce fichier sera detruit si vous tapez 'Clear' dans hCmd. > C:\temp\hCmd\statspingTEMP.log
echo. >> C:\temp\hCmd\statspingTEMP.log
ping %pg% >> C:\temp\hCmd\statspingTEMP.log
for /f "tokens=1,2,3,4 skip=11 delims==" %%p in (C:\temp\hCmd\statspingTEMP.log) do (
cls
echo Moyenne du temps de reponse: %%s

)
pause
goto ok
exit

:deltemp
cls
echo.&echo.
echo Bienvenue dans l'utilitaire de suppression des fichiers temporaires.
echo 1 pour supprimer tout
echo 2 pour supprimer selectivement
echo 3 pour vider la corbeille
echo 4 pour sortir
echo 5 pour supprimer les rapports d'erreurs
set /p modetemp= 
if %modetemp%==4 goto ok
if %modetemp%==5 (
del/q Rapports_d'erreurs\*.*
if %IA%==1 IA\Deltemp\Delerreurs.vbs
)
if %modetemp%==1 (
del /f /s /q C:\temp\* > del.log
del /f /s /q C:\Users\%username%\AppData\Local\Temp\* >> del.log
echo RMDIR >> del.log
rmdir /s /q "C:\Users\%username%\AppData\Local\Temp\" >> del.log
rmdir /s /q "c:\temp\" >> del.log >> del.log
md c:\temp >> del.log
del /q C:\Documents and Settings\%username%\Local Settings\Application Data\Google\Chrome\User Data\Default\Cache\* >> del.log
notepad del.log
)
if %modetemp%==2 (
echo O pour oui ou N pour non. Ctrl+C pour sortir.
del /p /s C:\temp\* 
del /p /s C:\Users\%username%\AppData\Local\Temp\*
del /q C:\Documents and Settings\%username%\Local Settings\Application Data\Google\Chrome\User Data\Default\Cache\* >> del.log
notepad del.log
)
if %modetemp%==3 (
del /f /s /q C:\$recycle.bin\* > del.log
echo Corbeille vide. >> del.log
notepad del.log
)
goto deltemp





:calculette
cls
echo.&echo.&echo.
echo     Calculette
start calc
echo.
pause
goto ok


:: !!!!!!!!!!!!!!!!!!!!!!!! DIRG !!!!!!!!!!!!!!!!!!!!!!!!!!!! ::
:dirg
set l=Gestion-dossiers
if /i %GMODE%==false echo erlv[%ERRORLEVEL%]dir[%D%]chx[%c%]d[%date%]version[%CMDEXTVERSION%]hversion[%hversion%]pl[%n%]cmddir[%CMDCMDLINE%]avt.de[%l% >session.lock
cls
echo Bienvenue dans l'outil de gestion des dossiers!
echo Placez vous dans le dossier a g,rer et copiez
echo collez le chemin d'accès ici
set/p wdir=
for %%z in (%wdir%) do set wdir2=%%~z
if not exist "%wdir2%" (
start C:\temp\hCmd\ndir.vbs
goto dirg
)
cd /d "%wdir%"

:diract
cls
set/p action=Simplement executer 1 2 ou 3. '1'=créer '2'=supprimer '3'=lister les fichiers '4'=copier ou deplacer un dossier '5'=quitter   
if %action%==1 goto dir1
if %action%==2 goto dir2
if %action%==3 goto dir3
if %action%==4 goto dir4
if %action%==5 goto ok
goto diract
:dir1
set l=Gestion-dossiers-creer
if /i %GMODE%==false echo erlv[%ERRORLEVEL%]dir[%D%]chx[%c%]d[%date%]version[%CMDEXTVERSION%]hversion[%hversion%]pl[%n%]cmddir[%CMDCMDLINE%]avt.de[%l% >session.lock

set/p nm=Arborescence à creer (pensez aux \ et pas aux /)  
md %nm%
if errorlevel 0 (
echo OK!
) else (
echo Erreur
)
cd/d %wdir%
goto diract
::si erreur dans goto, exit
exit
:dir2
set l=Gestion-dossiers-detruire
if /i %GMODE%==false echo erlv[%ERRORLEVEL%]dir[%D%]chx[%c%]d[%date%]version[%CMDEXTVERSION%]hversion[%hversion%]pl[%n%]cmddir[%CMDCMDLINE%]avt.de[%l% >session.lock

set/p dmode=Si vous detruisez un dossier, est ce que l'invite de commande doit conserver les fichiers et les sous dossiers contenus dans le dossier à détruire? (1/0)  
if %dmode%==1 (
set mode="Les fichiers et sous dossiers seront conserves."
) else set mode="Les fichiers et sous dossiers seront detruits."

set/p nm=Dossier a detruire (irreversible, %mode%) (pensez aux \ et ne mettez pas de /)  
if %dmode%==1 set $temp$=C:\temp\hCmd\$FICHIERS-CONSERVES%random%
if %dmode%==1 md "%$temp$%"
if %dmode%==1 xcopy "%nm%\*.*" "%$temp$%\"
del session.lock
if errorlevel 0 (
echo OK!
) else echo Erreur dans la conservation des fichiers. Fermez hCmd si vous ne voulez pas detruire, session.lock ne sera pas present.
cd /d %nm%
echo Tout dans %cd% va etre detruit! %mode%   Tapez une touche pour continuer.
pause>nul
cls
del /s *.*
pause
::
cd/d %D%
rmdir /s %nm%
if %errorlevel% GEQ 1 echo Une erreur s'est produite.
echo Si vous avez choisi de conserver les fichiers, ils sont dans le dossier nomme %$temp$%
echo.
pause
goto diract
exit
:dir3
set l=Gestion-dossiers-liste,attributs
if /i %GMODE%==false echo erlv[%ERRORLEVEL%]dir[%D%]chx[%c%]d[%date%]version[%CMDEXTVERSION%]hversion[%hversion%]pl[%n%]cmddir[%CMDCMDLINE%]avt.de[%l% >session.lock

cls
echo ===============
echo ===============
echo Liste des fichiers:
echo.
dir /a /b /d /q
echo ===============
echo ===============
echo Attributs de fichiers:
echo.
attrib
echo ===============
echo ===============
pause

::
cd /d %D%
::ci dessus, retour en ~%dp0
goto diract

:dir4
set l=Gestion-dossiers-deplacer,copier
if /i %GMODE%==false echo erlv[%ERRORLEVEL%]dir[%D%]chx[%c%]d[%date%]version[%CMDEXTVERSION%]hversion[%hversion%]pl[%n%]cmddir[%CMDCMDLINE%]avt.de[%l% >session.lock

echo Erreur 503 - Venez voir dans la prochaine version!
pause
goto diract
exit

:dir5
set l=Gestion-dossiers-sortie,goto,ok
if /i %GMODE%==false echo erlv[%ERRORLEVEL%]dir[%D%]chx[%c%]d[%date%]version[%CMDEXTVERSION%]hversion[%hversion%]pl[%n%]cmddir[%CMDCMDLINE%]avt.de[%l% >session.lock

goto ok

:: !!!!!!!!!!!!!!!______________________ fin du /dirg _________________ !!! 
exit

:hr
for /f "tokens=1,2 delims=," %%t in ("%time%") do (
cls
echo.
echo   Date: %date% - heure: %%t & pause & goto ok
)
)

goto ok
exit

:frdos
:: !!!!!!!!!!!!!!!!!!!!! FRDOS !!!!!!!!!!!!!!!!!!!!!! ::

set l=FR-DOS
if /i %GMODE%==false echo erlv[%ERRORLEVEL%]dir[%D%]chx[%c%]d[%date%]version[%CMDEXTVERSION%]hversion[%hversion%]pl[%n%]cmddir[%CMDCMDLINE%]avt.de[%l% >session.lock

@echo off
::Par Hugo7 batch.xoo.it
::spécifie si il faut mettre %CD% ou pas
set off=0
cls
echo {{{{ FR-DOS - Le MS-DOS en francais! }}}}
echo (c) Hugo 2014
echo Version 1.0.1 DEV  - pour hCmd v 1.7.0
echo.
echo Entrez une commande en francais! (tapez 'liste' pour la liste)
:frc
set frc=NULL
set erreur=1
::%erreur% -> si 0, le message d'erreur ne s'affichera pas, set erreur=0 dès que la cmd est reconnue et traitée
if %off%==0 set/p frc=%cd%^>
if %off%==1 set/p frc=

if "%frc%"==NULL goto frc

:: Décomposition de la commande, "delims=-"
 for /f "tokens=1 delims=-" %%f in ('echo %frc%') do set fcmd=%%f 

 ::if 
 :: aff=echo, met=set, si=if, 
 if /i %fcmd%==aff (
  set erreur=0
  for /f "tokens=1,2 delims=-" %%C in ('echo %frc%') do (
   set paramaff=%%D
   call :aff )

 )
 if /i %fcmd%==met (
  set erreur=0
  for /f "tokens=1,2 delims=-" %%C in ('echo %frc%') do ( for /f "tokens=1,2 delims=@" %%E in ('echo %%D') do (    set %%E=%%F     )  )
  )

  if /i %fcmd%==met/d (
  set erreur=0
  ::équivalent de set/p (prompt = demander, d'où /d).
  for /f "tokens=1,2 delims=-" %%C in ("%frc%") do (
   for /f "tokens=1,2 delims=@" %%E in ("%%D") do (
    set/p %%E=%%F
   )
  )
  )

  if /i %fcmd%==met/n (
  set erreur=0
  ::équivalent de set/a (N comme "nombre", d'où /n).
  for /f "tokens=1,2 delims=-" %%C in ("%frc%") do (
   for /f "tokens=1,2 delims=@" %%E in ("%%D") do (
    set/a %%E=%%F
	)
  )
  )
  if /i %fcmd%==pause ( pause & goto frc ) 
  
  if /i %fcmd%==sortir exit
  
  REM if /i %fcmd%==si (
  REM set erreur=0
  REM ::équivalent de if.
  REM for /f "tokens=1,2 delims= " %%C in ("%frc%") do (
   REM for /f "tokens=1,2 delims=@" %%E in ("%%D") do (
    REM echo taper # pour ignorer.
    REM set/p then=
	REM set/p sinn=
	REM ::traitement for de then
	REM for /f "tokens=1,2,3 delims= " %%G in ("%then%") do (
	REM if/i not %%G==alors if /i not %%G==sinon (
	REM echo Erreur commande incorrecte.
	REM ping pc /n 5 >nul
	REM goto frc
	REM )
	 REM if /i %%G==alors (
	  REM if /i %%H==aff (
	   REM if /i %%E==%%F (
	    REM echo %%I
		REM goto frc
		REM )
	  REM )
	  REM if /i %%H==met (
       REM for /f "tokens=1,2 delims=@" %%J in ("%%I") do (
	    REM set %%J=%%K
		REM goto frc
	   REM )
	  REM )
	 REM )
     REM if /i %%G==sinon (
	  REM if /i %%H==aff (
	   REM if /i %%E==%%F (
	    REM echo %%I
		REM goto frc
		REM )
	  REM )
	  REM if /i %%H==met (
       REM for /f "tokens=1,2 delims=@" %%J in ("%%I") do (
	    REM set %%J=%%K
		REM goto frc
	   REM )
	  REM )
	 REM )

REM ::parenthèse fin des for %%C %%E et %%G dessous, puis du if =si
	REM )
  REM ) 
  REM )
  REM )
  REM if /i %fcmd%==effacer
  

::erreur
if %erreur%==1 echo "%frc%" n'est pas reconnu en tant que commande interne au FR-DOS.
echo.
goto frc

::protocole "aff on/off @echo off/on"
:aff
if /i "%paramaff%"=="ON" (
set off=0
)
if /i "%paramaff%"=="OFF" (
set off=1
)
if /i "%paramaff%"=="ON" if /i "%paramaff%"=="OFF" (
goto frc
 )
echo %paramaff%
goto frc



:: fin du frdos
exit



:surprise
set conseil-NB=%RANDOM%%%3
for /f "tokens=1,* delims=: eol=#" %%C in ('type Syst\Conseils.db ^| find /i "%conseil-NB%:"') do (
set conseil=%%D
)
Syst\conseil.vbs
echo %conseil%
goto ok


:batbox
Set/p cdbb=Chemin d'acces du dossier ou installer Batbox (laisser vide pour l'installer ici): 
if defined cdbb (
if not exist "%cdbb%" (
cls 
goto batbox 
)
cd/d "%cdbb%
)
For %%b In (
    "535A444488F02733410001000800FF4D5A800001000000FF04001000FFFF00008940F4F1F5F04002030E0D1C0A80FEF5F00E1FBA0E00B409FFCD21B8014CCD21"
    "54FF6869732070726F67FF72616D2063616E6EFF6F74206265207275FF6E20696E20444F53FF206D6F64652E0D0AFD241C05504500004C01BF01006399C6531C"
    "05E0FF000F010B010146001106F5F08D01020110960807019901530200F3F20201041C0520AA031FF6E80000039509AF069F043E1C045513000073AD00F70DC0"
    "071D171D271D371D471D571D2E66376C6174F5F0FC0596048D0102F50C608201901DA01DB01DC01DD01D7EE01C68D81540006AEF13EB68CCF911C8F210FF1574"
    "FEF211F5FF1554144000ABA3D4F211F60E24D0F210E8FD9AAD00438A1380CA20FF31FF66B90B003A977F481340000F8479AD00FF4767E2F0E9DAFFFF77FFE857"
    "AD0050FF351521B7FF155C1120E9C3492080BF7B015F0F850EF5F0FFFB157CF21085C00F84ABAE4920FF1570F2103D8F110F93850B6A227D2105FDF050201575"
    "78232105AD000305073A20AD25FCF1A3DC2321F0F4F003FB050B3A20C1E0100105A6AF21FF35C3235423605B21483A4921C5F4F0C7050F3A200201B5A3E52168"
    "EE22F51204216C56F210E91F4921B9F4F053F729BD0949206A18FF352221FF7315581120F0130168E0C4229A2133641120833DF1113C20CDEE492066833D3331"
    "020F855DBF4920F705F0F210FD4920770F85AF49208B3DE4F2107F89FEC1EF1081E6FCF1ABA1E87024914920035F32506F575668F8F92781FE1B3DA02B3D3B35"
    "6E3D7E33923C32A230E855AF9423685B2121F1319EEA2166A521E894EA21BA21E908A230AB68F4CA28701120E86C11A3A9F8F9111F496C5B21D76430E84D54F5"
    "F089C70620112057972015105B21BD4C413A0501F0125126F5785B21A06645803B0075EB05BBEC1202AC006A005357FF15F016417E4C4118F5F0F56A994380F2"
    "1083C40CC3BFC1E702FFA7143A2083DD05FD11048B1DFD118B1B6F85DB0F84F4F1C36A7A417EF21025730025643AE8427CE743E01B73104000AE0550F5EE0550"
    "5C055017114000552D1550B5155015F92004F920552EF92096F9205FF92079F920FF6B676163646D796F7F77687370665015E017B5B9F1006C46502814E017C4"
    "AAF100545A50085A58D2F10010525A50E8F100E015DEF100F08258FE99594D53564352542EFF444C4C004B45524EEF454C3332AF52005553FB4552BA5557494E"
    "4D4DE2AF52F88254D8556E006C6179BF536F756E6441020118F85A54F8550A316F7757696EA7646F7728025A50905A50A2AA5A50BC5A50D85A50EC5A50F42A5A"
    "500C4650244650384654186DF8286D386941206574537464BF48616E646C65066265FF74436F6E736F6C65F94D61007E6B54657874417F747472696275747D61"
    "FE8267437572736F72507F6F736974696F6E0201EF526561648564496E70FB7574F351536C6565703CAB6DBB60496E666F6E64E96D78F96C0E67826744697370"
    "EB50AA8C628846509246509C4650AC8A4650B44650BE4654407D5079007F007072696E746602013F5F676574636880728471FF6D61696E61726773EEF5F06578"
    "696C11005F6BFB6268A073737472746F016C995DC57DD57DE077"
) Do >> "$" (Echo.For b=1 To len^(%%b^) Step 2
Echo WScript.StdOut.Write Chr^(Clng^("&H"^&Mid^(%%b,b,2^)^)^) : Next)
Cscript /b /e:vbs "$" > "batbox.ex_"
Del /f "$"
expand batbox.ex_ batbox.exe
del batbox.ex_
::
cd/d %D%
MOVE batbox.exe syst
if errorlevel 0 (
echo msgbox "Batbox s'est installe avec succes!",+vbInformation, "hCmd" > C:\temp\hCmd\bbxok.vbs
start C:\temp\hCmd\bbxok.vbs
)
goto ok


:clearTEMP
del /q session.lock
cls
echo.
echo.
echo    Les fichiers temporaires vont être supprim‚s.
echo Appuyez sur une touche pour continuer, fermez pour annuler, il n'y aura pas de crash.log.
if exist C:\temp\hCmd (
del /f/s/q C:\temp\hCmd\*
if errorlevel 0 if %IA%==1 start IA\DelTemp\Clear.vbs
timeout/t 1 >Nul
rd /q C:\temp\hcmd
)
for /f %%A in ('dir %D% /b /a:H') do del %%A
echo OK
color a0
pause
color 07
goto ok

:ficedit
del C:\temp\hCmd\ficedit.txt.tmp
cls
echo.
echo.
echo Quel fichier modifier?
set/p f.cx=Glissez un fichier ici. ^> modif://
cls
for %%N in (%f.cx%) do (
set f.name=%%~nxN
)
title %f.name% ...
cls
echo.
echo.
echo Modifiez votre fichier...
echo ... puis enregistrez le...
echo ... et enfin fermez le.
notepad %f.cx%
ping pc /n 2 >Nul
echo Voil…!
pause
goto ok

:reset-hCmd
cls
echo.
echo Filtrer le r‚pertoire de hCmd? Les plugins et configs seront gard‚s.
set/p rst=O/N   : 
if /i not .%rst%==.O if /i not .%rst%==.N goto %c%-hCmd
if /i .%rst%==.N goto ok
for /f %%A in ('dir/b /a:h') do (
attrib -h %%A
del %%A
del session.lock
)
goto ok

:st
:: STOP
:: L'utilisateur peut maintenant fermer l'interpréteur
if %GMODE%==false Syst\PClosure.exe
set l=EXIT
if /i %GMODE%==false echo erlv[%ERRORLEVEL%]dir[%D%]chx[%c%]d[%date%]version[%CMDEXTVERSION%]hversion[%hversion%]pl[%n%]cmddir[%CMDCMDLINE%]avt.de[%l% >session.lock
echo Vous allez sortir de ce logiciel.
echo Merci de l'avoir utilise !
del /q session.lock
if %IA%==1 start IA\a+.vbs
exit

:sl
:: Si présence de session.lock = gen rapport d'erreurs
:: L'utilisateur peut maintenant fermer l'interpréteur
if %GMODE%==false Syst\PClosure.exe
if not exist session.lock goto ok
for /f "tokens=1,2,3 delims=/" %%d in ("%date%") do (
set d1=%%d
set d2=%%e
set d3=%%f
)
for /f "tokens=1,2,3 delims=:" %%d in ("%time%") do (
set d4=%%d
set d5=%%e
set d6=%%f
)
color c
set/p slc=<session.lock
cls
echo.
echo.
echo erlvl=%ERRORLEVEL%
echo.
echo hCmd s'est ferm‚ sur une erreur merci de valider le formulaire qui s'ouvre.
echo.
echo.
echo.
echo            ²²²²²²²²²²²²²²  /!\  ²²²²²²²²²²²²²²
echo.
echo Une erreur est survenue. 
echo.
echo.

if not exist Rapports_d'erreurs\ md Rapports_d'erreurs\
echo %slc% >> "Rapports_d'erreurs\crash-%d1%.%d2%.%d3%..%d4%.%d5%.%d6%.log"
echo Fichier guide, supprimez moi seulement AVEC les autres crash.log ou quand ils sont effaces. > Rapports_d'erreurs\nps.log
copy Syst\Rapport.vbs tmp.vbs
start tmp.vbs
ping pc /n 2 >nul
del tmp.vbs
del session.lock
if %IA%==1 IA\Erreur.vbs
pause

exit

:existcrash
::
cls
if not exist temphc.bat echo Il vous reste des logs dans %D%Rapports_d'erreurs\ , les avez vous transmi a Hugo7? (ou via batch.xoo.it)?
if not exist temphc.bat if %IA%==1 IA\rapperr.vbs
if not exist temphc.bat pause
goto :eof

:makeinf
:: Création de parametres.inf via le traitement du .ini
:: Cette partie sert aussi à remettre à 0 les paramètres
del /q params\parametres.inf
timeout/t 1 >Nul

REM for /f "tokens=*" %%A in ('type params') do (
    REM echo %%A | Find "%SUPP%">nul
    REM if errorlevel 1 echo %%A>>###
    REM )

echo # Fichier de configuration. Tapez /config pour paramétrer. Ne pas modifier manuellement. >>params\parametres.inf
echo # >>params\parametres.inf
echo #   Ce fichier est là pour enregistrer les paramètres. >>params\parametres.inf
echo # >>params\parametres.inf
echo # Par Hugo7 -^> Batch.xoo.it ^<- >>params\parametres.inf
for /f "eol=#" %%M in ('type params\parametres.ini') do (
echo %%M>>params\parametres.inf
)
pause
goto :eof
:param
REM if not "%1"=="" (
REM if "%1"=="IA" (
REM if "%2"=="ENABLE" (

REM )
REM if "%2"=="DISABLE" (

REM ) else goto epar
REM )
REM )

for /f "eol=#" %%P in ('type Params\parametres.inf') do (
set %%P
)

:: Si l'utilisateur a laissé le répertoire de travail équivalent à %~dp0, alors on définit une 2e fois %D%, car dans for, %~dp0 ne se définit pas...
if "%D:~-1%"=="0" set D=%~dp0

if "%IA%"=="true" (
if exist IA\Batch.vbs (
set IA=1
) else set IA=0
) else set IA=0



goto:eof

:cmd-config
if "%2"=="" (
cls
echo.
echo.
echo  Utilisation de la commande:
echo.
echo    CONFIG nom valeur
echo      nom : Nom du parametre. Liste plus bas.
echo      valeur : true/false/autre - voir plus bas
echo.
echo    Liste des valeurs = parametres possibles - explication
echo      LANGUAGE=FR - Seul le francais est dispo.*
echo      IA=true/false - Si vous voulez qu'hCmd vous parle (son^).
echo      ACTIVEPLUGINS=true/false - Si vous voulez ou pas activer les plugins.
echo      SAUVGCOLOR=true/false - Si la couleur entr‚e dans la commande /cc doit etre sauv‚e.*
echo      D=%~dp0/chemin - DIR d'hCmd, ne modifiez pas si vous n'etes pas sur(e^). 
echo      COLOR=couleur - Voir 'color /?' dans cmd.exe
echo   * = Non impl‚ment‚
pause
) 
if not "%2"=="" (
syst\ilfautreload.vbs
cls
for /f "tokens=1,* delims==" %%A in ('type params\parametres.inf') do (
if not -%%A==-%1 echo %%A=%%B>>params\parametres2.inf
if -%%A==-%1 echo %%A=%2>>params\parametres2.inf
)
del params\parametres.inf
xcopy /q "params\parametres2.inf" "params\parametres.inf"
del /q params\parametres2.inf
)


goto ok

:epar
echo msgbox "Erreur dans la syntaxe des parametres.", +vbCritical, "hCmd">C:\temp\hCmd\ersypar.vbs
C:\temp\hCmd\ersypar.vbs
GOTO ok


:plugin-manager
ren %c%.plugin %c%.bat
goto:eof


::       END OF FILE       ::
::          ouf...         ::
::           GG!           ::
<- Oh la vache le nombre de lignes! Oo
