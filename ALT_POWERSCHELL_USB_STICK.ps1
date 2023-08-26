# Abfrage Rechnername EEPC vorgegeben

[string] $EWWPC = "EEWPC"

[string]$RechnerNUMMER = Read-Host -Prompt   "Bitte Rechner NUMMMER eingeben (EEWPC wird automatisch vorgestellt)"

$Rechnername = $EWWPC + $RechnerNUMMER

# Abfrage PIN

[string]$PIN = Read-Host -Prompt "Bitte PIN eingeben"

# Einlesen der XML Antwortdatei in XML Variable

[ xml ]$daten = Get-Content .\autounattend.xml

# Schreiben des Rechnernamens in XML Datei

$daten.unattend.settings[1].FirstChild.ComputerName = $RechnerName

# Einlesen des CMD Befehls aus der XML Date

[string]$String = $daten.unattend.settings[2].component[1].FirstLogonCommands.ChildNodes[1].CommandLine

# Abschneiden rechter Teil mit PIN

[string]$Teilstringlinks = $String.Substring(0,49)

# Zusammensetzen mit neuer PIN 

[string]$NeuePIN = $Teilstringlinks +" "+$PIN  

# Schreiben des Befehls mit neuer PIN in XLM Datei

$daten.unattend.settings[2].component[1].FirstLogonCommands.ChildNodes[1].CommandLine = $NeuePIN

# XML Sichern

$daten.Save(".\autounattend.xml")


 

