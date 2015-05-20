' Par Hugo7 
msg = "Il vous reste des rapports d'erreurs à transmettre à Hugo." ' 
 
Set moteur = CreateObject ("sapi.spvoice")
moteur.Speak msg
