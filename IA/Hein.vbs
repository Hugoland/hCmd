' Par Hugo7 
msg = "Désolé, je n'ai pas compris votre demande."
 
Set moteur = CreateObject ("sapi.spvoice")
moteur.Speak msg
