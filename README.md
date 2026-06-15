# IP Info Lookup

Ett litet PowerShell-projekt som hämtar information om en IP-adress via ett externt API.  
Projektet använder API-nyckel, `.env`-fil och modulstruktur med `.psm1`-filer.

## Syfte

Syftet med IP Info Lookup är att snabbt kunna slå upp information om en IP-adress direkt från PowerShell.

Verktyget kan användas för att få en enkel överblick över var en IP-adress verkar höra hemma och vilken organisation eller internetleverantör den är kopplad till. Det kan vara användbart vid felsökning, dokumentation eller enklare nätverkskontroller.

Projektet är byggt med modulstruktur och använder en API-nyckel som läses in från en `.env`-fil, så att känslig information inte behöver ligga direkt i koden.


## API

Projektet använder IP Info API för att hämta information om en IP-adress, till exempel:

- IP-adress
- stad
- region
- land
- internetleverantör/organisation