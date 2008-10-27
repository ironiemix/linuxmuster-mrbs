Hinweise zu linuxmuster-mrbs
----------------------------
---------------
1) Installation
---------------
--------------------------------------
1a) Mit "unsupported" Paket Repository
--------------------------------------
Stellen Sie sicher, dass sich in der Datei /etc/apt/sources.list
ein Eintrag der Form

# unsupported
deb http://www.linuxmuster.net/lml30-unsupported ./

befindet. Aktualisieren Sie die Paketliste mit dem Befehl

aptitude update

Die Installation des Pakets erfolgt anschliessend mit 

apt-get install linuxmuster-mrbs

-------------------------------
1b) Installation der .deb-Datei
-------------------------------
Laden sie die datei linuxmuster-mrbs_x.x.x-y-0_i386.deb 
auf ihren Server herunter. 

Das Paket mird mit dem Befehl 

dpkg -i linuxmuster-mrbs_x.x.x-y-0_i386.deb

installiert.

Die Moeglichkeit 1a) ist dem Vorgehen in 1b) unbedingt vorzuziehen.

----------
2) Upgrade
----------

Bei einem Upgrade vom angepassten tar.gz von lehrerfortbildung-bw.de 
werden folgende Aenderungen durchgefuehrt:

* Die Konfigurationsdatei config.inc.php wird nach /etc/mrbs/ verlinkt
* Das Kennwort des mrbs DB Benutzers wird auf einen Zufallswert gesetzt. 
Diese Aenderungen werden in mysql und config.inc.php vorgenommen. 

Insgesamt sollte das System ohne weitere Anpassungen weiterverwendet 
werden koennnen, das eingestellte Stundenraster bleibt gueltig.
Alle bereits eingetragenen Buchung werden uebernommen.

-------------------------------------------
3) Anpassung von Stundenraster und Aussehen
-------------------------------------------

Das *Stundenraster* wird in der Datei /etc/mrbs/config.inc.php festgelegt.
Ein Beispiel findet sich in der Datei, fuer jede Stunde ist eine 
Zeile der Form 

$periods[] = "(1.)07:40-08:25";

anzulegen.

Wenn man sehr viele Geraete und Raeume verwalten muss, empfiehlt es sich, 
die Einstellung

$area_list_format = "list";
#$area_list_format = "select";

durch umsetzen des gartenzauns von "list" nach "select" zu aendern, dann 
werden Raum- und Geraeteliste als  Select-Box und nicht mehr als 
Listen ausgegeben.

Das HTML-Layout in linuxmuster-mrbs wurde gegenueber dem Originalpaket 
dahingehend veraendert, dass die Seite weitgehend aus <div>-Tags besteht, 
die mit CSS-Klassen versehen wurden.  

Das Aussehen kann durch Aenderungen in der Datei /etc/mrbs/mrbs_usermod.css 
beeinflusst werden. Einige beispielhafte Aenderungen wurden dort bereits vorgenommen.

Aendern Sie neicht die Dateien im Verzeichnis /usr/share/mrbs-1.2.5, diese werden 
beim Paketupdate ungefragt ueberschrieben, wohingegen bei den dateien in /etc/mrbs 
Rueckfrage stattfindet.
