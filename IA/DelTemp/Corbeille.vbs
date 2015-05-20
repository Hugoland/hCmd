' Par Hugo7 
msg = "La corbeille a été vidée."
 
Set moteur = CreateObject ("sapi.spvoice")
moteur.Speak msg
