' Par Hugo7 
msg = "Les fichiers temporaires ont étés supprimés." 
 
Set moteur = CreateObject ("sapi.spvoice")
moteur.Speak msg
