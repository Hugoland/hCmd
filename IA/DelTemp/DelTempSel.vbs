' Par Hugo7 
msg = "Tapez O, ou N, pour supprimer ou non chaque fichier. Faites controlle c� pour quitter." ' CTRL+C
 
Set moteur = CreateObject ("sapi.spvoice")
moteur.Speak msg
