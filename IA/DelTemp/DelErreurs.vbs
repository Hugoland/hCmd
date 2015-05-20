' Par Hugo7 
msg = "Les rapports d'erreurs ont bien étés supprimés. J'espère que vous les avez transmi à Hugo, cela aide au logiciel." '
 
Set moteur = CreateObject ("sapi.spvoice")
moteur.Speak msg
