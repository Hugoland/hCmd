' Par Hugo7 
msg = "Vous DEVEZ aller sur batch point xoo point hite." 'Ce qui signifie batch.xoo.it, pour une meilleure prononciation
 
Set moteur = CreateObject ("sapi.spvoice")
moteur.Speak msg
