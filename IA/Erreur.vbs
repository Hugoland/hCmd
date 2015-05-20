' Par Hugo7 
msg = "Une erreur s'est produite lors du dernier lancement d'hache commande." 
 
Set moteur = CreateObject ("sapi.spvoice")
moteur.Speak msg
