' Par Hugo7 
msg = "Vous �tes sorti du logiciel. Merci de l'avoir utilis�!"
 
Set moteur = CreateObject ("sapi.spvoice")
moteur.Speak msg
