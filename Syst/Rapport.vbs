
'      Merci à Sachadee pour son code qui m'a appris comment utiliser nav.document.All.tags :D
'                             (Je savais même pas que c'était possible!)
'          http://batch.xoo.it/t4189-Comment-extraire-une-donn-e-d-un-site.htm?start=15
'

On Error Resume Next
'récupération du rapport d'erreur
Const ForReading = 1, ForWriting = 2, ForAppending = 8 
Set fso = CreateObject("Scripting.FileSystemObject" ) 
Set f = fso.OpenTextFile("session.lock", ForReading) 
C_Ligne = f.ReadAll 
f.Close
'
'Demande du nom
Nom = InputBox("Votre pseudo? (facultatif):", "hCmd")
'démarrage internet
set nav = CreateObject("InternetExplorer.Application")
nav.Navigate "http://bugtracker.gofox.eu/hcmd/api.php"
nav.Visible = true
Do While not nav.ReadyState = 4
Loop
nav.document.All.tags("input").Item("titre").Value = Nom
nav.document.All.tags("textarea").Item("news").Value = C_Ligne

