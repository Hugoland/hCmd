Installeur de plugin <br/>automatique, apr&egrave;s avoir <br/>t&eacute;l&eacute;charg&eacute; ce dernier.

:: --------------------------------------------------------------------
:: PLUGIN: . . . . ."plinstall" par Skywalker
:: COPYRIGHT: . . (c) Skywalker, svp ne pas reproduire.
:: FICHIER: . . . . .plinstall.bat
:: --------------------------------------------------------------------

echo Glissez - d‚poser le plugin que vous avez t‚l‚charg‚ … installer ici :
echo.
set /p "pl_install=>>"

if not exist %pl_install% goto pl_not_exist
if     exist %pl_install% goto pl_exist

:pl_not_exist
echo Erreur, le plugin … installer n'existe pas au chemin sp‚cifi‚ !
goto end

:pl_exist
echo Installation du plugin en cours...
xcopy /p /c /q /y %pl_install% "%CD%"
echo Plugin install‚ !
echo.
goto end

:end
title Retour vers hCmd
ping pc -n 2 >nul
hCmd