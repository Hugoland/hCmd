' Par Hugo7 
msg = "D�sol�, je n'ai pas compris votre demande."
 
Set moteur = CreateObject ("sapi.spvoice")
moteur.Speak msg
