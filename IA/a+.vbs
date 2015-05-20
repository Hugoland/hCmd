' Par Hugo7 
msg = "Vous êtes sorti du logiciel. Merci de l'avoir utilisé!"
 
Set moteur = CreateObject ("sapi.spvoice")
moteur.Speak msg
