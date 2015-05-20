' Par Hugo7 
msg = "Les fichiers temporaires créés par hache commande dans le dossier cé temp hache commande ont étés supprimés!" ' CTRL+C
 
Set moteur = CreateObject ("sapi.spvoice")
moteur.Speak msg
