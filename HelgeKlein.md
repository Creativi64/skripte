# Helge Klein Examplels

## SIDS

`S-R-X-Y1-Y2-Yn-1-Yn`

`S` Gibt an, dass es sich bei der Zeichenfolge um eine SID handelt.

`R` Gibt die Revisionsebene an.

`X` Gibt den Wert der Bezeichnerautorität an.

`j` `Y?` Stellt eine Reihe von Unterautoritätswerten dar, wobei n die Anzahl der Werte ist.

---

`S-1-0-0`  `NULL-SID`   Eine Gruppe ohne Mitglieder. Dies wird häufig verwendet, wenn kein SID-Wert bekannt ist.

`S-1-1-0`   `World`   Eine Gruppe, die alle Benutzer umfasst.

`S-1-2-0`   `Lokal`   Benutzer, die sich an Terminals anmelden, die lokal (physisch) mit dem System verbunden sind.

`S-1-2-1`   `Konsolenanmeldung`   Eine Gruppe, die Benutzer enthält, die an der physischen Konsole angemeldet sind.

`S-1-3-0`   `Creator-Besitzer-ID`   Eine Sicherheits-ID, die durch die Sicherheits-ID des Benutzers ersetzt werden soll, der ein neues Objekt erstellt hat. Diese SID wird in vererbbaren ACEs verwendet.

`S-1-3-1`   `Creator-Gruppen-ID`   Ein Sicherheitsbezeichner, der durch die SID der primären Gruppe des Benutzers ersetzt werden soll, der ein neues Objekt erstellt hat. Verwenden Sie diese SID in vererbbaren ACEs.

`S-1-3-2`   `Creator Owner Server`

`S-1-3-3`   `Creator Group Server`

`S-1-3-4`   `Besitzerrechte`   Eine Gruppe, die den aktuellen Besitzer des Objekts darstellt. Wenn eine ACE, die diese SID trägt, auf ein Objekt angewendet wird, ignoriert das System die impliziten READ_CONTROL und WRITE_DAC Berechtigungen für den Objektbesitzer.

`S-1-4`   `Nicht eindeutige Autorität`   Eine SID, die eine Bezeichnerautorität darstellt.

`S-1-5`   `NT-Autorität`   Eine SID, die eine Bezeichnerautorität darstellt.

`S-1-5-80-0`   `Alle Dienste`   Eine Gruppe, die alle auf dem System konfigurierten Dienstprozesse enthält. Die Mitgliedschaft wird vom Betriebssystem gesteuert.

`S-1-5-1`  `Dialup`  Eine Gruppe, die alle Benutzer umfasst, die über eine DFÜ-Verbindung am System angemeldet sind.

`S-1-5-113`  `Lokales Konto`  Sie können diese SID verwenden, wenn Sie die Netzwerkanmeldung auf lokale Konten statt auf "Administrator" oder gleichwertig beschränken. Diese SID kann beim Blockieren der Netzwerkanmeldung für lokale Benutzer und Gruppen nach Kontotyp wirksam sein, unabhängig davon, welchen Namen sie tatsächlich haben.

`S-1-5-114`  `Lokales Konto und Mitglied der Gruppe "Administratoren"`  Sie können diese SID verwenden, wenn Sie die Netzwerkanmeldung auf lokale Konten statt auf "Administrator" oder gleichwertig beschränken. Diese SID kann beim Blockieren der Netzwerkanmeldung für lokale Benutzer und Gruppen nach Kontotyp wirksam sein, unabhängig davon, welchen Namen sie tatsächlich haben.

`S-1-5-2`  `Network`  Eine Gruppe, die alle Benutzer umfasst, die über eine Netzwerkverbindung angemeldet sind. Zugriffstoken für interaktive Benutzer enthalten nicht die Netzwerk-SID.

`S-1-5-3`  `Batch`  Eine Gruppe, die alle Benutzer umfasst, die sich mithilfe einer Batchwarteschlangenfunktion angemeldet haben, z. B. Aufgabenplanungsaufträge.

`S-1-5-4`  `Interaktive`  Eine Gruppe, die alle Benutzer enthält, die sich interaktiv anmelden. Ein Benutzer kann eine interaktive Anmeldesitzung starten, indem er sich direkt über die Tastatur anmeldet, eine Remotedesktopdienste-Verbindung von einem Remotecomputer aus öffnet oder eine Remoteshell wie Telnet verwendet. In jedem Fall enthält das Zugriffstoken des Benutzers die interaktive SID. Wenn sich der Benutzer über eine Remotedesktopdienste-Verbindung anmeldet, enthält das Zugriffstoken des Benutzers auch die interaktive Remoteanmeldungs-SID.

`S-1-5-5- XY-**`  `Anmeldesitzung`  Die X - und Y-Werte für diese SIDs identifizieren eine bestimmte Anmeldesitzung eindeutig.

`S-1-5-6`  `Service`  Eine Gruppe, die alle Sicherheitsprinzipale enthält, die sich als Dienst angemeldet haben.

`S-1-5-7`  `Anonyme Anmeldung`  Ein Benutzer, der eine Verbindung mit dem Computer hergestellt hat, ohne einen Benutzernamen und ein Kennwort anzugeben.
Die Anonyme Anmeldeidentität unterscheidet sich von der Identität, die von Internetinformationsdienste (IIS) für anonymen Webzugriff verwendet wird. IIS verwendet ein tatsächliches Konto – standardmäßig IUSR\_ ComputerName für anonymen Zugriff auf Ressourcen auf einer Website. Genau genommen ist dieser Zugriff nicht anonym, da der Sicherheitsprinzipal bekannt ist, obwohl unbekannte Personen das Konto verwenden. IUSR_ ComputerName (oder was auch immer Sie das Konto nennen) über ein Kennwort verfügt, und IIS meldet sich beim Start des Diensts bei dem Konto an. Daher ist der "anonyme" IIS-Benutzer ein Mitglied der authentifizierten Benutzer, die anonyme Anmeldung jedoch nicht.

`S-1-5-8`  `Proxy`  Gilt derzeit nicht: Diese SID wird nicht verwendet.

`S-1-5-9`  `Organisationsdomänencontroller`  Eine Gruppe, die alle Domänencontroller in einer Domänengesamtstruktur enthält.

`S-1-5-10`  `Selbst`  Ein Platzhalter in einer ACE für ein Benutzer-, Gruppen- oder Computerobjekt in Active Directory. Wenn Sie Berechtigungen für Self erteilen, gewähren Sie diese dem Sicherheitsprinzipal, der durch das Objekt dargestellt wird. Während einer Zugriffsprüfung ersetzt das Betriebssystem die SID für Self durch die SID für den Sicherheitsprinzipal, der durch das Objekt dargestellt wird.

`S-1-5-11`  `Authentifizierte Benutzer`  Eine Gruppe, die alle Benutzer und Computer mit authentifizierten Identitäten umfasst. Authentifizierte Benutzer enthalten keinen Gast, auch wenn das Gastkonto über ein Kennwort verfügt.
Diese Gruppe enthält authentifizierte Sicherheitsprinzipale von jeder vertrauenswürdigen Domäne, nicht nur von der aktuellen Domäne.

`S-1-5-12`  `Eingeschränkter Code`  Eine Identität, die von einem Prozess verwendet wird, der in einem eingeschränkten Sicherheitskontext ausgeführt wird. In Windows- und Windows Serverbetriebssystemen kann eine Softwareeinschränkungsrichtlinie code eine von drei Sicherheitsstufen zuweisen: uneingeschränkt, eingeschränkt oder nicht zulässig. Wenn Code auf der eingeschränkten Sicherheitsstufe ausgeführt wird, wird die eingeschränkte SID dem Zugriffstoken des Benutzers hinzugefügt.

`S-1-5-13`  `Terminal Server-Benutzer`  Eine Gruppe, die alle Benutzer umfasst, die sich bei einem Server anmelden, auf dem Remotedesktopdienste aktiviert sind.

`S-1-5-14`  `Interaktive Remoteanmeldung`  Eine Gruppe, die alle Benutzer enthält, die sich mithilfe einer Remotedesktopverbindung am Computer anmelden. Diese Gruppe ist eine Teilmenge der interaktiven Gruppe. Zugriffstoken, die die interaktive Remoteanmeldungs-SID enthalten, enthalten auch die interaktive SID.

`S-1-5-15`  `Diese Organisation`  Eine Gruppe, die alle Benutzer aus derselben Organisation umfasst. Nur in Active Directory-Konten enthalten und nur von einem Domänencontroller hinzugefügt.

`S-1-5-17`  `IUSR`  Ein Konto, das vom Standardmäßigen Internetinformationsdienste (IIS)-Benutzer verwendet wird.

`S-1-5-18`  `System (oder LocalSystem)`  Eine Identität, die lokal vom Betriebssystem und von Diensten verwendet wird, die für die Anmeldung als LocalSystem konfiguriert sind.
Das System ist ein ausgeblendetes Mitglied von Administratoren. Das heißt, jeder Prozess, der als System ausgeführt wird, verfügt über die SID für die integrierte Administratorgruppe in seinem Zugriffstoken.
Wenn ein Prozess lokal ausgeführt wird, während das System auf Netzwerkressourcen zugreift, erfolgt dies mithilfe der Domänenidentität des Computers. Das Zugriffstoken auf dem Remotecomputer enthält die SID für das Domänenkonto des lokalen Computers sowie SIDs für Sicherheitsgruppen, in denen der Computer Mitglied ist, z. B. Domänencomputer und authentifizierte Benutzer.

`S-1-5-19`  `NT-Autorität (LocalService)`  Eine Identität, die von Diensten verwendet wird, die lokal auf dem Computer sind, keinen umfassenden lokalen Zugriff benötigen und keinen authentifizierten Netzwerkzugriff benötigen. Dienste, die als LocalService ausgeführt werden, greifen als normale Benutzer auf lokale Ressourcen zu, und sie greifen als anonyme Benutzer auf Netzwerkressourcen zu. Daher hat ein Dienst, der als LocalService ausgeführt wird, deutlich weniger Autorität als ein Dienst, der lokal und im Netzwerk als LocalSystem ausgeführt wird.

`S-1-5-20`  `Netzwerkdienst`  Eine Identität, die von Diensten verwendet wird, die keinen umfassenden lokalen Zugriff benötigen, aber authentifizierten Netzwerkzugriff benötigen. Dienste, die als NetworkService ausgeführt werden, greifen als normale Benutzer auf lokale Ressourcen zu und greifen mithilfe der Computeridentität auf Netzwerkressourcen zu. Daher hat ein Dienst, der als NetworkService ausgeführt wird, den gleichen Netzwerkzugriff wie ein Dienst, der als LocalSystem ausgeführt wird, aber einen erheblich reduzierten lokalen Zugriff.

`S-1-5-domain-500**`  `Administrator`  Ein Benutzerkonto für den Systemadministrator. Jeder Computer verfügt über ein lokales Administratorkonto und jede Domäne über ein Domänenadministratorkonto.
Das Administratorkonto ist das erste Konto, das während der Installation des Betriebssystems erstellt wurde. Das Konto kann nicht gelöscht, deaktiviert oder gesperrt werden, aber es kann umbenannt werden.
Standardmäßig ist das Administratorkonto Mitglied der Gruppe "Administratoren", und es kann nicht aus dieser Gruppe entfernt werden.

`S-1-5-domain-501**`  `Gast`  Ein Benutzerkonto für Personen, die nicht über einzelne Konten verfügen. Jeder Computer verfügt über ein lokales Gastkonto und jede Domäne über ein Gastkonto.
Standardmäßig ist "Gast" Mitglied der Gruppen "Jeder" und "Gäste". Das Gastkonto der Domäne ist auch Mitglied der Gruppen "Domänengäste" und "Domänenbenutzer".
Im Gegensatz zur anonymen Anmeldung ist Gast ein echtes Konto und kann verwendet werden, um sich interaktiv anzumelden. Für das Gastkonto ist kein Kennwort erforderlich, es kann jedoch über ein Kennwort verfügen.

`S-1-5-domain-502**`  `Krbtgt`  Ein Benutzerkonto, das vom Key Distribution Center (KDC)-Dienst verwendet wird. Das Konto ist nur auf Domänencontrollern vorhanden.

`S-1-5-domain-512**`  `Domänenadministratoren`  Eine globale Gruppe mit Mitgliedern, die zum Verwalten der Domäne autorisiert sind. Standardmäßig ist die Gruppe "Domänenadministratoren" ein Mitglied der Gruppe "Administratoren" auf allen Computern, die der Domäne beigetreten sind, einschließlich Domänencontrollern.
Domänenadministratoren sind der Standardbesitzer jedes Objekts, das von jedem Mitglied der Gruppe im Active Directory der Domäne erstellt wird. Wenn Mitglieder der Gruppe andere Objekte erstellen, z. B. Dateien, ist der Standardeigentümer die Gruppe Administratoren.

`S-1-5-domain-513**`  `Domänenbenutzer`  Eine globale Gruppe, die alle Benutzer in einer Domäne umfasst. Wenn Sie ein neues Benutzerobjekt in Active Directory erstellen, wird der Benutzer dieser Gruppe automatisch hinzugefügt.

`S-1-5-domain-514**`  `Domänengäste`  Eine globale Gruppe, die standardmäßig nur ein Mitglied hat: das integrierte Gastkonto der Domäne.

`S-1-5-domain-515**`  `Domänencomputer`  Eine globale Gruppe, die alle Computer enthält, die der Domäne beigetreten sind, mit Ausnahme von Domänencontrollern.

`S-1-5-domain-516**`  `Domänencontroller`  Eine globale Gruppe, die alle Domänencontroller in der Domäne enthält. Dieser Gruppe werden automatisch neue Domänencontroller hinzugefügt.

`S-1-5-domain-517**`  `Zertifikatsherausgeber`  Eine globale Gruppe, die alle Computer umfasst, die eine Unternehmenszertifizierungsstelle hosten.
Cert Publishers sind berechtigt, Zertifikate für Benutzerobjekte in Active Directory zu veröffentlichen.

`S-1-5-root domain-518**`  `Schemaadministratoren`  Eine Gruppe, die nur in der Stammdomäne der Gesamtstruktur vorhanden ist. Es handelt sich um eine universelle Gruppe, wenn sich die Domäne im nativen Modus befindet, und es handelt sich um eine globale Gruppe, wenn sich die Domäne im gemischten Modus befindet. Die Gruppe "Schemaadministratoren" ist berechtigt, Schemaänderungen in Active Directory vorzunehmen. Standardmäßig ist das einzige Mitglied der Gruppe das Administratorkonto für die Stammdomäne der Gesamtstruktur.

`S-1-5-root domain-519**`  `Organisationsadministratoren`  Eine Gruppe, die nur in der Stammdomäne der Gesamtstruktur vorhanden ist. Es handelt sich um eine universelle Gruppe, wenn sich die Domäne im nativen Modus befindet, und es handelt sich um eine globale Gruppe, wenn sich die Domäne im gemischten Modus befindet.
Die Gruppe Enterprise Administratoren ist berechtigt, Änderungen an der Gesamtstrukturinfrastruktur vorzunehmen, z. B. untergeordnete Domänen hinzuzufügen, Websites zu konfigurieren, DHCP-Server zu autorisieren und Unternehmenszertifizierungsstellen zu installieren.
Standardmäßig ist das einzige Mitglied von Enterprise Administratoren das Administratorkonto für die Stammdomäne der Gesamtstruktur. Die Gruppe ist ein Standardmitglied jeder Domänenadministratorgruppe in der Gesamtstruktur.

`S-1-5-domain-520**`  `Gruppenrichtlinien Ersteller Besitzer`  Eine globale Gruppe, die berechtigt ist, neue Gruppenrichtlinie Objekte in Active Directory zu erstellen. Standardmäßig ist das einzige Mitglied der Gruppe der Administrator.
Objekte, die von Mitgliedern von Gruppenrichtlinie Creator Owners erstellt werden, gehören dem einzelnen Benutzer, der sie erstellt. Auf diese Weise unterscheidet sich die Gruppe Gruppenrichtlinie Erstellerbesitzer im Gegensatz zu anderen administrativen Gruppen (z. B. Administratoren und Domänenadministratoren). Objekte, die von Mitgliedern dieser Gruppen erstellt werden, gehören der Gruppe und nicht der Person.

`S-1-5-domain-553**`  `RAS- und IAS-Server`  Eine lokale Domänengruppe. Standardmäßig hat diese Gruppe keine Mitglieder. Computer, auf denen der Routing- und Remotezugriffsdienst ausgeführt wird, werden der Gruppe automatisch hinzugefügt.
Mitglieder dieser Gruppe haben Zugriff auf bestimmte Eigenschaften von Benutzerobjekten, z. B. Kontobeschränkungen lesen, Anmeldeinformationen lesen und Remotezugriffsinformationen lesen.

`S-1-5-32-544`  `Administratoren`  Eine integrierte Gruppe. Nach der Erstinstallation des Betriebssystems ist das einzige Mitglied der Gruppe das Administratorkonto. Wenn ein Computer einer Domäne beitritt, wird die Gruppe "Domänenadministratoren" zur Gruppe "Administratoren" hinzugefügt. Wenn ein Server zu einem Domänencontroller wird, wird die Gruppe Enterprise Administratoren auch der Gruppe "Administratoren" hinzugefügt.

`S-1-5-32-545`  `Users`  Eine integrierte Gruppe. Nach der Erstinstallation des Betriebssystems ist das einzige Mitglied die Gruppe Authentifizierte Benutzer.

`S-1-5-32-546`  `Gäste`  Eine integrierte Gruppe. Standardmäßig ist das Gastkonto das einzige Mitglied. Die Gruppe "Gäste" ermöglicht es gelegentlichen oder einmaligen Benutzern, sich mit eingeschränkten Berechtigungen beim integrierten Gastkonto eines Computers anzumelden.

`S-1-5-32-547`  `Power Users`  Eine integrierte Gruppe. Standardmäßig hat die Gruppe keine Mitglieder. Power-Benutzer können lokale Benutzer und Gruppen erstellen. Konten, die sie erstellt haben, zu ändern und zu löschen; und entfernen Sie Benutzer aus den Gruppen "Power Users", "Users" und "Guests". Power-Benutzer können auch Programme installieren; lokale Drucker erstellen, verwalten und löschen; und erstellen und löschen Sie Dateifreigaben.

`S-1-5-32-548`  `Kontooperatoren`  Eine integrierte Gruppe, die nur auf Domänencontrollern vorhanden ist. Standardmäßig hat die Gruppe keine Mitglieder. Kontooperatoren verfügen standardmäßig über die Berechtigung zum Erstellen, Ändern und Löschen von Konten für Benutzer, Gruppen und Computer in allen Containern und Organisationseinheiten von Active Directory mit Ausnahme des integrierten Containers und der Domänencontroller-OU. Kontooperatoren verfügen nicht über die Berechtigung zum Ändern der Gruppen "Administratoren" und "Domänenadministratoren" und nicht über die Berechtigung zum Ändern der Konten für Mitglieder dieser Gruppen.

`S-1-5-32-549`  `Serveroperatoren`  Beschreibung: Eine integrierte Gruppe, die nur auf Domänencontrollern vorhanden ist. Standardmäßig hat die Gruppe keine Mitglieder. Serveroperatoren können sich interaktiv bei einem Server anmelden; Netzwerkfreigaben erstellen und löschen; Dienste starten und beenden; Sichern und Wiederherstellen von Dateien; die Festplatte des Computers formatieren; und fahren Sie den Computer herunter.

`S-1-5-32-550`  `Druckoperatoren`  Eine integrierte Gruppe, die nur auf Domänencontrollern vorhanden ist. Standardmäßig ist die Gruppe "Domänenbenutzer" das einzige Mitglied. Druckoperatoren können Drucker und Dokumentwarteschlangen verwalten.

`S-1-5-32-551`  `Sicherungsoperatoren`  Eine integrierte Gruppe. Standardmäßig hat die Gruppe keine Mitglieder. Sicherungsoperatoren können alle Dateien auf einem Computer sichern und wiederherstellen, unabhängig von den Berechtigungen, die diese Dateien schützen. Sicherungsoperatoren können sich auch am Computer anmelden und herunterfahren.

`S-1-5-32-552`  `Replikatoren`  Eine integrierte Gruppe, die vom Dateireplikationsdienst auf Domänencontrollern verwendet wird. Standardmäßig hat die Gruppe keine Mitglieder. Fügen Sie dieser Gruppe keine Benutzer hinzu.

`S-1-5-32-554`  `Builtin\Pre-Windows 2000-kompatibler Zugriff`  Ein Alias, der von Windows 2000 hinzugefügt wurde. Eine Abwärtskompatibilitätsgruppe, die Lesezugriff auf alle Benutzer und Gruppen in der Domäne ermöglicht.

`S-1-5-32-555`  `Integrierte\Remotedesktopbenutzer`  Ein Alias. Mitgliedern dieser Gruppe wird das Recht gewährt, sich remote anzumelden.

`S-1-5-32-556`  `Integrierte\Netzwerkkonfigurationsoperatoren`  Ein Alias. Mitglieder dieser Gruppe können über einige Administratorrechte zum Verwalten der Konfiguration von Netzwerkfeatures verfügen.

`S-1-5-32-557`  `Builtin\Incoming Forest Trust Builders`  Ein Alias. Mitglieder dieser Gruppe können eingehende unidirektionale Vertrauensstellungen für diese Gesamtstruktur erstellen.

`S-1-5-32-558`  `Integrierte\Leistungsmonitor-Benutzer`  Ein Alias. Mitglieder dieser Gruppe haben Remotezugriff, um diesen Computer zu überwachen.

`S-1-5-32-559`  `Benutzer des integrierten\Leistungsprotokolls`  Ein Alias. Mitglieder dieser Gruppe haben Remotezugriff, um die Protokollierung von Leistungsindikatoren auf diesem Computer zu planen.

`S-1-5-32-560`  `Integrierte\Windows Autorisierungszugriffsgruppe`  Ein Alias. Mitglieder dieser Gruppe haben Zugriff auf das berechnete tokenGroupsGlobalAndUniversal-Attribut für Benutzerobjekte.

`S-1-5-32-561`  `Builtin\Terminal Server License Servers`  Ein Alias. Eine Gruppe für Terminal Server-Lizenzserver. Wenn Windows Server 2003 Service Pack 1 installiert ist, wird eine neue lokale Gruppe erstellt.

`S-1-5-32-562`  `Integrierte\verteilte COM-Benutzer`  Ein Alias. Eine Gruppe für COM, die computerweite Zugriffssteuerungen bereitstellt, die den Zugriff auf alle Anruf-, Aktivierungs- oder Startanforderungen auf dem Computer steuern.

`S-1-5-32-568`  `Integriert\IIS_IUSRS`  Ein Alias. Ein integriertes Gruppenkonto für IIS-Benutzer.

`S-1-5-32-569`  `Builtin\Cryptographic Operators`  Eine integrierte lokale Gruppe. Mitglieder sind berechtigt, kryptografische Vorgänge auszuführen.

`S-1-5-32-573`  `Integrierte\Ereignisprotokollleser` Eine integrierte lokale Gruppe. Mitglieder dieser Gruppe können Ereignisprotokolle vom lokalen Computer lesen.

`S-1-5-32-574`  `Builtin\Certificate Service DCOM Access`  Eine integrierte lokale Gruppe. Mitglieder dieser Gruppe dürfen eine Verbindung mit Zertifizierungsstellen im Unternehmen herstellen.

`S-1-5-32-575`  `Integrierte\RDS-Remotezugriffsserver`  Eine integrierte lokale Gruppe. Server in dieser Gruppe ermöglichen Benutzern von RemoteApp-Programmen und persönlichen virtuellen Desktops den Zugriff auf diese Ressourcen. In Internetbereitstellungen werden diese Server in der Regel in einem Edgenetzwerk bereitgestellt. Diese Gruppe muss auf Servern aufgefüllt werden, auf denen RD-Verbindungsbroker ausgeführt wird. RD-Gatewayserver und RD-Webzugriffsserver, die in der Bereitstellung verwendet werden, müssen sich in dieser Gruppe befinden.

`S-1-5-32-576`  `Integrierte\RDS-Endpunktserver`    Eine integrierte lokale Gruppe. Server in dieser Gruppe führen virtuelle Computer und Hostsitzungen aus, in denen Benutzer RemoteApp-Programme und persönliche virtuelle Desktops ausführen. Diese Gruppe muss auf Servern aufgefüllt werden, auf denen RD-Verbindungsbroker ausgeführt wird. RD-Sitzungshostserver und RD Virtualization Host-Server, die in der Bereitstellung verwendet werden, müssen sich in dieser Gruppe befinden.

`S-1-5-32-577`  `Integrierte\RDS-Verwaltungsserver` Eine integrierte lokale Gruppe. Server in dieser Gruppe können routinemäßige administrative Aktionen auf Servern ausführen, auf denen Remotedesktopdienste ausgeführt werden. Diese Gruppe muss auf allen Servern in einer Remotedesktopdienste-Bereitstellung aufgefüllt werden. Die Server, auf denen der zentrale RDS-Verwaltungsdienst ausgeführt wird, müssen in dieser Gruppe enthalten sein.

`S-1-5-32-578`  `Integrierte\Hyper-V-Administratoren`  Eine integrierte lokale Gruppe. Mitglieder dieser Gruppe haben vollständigen und uneingeschränkten Zugriff auf alle Features von Hyper-V.

`S-1-5-32-579`  `Integrierte\Access Control-Hilfsoperatoren`  Eine integrierte lokale Gruppe. Mitglieder dieser Gruppe können Autorisierungsattribute und Berechtigungen für Ressourcen auf diesem Computer remote abfragen.

`S-1-5-32-580`  `Integrierte\Remoteverwaltungsbenutzer`  Eine integrierte lokale Gruppe. Mitglieder dieser Gruppe können über Verwaltungsprotokolle (z. B. WS-Management über den Windows Remoteverwaltungsdienst) auf WMI-Ressourcen zugreifen. Dies gilt nur für WMI-Namespaces, die dem Benutzer Zugriff gewähren.

`S-1-5-64-10`  `NTLM-Authentifizierung`  Eine SID, die verwendet wird, wenn das NTLM-Authentifizierungspaket den Client authentifiziert hat

`S-1-5-64-14`  `SChannel-Authentifizierung`  Eine SID, die verwendet wird, wenn das SChannel-Authentifizierungspaket den Client authentifiziert hat.

`S-1-5-64-21`  `Digestauthentifizierung`  Eine SID, die verwendet wird, wenn das Digestauthentifizierungspaket den Client authentifiziert hat.

`S-1-5-80`  `NT-Dienst`  Eine SID, die als NT-Dienstkontopräfix verwendet wird.

`S-1-5-80-0`  `Alle Dienste`  Eine Gruppe, die alle Dienstprozesse enthält, die auf dem System konfiguriert sind. Die Mitgliedschaft wird vom Betriebssystem gesteuert. SID S-1-5-80-0 entspricht NT SERVICES\ALL SERVICES. Diese SID wurde in Windows Server 2008 R2 eingeführt.

`S-1-5-83-0`  `NT VIRTUAL MACHINE\Virtual Machines`  Eine integrierte Gruppe. Die Gruppe wird erstellt, wenn die Hyper-V-Rolle installiert wird. Die Mitgliedschaft in der Gruppe wird vom Hyper-V-Verwaltungsdienst (VMMS) verwaltet. Für diese Gruppe sind das Recht " Symbolische Verknüpfungen erstellen " (SeCreateSymbolicLinkPrivilege) und das Recht "Als Dienst anmelden " (SeServiceLogonRight) erforderlich.

---

`DOMAIN_USER_RID_ADMIN` `500`  Das Administratorbenutzerkonto in einer Domäne.
`DOMAIN_USER_RID_GUEST` `501`  Das Gastbenutzerkonto in einer Domäne. Benutzer, die nicht über ein Konto verfügen, können sich automatisch bei diesem Konto anmelden.
`DOMAIN_GROUP_RID_USERS` `513`  Eine Gruppe, die alle Benutzerkonten in einer Domäne enthält. Alle Benutzer werden dieser Gruppe automatisch hinzugefügt.
`DOMAIN_GROUP_RID_GUESTS` `514`  Das Gastkonto der Gruppe in einer Domäne.
`DOMAIN_GROUP_RID_COMPUTERS` `515`  Die Gruppe "Domänencomputer". Alle Computer in der Domäne sind Mitglieder dieser Gruppe.
`DOMAIN_GROUP_RID_CONTROLLERS` `516`  Die Gruppe "Domänencontroller". Alle Domänencontroller in der Domäne sind Mitglieder dieser Gruppe.
`DOMAIN_GROUP_RID_CERT_ADMINS` `517`  Die Gruppe der Zertifikatherausgeber. Computer, auf denen Active Directory-Zertifikatdienste ausgeführt werden, sind Mitglieder dieser Gruppe.
`DOMAIN_GROUP_RID_SCHEMA_ADMINS` `518`  Die Gruppe der Schemaadministratoren. Mitglieder dieser Gruppe können das Active Directory-Schema ändern.
`DOMAIN_GROUP_RID_ENTERPRISE_ADMINS` `519`  Die Gruppe der Unternehmensadministratoren. Mitglieder dieser Gruppe haben Vollzugriff auf alle Domänen in der Active Directory-Gesamtstruktur. Enterprise Administratoren sind für Vorgänge auf Gesamtstrukturebene verantwortlich, z. B. das Hinzufügen oder Entfernen neuer Domänen.
`DOMAIN_GROUP_RID_POLICY_ADMINS` `520`  Die Gruppe der Richtlinienadministratoren.
`DOMAIN_ALIAS_RID_ADMINS` `544`  Administratoren der Domäne.
`DOMAIN_ALIAS_RID_USERS` `545`  Alle Benutzer in der Domäne.
`DOMAIN_ALIAS_RID_GUESTS` `546`  Gäste der Domäne.
`DOMAIN_ALIAS_RID_POWER_USERS` `547`  Ein Benutzer oder eine Gruppe von Benutzern, die erwarten, ein System so zu behandeln, als wäre es sein persönlicher Computer und nicht als Arbeitsstation für mehrere Benutzer.
`DOMAIN_ALIAS_RID_BACKUP_OPS` `551`  Eine lokale Gruppe, die zum Steuern der Zuweisung von Dateisicherungs- und Wiederherstellungsbenutzerrechten verwendet wird.
`DOMAIN_ALIAS_RID_REPLICATOR` `552`  Eine lokale Gruppe, die für das Kopieren von Sicherheitsdatenbanken vom primären Domänencontroller auf die Sicherungsdomänencontroller verantwortlich ist. Diese Konten werden nur vom System verwendet.
`DOMAIN_ALIAS_RID_RAS_SERVERS` `553`  Eine lokale Gruppe, die den Remotezugriff und Server darstellt, auf denen der Internetauthentifizierungsdienst (Internet Authentication Service, IAS) ausgeführt wird. Diese Gruppe ermöglicht den Zugriff auf verschiedene Attribute von Benutzerobjekten.

## Syntax

`SetACL.exe`

`-on [PATH]` ObjectName

`-ot` ObjectType

`-actn ParameterderAktion` Aktion und deren Parameter

`...`

`-rec` Rekursiv arbeiten

`-log [FILENAME]`

`-fltr [KEYWORD]`

`-silent` Keine Ausgabe bei Ausführung

`-ignoreerr` Ignoriert Fehler

## ObjectTypes

`file` Directory/file //DirF

`reg` Registry key //Reg

`srv` Service //Sev

`prn` Printer //Pri

`shr` Network share //Net

`wmi` WMI object //WMI

## Aktionen

### Acces Control Entrys

```powershell
-actn ace
-ace "n:[USER];p:[Permission] [;i:Inheritance;m:Mode;w:Where]"
```

#### Permissions

`Permisstion`

Nutzbar bei ObjectTypes

---

`full`

DirF, Reg, Pri ,Sev, Net, WMI

`read`

DirF, Reg , Sev, Net

`change`

DirF, Net

`write`

DirF,

`list_folder`

DirF,

`read_ex`

DirF,

`print`

Pri,

`man_printer`

Pri,

`man_docs`

Pri,

`start_stop`

Sev

`Execute`

WMI,

`remote_access`

WMI,

`enable_account`

WMI,

Und noch mehr

#### Inheritance

 Vererbung mehrere Komma getrennt

`so` sub-objects

`sc` sub-containers

`np` keine Vererbung

`io` nur erben

#### Mode

`set` Alle Permissions durch die neuen ersetzten für den bestimmen Nutzer

`grant` die gewählte Permission für Nutzer hinzufügen

`deny` die gewählte Permission verweigern

`revoke` die gewählte Permission entfernen für bestimmten Nutzer

#### Where

wo die permission hinzugefügt werden

`dacl` permissions list

`sacl` auditing list

`dacl,sacl` Beide

### Trustee

Name oder SID von einem trustee (ein user oder group). Unterstützte Formate:

[{computer | domain}\]name
SID string

```powershell
-actn trustee
-trst "n1:[Trustee1][;n2:[Trustee2]];ta:TrusteeAction[;w:What]”
```

#### TrusteeAction

`remtrst` Remove all ACEs belonging to trustee specified.

`repltrst` Replace trustee ‘n1’ by ‘n2’ in all ACEs.

`cpytrst` Copy the permissions for trustee ‘n1’ to ‘n2’.

#### What

`d` DACL

`S` SACL

`o` Besitzer

`g` Primary Group

### Domain

```powershell
-actn domain
-dom "n1:[Domain1][;n2:[Domain2]];da:DomainAction[;w:What]”
```

#### Domain action

Action to perform on the domain specified:

`remdom` Remove all ACEs belonging to trustees of the domain specified.

`repldom` Replace trustees from domain ‘n1’ by trustees with the same name from domain ‘n2’ in all ACEs.

`cpydom` Copy permissions from trustees from domain ‘n1’ to trustees with the same name from domain ‘n2’ in all ACEs.

Explanation:

For every SID in the ACEs of the ACL(s), the name of the domain and user/group of the corresponding account is looked up. If the domain name is equal to the domain name ‘n1’ specified, the ACE is deleted in the case of ‘remdom’. In the case of `repldom` or `cpydom` a user/group of the same name is searched in the domain ‘n2’ specified. If such a user/group is found, either a new ACE with the same permissions and flags is created (`cpydom`), or the SID in the ACE is replaced with the SID of the user/group in the domain ‘n2’ specified (`repldom`).

### Set Owner

```powershell
-actn setowner
-ownr "n:[TRUSTEE->USER]"
```

### Set Primary Group

```powershell
-actn setgroup
-grp "n:[TRUSTEE->GROUP]"
```

### Set Protection Flags

```powershell
-actn setprot
-op "dacl:Protection;sacl:Protection"
```

Configures protection from inheritance (whether to ‘allow inheritable permissions from the parent object to propagate to this object’)

### Reset Children

Resets permissions on all sub-objects and enables propagation of inherited permissions.

```powershell
-actn rstchldrn
-rst "Where"
```

### Clear

Clears the ACL of any non-inherited ACEs. You can configure whether to remove non-inherited ACEs from the DACL, the SACL or both.

```powershell
-actn clear 
-clr "Where"
```

### List

Lists permissions. If -lst is omitted, a listing of the non-inherited permissions is created in table format. The result can optionally be written to a backup file.

`[-lst "f:Format;w:What;i:ListInherited;s:DisplaySID;oo:OrphanedOnly"] [-bckp Filename]`

```powershell
-actn list [-lst "f:{sddl/csv/tab};w:What;i:{y/n};s:{y/n/b};oo:{y/n}] [-bckp Filename]
```

### Restore

```powershell
-actn restore
-bckp [Filename]
```

### Delete Orphaned SIDs

```powershell
-actn delorphanedsids 
[-os Where]
```

## Example 1.1 – Setting Permissions

```powershell
SetACL.exe -on "C:\my dir" 
           -ot file 
           -actn ace
           -ace "n:domain1\user1;p:change" #user1 aus der Domain domain1 kriegt die Berechtigung change

```

Sets ‘change’ permissions on the directory ‘c:\my dir’ for user ‘user1’ in domain ‘domain1’.

### Example 1.2 – Setting Multiple Permissions

```powershell
SetACL.exe  -on "C:\my dir"
            -ot file 
            -actn ace
            -ace "n:domain1\user1;p:read,write_dacl"
```

Same as the previous example, but sets the following two permissions:

read (standard permission set)
write_dacl (specific permission)

### Example 1.3 – Adding Multiple ACEs

```powershell
SetACL.exe  -on "C:\my dir"
            -ot file 
            -actn ace
            -ace "n:domain1\user1;p:change"
            -ace "n:administrators;p:full"
```

Same as the first example, but additionally sets ‘full’ permissions for the group ‘administrators’.

### Example 1.4 – Specifying SIDs

```powershell
SetACL.exe  -on "C:\my dir"
            -ot file 
            -actn ace
            -ace "n:domain1\user1;p:change"
            -ace "n:S-1-5-32-544;p:full"
```

An improved version of the previous example: ‘administrators’ is a built-in group, whose name is dependent on the language of the operating system. Therefore it is better to use its well-known SID which never changes.

### Example 1.5 – Remote Systems

```powershell
SetACL.exe  -on "\\server1\share1\my dir" 
            -ot file 
            -actn ace
            -ace "n:domain1\user1;p:change"
            -ace "n:S-1-5-32-544;p:full"
```

Same as the previous example, but using a UNC name to access the server ‘server1’ remotely via the network share ‘share1’.

### Example 1.6 – Auditing Entries (SACL)

```powershell
SetACL.exe  -on "\\server1\share1\my dir" 
            -ot file 
            -actn ace
            -ace "n:domain1\user1;p:change"
            -ace "n:S-1-5-32-544;p:full"
            -ace "n:domain2\user2;p:full;m:aud_fail;w:sacl"
```

Same as the previous example, but additionally setting an auditing entry for all (‘full’) failed attempts of ‘user2’ from domain ‘domain2’.

### Example 1.7 – Cleaning up ACLs

```powershell
SetACL.exe  -on "\\server1\share1\my dir" 
            -ot file 
            -actn ace
            -ace "n:domain1\user1;p:change"
            -ace "n:S-1-5-32-544;p:full"
            -ace "n:domain2\user2;p:full;m:aud_fail;w:sacl"
            -actn clear -clr "dacl,sacl"
```

Same as the previous example, but first (see ordering of actions in the documentation) the DACL and SACL are cleared of any non-inherited entries, and then the specified ACEs are set. This effectively ‘cleans up’ messed-up ACLs.

### Example 1.8 – Resetting Child Objects

```powershell
SetACL.exe  -on "\\server1\share1\my dir" 
            -ot file 
            -actn ace
            -ace "n:domain1\user1;p:change"
            -ace "n:S-1-5-32-544;p:full"
            -ace "n:domain2\user2;p:full;m:aud_fail;w:sacl"
            -actn clear -clr "dacl,sacl"
            -actn rstchldrn -rst "dacl,sacl"
```

Same as the previous example, but even more housekeeping is done. Propagation of inherited permissions is enabled for all sub-objects whose permissions are also reset, resulting in only the specified permissions being active for a whole directory tree.

### Example 1.9 – Using the Log File

```powershell
SetACL.exe  -on "\\server1\share1\my dir" 
            -ot file 
            -actn ace
            -ace "n:domain1\user1;p:change"
            -ace "n:S-1-5-32-544;p:full"
            -ace "n:domain2\user2;p:full;m:aud_fail;w:sacl"
            -actn clear -clr "dacl,sacl"
            -actn rstchldrn -rst "dacl,sacl"
            -log "c:\my files\setacl log.txt"
```

Same as the previous example, but all output is written both to the screen and to the log file ‘c:\my files\setacl log.txt’.

### Example 1.10 – Silent Mode

```powershell
SetACL.exe  -on "\\server1\share1\my dir" 
            -ot file 
            -actn ace
            -ace "n:domain1\user1;p:change"
            -ace "n:S-1-5-32-544;p:full"
            -ace "n:domain2\user2;p:full;m:aud_fail;w:sacl"
            -actn clear -clr "dacl,sacl"
            -actn rstchldrn -rst "dacl,sacl"
            -log "c:\my files\setacl log.txt"
            -silent
```

Same as the previous example, but no output is written to the screen, only to the log file ‘c:\my files\setacl log.txt’.

### Example 1.11 – Filtering and Excluding Objects

```powershell
SetACL.exe  -on "\\server1\share1\my dir" 
            -ot file 
            -actn ace
            -ace "n:domain1\user1;p:change"
            -ace "n:S-1-5-32-544;p:full"
            -ace "n:domain2\user2;p:full;m:aud_fail;w:sacl"
            -actn clear -clr "dacl,sacl"
            -actn rstchldrn -rst "dacl,sacl"
            -log "c:\my files\setacl log.txt"
            -silent
            -fltr "secrets" -fltr "top secret"
```

Same as the previous example, but files/directories containing the strings ‘secrets’ or ‘top secret’ are excluded.

### Example 1.12 – Setting the Owner

```powershell
SetACL.exe  -on "\\server1\share1\users" 
            -ot file 
            -actn setprot
            -op "dacl:np;sacl:nc"
            -rec cont_obj
            -actn setowner 
            -ownr "n:S-1-5-32-544"
```

Resets a whole directory tree to what most administrators dream of: the owner of all files and directories is set to the group ‘administrators’ and the flag ‘allow inheritable permissions from the parent object to propagate to this object’ is enabled for all object’s DACLs; the SACLs are left unchanged.

## Example 2 – Listing and Backup

```powershell
SetACL.exe  -on "\\server1\share1\users" 
            -ot file
            -actn list
            -lst "f:sddl;w:d,s,o,g"
            -rec cont
            -bckp "d:\data\setacl listing.txt"
```

Creates a complete listing of DACL, SACL, owner and primary group in SDDL format of the directory ‘\\server1\share1\users’ and all sub-folders. The listing is stored in unicode format in the backup file specified.

## Example 3 – Restore

```powershell
SetACL.exe  -on "dummy entry" 
            -ot file 
            -actn restore
            -bckp "d:\data\setacl listing.txt"
```

Restores all (!) security descriptor data (DACL, SACL, owner, primary group) from the backup file to its original location.

BEWARE: If you have the appropriate user rights (usually, being a member of the administrators group on the target system is sufficient) ALL data in the security descriptor is overwritten!

Comment: Only data contained in the backup file is overwritten, i.e. if you create a backup of the SACL only, when you restore it, the DACL, owner and primary group are left unchanged!

## Example 4 – Copying Permissions Between Users

```powershell
SetACL.exe  -on "\\server1\share1\users" 
            -ot file 
            -actn trustee
            -rec cont_obj
            -trst "n1:domain1\user1;n2:domain2\user2;ta:cpytrst;w:dacl"
```

This command copies all ACEs belonging to ‘domain1\user1’ to ‘domain2\user2’ resulting in a duplication of permissions: after the process domain2\user2 has the same permissions as domain1\user1. This might be useful in a migration scenario where users from domain1 are migrated (copied) to domain2.

## Example 5 – Migrating Permissions Between Domains

```powershell
SetACL.exe  -on "\\server1\share1\users" 
            -ot file
            -actn domain
            -rec cont_obj
            -dom "n1:domain1;n2:domain2;da:repldom;w:dacl"
```

This is useful in a domain migration scenario where users from domain1 are migrated (copied) to domain2. This command replaces all SIDs belonging to users/groups from domain1 with SIDs of users/groups with the same names from domain2 resulting in a replacement of permissions: after the process domain2\user1 has the permissions domain1\user1 previously had.

## Example 6 – Removing all Permissions of a User

```powershell
SetACL.exe -on "c:\\" -ot file -actn trustee 
           -trst "n1:UserOrGroup;ta:remtrst;w:dacl,sacl" -rec cont_obj -ignoreerr
```

Removes "UserOrGroup” from the ACLs of all files on drive C:.
