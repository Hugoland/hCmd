' Par Hugo7 
msg = "Les fichiers temporaires cr��s par hache commande dans le dossier c� temp hache commande ont �t�s supprim�s!" ' CTRL+C
 
Set moteur = CreateObject ("sapi.spvoice")
moteur.Speak msg
