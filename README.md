SafeSignal ermöglicht das einfache Aufsetzen eines rechtssicheren Routers bzw. Hotspots zum Betrieb in Gastronomie, Ferienwohnungen, Hotels sowie sonstigen Dienstleistungsbetrieben. Die Funktionalität ähnelt existieren kommerziellen Produkten von unter anderem sorglosinternet, freefii, SafeSpot, MaxSpot oder SmartSpot.
SafeSignal ist Freie Software und veröffentlicht unter der Lizenz GNU GPLv3.

*English summary: SafeSignal provides business with an easy and reliable hotspot solution specifically adapted to German law. It has been designed with cottages, hotels, cafes, restaurants, bars, and similar businesses in mind. The functionality is compareable to commercial solutions like sorglosinternet, freefii, SafeSpot, MaxSpot or SmartSpot. SafeSignal is released under the GNU GPLv3. Notice: The README is provided in German only, while the source features comments in English.*

### Überblick
Betriebe mit Kunden- oder Gästekontakt stehen vor der Herausforderung diesen einen einfachen und unkomplizierten Zugang zum Internet zu ermöglichen. Auf Grund der deutschen Gesetzeslage (die s. g. Störerhaftung) können jene Betriebe kostenpflichtig abgemahnt werden, sofern ihre Kunden und Gäste beispielsweise urheberrechtlich geschützte Werke im Internet herunterladen.

Die Open Source-Variante basiert auf der kommerziellen Variante von SafeSignal. Sie ist voll funktionstüchtig und lediglich funktionsreduziert um wenige Funktionen, wie die Verwaltung und Fernsteuerung einer Vielzahl von Hotspots, optisch aufgewerteten Begrüßungsseiten (Splash pages), einem zeitgesteuerten Betrieb, sowie einem Betrieb an UMTS-Sticks. Bei Interesse an diesen Funktionen wenden Sie sich bitte per Email an René Reineke (rene.reineke@safesignal.de).

### Vorteile des SafeSignal Hotspots
#### Deutliche Kostenvorteile gegenüber kommerziellen Lösungen
Existierende kommerzielle Lösungen sind zumeist teuer in der Anschaffung (50 bis 400 EUR) und verlangen eine  Servicepauschale im Abomodell (weitere 8,50 bis 50 EUR pro Monat). SafeSignal bietet eine vergleichbare Lösung auf Basis eines einfachen, handelsüblichen Routers sowie einer VPN-Verbindung. Der übliche Bezugspreis des Routers TP-Link TL-MR3020 (derzeit einziges unterstützes Modell, weitere können problemlos ergänzt werden) liegt bei 30 EUR. Eine übliche Monatspauschale für eine VPN-Verbindung liegt bei 5 EUR pro Monat (bspw. Mullvad).

#### Aufbau auf bestehende Internetinfrastruktur im Betrieb
Der SafeSignal Hotspot stellt eine Ergänzung zu einem eventuell bereits vorhandenen Router dar und ersetzt diesen nicht. Der SafeSignal Hotspot stellt ein gesondertes WLAN-Netz (SSID) zur Verfügung. Ausschließlich über dieses Netz erhalten Gäste bzw. Kunden ab Inbetriebnahme einen Zugang zum Internet erhalten.

#### Rechtssicher (Schutz vor Abmahnungen)
Sämtlicher Datenverkehr von Gästen resp. Kunden wird über eine gesonderte Route ins Internet (VPN) abgebildet und ist getrennt vom betriebseigenen Internetverkehr. Bei Verwendung eines VPN-Zugangs ohne Logging ist eine vollständige Rechtssicherheit gegeben, da ihre Gästen resp. Kunden mit einer anderen IP-Adresse im Internet surfen. Sofern die VPN-Verbindung unterbrochen wird, sind sie weiterhin geschützt und der Gastzugang ins Internet wird solange unterbrochen bis die sichere VPN-Verbindung wiederhergestellt wurde.

#### Wartungsfrei und einfach zu nutzen
Nach einer Erstkonfiguration ist der Betrieb des SafeSignal Hotspots quasi wartungsfrei. Eine Schulung von Mitarbeiter ist nicht erforderlich. Gäste und Kunden erhalten nach Verbindungsaufbau mit dem SafeSignal WLAN-Netz eine konfigurierbare Startseite angezeigt und können per Mausklick direkt und unbeschränkt ins Internet.

#### Energieeffizient
Bei Verwendung des empfohlenen Routers TP-Link TL-MR3020 beträgt der Stromverbrauch unter 1 Watt pro Stunde. Vergleichbare kommerzielle Lösungen setzen auf Hardware, die im Mittel zwischen 5 bis 12 Watt verbrauchen und damit deutlich weniger energieeffizient sind.

### Voraussetzungen zur Inbetriebnahme

#### Infrastruktur
* Bestehender Internetzugang mit (WLAN-)Router (Hersteller/ Modell quasi beliebig) mit freiem LAN-Anschluss, MAC-Schutz ist ausgeschaltet und IP-Adressen werden automatisch vergeben (übliche Konfiguration)
* 220 V-Steckdose (alternativ freier USB-Anschluss bei Verwendung des TP-Link TL-MR3020 als SafeSignal Hotspot ausreichend)

#### Hard- und Software
* Unterstützter Router als Basis für den SafeSignal Hotspot (derzeit lediglich TP-Link TL-MR3020, Bezug bspw. hier: [Amazon](http://www.amazon.de/TP-Link-TL-MR3020-WLAN-Router-frustfreie-Verpackung/dp/B00634PLTW/)
* SafeSignal Firmware zur Installation auf dem Router (Bezug hier)
* VPN-Zugang zur Verwendung im SafeSignal Hotspot (empfohlen wird [Mullvad](http://www.mullvad.net))

### Anschluss, Installation, Anpassung und Betrieb des SafeSignal Hotspots
Die Installationsanleitung ist auf die Verwendung des Routers TP-Link TL-MR3020 und des VPN-Zugangs von Mullvad angepasst. Sofern ein anderer Router verwendet werden soll, ist eine Anpassung der Firmware zwingend erforderlich und setzt Linux sowie OpenWRT-Fachkenntnisse voraus (siehe "Für Entwickler: Firmware selbst kompilieren").

#### Vorbereitung des Routers TP-Link TL-MR3020
1. Download der SafeSignal Hotspot Firmware (hier)
2. Aufspielen der Firmware über die Web-Administrationsoberfläche des Routers ([dieser Beschreibung folgend](http://wiki.openwrt.org/toh/tp-link/tl-mr3020#method_using_web_gui_recommended))
3. Neustart des Routers und 60 Sekunden warten
4. Verbindung mit WLAN-Netz "SafeSignal Admin" aufbauen, Passwort "adminadmin"
5. Telnet-Verbindung zum Hotspot aufbauen, IP 192.168.10.1
6. VPN-Verbindungsschlüssel von Mullvad im Ordner */etc/openvpn* hinterlegen (Dateien *connection.crt*, *connection-ca.crt*, *connection.key*)
7. Dringend empfohlen: root-Passwort des Hotspots ändern per "passwd"-Befehl
8. Dringend empfohlen: Passwort des WLAN-Netzes "SafeSignal Admin" ändern in */etc/config/wireless*
9. Neustart des Routers und 60 Sekunden warten

#### Anschluss des TP-Link TL-MR3020 an den vorhandenen Router
1. Netzwerkkabel mit WAN/LAN der SafeBox verbinden sowie mit einem beliebigen LAN-Anschluss ihres Routers (beschriftet mit LAN 1, LAN 2, o. ä.).
2. Mini-Stecker des USB-Kabels mit POWER der SafeBox verbinden und einen großen USB-Stecker mit dem Netzteil (der 3. Stecker bleibt frei).
3. Netzteil mit Steckdose verbinden.

Nach Abschluss der Installation ist zur Erfolgsprüfung ein Verbinden mit dem freien, nicht-passwortgeschützten WLAN-Netz "SafeSignal Internet" sinnvoll. War die Installation erfolgreich, so erscheint eine Begrü0ungsseite im Browser, die per Mausklick auf "Connect Now" den Zugang zum Internet ermöglicht. Ist dies nicht der Fall, so war die Installation nicht erfolgreich. Eine Fehlersuche ist daraufhin per Telnet-/SSH-Zugriff und Logfile-Analyse durchzuführen.

#### Anpassung
Der SafeSignal Hotspot basiert auf dem weit verbreiteten OpenWRT-Betriebssystem für Router. Eine Anpassung der Installation ist über Konfigurationsdateien im Ordner */etc/config* möglich. Ausführliche Informationen dazu bietet das [Wiki von OpenWRT](http://wiki.openwrt.org/start).

Die Begrüßungsseite wird von NoDogSplash ausgeliefert. Informationen zur visuellen und funktionellen Anpassung sind auf der [Webseite von NoDogSplash](https://github.com/nodogsplash/nodogsplash/blob/master/README.md) verfügbar. Die Konfigurationsdateien befinden sich im Ordner */etc/nodogsplash*.

#### Betrieb
Nach Verbindung mit dem Stromnetz versucht der SafeSignal Hotspot zunächst vom vorhandenen Router eine IP-Adresse zu beziehen und eine reguläre Internetverbindung aufzubauen. Anschließend erfolgt kontinuierlich der Versuch eine VPN-Verbindung herzustellen. Erst wenn dies erfolgreich ist, erhalten Gäste resp. Kunden die Möglichkeit über die Begrüßungsseite eine Verbindung zum Internet herzustellen. Geht die VPN-Verbindung verloren, wird der unmittelbar Internetzugriff deaktiviert.

### Für Entwickler: Firmware selbst kompilieren
Ist der Einsatz auf einem anderen Router als dem TP-Link TL-MR3020 gewünscht oder soll die Konfiguration der OpenWRT-Umgebung angepasst werden, muss die Firmware selbst kompiliert werden.

Dazu ist ein [OpenWRT-Buildroot](http://wiki.openwrt.org/doc/howto/buildroot.exigence) notwendig. Zum Einsatz wird das Trunk-Release mit Changeset >=43777 empfohlen. 
Die verwendete Buildconfig ist im Ordner */build-config* zu finden. 
Die Quellen des SafeSignal Hotspots sind bei GitHub im Ordner */source* zu finden. Ein Symlink vom OpenWRT-Buildroot Ordner */files* (manuell zu erstellen) auf die Quellen ist notwendig, damit diese in die Firmware eingebunden werden.
