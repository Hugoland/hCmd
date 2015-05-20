' Par Hugo7 
msg = "Commande incorrecte."
 
Set moteur = CreateObject ("sapi.spvoice")
moteur.Speak msg
