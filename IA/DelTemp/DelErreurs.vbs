' Par Hugo7 
msg = "Les rapports d'erreurs ont bien �t�s supprim�s. J'esp�re que vous les avez transmi � Hugo, cela aide au logiciel." '
 
Set moteur = CreateObject ("sapi.spvoice")
moteur.Speak msg
