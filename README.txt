----- ## ROAD DATA CASE README ## -----

1. Opret database
 Kør scriptet 'Create Db_Roaddata' i SSMS
 - den er oprettet med default indstillinger, intet øvre max på lagring

2. Opret tabeller
 Kør scriptet 'dbo.Fact_RealtidsTrafikdata.Table' og 'dbo.Dim_RuteOgMålepunkter.Table'

 - OBS hvis man kalder API'et til Realtids trafikdata hvert 5min, så vil databasen vokse ca. 2,9gb om året, og fact tabellen 'Fact_RealtidsTrafikdata'
   vil vokse med ca. 100 millioner rækker om året.

 - Dimension tabellen 'Dim_RuteOgMålepunkter' er oprettet med PK på 'report_ID' og fact tabellen 'Fact_RealtidsTrafikdata' er oprette med FK på 'report_ID'.
   Det er gjort for at øge performance ved dataforespørgsler ligesom dem der ønske i denne case. Man kan også oprette indexes, hvis man ved hvilke forespørgesel man ønbsker i fremtiden.
 - Vær opmærksom på at der er en PK i 'Dim_RuteOgMålepunkter', hvilket man skal huske hvis man vil opdatere denne tabel.

3. Kør python projectet 'RoadDataAPI'
 - Her henter du først Rute Og Målepunkter, som læses ind i 'Dim_RuteOgMålepunkter'
   * i en driftssituation vil jeg have en dialog med forretningen om behovet for at opdatere denne tabel, måske det er noget der kun skal gøres ved nye målepunkters tilkomst.

 - Dernæst hentes Realtids Trafikdata, som læses ind i 'Fact_RealtidsTrafikdata'
   * i Drift tænker jegf at det giver bedste mening at kalde dette API hvert 5min. Dog er der nogle målepunkter som ikke opdateres hvert femte min.
     Her mener jeg man bør have en dialog med forretningen om hvad man gør(ift analyse) med målepunkter der ikke opdateres hvert femte min.
   * OBS hvis man kalder API'et til Realtids trafikdata hvert 5min, så vil databasen vokse ca. 2,9gb om året, og fact tabellen 'Fact_RealtidsTrafikdata'
     vil vokse med ca. 100 millioner rækker om året.
 
 - dvs at du nu har engangsudtræk af data og du kan nu lave din analyse.

4. Analyse
 
 Nedenfor ser du hvordan du kan replicere analyserne, samt se resultaterne:
	

 - De 50 mest trafikerede målepunkter (baseret på antal køretøjer), hvor vi kender både vejnavn og postnummer.
   * Kør scriptet 'De 50 mest trafikerede målepunkter.sql' i SSMS - se resultatet i 'De 50 mest trafikerede veje målt på antal biler.txt'
 
 - En oversigt over de 10 mest trafikerede veje.
    * Kør scriptet 'En oversigt over de 10 mest trafikerede veje.sql' i SSMS - se resultatet i 'De 10 mest trafikerede veje.txt'
 
- En oversigt over de 5 postnumre med den højeste gennemsnitshastighed.
    * Kør scriptet 'En oversigt over de 5 postnumre med den højeste gennemsnitshastighed.sql' i SSMS - se resultatet i 'De 5 postnumre højeste gennemsnitsfart.txt'





